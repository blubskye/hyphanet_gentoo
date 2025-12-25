#!/bin/bash
# Hyphanet run script

set -e

HYPHANET_HOME="/opt/hyphanet"
HYPHANET_DATA="${HYPHANET_DATA:-/var/lib/hyphanet}"
JAVA_OPTS="${JAVA_OPTS:--Xms128m -Xmx1024m}"
PIDFILE="${HYPHANET_DATA}/hyphanet.pid"

# Source configuration if available
[ -f /etc/default/hyphanet ] && . /etc/default/hyphanet
[ -f /etc/conf.d/hyphanet ] && . /etc/conf.d/hyphanet

JAVA_CMD="java"
MAIN_JAR="${HYPHANET_HOME}/freenet.jar"
EXT_JAR="${HYPHANET_HOME}/lib/freenet-ext.jar"

CLASSPATH="${MAIN_JAR}:${EXT_JAR}"

cd "${HYPHANET_DATA}"

case "$1" in
    start)
        echo "Starting Hyphanet..."
        exec ${JAVA_CMD} ${JAVA_OPTS} ${JAVA_EXTRA_OPTS} \
            -Dfile.encoding=UTF-8 \
            -cp "${CLASSPATH}" \
            freenet.node.NodeStarter \
            "${HYPHANET_DATA}"
        ;;
    stop)
        echo "Stopping Hyphanet..."
        if [ -f "${PIDFILE}" ]; then
            kill $(cat "${PIDFILE}") 2>/dev/null || true
            rm -f "${PIDFILE}"
        fi
        ;;
    status)
        if [ -f "${PIDFILE}" ] && kill -0 $(cat "${PIDFILE}") 2>/dev/null; then
            echo "Hyphanet is running (PID: $(cat ${PIDFILE}))"
            exit 0
        else
            echo "Hyphanet is not running"
            exit 1
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop|status}"
        exit 1
        ;;
esac
