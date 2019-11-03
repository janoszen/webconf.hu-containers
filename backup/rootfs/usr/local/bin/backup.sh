#!/bin/bash

set -e

echo "[default]
host_base = sos-${EXOSCALE_REGION}.exo.io
host_bucket = ${BACKUP_BUCKETURL}
access_key = ${EXOSCALE_KEY}
secret_key = ${EXOSCALE_SECRET}
use_https = True
" > ~/.s3cfg

s3cmd sync --host=${BACKUP_ENDPOINT} --delete-removed /srv/acme/ ${BACKUP_URL}/acme

rm ~/.s3cfg

echo "last_backup $(date +%s)" > /srv/monitoring/last-backup.prom
