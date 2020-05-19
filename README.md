# Docker + Alpine + MariaDB(Mysql)

This is an upgrade to the [leafney/docker-alpine-mysql](https://github.com/leafney/docker-alpine-mysql).

#### Parameters

Copy `.env.template` to a `.env` file

* `MYSQL_ROOT_PWD` : root Password default is "mysql"
* `MYSQL_USER`     : new UserName
* `MYSQL_USER_PWD` : new User Password
* `MYSQL_USER_DB`  : new Database for new User

Move `traefik.toml.template` to `traefik.toml` and change certificate string with your certification

#### Run with docker-compose file

```
$ docker-compose up -d
```

### Customization

See `usr/local/bin/setup_mysql` file

### Get the mysql ip

    make ip.mysql

See more on `Makefile`
