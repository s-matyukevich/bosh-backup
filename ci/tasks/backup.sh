#!/bin/bash

bosh -u $BOSH_USER -p $BOSH_PASSWORD target $BOSH_URL

bosh backup "bosh-$(date +%Y-%m-%dT%H:%M:%S%z).tgz"

echo $STORE_PASSWORD | scp bosh*.tgz $STORE_USER@$STORE_HOST:$STORE_PATH
