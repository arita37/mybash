# -*- coding: utf-8 -*-
"""Copy of finetune_bicycle.ipynb

!apt-get update
!apt-get install potrace imagemagick
!pip install svgutils


Original file is located at
    https://colab.research.google.com/drive/1F5IfrlYPfk-DW_xTuTpujEiU5VxeTeRQ

# Textual-inversion fine-tuning for Stable Diffusion using d🧨ffusers 

This notebook shows how to "teach" Stable Diffusion a new concept via textual-inversion using 🤗 Hugging Face [🧨 Diffusers library](https://github.com/huggingface/diffusers). 

![Textual Inversion example](https://textual-inversion.github.io/static/images/editing/colorful_teapot.JPG)
_By using just 3-5 images you can teach new concepts to Stable Diffusion and personalize the model on your own images_ 

For a general introduction to the Stable Diffusion model please refer to this [colab](https://colab.research.google.com/github/huggingface/notebooks/blob/main/diffusers/stable_diffusion.ipynb).

"""

def colab_setup():
  ss= """
        #@title Install the required libs
        !pip install -U -qq git+https://github.com/huggingface/diffusers.git
        !pip install -qq accelerate transformers ftfy

        #@title [Optional] Install xformers for faster and memory efficient training
        #@markdown Acknowledgement: The xformers wheel are taken from [TheLastBen/fast-stable-diffusion](https://github.com/TheLastBen/fast-stable-diffusion). Thanks a lot for building these wheels!

        # !pip install -U --pre triton
        !pip install -q https://github.com/TheLastBen/fast-stable-diffusion/raw/main/precompiled/T4/xformers-0.0.13.dev0-py3-none-any.whl
  """


#@title Import required libraries
import argparse,itertools,  math, os, random,sys, shutil, subprocess, datetime, requests, glob
import svgutils.transform as sg
import numpy as np, torch
import torch.nn.functional as F
import torch.utils.checkpoint
from torch.utils.data import Dataset

import PIL
from accelerate import Accelerator
from accelerate.logging import get_logger
from accelerate.utils import set_seed
from diffusers import AutoencoderKL, DDPMScheduler, PNDMScheduler, StableDiffusionPipeline, UNet2DConditionModel
from diffusers.optimization import get_scheduler
from diffusers.pipelines.stable_diffusion import StableDiffusionSafetyChecker
from PIL import Image
from torchvision import transforms
from tqdm.auto import tqdm
from transformers import CLIPFeatureExtractor, CLIPTextModel, CLIPTokenizer

#@title Download
from io import BytesIO

from utilmy import log 


from subprocess import getoutput
from IPython.display import HTML
from IPython.display import clear_output
import time


def gpu_check():
    s = getoutput('nvidia-smi')
    # if 'T4' in s:
    #   gpu = 'T4'
    # elif 'P100' in s:
    #   gpu = 'P100'
    # elif 'V100' in s:
    #   gpu = 'V100'
    # elif 'A100' in s:
    #   gpu = 'A100'

    # while True:
    #     try: 
    #         gpu=='T4'or gpu=='P100'or gpu=='V100'or gpu=='A100'
    #         break
    #     except:
    #         pass
    #     print('[1;31mit seems that your GPU is not supported at the moment')
    #     time.sleep(5)

    # if (gpu=='T4'):
    #   %pip install -q https://github.com/TheLastBen/fast-stable-diffusion/raw/main/precompiled/T4/xformers-0.0.13.dev0-py3-none-any.whl
      
    # elif (gpu=='P100'):
    #   %pip install -q https://github.com/TheLastBen/fast-stable-diffusion/raw/main/precompiled/P100/xformers-0.0.13.dev0-py3-none-any.whl

    # elif (gpu=='V100'):
    #   %pip install -q https://github.com/TheLastBen/fast-stable-diffusion/raw/main/precompiled/V100/xformers-0.0.13.dev0-py3-none-any.whl

    # elif (gpu=='A100'):
    #   %pip install -q https://github.com/TheLastBen/fast-stable-diffusion/raw/main/precompiled/A100/xformers-0.0.13.dev0-py3-none-any.whl

    # #@title [Optional] Login to the Hugging Face Hub
    # #@markdown Add a token with the "Write Access" role to be able to add your trained concept to the [Library of Concepts](https://huggingface.co/sd-concepts-library)
    # # !pip install ipywidgets
    # from huggingface_hub import notebook_login

    # notebook_login()



