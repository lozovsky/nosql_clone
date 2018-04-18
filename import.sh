dane=./lacrime.zip
#standalone
mkdir -p standalone

for ((i=1; $i<= 5;i++)) ; do
(time unzip -c $dane | mongoimport -d test -c alarms  --type csv --headerline --drop) > standalone/"$i.txt" 2>&1
tail -3 standalone/"$i.txt" > standalone/"czas_$i.txt"
rm standalone/"$i.txt"
done

exec ./avg.sh "$PWD/standalone" &
exec ./tabelka.sh "$PWD/standalone" "Standalone" &

#default
mkdir -p replica1

for ((i=1; $i<= 5;i++)) ; do
(time unzip -c $dane \
| mongoimport --host carbon/localhost:27020,localhost:27021,localhost:27022 \
      --drop -d test -c defaultcarbon --type csv --headerline ) > replica1/"$i.txt" 2>&1
tail -3 replica1/"$i.txt" > replica1/"czas_$i.txt"
rm replica1/"$i.txt"
done

exec ./avg.sh "$PWD/replica1" &
exec ./tabelka.sh "$PWD/replica1" "Replica Set {w:1, wtimeout:0}" &

# w:1 j:false
mkdir -p replica 2

for ((i=1; $i<= 5;i++)) ; do
(time unzip -c $dane | mongoimport --host carbon/localhost:27020,localhost:27021,localhost:27022 --drop -d test -c defaultcarbon --writeConcern '{w: 1, j: false}' --type csv --headerline) > replica2/"$i.txt" 2>&1 
tail -3 replica2/"$i.txt" > replica2/"czas_$i.txt"
rm replica2/"$i.txt"
done

exec ./avg.sh "$PWD/replica2" &
exec ./tabelka.sh "$PWD/replica2" "Replica Set {w:1, j:false}" &

# w:1 j:true
(time unzip -c $dane | mongoimport --host carbon/localhost:27020,localhost:27021,localhost:27022 --drop -d test -c defaultcarbon --type csv --headerline --writeConcern '{w:1, j:true}') > out4.txt 2>&1 
tail -3 out4.txt >> my_replica3.txt
#rm out4.txt

# w:2 j:false
(time unzip -c $dane | mongoimport --host carbon/localhost:27020,localhost:27021,localhost:27022 --drop -d test -c defaultcarbon --type csv --headerline --writeConcern '{w:2, j:false}') > out5.txt 2>&1 
tail -3 out5.txt >> my_replica4.txt
#rm out5.txt

# w:2 j:true
(time unzip -c $dane | mongoimport --host carbon/localhost:27020,localhost:27021,localhost:27022 --drop -d test -c defaultcarbon --type csv --headerline --writeConcern '{w:2, j:true}') > out6.txt 2>&1 
tail -3 out6.txt >> my_replica5.txt
#rm out6.txt
