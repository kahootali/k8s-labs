helm template mongo-release bitnami/mongodb --version 11.0.6 -n default -f mongo-values.yaml > mongo-templatized.yaml
helm install mongo-release bitnami/mongodb --version 11.0.6 -n default -f mongo-values.yaml  

# Now mongo DB server is running, for client side, we will be deploying another mongo pod, which will serve as client
kubectl apply -f mongo-client.yaml 

mongosh admin --host "mongo-release-mongodb-0.mongo-release-mongodb-headless.default.svc.cluster.local:27017,mongo-release-mongodb-1.mongo-release-mongodb-headless.default.svc.cluster.local:27017" --authenticationDatabase admin -u root -p root123

mongosh admin --host "mongo-release-mongodb-1.mongo-release-mongodb-headless.default.svc.cluster.local:27017" --authenticationDatabase admin -u root -p root123

mongosh admin --host "mongo-release-mongodb-0.mongo-release-mongodb-headless.default.svc.cluster.local:27017" --authenticationDatabase admin -u root -p root123

use inventory
db.inventory.insertMany([
   { item: "journal", qty: 25, status: "A", size: { h: 14, w: 21, uom: "cm" }, tags: [ "blank", "red" ] },
   { item: "notebook", qty: 50, status: "A", size: { h: 8.5, w: 11, uom: "in" }, tags: [ "red", "blank" ] },
   { item: "paper", qty: 10, status: "D", size: { h: 8.5, w: 11, uom: "in" }, tags: [ "red", "blank", "plain" ] },
   { item: "planner", qty: 0, status: "D", size: { h: 22.85, w: 30, uom: "cm" }, tags: [ "blank", "red" ] },
   { item: "postcard", qty: 45, status: "A", size: { h: 10, w: 15.25, uom: "cm" }, tags: [ "blue" ] }
]);


db.inventory.find({}).pretty()