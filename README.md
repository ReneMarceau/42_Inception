# Project Inception: Docker-Based Infrastructure

## Description
Project Inception is designed to deepen your understanding of system administration by leveraging Docker. The goal is to virtualize multiple Docker images, creating them in your personal virtual machine.

## Prerequisites
- Docker and Docker Compose installed on your system.
- Basic understanding of Docker, Docker Compose, and virtual machines.
- Familiarity with Linux (Alpine Linux or Debian Buster), NGINX, WordPress, and MariaDB.

## Installation
1. Clone the repository to your local machine:
    ```bash
    git clone [repository URL]
    ```
2. Navigate to the project directory:
    ```bash
    cd [project directory]
    ```

## Usage
To launch the application, run the following command in the project root directory:
```bash
make all
```
This command will use the `Makefile` to build Docker images via `docker-compose.yml`.

## Step-by-Step Guide

### Step 1: Setting Up the Virtual Machine
- Ensure that your virtual machine is properly set up and Docker is installed.

### Step 2: Creating Docker Containers
- **NGINX Container**: Create a Docker container with NGINX, configured to use TLSv1.2 or TLSv1.3.
- **WordPress Container**: Set up WordPress with php-fpm, without NGINX.
- **MariaDB Container**: Deploy MariaDB in a separate container.

### Step 3: Volumes and Networking
- Set up two volumes: one for the WordPress database and one for WordPress files.
- Configure a Docker network to link the containers.

### Step 4: Dockerfiles and docker-compose
- Write Dockerfiles for each service and include them in your `docker-compose.yml`.
- Configure your Makefile for building the Docker environment.

### Step 5: Security and Best Practices
- Avoid using the `latest` tag in Dockerfiles.
- Do not store passwords or sensitive information in Dockerfiles.
- Use environment variables for configuration. Store them in a `.env` file in your `srcs` directory.

### Step 6: Domain Configuration
- Configure your domain name (e.g., `login.42.fr`) to point to your local IP address.

## Useful Links
- Docker Documentation: [https://docs.docker.com/](https://docs.docker.com/)
- Docker Compose: [https://docs.docker.com/compose/](https://docs.docker.com/compose/)
- NGINX Official Site: [https://www.nginx.com/](https://www.nginx.com/)
- WordPress Codex: [https://codex.wordpress.org/](https://codex.wordpress.org/)
- MariaDB Knowledge Base: [https://mariadb.com/kb/en/](https://mariadb.com/kb/en/)

## Contributing
For contributions, please open a pull request or an issue to discuss the proposed changes.

## License
[Specify the license under which the project is made available]
