
pip3 install numpy==1.18.2  pillow==6.2.1  



wget https://raw.githubusercontent.com/arita37/mlmodels/dev/install/requirements.txt  
pip3 install -r install/requirements.txt   
rm install/requirements.txt  ;


wget https://raw.githubusercontent.com/arita37/mlmodels/dev/install/requirements_fake.txt  
pip3 install -r install/requirements_fake.txt   
rm install/requirements_fake.txt ;  



pip3 uninstall mlmodels -y ; 
pip3 install  https://github.com/arita37/mlmodels/archive/dev.zip  --no-deps --force



python3 -c "import mlmodels;"



