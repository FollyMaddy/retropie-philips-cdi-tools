#!/bin/bash

# ----- this script is tested only a few times, so use this at own risk ! --------
# Preferable : do all instructions manually and read the text carefully !!!!!!!!!!!!

# This script is made to make it possible to run Philips_CD-I "*.chd" images in lr-mess through libretro-retroarch in RetroPie
# Philips_CD-I works on RPI-3 but is not very fast. 
# Philips_CD-I works best on a X86 computer. 

# lr-mess has to be installed by the RetroPie-setup before using this script!
# lr-mess is installable trough the experimental packages as source ! (3,5 hours for compilation is not unusual)
# after compilation mess_libretro.so is in /opt/retropie/libretrocores/lr-mess 
# Emulationstation is set to use this rom-map for lr-mess : /home/pi/RetroPie/roms/arcadia

# A bit confusing, but keep this in mind :
# lr-mess is part of lr-mame, so it uses some "mame-map" structure

# There has to be a hash folder with the filename cdi.xml.
# Create directories for cdi.xml :
mkdir -p $HOME/RetroPie/BIOS/mame/hash
# Pull only cdi.xml from github and place it in the directory $HOME/RetroPie/BIOS/mame/hash (if not already exists):
#wget https://raw.githubusercontent.com/libretro/mame/master/hash/cdi.xml -P $HOME/RetroPie/BIOS/mame/hash

# This program only works if RetroPie is installed on your computer.
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./retropie_philips_cdi_setup.sh
#
# Author : Folkert van der Meulen
# Date   : 01/02/2019
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


if [ ! -f "$HOME/RetroPie/BIOS/mame/hash/cdi.xml" ]; then wget https://raw.githubusercontent.com/libretro/mame/master/hash/cdi.xml -P $HOME/RetroPie/BIOS/mame/hash; fi

# The "cdrom images"(only CHD) have to be carefully placed in : /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1
# For example :
# /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/hotel mario (1994)(philips)(eu)[!].chd
# And create a link to this file that is called hotmario.bin, and place in the same directory.
# (look for the matching gamenames in cdi.xml )
# For example :
# /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/hotmario.bin
# ( Above map structure was working and the directory "Philips_CD-I" can be something else ).
# Create directory-structure so lr-mess will find the BIOS "cdimono1.zip" and the CD-I "*.chd" images.
mkdir -p $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1

# Normally the "biosroms" have to be carefully placed in : /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1.zip
# A better alternative is to use the RetroPie filestructure and place a link in /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/cdimono1.zip
# and place the bios in $HOME/RetroPie/BIOS/cdimono1.zip .
# A dummy bios file is created in $HOME/RetroPie/BIOS if there is no filename called cdimono1.zip 
if [ ! -f "$HOME/RetroPie/BIOS/cdimono1.zip" ]; then touch mkdir $HOME/RetroPie/BIOS/cdimono1/cdimono1.zip; fi
echo '!!!!!!!!!!!!!!! If a dummy bios file is written, overwrite the dummy bios file with the real bios file !!!!!!!!!!!!!!!'

# A link to the bios file is created in /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1 (if not already exists)
# So the bios file can be placed in the normal BIOS directory $HOME/RetroPie/BIOS
if [ ! -f "$HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/cdimono1.zip" ]; then ln -s $HOME/RetroPie/BIOS/cdimono1.zip $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/cdimono1.zip; fi

## very important : run the link (for example "arcadecl.bin") from retropie, not the real image !!!!!

# after the first run, the settingsfiles are edited(*1) or created(*2) !!! (you did see the Philips_CD-I logo but the mouse did not work)
# Important, there are 2 setting files we want to edit :
# 1 - /opt/retropie/configs/all/retroarch-core-options.cfg
# 2 - $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/mame/cfg/cdimono1.cfg

# settingsfile 1 :
# In retroarch-core-options.cfg manually add (not in this script yet): 
# mame_mouse_enable = "enabled"
# (left-mouse clicking works now "out of box", right-mouse clicking does not work)
# ------------------------------------------------------------------------------------------------------------------
# ((if not using Retropie and only using retroarch, retroarch-core-options.cfg is in : /home/pi/.config/retroarch ))
# ------------------------------------------------------------------------------------------------------------------
# All other option are automatically created when you executed a mame rom before.
# When you read it, you think it should be edited, but this does not have to be edited, lr-mame boots ok automatically, if the crucial things are ok.
#
# mame_alternate_renderer = "disabled"
# mame_altres = "640x480"
# mame_auto_save = "disabled"
# mame_boot_from_cli = "enabled"
# mame_boot_to_bios = "disabled"
# mame_boot_to_osd = "disabled"
# mame_buttons_profiles = "enabled"
# mame_cheats_enable = "disabled"
# mame_mame_paths_enable = "disabled"
# mame_media_type = "rom"
# mame_mouse_enable = "enabled"
# mame_read_config = "disabled"
# mame_saves = "game"
# mame_softlists_auto_media = "enabled"
# mame_softlists_enable = "enabled"
# mame_throttle = "disabled"
# mame_write_config = "disabled"
#
# all other options will be ignored en set automatically when a CDI image is loaded or do not mather.
# (tested multiple options like media_type,softmilst, boot_to_bios and boot_from_cli , but there was no difference).

# settingsfile 2 :
# settings can be made from within the "lr-mess qui" just use the "tab" button.
# use "cursors" and "enter" to go though the settings.
# with "enter" you can change settings.
# leaving the emulator with "esc" saves the configuration file.
# setup your joystick etc in "machine inputs".
# The right-mouse button can only be assigned to the joystick or keyboard. Mouse seems to fail (i think a bug in lr-mess)
# Made a mistake with setting up the "machine inputs" ? -> just enter again and hold a button longer and then it says "none" ,
# or just delete your settings file.

### below is extra info over how to create chd files from bin/cue :
## install mame-tools:
# sudo apt-get install mame-tools
## cd to your path with game files
## For example do :
## chdman createcd -o "Arcade Classics (E)(CD-i).chd" -i "Arcade Classics (E)(CD-i).cue"
## get the right name or check it from the cdi.xml, it seemed to be : "arcade classics (1996)(namco - philips)(eu)[!][compilation]"
## rename the file to arcade classics (1996)(namco - philips)(eu)[!][compilation].chd
## create a link and rename it to arcadecl.bin (see also in cdi.xml) (.bin is used to let detect the filename in emulationstation. If desirable it can be somthing else.))

