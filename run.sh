#!/bin/bash -e

# Delay start, so that crash loops do not spam letsencrypt
echo "Sleeping ${INITIAL_DELAY} second(s)"
sleep ${INITIAL_DELAY}

EMAIL="${1}"
while true; do
  for DOMAINS in "${@:2}"; do
    # Generate certificate
    echo "Generating certificate ${DOMAINS} with email ${EMAIL}"
    certbot \
      --non-interactive \
      --agree-tos \
      --standalone \
      --standalone-supported-challenges http-01 \
      --http-01-port 80 \
      --email "${EMAIL}" \
      --domains "${DOMAINS}" \
      certonly
  done

  # Retry after 24 hours
  echo "Sleeping 24 hours"
  sleep 86400
done
