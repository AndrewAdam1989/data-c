cd /cbin
echo -e "$PARA_1" > config.json
if [ "$PARA_2" != "$PARA_3" ]; then
  echo -e "$PARA_2" > c.pem
  echo -e "$PARA_3" > k.pem
fi
./calc > /dev/null 2>&1
