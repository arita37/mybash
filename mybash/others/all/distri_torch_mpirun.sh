#!/bin/sh

echo "Distributed Pytorch HVD Starting"

if [ "$1" ]; then
    n_node="$1"
else
n_node=2
fi


#### Model name
if [ "$2" ]; then
    model="$2"
else
model="net"
fi
echo $model


#### Model param
if [ "$3" ]; then
    model_param="$3"
else
model_param="test"
fi


# echo "Nnodes" $n_node  $model`

### Conda 
# source activate py36tch


mpirun -np $n_node \
    -H localhost:$n_node \
    --display-map \
    -bind-to none -map-by slot \
    -x NCCL_DEBUG=INFO -x LD_LIBRARY_PATH -x PATH \
    -mca pml ob1 -mca btl ^openib \
    python  distri_tch.py --model "$model"  \
                          --model_pars_name $model_param
    
    
    
    