#!/bin/sh
# Start a simple HTTP server
mkdir -p /www
httpd -p 9001 &
# Expose SPIFFE ID on request
cat << 'EOF' > /www/hello
#!/bin/sh
echo "App B SPIFFE ID:"
# In real use, fetch SVID via Workload API like App A
echo "spiffe://example.org/app-b"
EOF
chmod +x /www/hello
wait