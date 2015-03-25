#!/bin/bash

source common.sh

# Create the index
curl -XPUT -u $AUTH $URL/deathrow?pretty=1 -d@resources/deathrow-settings.json

# Check the settings
curl -XGET -u $AUTH $URL/deathrow/_settings?pretty=1
curl -XGET -u $AUTH $URL/deathrow/_mappings?pretty=1


# Index the dataset
for I in `ls resources/deathrow | cut -d'.' -f1 | sort -n`
do
    curl -u $AUTH -XPUT $URL/deathrow/execution/$I?pretty=1 -d"@resources/deathrow/$I.json"
done
