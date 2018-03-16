# Repozytorium z przedmiotu NoSQL

Dane: [Crime Data from 2010 to Present](https://catalog.data.gov/dataset/crime-data-from-2010-to-present)

## To do: 
- [x] Konwersja CSV -> json

[csvtojson](https://www.npmjs.com/package/csvtojson)
```
npm i -g csntojson
csvtojson Crime_Data_from_2010_to_Present.csv > lacrime.json
```
- [x] Instalacja mongoDB
```
dnf install mongodb mongodb-server
```
```
service mongod start
mongo
```
- [x] Import danych do mongoDB
```
mongoimport -d test -c collection_name --type csv --headerline  --drop --file file_path
```
- [x] Collection count
```
db.collection.count()
```
```
> 1,700,816 
```
- [x] localhost replicaset
```
mkdir -p carbon/carbon-0 carbon/carbon-1 carbon/carbon-2
```
```
mongod --replSet carbon --port 27020 --dbpath ./carbon/carbon-0 --smallfiles --oplogSize 128
mongod --replSet carbon --port 27021 --dbpath ./carbon/carbon-1 --smallfiles --oplogSize 128
mongod --replSet carbon --port 27022 --dbpath ./carbon/carbon-2 --smallfiles --oplogSize 128
```
```
mongo --port 27020

rsconf = {
  _id: "carbon",
  members: [
  {
    _id: 0,
    host: "localhost:27020"
  },
  {
    _id: 1,
    host: "localhost:27021"
  },
  {
    _id: 2,
    host: "localhost:27022"
  }
  ]
}

rs.initiate( rsconf )
```
- [ ] replicaset (3 komputery)
- [ ] import script & time counter
```
chmod +x import.sh
./ import.sh
```
[https://github.com/nosql/app-cli-lozovsky/blob/master/README.md](import.sh)
- [ ] Test skryptu
