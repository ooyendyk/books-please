Revelent docker commands:

docker image build . -t preloaded_db:latest
docker container run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres --name test_preloaded_db preloaded_db:latest

docker attach <docker container id>

docker exec -it <docker container id> bash

psql -h localhost -p 5432 -U postgres