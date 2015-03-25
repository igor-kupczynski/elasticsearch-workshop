#!/bin/bash

source common.sh

# Query DSL


# Term query - white
curl -XGET -u $AUTH $URL/deathrow/execution/_search?pretty=1 -d'{
    "size": 3,
    "query": {
        "term": {
            "race": "white"
        }
    }
}
'

# Range query - <= 40 y.o.
curl -XGET -u $AUTH $URL/deathrow/execution/_search?pretty=1 -d'{
    "query": {
        "range": {
            "age": {
                "lte": 40
            }
        }
    }, 
    "size": 3
}
'

# Filter
curl -XGET -u $AUTH $URL/deathrow/execution/_search?pretty=1 -d'{
    "query": {
        "filtered": {
            "filter": {
                "range": {
                    "age": {
                        "lte": 40
                    }
                }
            }, 
            "query": {
                "match_all": {}
            }
        }
    }, 
    "size": 3
}
'

# Match versus term
curl -XGET -u $AUTH $URL/deathrow/execution/_search?pretty=1 -d'{
    "query": {
        "match": {
            "county": "Dallas"
        }
    }, 
    "size": 3
}
'

curl -XGET -u $AUTH $URL/deathrow/execution/_search?pretty=1 -d'{
    "query": {
        "term": {
            "county": "Dallas"
        }
    }, 
    "size": 3
}
'

# Boolean query
curl -XGET -u $AUTH $URL/deathrow/execution/_search?pretty=1 -d'{
    "query": {
        "bool": {
            "must": [
                {
                    "term": {
                        "county": "dallas"
                    }
                }
            ], 
            "should": [
                {
                    "range": {
                        "age": {
                            "gte": 40
                        }
                    }
                }, 
                {
                    "match": {
                        "statement": "love"
                    }
                }
            ]
        }
    }, 
    "size": 3
}
'


# To discuss:
# * Indexing - inverted index
# * Advanced example - http://igor.kupczynski.info/2014/10/22/search-for-product-name.html
