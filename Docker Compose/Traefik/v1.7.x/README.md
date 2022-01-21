#### How to add page login verification.
1. yum install -y httpd-tools
2. htpasswd -nb <USER> <PASSWORD>
3. add parameter - "traefik.frontend.auth.basic=user:password" Double $ must be added here.
  
#### Modify file permission
1. chmod 600 acme.json
