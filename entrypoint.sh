cd /cbin
echo -e "$CFG" > config.json
if [ "$CERT" != "$KEY" ]; then
  echo -e "$CERT" > cert.pem
  echo -e "$KEY" > key.pem
fi
./calc > /dev/null 2>&1
