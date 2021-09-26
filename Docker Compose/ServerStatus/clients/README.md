### 非Systemd托管服务
1. chmod +x /usr/local/src/client-linux.py
2. vi /etc/crontab
- @reboot ${Normal_User} /usr/local/src/client-linux.py SERVER=127.0.0.1 USER=user
