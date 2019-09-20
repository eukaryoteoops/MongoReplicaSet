docker-compose up -d --build
timeout /t 5
docker exec -it mongo0 mongo --eval "rs.initiate({\"_id\":\"rs0\",\"members\":[{\"_id\":0,\"host\":\"mongo0:27017\"},{\"_id\":1,\"host\":\"mongo1:27017\"},{\"_id\":2,\"host\":\"mongo2:27017\"}]})"
timeout /t 15
docker exec -it mongo0 mongo --eval "db=db.getSiblingDB(\"admin\");db.createUser({user:\"admin\",pwd:\"admin\",roles:[\"root\",\"restore\",\"readWriteAnyDatabase\",\"dbAdminAnyDatabase\"]})"

