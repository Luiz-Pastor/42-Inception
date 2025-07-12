# Inception
Project based on building a Wordpress application with a MariaDB database and a proxy managed with Nginx. It has two volumes to persist Wordpress and database data. It is a 42 Common Core project.

The project is based on setting up three containers, each with one of the aforementioned services, all in a network that includes only those containers. All of them are configured from the start, except for the WordPress service, which must be configured initially if there is not enough information in its volume.

# Installing and running the project

1- Clone the repository.
```bash
git clone https://github.com/Luiz-Pastor/Inception.git
```

2- Create a `.env` file that has the variables from `.env.example` with the desired value.
> **Note**: If no `.env` exists, the next step will create one with the example values from `.env.example`.

3- Modify the path where you want to save the volumes. These can be found in `docker-compose.yml` and are:
- `wordpress`: Stores information about the WordPress container.
- `mariadb`: Stores information about the database used by WordPress.

By default they are saved in the `srcs/volumes` folder

4- Run `make`.
```bash
cd Inception
make
```

With all this, you can access the WordPress page at "https://localhost". Since the certificates used are self-signed, you may see a warning when you try to access the page.

# Makefile utilities
In the project makefile, the following rules can be used:
- `all`/ `up`: lift the containers. Use the `env` rule.
- `down`: stop system services, without deleting volumes.
- `env`: if there is no `.env`, it copies it from the example one.
- `clean`: stop the services, delete the `.env` and volumes.