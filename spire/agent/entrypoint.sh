#!/bin/sh
# Bootstrap agent with a one-time token so it can join
if [ ! -f /run/spire/data/bootstrap_info ]; then
  /opt/spire/bin/spire-server token generate -spiffeID "spiffe://example.org/agent" > /run/spire/data/bootstrap_info
fi
/opt/spire/bin/spire-agent run -config /run/spire/conf/agent.conf