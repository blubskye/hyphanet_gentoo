#!/bin/bash
# Hyphanet run script
# Copyright (C) 2024 blubskye
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# Source: https://github.com/blubskye/hyphanet_gentoo

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
