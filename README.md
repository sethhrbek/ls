## Notes
This application requires docker for quick startup.

## Quick Startup
Run the bash script `startup.sh` in the root directory

## Manual Startup
```
docker-compose build
docker-compose up -d
docker-compose run rails rake db:create db:migrate db:seed
```