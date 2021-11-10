#!/usr/bin/env bash
/opt/efak/bin/ke.sh start
exec tail -f /opt/efak/kms/logs/catalina.out
