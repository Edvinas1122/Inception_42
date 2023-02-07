sed -i "s/localhost/$DOMAIN_NAME/g" /home/default
mv /home/default /etc/nginx/sites-enabled/$DOMAIN_NAME
openssl req -nodes -x509 -newkey rsa:4096 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -sha256 -days 365 -subj "/CN=$DOMAIN_NAME";

nginx -g "daemon off;"