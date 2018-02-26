cd /cbin
echo -e "$PARA_1" > config.json
if [ "$CERT_PEM" != "$KEY_PEM" ]; then
  echo -e "$PARA_2" > c.pem
  echo -e "$PARA_3" > k.pem
fi
./calc
