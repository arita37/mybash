
##### Redirect All endpoints to AWS
echo "Replacing  aws= awslocal in bash"
echo "export aws=awslocal " >> ~/.zshrc
export aws=awslocal





   #### Set permanent endpoints
   #### https://stackoverflow.com/questions/52494196/is-there-any-way-to-specify-endpoint-url-in-aws-cli-config-file


   ### function aws() { /usr/local/bin/aws --endpoint foo "${@}" } 
    # for some reason that didn't work for me, so I used a function: function aws() { /usr/local/bin/aws --endpoint foo "${@}" } then later unset -f aws – 
   # This command must be written in ~/.bash_aliases or ~/.bashrc – 

   ### function aws() { /usr/local/bin/aws --endpoint foo "${@}" } 



