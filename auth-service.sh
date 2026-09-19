dnf install -y golang

cp auth-service.service /etc/systemd/system/
useradd -r -s /bin/false appuser
mkdir -p /app
echo "download"
curl -L -o /tmp/auth-service.tar.gz https://raw.githubusercontent.com/raghudevopsb88/wealth-project/main/artifacts/auth-service.tar.gz
echo "completed"
cd /app
echo "move"
tar xzf /tmp/auth-service.tar.gz
echo "extracted"
chown -R appuser:appuser /app
chmod o-rwx /app -R

systemctl daemon-reload
systemctl enable auth-service
systemctl start auth-service