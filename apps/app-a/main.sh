#!/bin/sh
# Fetch SVID from Workload API
echo "App A SPIFFE ID:" \
  && curl --unix-socket $SPIFFE_ENDPOINT_SOCKET \
         --request GET http://localhost/0.5.0/workload/x509Svid | jq -r '.'.svids[0].spiffe_id
# Simulate call to App B
echo "Calling App B..."
app_b_address="app-b"
echo "App A connecting to App B with mTLS certs..."
# For demo, we simply curl insecurely
curl http://localhost:9001/hello