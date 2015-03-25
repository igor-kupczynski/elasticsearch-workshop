#!/bin/bash

source common.sh

# Sum execution by counties
curl -XGET -u $AUTH $URL/deathrow/execution/_search?pretty=1 -d'{
    "aggs": {
        "counties": {
            "terms": {
                "field": "county"
            }
        }
    }, 
    "size": 0
}
'

# Age histogram
curl -XGET -u $AUTH $URL/deathrow/execution/_search?pretty=1 -d'{
    "aggs": {
        "age": {
            "histogram": {
                "field": "age", 
                "interval": 5
            }
        }
    }, 
    "size": 0
}
'

# County - Race
curl -XGET -u $AUTH $URL/deathrow/execution/_search?pretty=1 -d'{
    "aggs": {
        "counties": {
            "aggs": {
                "races": {
                    "terms": {
                        "field": "race"
                    }
                }
            }, 
            "terms": {
                "field": "county"
            }
        }
    }, 
    "size": 0
}
'
