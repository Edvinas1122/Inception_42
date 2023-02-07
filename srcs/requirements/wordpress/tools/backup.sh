apt install -y mariadb-client;
mysqldump --add-drop-table -h mariadb -u $DB_USER -p$DB_PASSWORD $DB_NAME > /var/www/wordpress/backup.sql