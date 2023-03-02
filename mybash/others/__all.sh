while true ; do ./cpu.sh ; sleep 60 ; done &


top -b -n 1 s




-c sudo /usr/local/bin/mount   && ./init_hdp.sh && while true ; do /kniit.sh ; sleep 3600 ; done






cat *.txt >> all.txt

cat file1 file2 > file3


cd tttcb201/sssvols03/ndata/cpa/emb/seq/z_clk_202006_202012d_itemtagb_202009_12/


cat seq_1000000000.txt    ../z_clk_202102_202108_itemtagb2_202106_08/aseq_1000000000.txt     >     seq_2020_2021_merge.txt  &


f = open('test.txt','r')
g = open('test1.txt','w') 
while True:
    x = f.readline()
    x = x.rstrip()
    if not x: break
    print >> g, int(x, 16)



# Information about the command
CONTAINER_TYPE=$1
shift 1
COMMAND=("$@")

# Information about machine and OS
OS=$(uname)
KERNEL=$(uname -r)

ARCH=$(uname -p)
PROCESSOR=$(grep "model name" /proc/cpuinfo | head -1 | awk '{print substr($0, index($0, $4))}')
PROCESSOR_COUNT=$(grep "model name" /proc/cpuinfo | wc -l)

MEM_TOTAL=$(grep MemTotal /proc/meminfo | awk '{print $2, $3}')
SWAP_TOTAL=$(grep SwapTotal /proc/meminfo | awk '{print $2, $3}')

# Information about build tools
if [[ ! -z $(which bazel) ]]; then
  BAZEL_VER=$(bazel version | head -1)
fi

if [[ ! -z $(which javac) ]]; then
  JAVA_VER=$(javac -version 2>&1 | awk '{print $2}')
fi

if [[ ! -z $(which python) ]]; then
  PYTHON_VER=$(python -V 2>&1 | awk '{print $2}')
fi

if [[ ! -z $(which g++) ]]; then
  GPP_VER=$(g++ --version | head -1)
fi

if [[ ! -z $(which swig) ]]; then
  SWIG_VER=$(swig -version > /dev/null | grep -m 1 . | awk '{print $3}')
fi

# Information about TensorFlow source
TF_FETCH_URL=$(git config --get remote.origin.url)
TF_HEAD=$(git rev-parse HEAD)

# NVIDIA & CUDA info
NVIDIA_DRIVER_VER=""
if [[ -f /proc/driver/nvidia/version ]]; then
  NVIDIA_DRIVER_VER=$(head -1 /proc/driver/nvidia/version | awk '{print $(NF-6)}')
fi

CUDA_DEVICE_COUNT="0"
CUDA_DEVICE_NAMES=""
if [[ ! -z $(which nvidia-debugdump) ]]; then
  CUDA_DEVICE_COUNT=$(nvidia-debugdump -l | grep "^Found [0-9]*.*device.*" | awk '{print $2}')
  CUDA_DEVICE_NAMES=$(nvidia-debugdump -l | grep "Device name:.*" | awk '{print substr($0, index($0,\
 $3)) ","}')
fi

CUDA_TOOLKIT_VER=""
if [[ ! -z $(which nvcc) ]]; then
  CUDA_TOOLKIT_VER=$(nvcc -V | grep release | awk '{print $(NF)}')
fi

# Print info
echo "TF_BUILD_INFO = {"\
"container_type: \"${CONTAINER_TYPE}\", "\
"command: \"${COMMAND[*]}\", "\
"source_HEAD: \"${TF_HEAD}\", "\
"source_remote_origin: \"${TF_FETCH_URL}\", "\
"OS: \"${OS}\", "\
"kernel: \"${KERNEL}\", "\
"architecture: \"${ARCH}\", "\
"processor: \"${PROCESSOR}\", "\
"processor_count: \"${PROCESSOR_COUNT}\", "\
"memory_total: \"${MEM_TOTAL}\", "\
"swap_total: \"${SWAP_TOTAL}\", "\
"Bazel_version: \"${BAZEL_VER}\", "\
"Java_version: \"${JAVA_VER}\", "\
"Python_version: \"${PYTHON_VER}\", "\
"gpp_version: \"${GPP_VER}\", "\
"swig_version: \"${SWIG_VER}\", "\
"NVIDIA_driver_version: \"${NVIDIA_DRIVER_VER}\", "\
"CUDA_device_count: \"${CUDA_DEVICE_COUNT}\", "\
"CUDA_device_names: \"${CUDA_DEVICE_NAMES}\", "\
"CUDA_toolkit_version: \"${CUDA_TOOLKIT_VER}\""\
"}"




cut -c9- < /proc/1/cpuset


#########################################################
#########################################################
fallocate -l 4970M  /home/dump.tmp


fallocate -l 140100M  /home/dump.tmp



base64 /dev/urandom/ | head -c 30000000 > /home/fdump2.tmp 


rm -f /home/dump2.tmp

rm -f /home/dump.tmp


/home/popo01/test_code/sparkc/new_mona


du -Sh  /data/ | sort -rh | head -20


du -Sh  /home/popo01/ | sort -rh | head -20



du -Sh  /home/popo01/ | sort -rh | head -20





du -Sh  /sys/fs/cgroup/cpa/db  | sort -rh | head -20


print(get_size(), 'bytes')




find -maxdepth 1 -type d   -exec du -sh {} /data/ 


du -Sh  /data/workspaces/takos01/ | sort -rh | head -20


du -Sh  /data/workspaces/ | sort -rh | head -20



du -Sh  tttcb201/sssvolh03/ndata/ | sort -rh | head -100  > zbigfile.txt




du -Sh  /data/ | sort -rh | head -20





