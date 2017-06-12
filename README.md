## app set up
```
ansible-playbook app.yml -i inventory/app
```

## pem file upload to provisioning server
```
scp -i ec2-key.pem ec2-key.pem ec2-user@<管理インスタンスのPublic_IP>:~/
```

## db set up(from web server)
```
ansible-playbook db.yml -i inventory/db
```

## cpsm for vim
```
sudo yum remove boost
wget https://sourceforge.net/projects/boost/files/boost/1.63.0/boost_1_63_0.zip
mkdir -p /home/{{ boost_user }}/bootstrap-lib
/home/{{ boost_user }}/boost_1_63_0/bootstrap.sh --prefix=/home/{{ boost_user }}/bootstrap-lib
/home/{{ boost_user }}/boost_1_63_0/b2 install
sudo BOOST_ROOT=/home/ec2-user/boost-lib /home/{{ boost_user }}/.vim/bundle/cpsm/install.sh
```
