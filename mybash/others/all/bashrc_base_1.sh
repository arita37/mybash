

#### Common Shell Scripts  #########################################################
chmod -R 777 ${HOME}/zscript
export PATH="${HOME}/zscript:$PATH"

#find ${HOME}/zs3drive/zscript/ -type f -iname "*" -exec chmod +x {} \;
#export PATH="${HOME}/zs3drive/zscript:$PATH"


export PIP_REQUIRE_VIRTUALENV=false



###################################################################################
########## Alias   ################################################################
alias bashe="vim open ${HOME}/.bashrc"
alias bashs="source ${HOME}/.bashrc"
alias bashe2="nano ${HOME}/.bashrc"

alias shorten="PS1='\u:\W\$ '"
alias home="cd ${HOME}/"





### Give access to script
alias chmodall="find $1/*.sh -type f -exec chmod 777 '{}' \;  "

alias topc="top -c -p $(pgrep -d',' -f python)  "


topc2() {
  top -c -p $(pgrep -d',' -f $1)     
}


chmodc() {
  echo  "Execute access to ${HOME}/zscript"    
  chmod -R  +x  "${HOME}/zscript"
}


# alias etc="sudo nano /etc/environment"     
 


finds() {
    find $1 -type f -name "$2*"  -exec sh -c 
}




