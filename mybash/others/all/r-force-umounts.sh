if [ "$(mount | grep "$HOME/remote-home")" ]; then
    echo "umounting $HOME/remote-home"
    ps x | grep sshfs | grep -v grep | awk '{print $1}' | xargs kill -9
    umount -f ~/remote-home
fi

if [ -d ~/remote-home ]; then
    [ ! "$(ls -A ~/remote-home)" ] && rm -rf ~/remote-home  || echo "WARNING: NOT Empty"
fi
