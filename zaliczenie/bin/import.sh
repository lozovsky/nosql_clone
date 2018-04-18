#!/bin/sh
# Import sample datasets into MongoDB

`mongoimport --host carbon/localhost:27020,localhost:27021,localhost:27022 --db test --collection alarms --file ../data/lacrime.json --jsonArray --drop`
