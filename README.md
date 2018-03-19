# Repozytorium z przedmiotu NoSQL

Dane: [Crime Data from 2010 to Present](https://catalog.data.gov/dataset/crime-data-from-2010-to-present)

## Measured times
| Typ importu                   | real time         | user time         | sys time  |
| :---                          | ---               | ---               | ---       |
| standalone                    | 44.654 [s]        | 1 [m] 39.3742 [s] | 6.777 [s] |
| replica set default           | 6 [m] 48.3302 [s] | 1 [m] 45.9328 [s] | 7.43  [s] | 
| replica set (w: 1, j: false)  | 1 [m] 32.4982 [s] | 1 [m] 45.4486 [s] | 6.736 [s] |
| replica set (w: 1, j: true)   | 5 [m] 33.7674 [s] | 1 [m] 49.2026 [s] | 7.439 [s] |
| replica set (w: 2, j: false)  | 5 [m] 27.5454 [s] | 1 [m] 51.247  [s] | 7.545 [s] |
| replica set (w: 2, j: true)   | 5 [m] 50.1938 [s] | 1 [m] 44.5534 [s] | 7.612 [s] |


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
- [x] import script
```
chmod +x import.sh
./ import.sh
```
[import.sh](https://github.com/nosql/app-cli-lozovsky/blob/master/import.sh)

- [ ] Przygotowanie danych porownawczych
