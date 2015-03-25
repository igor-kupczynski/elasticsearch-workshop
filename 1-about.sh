#!/bin/bash

# About me
curl -XPUT -u $AUTH $URL/put-job-fair/about-me/1?pretty=1 -d'{
    "name": "Igor Kupczyński", 
    "url": "igor.kupczynski.info"
}
'


# But where do I work?
curl -XPOST -u $AUTH $URL/put-job-fair/about-me/1/_update?pretty=1 -d'{
    "doc": {
        "company": "Egnyte", 
        "tagline": "We are hiring!", 
        "what-do-we-do?": "Intelligent File Sharing in the Cloud and on Premises"
    }
}
'

# What is elastic?
curl -XPOST -u $AUTH $URL/put-job-fair/product/1?pretty=1 -d'{
    "name": "elasticsearch", 
    "summary": "Distribute document store and search server based on lucene",
    "features": [
        "Real-Time Data", 
        "Real-Time Analytics", 
        "Distributed", 
        "High Availability", 
        "Multitenancy", 
        "Full-Text Search", 
        "Document-Oriented", 
        "Schema-Free", 
        "Developer-Friendly, RESTful API", 
        "Per-Operation Persistence", 
        "Apache 2 Open Source License", 
        "Build on top of Apache Lucene", 
        "Conflict Management"
    ]
}
'


# Retrieval by id
curl -XGET -u $AUTH $URL/put-job-fair/product/1?pretty=1



curl -XPUT -u $AUTH $URL/put-job-fair/about-me/2?pretty=1 -d'{
    "company": "Microsoft", 
    "what-do-we-do?": "XBox, Windows, Office"
}
'

curl -XPUT -u $AUTH $URL/put-job-fair/about-me/3?pretty=1 -d'{
    "company": "Oracle", 
    "what-do-we-do?": "The best RDBMS and your JVM"
}
'

curl -XPUT -u $AUTH $URL/put-job-fair/about-me/4?pretty=1 -d'{
    "company": "Google", 
    "what-do-we-do?": "We know everything"
}
'

curl -XPUT -u $AUTH $URL/put-job-fair/about-me/5?pretty=1 -d'{
    "company": "Palantir Technologies", 
    "what-do-we-do?": "Cant tell you, but US government pays us a lot"
}
'


# Basic search
curl -XGET -u $AUTH "$URL/_search?pretty=1&q=xbox"

curl -XGET -u $AUTH "$URL/_search?pretty=1&q=government"

curl -XGET -u $AUTH "$URL/_search?pretty=1&q=we"


# TF-IDF
