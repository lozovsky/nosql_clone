# Repozytorium z przedmiotu NoSQL

Dane: [Crime Data from 2010 to Present](https://catalog.data.gov/dataset/crime-data-from-2010-to-present)

## To do: 
- [x] Konwersja CSV -> json

[csvtojson](https://www.npmjs.com/package/csvtojson)
```
npm i -g csntojson
csvtojson source.csv > converted.json
```
- [x] Instalacja mongoDB
```
dnf install mongodb mongodb-server
```
```
service mongod start
mongo
```
- [ ] Import danych do mongoDB
- [ ] localhost replicaset
- [ ] replicaset (3 komputery)
- [ ] import script & time counter
- [ ] Test skryptu
