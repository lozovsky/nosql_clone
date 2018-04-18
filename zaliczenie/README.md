## Projekt na zaliczenie z NoSQL


Opis
-------
Projekt został napisany w Ruby i korzysta z [Ruby MongoDB Driver](https://docs.mongodb.com/ruby-driver/master/).
1. Przed użyciem aplikacji należy uruchomić [Replica Set](https://github.com/egzamin/nosql/tree/master/replica_sets).
```
mongod --replSet carbon --port 27020 --dbpath ./carbon/carbon-0 --smallfiles --oplogSize 128
mongod --replSet carbon --port 27021 --dbpath ./carbon/carbon-1 --smallfiles --oplogSize 128
mongod --replSet carbon --port 27022 --dbpath ./carbon/carbon-2 --smallfiles --oplogSize 128
```
2. Uruchamiamy skyprt import.sh, znajdujący sie w folderze bin. Wykona on import do replica set danych znajdujądej się w folderze data (20 000 dokumentów).
3. Następnie należy uruchumić rspec, aby upewnić się czy połączenie z baza jest poprawne.

Skrypty
-------
1. **bin/agg1.rb**

Skrypt zlicza liczbe wystąpień poszczególnych powodów popelnionych przestepstw.

```
$ ./agg1.rb -l n # tworzy tabelkę z n najczęsciej pojawiającymi się powodami zgloszeń
```
W przypadku nie podania parametru, n będzie wynosiło 10.

Tabelka wygenerowana przy użyciu komendy ./agg1.rb -l 15
<table>
  <tr>
    <th>_id</th>
    <th>count</th>
  </tr>
  <tr>
    <td>BATTERY - SIMPLE ASSAULT</td>
    <td>2572</td>
  </tr>
  <tr>
    <td>VEHICLE - STOLEN</td>
    <td>1933</td>
  </tr>
  <tr>
    <td>THEFT PLAIN - PETTY ($950 &amp; UNDER)</td>
    <td>1856</td>
  </tr>
  <tr>
    <td>BURGLARY FROM VEHICLE</td>
    <td>1354</td>
  </tr>
  <tr>
    <td>INTIMATE PARTNER - SIMPLE ASSAULT</td>
    <td>1254</td>
  </tr>
  <tr>
    <td>ROBBERY</td>
    <td>1083</td>
  </tr>
  <tr>
    <td>VANDALISM - MISDEAMEANOR ($399 OR UNDER)</td>
    <td>990</td>
  </tr>
  <tr>
    <td>ASSAULT WITH DEADLY WEAPON, AGGRAVATED ASSAULT</td>
    <td>962</td>
  </tr>
  <tr>
    <td>BURGLARY</td>
    <td>870</td>
  </tr>
  <tr>
    <td>THEFT OF IDENTITY</td>
    <td>697</td>
  </tr>
  <tr>
    <td>VANDALISM - FELONY ($400 &amp; OVER, ALL CHURCH VANDALISMS) 0114</td>
    <td>688</td>
  </tr>
  <tr>
    <td>CRIMINAL THREATS - NO WEAPON DISPLAYED</td>
    <td>670</td>
  </tr>
  <tr>
    <td>THEFT FROM MOTOR VEHICLE - PETTY ($950 &amp; UNDER)</td>
    <td>582</td>
  </tr>
  <tr>
    <td>THEFT-GRAND ($950.01 &amp; OVER)EXCPT,GUNS,FOWL,LIVESTK,PROD0036</td>
    <td>559</td>
  </tr>
  <tr>
    <td>SHOPLIFTING - PETTY THEFT ($950 &amp; UNDER)</td>
    <td>314</td>
  </tr>
</table>
<to_s/>


2. **bin/agg2.rb**

Skrypt tworzy diagram z statystykami zgloszeń w poszczególnych dzielnicach.
Przykładowy [Diagram](https://github.com/nosql/app-cli-lozovsky/blob/master/zaliczenie/bin/district_alarms.pdf).

3. **bin/agg3.rb**

Skrypt zwraca statystyki o wieku poszkodowanych dla zgloszeń w wybranej dzielnicy.
```
$ ./agg3.rb -d <district> # zwraca zliczone powody w dzielnicy <district>
```
W przypadku nie podania parametru, skrypt wybierze dzielnice 12.

Dzielnice podawane sa w postaci liczb calkowitych naturalnych.

Rspec
----------
Pierwsze wywolanie
```
bundle install
```
nastepnie

```
$ rspec spec/*
```
