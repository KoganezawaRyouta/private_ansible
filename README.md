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
