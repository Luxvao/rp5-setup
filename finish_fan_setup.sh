#!/bin/bash

ln -s /root/rp5-setup/rp5-fan-control/rp5-fan-controller /etc/init.d/rp5-fan-controller
update-rc.d rp5-fan-controller defaults
