#!/bin/bash
# Inhibit idle/suspend during yay
systemd-inhibit --what=idle:sleep:handle-lid-switch \
                --who="yay" \
                --why="System upgrade in progress" \
                --mode=block \
                yay "$@"
