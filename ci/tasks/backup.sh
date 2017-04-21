#!/bin/bash -e

echo "$BOSH_CACERT" > rootCA.pem

echo -e "$BOSH_USER\n$BOSH_PASSWORD\n"| bosh --ca-cert rootCA.pem target  $BOSH_URL

bosh backup "bosh-$(date +%Y-%m-%dT%H:%M:%S%z).tgz"

echo $STORE_PASSWORD | scp bosh*.tgz $STORE_USER@$STORE_HOST:$STORE_PATH
