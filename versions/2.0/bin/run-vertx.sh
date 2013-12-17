#!/usr/bin/env sh

version_name=vert.x-2.0.2-final

export VERTX_HOME=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/../${version_name}

echo "PWD: $PWD"
echo "VERTX_HOME: $VERTX_HOME"

export TORQUEBOX_HOST="bam.keynote.projectodd.org"

cd $OPENSHIFT_REPO_DIR

$VERTX_HOME/bin/vertx run  ./server.js  -cluster -cluster-port 9123 -cluster-host ${env.OPENSHIFT_VERTX_IP} -advertise-port ${env.OPENSHIFT_VERTX_VERTX_PROXY_PORT} -advertise-host ${env.OPENSHIFT_VERTX_PROXY_IP}
