# set -e
# chmod -R 777 /var/lib/mysql
sed -i "s/default_password/$DB_ROOT_PASSWORD/g" /home/init.sql
sed -i "s/user_default/$DB_USER/g" /home/init.sql
sed -i "s/default_user_pwd/$DB_PASSWORD/g" /home/init.sql
sed -i "s/default_db_name/$DB_NAME/g" /home/init.sql
mysqld --user=root --init-file=/home/init.sql
