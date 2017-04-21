#!/bin/bash -e

echo "BOSH_CACERT" > rootCA.pem

bosh -u $BOSH_USER -p $BOSH_PASSWORD --ca-cert rootCA.pem target $BOSH_URL

bosh backup "bosh-$(date +%Y-%m-%dT%H:%M:%S%z).tgz"

echo $STORE_PASSWORD | scp bosh*.tgz $STORE_USER@$STORE_HOST:$STORE_PATH
