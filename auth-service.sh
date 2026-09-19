dnf install -y golang
go version
useradd -r -s /bin/false appuser
mkdir -p /app
curl -L -o /tmp/auth-service.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/auth-service.tar.gz
cd /app
tar xzf /tmp/auth-service.tar.gz
cd /app
chown -R appuser:appuser /app
chmod o-rwx /app -R
cp auth-service.sh /etc/systemd/system/
systemctl daemon-reload
systemctl enable auth-service
systemctl start auth-service