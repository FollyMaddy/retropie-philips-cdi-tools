#!/usr/bin/env python

#
# Program : Retropie_Philips_CD-I_gamelist_creator.py
# Version : 1.0
# Use : 
# Create Philips_CD-I gamelist.xml for Retropie from cdi.xml of lr-mame/lr-mess.
# Dependencies : 
# This program only works if cdi.xml is in the ~/RetroPie/BIOS/mame/hash/cdi.xml directory.
# if not you can download it with : wget https://raw.githubusercontent.com/libretro/mame/master/hash/cdi.xml -P $HOME/RetroPie/BIOS/mame/hash
# Also make sure you have installed the desired python-modules.
# How to run :
# make it executable : right click -> rights -> execute --> "only owner" or  chmod +x "filename"
# Make sure you're in the right directory, then run it with : ./Retropie_Philips_CD-I_gamelist_creator.py
#
# Author : Folkert van der Meulen
# Date   : 03/02/2019
#
# Copyright 2019 Folkert van der Meulen
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#--------------------------------------


import os 
import time

os.rename('/opt/retropie/configs/all/emulationstation/gamelists/arcadia/gamelist.xml', '/opt/retropie/configs/all/emulationstation/gamelists/arcadia/gamelist.xml.bak')

path_cdi_xml = os.path.expanduser('~/RetroPie/BIOS/mame/hash/cdi.xml')

cdi_xml = open(path_cdi_xml, 'r')
file = open('/opt/retropie/configs/all/emulationstation/gamelists/arcadia/gamelist.xml','w') 
file.write('<?xml version=\"1.0\"?>\n') 
file.write('<gameList>\n') 

for name in cdi_xml:
   if name.startswith('	<software name='):
      name = name.rstrip('\n')
      shortname = name
      shortname = shortname.split('"', shortname.count('"'))[1]
      file.write('	<game>\n') 
      file.write('		<path>./Philips_CD-I/cdimono1/%s.bin</path>\n' %(shortname))
   elif name.startswith('		<description>'):
      name = name.rstrip('\n')
      longname = name
      longname = longname.split('>', longname.count('>'))[1]
      longname = longname.split('<', longname.count('<'))[0]
      file.write('		<name>%s</name>\n' %(longname))
      file.write('	</game>\n') 

file.write('</gameList>\n') 
file.close() 
print "old gamelist backup in /opt/retropie/configs/all/emulationstation/gamelists/arcadia"
print "new gamelist in /opt/retropie/configs/all/emulationstation/gamelists/arcadia"
