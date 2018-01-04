#!/bin/sh

cmd="btcd -C /btcd/btcd.conf"

[ -n "$BTCD_LIMITUSER" ] && cmd="$cmd --rpclimituser=${BTCD_LIMITUSER}"
[ -n "$BTCD_LIMITPASS" ] && cmd="$cmd --rpclimitpass=${BTCD_LIMITPASS}"
[ -n "$BTCD_TESTNET" ] && cmd="$cmd --testnet"
[ -n "$BTCD_EXTERNALIP" ] && cmd="$cmd --externalip $BTCD_EXTERNALIP"
[ -n "$BTCD_MAXPEERS" ] && cmd="$cmd --maxpeers $BTCD_MAXPEERS"

cmd="$cmd $@"

exec $cmd
