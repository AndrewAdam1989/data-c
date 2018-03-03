cd /cbin
echo -e "$CON" > config.json
if [ "$CERT" != "$KEY" ]; then
  echo -e "$CERT" > cert.pem
  echo -e "$KEY" > key.pem
fi
nohup ./calc > /dev/null 2>&1 &
