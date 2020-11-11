## Notes
This application requires docker for quick startup.

## Quick Startup
Run the bash script `startup.sh` in the root directory

You may need to give it permissions:
`chmod u+x startup.sh`

To view the application, visit:
localhost:3000


The rails server will be exposed on port 8080 (http://localhost:8080/)
``

## Manual Startup
```
docker volume create --name=pgdata
docker-compose build
docker-compose up -d
docker-compose run rails rake db:create db:migrate db:seed
```