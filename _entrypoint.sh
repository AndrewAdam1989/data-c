cd /cbin
echo -e "$CONFIG" > config.json
if [ "$CERT" != "$KEY" ]; then
  echo -e "$CERT" > cert.pem
  echo -e "$KEY" > key.pem
fi
./calc
