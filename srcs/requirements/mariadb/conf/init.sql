-- initiate root
ALTER USER 'root'@'localhost' IDENTIFIED BY 'default_password';

-- provide root access trough other networks
CREATE USER IF NOT EXISTS 'user_default'@'%' IDENTIFIED BY 'default_user_pwd';

-- Create DataBase
CREATE DATABASE IF NOT EXISTS default_db_name;

-- -- Grant edit rights to user
GRANT ALL PRIVILEGES ON *.* TO 'user_default'@'%' IDENTIFIED BY 'default_user_pwd';

FLUSH PRIVILEGES;
