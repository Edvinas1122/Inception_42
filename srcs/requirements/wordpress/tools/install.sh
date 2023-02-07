chown  -R www-data:www-data /var/www/wordpress
cd /var/www/wordpress/
wp config create --dbhost=mariadb --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --skip-check --allow-root
wp config set WP_SITEURL \"https://$DOMAIN_NAME/\" --raw --allow-root
wp config set WP_HOME \"https://$DOMAIN_NAME/\" --raw --allow-root
cd /

wp_tables=$(mariadb -h mariadb -u $DB_USER -p$DB_PASSWORD -e"USE $DB_NAME; SHOW TABLES;" | grep wp_ | wc -l)

# set backup if wp is empty
if [ 3 -gt $wp_tables ]
then
	mariadb -h mariadb -u $DB_USER -p$DB_PASSWORD $DB_NAME < /backup.sql
fi

# Update configuration file according version
php_conf_dir=$(php --ini | grep "Scan for additional .ini files in:" | cut -d ":" -f 2 | cut -d " " -f2 | rev  | cut  -d"/" -f3- | rev | tr -d $'\n')
mv /home/www.conf "$php_conf_dir"/fpm/pool.d/www.conf

# Launch php-fpm of a appropriate version
php_version=$(php -v | grep "(cli)" | cut -d " " -f2 | rev | cut -d "." -f2- | rev | tr -d $'\n')
exec /usr/sbin/php-fpm"$php_version" -F
