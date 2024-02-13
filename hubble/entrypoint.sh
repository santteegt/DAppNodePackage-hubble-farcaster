#!/bin/sh

if [ ! -f ./.hub/default_id.protobuf ]; then
    echo "Creating Peer ID..."
    exec node --no-warnings
        build/cli.js identity create
    echo "Peer ID created."
fi

exec node --no-warnings \
    --max-old-space-size=8192 \
    build/cli.js start \
    --ip 0.0.0.0 \
    --gossip-port ${GOSSIP_PORT} \
    --rpc-port ${RPC_PORT} \
    --eth-mainnet-rpc-url $ETH_MAINNET_RPC_URL \
    --l2-rpc-url $OPTIMISM_L2_RPC_URL \
    --network ${FC_NETWORK_ID} \
    --rpc-subscribe-per-ip-limit ${RPC_SUBSCRIBE_PER_IP_LIMIT} \
    -b ${BOOTSTRAP_NODE} \
    --statsd-metrics-server $STATSD_METRICS_SERVER \
    --hub-operator-fid ${HUB_OPERATOR_FID   } \
    ${EXTRA_OPTs}