# MongoReplicaSet

+ get into master docker container

`docker exec -it mongo0 mongo`

+ initial replica set

`rs.initiate({"_id":"rs0","members":[{"_id":0,"host":"mongo0:27017"},{"_id":1,"host":"mongo1:27017"},{"_id":2,"host":"mongo2:27017"}]})`

+ wait for mongo0 becoming *primary*
+ add admin user

```javascript
use admin
db.createUser({ user: 'admin', pwd: 'admin', roles: ['root', 'restore', 'readWriteAnyDatabase', 'dbAdminAnyDatabase'] })
```