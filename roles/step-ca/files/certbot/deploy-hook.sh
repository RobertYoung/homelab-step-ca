#!/bin/sh

echo "deploy hook executed for domain: $RENEWED_LINEAGE"

USER_ID=1000
GROUP_ID=1000

for CERT_DIR in "$RENEWED_LINEAGE"/*; do
  for CERT_FILE in "$CERT_DIR"; do
    echo "updating permissions for $CERT_FILE to $USER_ID:$GROUP_ID"
    chown $USER_ID:$GROUP_ID "$CERT_FILE"
  done
done

echo "deploy hook completed for domain: $RENEWED_LINEAGE"