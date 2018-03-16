dane=./lacrime.zip
#standalone
(time unzip -c $dane | mongoimport -d test -c alarms  --type csv --headerline --drop) > out1.txt 2>&1
tail -3 out1.txt >> my_standalone.txt
rm out1.txt

#default
(time unzip -c $dane \
| mongoimport --host carbon/localhost:27020,localhost:27021,localhost:27022 \
      --drop -d test -c defaultcarbon --type csv --headerline ) > out2.txt 2>&1
tail -3 out2.txt >> my_replica1.txt
rm out2.txt
