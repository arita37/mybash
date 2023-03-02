# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
  docker
zsh-autocomplete
macos

	)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"




##### auto complete
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh







# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('~/conda3/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "~/conda3/miniconda3/etc/profile.d/conda.sh" ]; then
        . "~/conda3/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="~/conda3/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


#### shorten
export PS1='\W$ '


#####  SSH Permission
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*



### Prevent auto-update
export HOMEBREW_NO_AUTO_UPDATE=1


########## PATH ######################################################
###### Shortcut Script
export PATH=~/zshortcut/:$PATH
chmod -R 777 ~/zshortcut/

##### MySQL CLient
export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"
# export PATH="~/D/gitdev/acausal/causica/:$PATH"




###### Git setup     ################################################
git config --global user.name ""
git config --global user.email ""





###### ML Dev
export PYTHONPATH="~/D/gitdev/aaml_dev01/mlb:$PYTHONPATH"
export PYTHONPATH="~/D/gitdev/aaml_dev01/mlb/src/frame/:$PYTHONPATH"
#export PYTHONPATH="~/D/gitdev/acausal/causica/:$PYTHONPATH"
echo $PYTHONPATH



##### Libtorch C++
export LIBTORCH=~/D/gitdev/zbin/libtorch/    # path to output of zip file
export LD_LIBRARY_PATH=${LIBTORCH}/lib:$LD_LIBRARY_PATH




##################################################################
alias cau="cd~/D/gitdev/acausal/causica/ && pwd "

alias showhy="cd~/D/gitdev/acausal/showwhy/ && docker-compose --profile all up"

alias gituser="git config --list"

alias bashs="source ~/.zshrc"

alias d="docker "


##################################################################
source ~/utils_bash.sh









#####################################################################
##### AWS Server Env Accesss ########################################


function env_local() {

  echo "AWS_PROFILE: $AWS_PROFILE"

}



function env_dev() {

  unset aws 	


}



function env_stg() {


}


function env_prd() {



	
}


function env_prd22() {



}



########################################################################################
###################  AWSLOCAL ################################
#set -a ### export
#function aws { awslocal "$@" ; }

#set +a # stop exporting
###############################################
alias s3ls="aws s3 ls"

function awsid() {   aws sts get-caller-identity     }


function to_awsmock() {
   mv ~/conda3/miniconda3/envs/py38/bin/aws       ~/conda3/miniconda3/envs/py38/bin/aws_true

   mv ~/conda3/miniconda3/envs/py38/bin/awslocal  ~/conda3/miniconda3/envs/py38/bin/aws

   aws s3 ls

   export USE_LOCALSTACK_BOTO3=1
   echo "USE_LOCALSTACK_BOTO3=1"
}


function to_awstrue() {
   mv ~/conda3/miniconda3/envs/py38/bin/aws  ~/conda3/miniconda3/envs/py38/bin/awslocal

   mv ~/conda3/miniconda3/envs/py38/bin/aws_true  ~/conda3/miniconda3/envs/py38/bin/aws

   which aws 
   export USE_LOCALSTACK_BOTO3=0

}




###############################################################################
########## Docker Check for MLB ###############################################
function mlb_login() {

    aaws dev  ## Dev account
    aws ecr get-login-password   --profile dev-backend --region  ap-northeast-1  | docker login 

}


function mlb_pull() {
     export  DNAME0="$1"
     export  ECR="162718241810.dkr.ecr.ap-northeast-1.amazonaws.com"
     export  DNAME="$ECR/mldock:$DNAME0"        
     docker pull  $DNAME
}


function mlb_start() {
     docker run -itd --rm  --add-host=host.docker.internal:host-gateway   -v ~//D/gitdev/aamL_dev01/mlb/ztmp/:/opt/mlb/ztmp  -v ~/.aws:/root/.aws   -v ~/D/gitdev:/opt/gitdev --network host --name ml2 --platform linux/amd64  $DNAME
     docker exec -it  ml2  /bin/bash 
}



function mlb_start1() {
     docker run -itd --rm  -m=2G  --cpus=1  --add-host=host.docker.internal:host-gateway   -v ~//D/gitdev/aamL_dev01/mlb/ztmp/:/opt/mlb/ztmp  -v ~/.aws:/root/.aws   -v ~/D/gitdev:/opt/gitdev --network host --name ml2 --platform linux/amd64  $DNAME
     docker exec -it  ml2  /bin/bash 
}



alias mlbe="docker exec -it  ml2  /bin/bash"
alias mlbin="docker exec -it  ml2  /bin/bash"






############################################################################
#### Print
echo "AWS_PROFILE:  $AWS_PROFILE"
cd ~/D/gitdev/aamL_dev01/mlb/

#### conda
source activate py38













