#!/bin/bash

source common.sh

# Delete all indices
curl -XDELETE -u $AUTH $URL/_all?pretty=1
