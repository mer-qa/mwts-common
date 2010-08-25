#!/usr/bin/python
# -*- coding: utf-8 -*-

# Copyright (C) 2010 Intel Corporation.
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
#       Jeff Zheng <jeff.zheng@intel.com>
#
# Description: CM_Prof_ActiveProfile
#

import sys
import os
dir=os.path.dirname(sys.argv[0])+"/common"
sys.path.append(dir)
import time
import gobject

import dbus
from common import *

manager = manager.manager
print 'Creating profile TestProfile...'
try:
    profile = manager.CreateProfile('TestProfile')
except dbus.DBusException, e:
    pass
print 'TestProfile created, check...'
properties = manager.GetProperties()
profiles = properties['Profiles']

for path in profiles:
    id = path[path.rfind('/') + 1:]
    if id == 'TestProfile':
        print 'Found profile TestProfile!'
        try:
            manager.SetProperty('ActiveProfile', path)
        except dbus.DBusException, e:
            if e._dbus_error_name \
                == 'org.moblin.connman.Error.NotSupported':
                print 'This feature is not supported now, please wait...'
                EXIT(False)
            else:
                print e
            EXIT(False)
        print 'Set ActiveProfile property without error'
        properties = manager.GetProperties()
        print 'ActiveProfile property value is %s' \
            % properties['ActiveProfile']
        EXIT(True)

print 'Not found profile TestProfile!'
EXIT(False)

