# Add the port mapping you need @1 is the ip address passed from the argument
# example: ssh -f  -N -R  2222:ins-101.nnn.hnd2..local:22 -o StrictHostKeyChecking=no zzz.taro@$1
ssh -f  -N -R  2222:<some-server>:22 -o StrictHostKeyChecking=no <long-account>@$1 # ssh
# ssh -f  -N -R  XXXX:<some-server>:XXXX -o StrictHostKeyChecking=no <long-account>@$1 # jupyter
