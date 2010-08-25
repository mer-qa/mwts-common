#!/bin/sh
#DESCR: Check if DRI2 is enabled
# Copyright (C) 2009, Intel Corporation.
# 
# This program is free software; you can redistribute it and/or modify it
# under the terms and conditions of the GNU General Public License,
# version 2, as published by the Free Software Foundation.
#
# This program is distributed in the hope it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.  
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, write to the Free Software Foundation, Inc., 59 Temple
# Place - Suite 330, Boston, MA 02111-1307 USA.
#
# Authors:
#        Zheng,Kui  <kui.zheng@intel.com>
#
#
# check if DRI2 is enabled, through /tmp/Xorg.0.log
# DRI2 should be enabled
# if DRI2 is not enabled, skip
#
#

XPID=`pgrep Xorg`
if [ -n "$XPID" ]; then
    echo "Checking Xorg.0.log"
else
    echo "Xorg is not started"
    exit 1
fi
XUSRNAME=`ps -C Xorg -o user=`
LOGDIR2=/var/log/Xorg.0.log
LOGDIR1=/tmp/Xorg.0.$XUSRNAME.log
if [ -s "$LOGDIR1" ]; then
    LOG=$LOGDIR1		 
elif [ -s "$LOGDIR2" ]; then
    LOG=$LOGDIR2
else 
    echo "can't find Xorg.0.log"
    exit 1
fi
DRI2_STATUS=`cat $LOG | grep "DRI2.*Setup complete"`
if [ -n "$DRI2_STATUS" ]; then
    echo "DRI2 is Enabled, PASS!"
else
    echo "DRI2 is not Enabled, FAIL"
    exit 1
fi

exit 0
	
