if [ -d ~/remote-home ]; then
    sh "$(dirname "$0")/r-force-umounts.sh"
fi

mkdir ~/remote-home
sshfs <some-name>:/home/<short-account> ~/remote-home
# some-name is defined in .ssh/config