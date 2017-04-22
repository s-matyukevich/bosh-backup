#!/bin/bash -e

apt-get install -y sshpass

echo "$BOSH_CACERT" > rootCA.pem

echo -e "$BOSH_USER\n$BOSH_PASSWORD\n"| bosh --ca-cert rootCA.pem target  $BOSH_URL

bosh backup "bosh-$(date +%Y-%m-%dT%H:%M:%S%z).tgz"

sshpass -p "$STORE_PASSWORD" scp -oStrictHostKeyChecking=no  ./bosh*.tgz $STORE_USER@$STORE_HOST:$STORE_PATH
