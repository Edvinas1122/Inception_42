# Docker LNMP Stack with WordPress
This project sets up a Docker-based LNMP (Linux, Nginx, MySQL, PHP) stack along with a WordPress site. The project ensures a saved state for both the WordPress site and the database, providing a resilient and flexible solution for hosting WordPress. It also includes scripts for managing database backups, making data management efficient and straightforward.

## About the Project
This project uses Docker to containerize the following services:

### MariaDB:
This service uses the MariaDB image and is configured to persist data using a Docker volume (db). This ensures that your database data remains intact across container restarts.

### WordPress:
The WordPress service is built on top of a custom image. It depends on the MariaDB service to provide the database for WordPress. The service uses a Docker volume (wp) to persist WordPress data, ensuring that your site data remains safe across container restarts.

### Nginx:
The Nginx service serves as a reverse proxy to the WordPress service. It depends on the WordPress service and uses the same Docker volume (wp) to access the WordPress site files. The service exposes port 443 (default HTTPS port) and uses the inception network.

The project uses a docker-compose.yml file to define and configure these services, making it easy to set up and manage the entire stack with a few commands.

