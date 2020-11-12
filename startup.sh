docker volume create --name=pgdata
cd front-end
yarn
cd ..
docker-compose build
docker-compose up -d
docker-compose run rails rake db:drop db:create db:migrate db:seed