###########################################################################################
def image_grid(imgs, rows, cols):
    assert len(imgs) == rows*cols

    w, h = imgs[0].size
    grid = Image.new('RGB', size=(cols*w, rows*h))
    grid_w, grid_h = grid.size
    
    for i, img in enumerate(imgs):
        grid.paste(img, box=(i%cols*w, i//cols*h))
    return grid

"""## Settings for teaching your new concept"""
#@markdown `pretrained_model_name_or_path` which Stable Diffusion checkpoint you want to use
pretrained_model_name_or_path = "coder119/Vectorartz_Diffusion" #@param ["stabilityai/stable-diffusion-2", "stabilityai/stable-diffusion-2-base", "CompVis/stable-diffusion-v1-4", "runwayml/stable-diffusion-v1-5"] {allow-input: true}

"""### Get the training images:
#### Download the images from the internet and save them locally.
You can also upload the images to colab or load from google drive, please check the next section if you want to use that.
"""

#@markdown Add here the URLs to the images of the concept you are adding. 3-5 should be fine
urls = [
      "https://huggingface.co/datasets/valhalla/images/resolve/main/2.jpeg",
      "https://huggingface.co/datasets/valhalla/images/resolve/main/3.jpeg",
      "https://huggingface.co/datasets/valhalla/images/resolve/main/5.jpeg",
      "https://huggingface.co/datasets/valhalla/images/resolve/main/6.jpeg",
      ## You can add additional images here
]


def download_image(url):
  try:
    response = requests.get(url)
  except:
    return None
  return Image.open(BytesIO(response.content)).convert("RGB")

def down_images():
    images = list(filter(None,[download_image(url) for url in urls]))
    save_path = "./my_concept"
    if not os.path.exists(save_path):
      os.mkdir(save_path)
    [image.save(f"{save_path}/{i}.jpeg") for i, image in enumerate(images)]




def image_setup():
    """#### Load images from local folder or google drive
    You can also load your own training images from google drive or upload them to colab usingthe files taband then provide the path to the directory containing images. 
    *Make sure that the directory only contains images as the following cells will read all the files from the provided directory.*
    """

    #@markdown `images_path` is a path to directory containing the training images. It could 
    images_path = "bicycle" #@param {type:"string"}
    images_path= r"D:\Projects\research_paper_scratch\bicycle"
    while not os.path.exists(str(images_path)):
      print('The images_path specified does not exist, use the colab file explorer to copy the path :')
      images_path=input("")
    save_path = images_path

    """####  Setup and check the images you have just added"""
    images = []
    for file_path in os.listdir(save_path):
      try:
          image_path = os.path.join(save_path, file_path)
          image = Image.open(image_path).convert("RGBA")
          new_image = Image.new("RGBA", image.size, "WHITE")
          new_image.paste(image, mask=image)
          new_image.convert('RGB')
          images.append(new_image.resize((512, 512)))
      except:
        print(f"{image_path} is not a valid image, please make sure to remove this file from the directory otherwise the training could fail.")


    image_grid(images, 1, len(images))




def prompt_create():
    """## Teach the model a new concept (fine-tuning with textual inversion)
    Execute this this sequence of cells to run the training process. The whole process may take from 1-4 hours. (Open this block if you are interested in how this process works under the hood or if you want to change advanced training settings or hyper)

    ### Create Dataset
    """

  
    imagenet_templates_small = [
        "a svg of a {}",
        "a rendering of a {}",
        "the photo of a {}",
        "flat vector icon of{}",
        "a dark photo of the {}",
        "white color clear background{}",
        "Design a flat vector icon of a {}",
        "minimalistic image of {}",
        "transparent background photo of the {}",
        "Create a clean and simple {}",
        "simple SVG illustration  {}",
    ]
    # prompt = "black color flat vector icon of bicycle, black and white, b&w, white color clear background only"
    # prmopt = "Design a black and white flat vector icon of a bicycle with a clear background, featuring a minimalist style and solid black color on a transparent background."
    # prompt = "Create a clean and simple SVG illustration of a bicycle in black, centered on a transparent background."
    imagenet_style_templates_small = [
        "flat vector icon of  of {}",
        "reate a clean and simple SVG illustration of a {} , centered on a clear white background.",
        "Design a  flat vector icon of a {} with a clear background",
        "featuring a minimalist style {} and solid  color on a clear white background",
        "Create a clean and simple SVG illustration of a {} , centered on a clear white background",
    ]

#@title Settings for your newly created concept
#@markdown `what_to_teach`: what is it that you are teaching? `object` enables you to teach the model a new object to be used, `style` allows you to teach the model a new style one can use.
what_to_teach = "object" #@param ["object", "style"]
#@markdown `placeholder_token` is the token you are going to use to represent your new concept (so when you prompt the model, you will say "A `<my-placeholder-token>` in an amusement park"). We use angle brackets to differentiate a token from other words/tokens, to avoid collision.
placeholder_token = "<bicycle-svg>" #@param {type:"string"}
#@markdown `initializer_token` is a word that can summarise what your new concept is, to be used as a starting point
initializer_token = "bicycle" #@param {type:"string"}


########################################################################################################
class TextualInversionDataset(Dataset):
    def __init__(
        self,
        data_root,
        tokenizer,
        learnable_property="object",  # [object, style]
        size=512,
        repeats=100,
        interpolation="bicubic",
        flip_p=0.5,
        set="train",
        placeholder_token="*",
        center_crop=False,
    ):

        self.data_root = data_root
        self.tokenizer = tokenizer
        self.learnable_property = learnable_property
        self.size = size
        self.placeholder_token = placeholder_token
        self.center_crop = center_crop
        self.flip_p = flip_p

        ### iMage data 
        self.image_paths = [os.path.join(self.data_root, file_path) for file_path in os.listdir(self.data_root)]

        self.num_images = len(self.image_paths)
        self._length = self.num_images

        if set == "train":
            self._length = self.num_images * repeats

        self.interpolation = {
            "linear": PIL.Image.LINEAR,
            "bilinear": PIL.Image.BILINEAR,
            "bicubic": PIL.Image.BICUBIC,
            "lanczos": PIL.Image.LANCZOS,
        }[interpolation]

        #### List of Text prompt. 
        self.templates = imagenet_style_templates_small if learnable_property == "style" else imagenet_templates_small
        self.flip_transform = transforms.RandomHorizontalFlip(p=self.flip_p)

    def __len__(self):
        return self._length

    def __getitem__(self, i):
        example = {}
        image = Image.open(self.image_paths[i % self.num_images])

        if not image.mode == "RGB":
            image = image.convert("RGB")

        ##### Pick some random Prompt: only one prompt/label at time.
        #### image can receive random prompt
        placeholder_string = self.placeholder_token
        text = random.choice(self.templates).format(placeholder_string)

        """
         example : input_ids :    list of word embedding/ tokenized, from random prompt.
                   pixel_values:  1 Single image 

        """

        #### Tokenize the text assigned: list of token words, in tensor
        example["input_ids"] = self.tokenizer(
            text,
            padding="max_length",
            truncation=True,
            max_length=self.tokenizer.model_max_length,
            return_tensors="pt",
        ).input_ids[0]

        # default to score-sde preprocessing
        img = np.array(image).astype(np.uint8)

        if self.center_crop:
            crop = min(img.shape[0], img.shape[1])
            h, w, = (
                img.shape[0],
                img.shape[1],
            )
            img = img[(h - crop) // 2 : (h + crop) // 2, (w - crop) // 2 : (w + crop) // 2]

        image = Image.fromarray(img)
        image = image.resize((self.size, self.size), resample=self.interpolation)

        image = self.flip_transform(image)
        image = np.array(image).astype(np.uint8)
        image = (image / 127.5 - 1.0).astype(np.float32)

        example["pixel_values"] = torch.from_numpy(image).permute(2, 0, 1)
        return example



def model_setup():
    """### Setting up the model"""

    #@title Load the tokenizer and add the placeholder token as a additional special token.
    tokenizer = CLIPTokenizer.from_pretrained(
        pretrained_model_name_or_path,
        subfolder="tokenizer",
    )

    # Add the placeholder token in tokenizer
    num_added_tokens = tokenizer.add_tokens(placeholder_token)
    if num_added_tokens == 0:
        raise ValueError(
            f"The tokenizer already contains the token {placeholder_token}. Please pass a different"
            " `placeholder_token` that is not already in the tokenizer."
        )

    #@title Get token ids for our placeholder and initializer token. This code block will complain if initializer string is not a single token
    # Convert the initializer_token, placeholder_token to ids
    token_ids = tokenizer.encode(initializer_token, add_special_tokens=False)
    # Check if initializer_token is a single token or a sequence of tokens
    if len(token_ids) > 1:
        raise ValueError("The initializer token must be a single token.")

    initializer_token_id = token_ids[0]
    placeholder_token_id = tokenizer.convert_tokens_to_ids(placeholder_token)


    # Load models and create wrapper for stable diffusion
    # pipeline = StableDiffusionPipeline.from_pretrained(pretrained_model_name_or_path)
    # del pipeline
    text_encoder = CLIPTextModel.from_pretrained(
        pretrained_model_name_or_path, subfolder="text_encoder"
    )
    vae = AutoencoderKL.from_pretrained(
        pretrained_model_name_or_path, subfolder="vae"
    )
    unet = UNet2DConditionModel.from_pretrained(
        pretrained_model_name_or_path, subfolder="unet"
    )


    """Initialise the newly added placeholder token with the embeddings of the initializer token
    We have added the `placeholder_token` in the `tokenizer` so we resize the token embeddings here, this will a new embedding vector in the token embeddings for our `placeholder_token`
    """
    text_encoder.resize_token_embeddings(len(tokenizer))
    token_embeds = text_encoder.get_input_embeddings().weight.data
    token_embeds[placeholder_token_id] = token_embeds[initializer_token_id]


    """In Textual-Inversion we only train the newly added embedding vector, so lets freeze rest of the model parameters here"""
    def freeze_params(params):
        for param in params:
            param.requires_grad = False

    # Freeze vae and unet
    freeze_params(vae.parameters())
    freeze_params(unet.parameters())
    # Freeze all parameters except for the token embeddings in text encoder
    params_to_freeze = itertools.chain(
        text_encoder.text_model.encoder.parameters(),
        text_encoder.text_model.final_layer_norm.parameters(),
        text_encoder.text_model.embeddings.position_embedding.parameters(),
    )
    freeze_params(params_to_freeze)





#############################################################################################
"""Dataset used for fine-tuning. Text, images """
train_dataset = TextualInversionDataset(
      data_root=save_path, ### image pathsonly
      tokenizer=tokenizer,
      size=vae.sample_size,
      placeholder_token=placeholder_token,  ### Text data
      repeats=100,
      learnable_property=what_to_teach, #Option selected above between object and style
      center_crop=False,
      set="train",
)

def create_dataloader(train_batch_size=1):
    return torch.utils.data.DataLoader(train_dataset, batch_size=train_batch_size, shuffle=True)


"""Create noise_scheduler for training"""
noise_scheduler = DDPMScheduler.from_config(pretrained_model_name_or_path, subfolder="scheduler")




###################################################################################################
"""### Training
Define hyper for our training
If you are not happy with your results, you can tune the `learning_rate` and the `max_train_steps`
"""
hyper = {
    "learning_rate": 5e-04,
    "scale_lr": True,
    "max_train_steps": 5000,
    "save_steps": 500,
    "train_batch_size": 4,
    "gradient_accumulation_steps": 1,
    "gradient_checkpointing": True,
    "mixed_precision": "fp16",
    "seed": 42,
    "output_dir": "sd-concept-output"
}
#v!mkdir -p sd-concept-output


########## """Train!"""
#@title Training function
logger = get_logger(__name__)

def save_progress(text_encoder, placeholder_token_id, accelerator, save_path):
    log("Saving embeddings")
    learned_embeds = accelerator.unwrap_model(text_encoder).get_input_embeddings().weight[placeholder_token_id]
    learned_embeds_dict = {placeholder_token: learned_embeds.detach().cpu()}
    torch.save(learned_embeds_dict, save_path)


def training_function(text_encoder, vae, unet):
    train_batch_size = hyper["train_batch_size"]
    gradient_accumulation_steps = hyper["gradient_accumulation_steps"]
    learning_rate = hyper["learning_rate"]
    max_train_steps = hyper["max_train_steps"]
    output_dir = hyper["output_dir"]
    gradient_checkpointing = hyper["gradient_checkpointing"]

    accelerator = Accelerator(
        gradient_accumulation_steps=gradient_accumulation_steps,
        mixed_precision=hyper["mixed_precision"]
    )

    if gradient_checkpointing:
        text_encoder.gradient_checkpointing_enable()
        unet.enable_gradient_checkpointing()

    train_dataloader = create_dataloader(train_batch_size)

    if hyper["scale_lr"]:
        learning_rate = (
            learning_rate * gradient_accumulation_steps * train_batch_size * accelerator.num_processes
        )

    # Initialize the optimizer
    optimizer = torch.optim.AdamW(
        text_encoder.get_input_embeddings().parameters(),  # only optimize the embeddings
        lr=learning_rate,
    )

    text_encoder, optimizer, train_dataloader = accelerator.prepare(
        text_encoder, optimizer, train_dataloader
    )

    weight_dtype = torch.float32
    if accelerator.mixed_precision == "fp16":
        weight_dtype = torch.float16
    elif accelerator.mixed_precision == "bf16":
        weight_dtype = torch.bfloat16

    # Move vae and unet to device
    vae.to(accelerator.device, dtype=weight_dtype)
    unet.to(accelerator.device, dtype=weight_dtype)

    # Keep vae in eval mode as we don't train it
    vae.eval()
    # Keep unet in train mode to enable gradient checkpointing
    unet.train()

    
    # We need to recalculate our total training steps as the size of the training dataloader may have changed.
    num_update_steps_per_epoch = math.ceil(len(train_dataloader) / gradient_accumulation_steps)
    num_train_epochs = math.ceil(max_train_steps / num_update_steps_per_epoch)

    # Train!
    total_batch_size = train_batch_size * accelerator.num_processes * gradient_accumulation_steps

    log("***** Running training *****")
    log(f"  Num examples = {len(train_dataset)}")
    log(f"  Instantaneous batch size per device = {train_batch_size}")
    log(f"  Total train batch size (w. parallel, distributed & accumulation) = {total_batch_size}")
    log(f"  Gradient Accumulation steps = {gradient_accumulation_steps}")
    log(f"  Total optimization steps = {max_train_steps}")
    print("***** Running training *****")
    print(f"  Num examples = {len(train_dataset)}")
    print(f"  Instantaneous batch size per device = {train_batch_size}")
    print(f"  Total train batch size (w. parallel, distributed & accumulation) = {total_batch_size}")
    print(f"  Gradient Accumulation steps = {gradient_accumulation_steps}")
    print(f"  Total optimization steps = {max_train_steps}")
    
    # Only show the progress bar once on each machine.
    progress_bar = tqdm(range(max_train_steps), disable=not accelerator.is_local_main_process)
    progress_bar.set_description("Steps")
    global_step = 0

    for epoch in range(num_train_epochs):
        text_encoder.train()
        for step, batch in enumerate(train_dataloader):
            # print("step", step)
            with accelerator.accumulate(text_encoder):
                # Convert images to latent space
                latents = vae.encode(batch["pixel_values"].to(dtype=weight_dtype)).latent_dist.sample().detach()
                latents = latents * 0.18215

                # Sample noise that we'll add to the latents
                noise = torch.randn_like(latents)
                bsz = latents.shape[0]
                # Sample a random timestep for each image
                timesteps = torch.randint(0, noise_scheduler.num_train_timesteps, (bsz,), device=latents.device).long()

                # Add noise to the latents according to the noise magnitude at each timestep
                # (this is the forward diffusion process)
                noisy_latents = noise_scheduler.add_noise(latents, noise, timesteps)

                # Get the text embedding for conditioning
                encoder_hidden_states = text_encoder(batch["input_ids"])[0]

                # Predict the noise residual
                noise_pred = unet(noisy_latents, timesteps, encoder_hidden_states.to(weight_dtype)).sample

                 # Get the target for loss depending on the prediction type
                if noise_scheduler.config.prediction_type == "epsilon":
                    target = noise
                elif noise_scheduler.config.prediction_type == "v_prediction":
                    target = noise_scheduler.get_velocity(latents, noise, timesteps)
                else:
                    raise ValueError(f"Unknown prediction type {noise_scheduler.config.prediction_type}")

                loss = F.mse_loss(noise_pred, target, reduction="none").mean([1, 2, 3]).mean()
                accelerator.backward(loss)

                # Zero out the gradients for all token embeddings except the newly added
                # embeddings for the concept, as we only want to optimize the concept embeddings
                if accelerator.num_processes > 1:
                    grads = text_encoder.module.get_input_embeddings().weight.grad
                else:
                    grads = text_encoder.get_input_embeddings().weight.grad
                # Get the index for tokens that we want to zero the grads for
                index_grads_to_zero = torch.arange(len(tokenizer)) != placeholder_token_id
                grads.data[index_grads_to_zero, :] = grads.data[index_grads_to_zero, :].fill_(0)

                optimizer.step()
                optimizer.zero_grad()

            # Checks if the accelerator has performed an optimization step behind the scenes
            if accelerator.sync_gradients:
                progress_bar.update(1)
                global_step += 1
                if global_step % hyper["save_steps"] == 0:
                    save_path = os.path.join(output_dir, f"learned_embeds-step-{global_step}.bin")
                    save_progress(text_encoder, placeholder_token_id, accelerator, save_path)
                    #### 3.4 Gb --> loaded in GPU, CPU inference: 10sec per image... 
                    ### cannot reduce image size: not good results, 512x 512,  128 x 128 ????
                    ### PNG format ONLY, svg --> PNG. 

                    ### 128 size of image


            logs = {"loss": loss.detach().item()}
            progress_bar.set_postfix(**logs)

            if global_step >= max_train_steps:
                break

        accelerator.wait_for_everyone()

        print("epoch", epoch)

    # Create the pipeline using using the trained modules and save it.
    if accelerator.is_main_process:
        print("creating pipeline")
        pipeline = StableDiffusionPipeline.from_pretrained(
            pretrained_model_name_or_path,
            text_encoder=accelerator.unwrap_model(text_encoder),
            tokenizer=tokenizer,
            vae=vae,
            unet=unet,
        )
        print("pipeline", pipeline)
        pipeline.save_pretrained(output_dir)
        print("pipeline saved")
        # Also save the newly trained embeddings
        save_path = os.path.join(output_dir, f"learned_embeds.bin")
        save_progress(text_encoder, placeholder_token_id, accelerator, save_path)
        print("progress saved")


def train_launcher():
    import accelerate
    print(torch.cuda.is_available())

    accelerate.notebook_launcher(training_function, args=(text_encoder, vae, unet),num_processes = 1)

    for param in itertools.chain(unet.parameters(), text_encoder.parameters()):
      print(param.grad) 
      if param.grad is not None:
        del param.grad  # free some memory
      torch.cuda.empty_cache()



#########################################################################################
def run_inference():
    #@title Set up the pipeline 
    from diffusers import DPMSolverMultistepScheduler
    pipe = StableDiffusionPipeline.from_pretrained(
        hyper["output_dir"],
        scheduler=DPMSolverMultistepScheduler.from_pretrained(hyper["output_dir"], subfolder="scheduler"),
        torch_dtype=torch.float16,
    ).to("cuda")

    #@title Run the Stable Diffusion pipeline
    #@markdown Don't forget to use the placeholder token in your prompt
    prompt = " Design a black and white simple flat vector icon of a svg bicycle with plain white background" #@param {type:"string"}

    folder = "svgs_house"
    resolution = 20
    number_of_images = 10
    def svg_scale(input,output,resolution):
      fig = sg.fromfile(input)
      fig.set_size((str(resolution),str(resolution)))
      fig.save(output)

    def svg_scale(input,output,resolution):
      fig = sg.fromfile(input)
      fig.set_size((str(resolution),str(resolution)))
      fig.save(output)

    """
    Keep the seed.

    Single bike as prompt
    Vector Illustration with black  bike and white and clear background.

    prompt lenght: 250 words,  medium, long prompt or short ???
    increase inference step
    """
    # prompt = "Create a clean and simple SVG illustration of a bicycle in black, centered on a transparent background."
    # prompt = "Create a clean and simple color illustration of a bicycle in black, centered on a transparent background."
    # prompt ="Create a clean and simple SVG illustration of a bicycle on plain clear and clean white background."
    num_samples = 1 #@param {type:"number"}
    num_rows = 50 #@param {type:"number"}

    all_images = [] 
    for _ in range(num_rows):
        # print(f"Generating row {_}")

        #### num_inference icrease: more details,  decrease: less details.
        #### fine tuning Colab PRO: 100 - 500 images
        images = pipe([prompt] * num_samples,height=512,width=512 ,
                      num_inference_steps=20).images
        # display and save images
        for image in images:
            display(image)
            image_name = folder+"/"+str(datetime.now())+".png"
            image.save(image_name)
            display(image)
            ppm_path=image_name.replace("png","ppm")
            svg_path=ppm_path.replace("ppm","svg")
            svg_scaled =svg_path.replace(".svg","_20.svg")
            subprocess.call(["convert","-flatten",image_name,ppm_path])
            subprocess.call(["potrace","-s",ppm_path,"-o",svg_path])
            svg_scale(svg_path,svg_scaled,resolution)
            os.remove(svg_path)
            os.remove(ppm_path)
            # image.show()



def run_inference2():
    """## Run the code with your newly trained model
    If you have just trained your model with the code above, use the block below to run it
    To save this concept for re-using, download the `learned_embeds.bin` file or save it on the library of concepts.
    Use the [Stable Conceptualizer notebook](https://colab.research.google.com/github/huggingface/notebooks/blob/main/diffusers/stable_conceptualizer_inference.ipynb) for inference with persistently saved pre-trained concepts
    """
    # #@title Save your newly created concept to the [library of concepts](https://huggingface.co/sd-concepts-library)?
    # !pip uninstall slugify
    # !pip install python-slugify
    # save_concept_to_public_library = True #@param {type:"boolean"}
    # name_of_your_concept = "Cat toy" #@param {type:"string"}
    # #@markdown `hf_token_write`: leave blank if you logged in with a token with `write access` in the [Initial Setup](#scrollTo=KbzZ9xe6dWwf). If not, [go to your tokens settings and create a write access token](https://huggingface.co/settings/tokens)
    # hf_token_write = "" #@param {type:"string"}

    # if(save_concept_to_public_library):
    #   from slugify import slugify
    #   from huggingface_hub import HfApi, HfFolder, CommitOperationAdd
    #   from huggingface_hub import create_repo
    #   repo_id = f"sd-concepts-library/{slugify(name_of_your_concept)}"
    #   output_dir = hyper["output_dir"]
    #   if(not hf_token_write):
    #     with open(HfFolder.path_token, 'r') as fin: hf_token = fin.read();
    #   else:
    #     hf_token = hf_token_write
    #   #Join the Concepts Library organization if you aren't part of it already
    #   !curl -X POST -H 'Authorization: Bearer '$hf_token -H 'Content-Type: application/json' https://huggingface.co/organizations/sd-concepts-library/share/VcLXJtzwwxnHYCkNMLpSJCdnNFZHQwWywv
    #   images_upload = os.listdir("my_concept")
    #   image_string = ""
    #   repo_id = f"sd-concepts-library/{slugify(name_of_your_concept)}"
    #   for i, image in enumerate(images_upload):
    #       image_string = f'''{image_string}![{placeholder_token} {i}](https://huggingface.co/{repo_id}/resolve/main/concept_images/{image})
    # '''
    #   if(what_to_teach == "style"):
    #       what_to_teach_article = f"a `{what_to_teach}`"
    #   else:
    #       what_to_teach_article = f"an `{what_to_teach}`"
    #   readme_text = f'''---
    # license: mit
    # base_model: {pretrained_model_name_or_path}
    # ---
    # ### {name_of_your_concept} on Stable Diffusion
    # This is the `{placeholder_token}` concept taught to Stable Diffusion via Textual Inversion. You can load this concept into the [Stable Conceptualizer](https://colab.research.google.com/github/huggingface/notebooks/blob/main/diffusers/stable_conceptualizer_inference.ipynb) notebook. You can also train your own concepts and load them into the concept libraries using [this notebook](https://colab.research.google.com/github/huggingface/notebooks/blob/main/diffusers/sd_textual_inversion_training.ipynb).

    # Here is the new concept you will be able to use as {what_to_teach_article}:
    # {image_string}
    # '''
    #   #Save the readme to a file
    #   readme_file = open("README.md", "w")
    #   readme_file.write(readme_text)
    #   readme_file.close()
    #   #Save the token identifier to a file
    #   text_file = open("token_identifier.txt", "w")
    #   text_file.write(placeholder_token)
    #   text_file.close()
    #   #Save the type of teached thing to a file
    #   type_file = open("type_of_concept.txt","w")
    #   type_file.write(what_to_teach)
    #   type_file.close()
    #   operations = [
    #     CommitOperationAdd(path_in_repo="learned_embeds.bin", path_or_fileobj=f"{output_dir}/learned_embeds.bin"),
    #     CommitOperationAdd(path_in_repo="token_identifier.txt", path_or_fileobj="token_identifier.txt"),
    #     CommitOperationAdd(path_in_repo="type_of_concept.txt", path_or_fileobj="type_of_concept.txt"),
    #     CommitOperationAdd(path_in_repo="README.md", path_or_fileobj="README.md"),
    #   ]
    #   create_repo(repo_id,private=True, token=hf_token)
    #   api = HfApi()
    #   api.create_commit(
    #     repo_id=repo_id,
    #     operations=operations,
    #     commit_message=f"Upload the concept {name_of_your_concept} embeds and token",
    #     token=hf_token
    #   )
    #   api.upload_folder(
    #     folder_path=save_path,
    #     path_in_repo="concept_images",
    #     repo_id=repo_id,
    #     token=hf_token
    #   )


