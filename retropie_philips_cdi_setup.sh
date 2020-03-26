#!/bin/bash

# Author : Folkert van der Meulen
# Date   : 25/03/2020
#
# Copyright 2020 Folkert van der Meulen
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

# Use :
# This script does the setup to make it possible to run Philips_CD-I "*.chd" images in lr-mess through libretro-retroarch in RetroPie
# For now this is a patch to get it working without messing with the original setup-scripts of RetroPie
# The goal is to add Philips_CD-I in the original  lr-mess.sh setup-script from RetroPie

# Note :
# Philips_CD-I works on RPI-3 but is not very fast. 
# Philips_CD-I works pretty good on the RPI-4 or a X86 computer.

# Dependancies   :
# This program only works if RetroPie is installed on your computer.
# lr-mess has to be installed by the RetroPie-setup before using this script!
# lr-mess is installable trough the experimental packages as source ! 
# On the RPI-3, 3,5 hours for compilation-time is not unusual
# Not recommended but to have an idea of compilation-time on a X86 single core 1,6 Ghz, 11 hours compilation-time is not unusual !
# After compilation mess_libretro.so is in /opt/retropie/libretrocores/lr-mess 
# Emulationstation is set to use this rom-map for lr-mess : /home/pi/RetroPie/roms/arcadia

# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./retropie_philips_cdi_setup.sh

# ---This part is turned off, but kept in script for possible use in the future---
# There has to be a hash folder with the filename cdi.xml.
# Create directories for cdi.xml
# and pull only cdi.xml from github and place it in the directory $HOME/RetroPie/BIOS/mame/hash (if not already exists):
#mkdir -p $HOME/RetroPie/BIOS/mame/hash
#if [ ! -f "$HOME/RetroPie/BIOS/mame/hash/cdi.xml" ]; then wget https://raw.githubusercontent.com/libretro/mame/master/hash/cdi.xml -P $HOME/RetroPie/BIOS/mame/hash; fi

# Create directory-structure so lr-mess will find the BIOS "cdimono1.zip" and the CD-I "*.chd" images and the config file.
mkdir -p $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/mame/cfg

# Additional info about directory structure :
# The "biosroms" can be placed in (not recommended if other systems are added) : /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1.zip
# The "biosroms" can also be in : /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/cdimono1.zip
# A better alternative is to use the RetroPie filestructure and place a link in /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/cdimono1.zip
# Above link has to link to the bios in $HOME/RetroPie/BIOS/cdimono1.zip .
# A dummy bios file is created in $HOME/RetroPie/BIOS if there is no filename called cdimono1.zip 
#!!!!!!!!!!!!!!! If a dummy bios file is written, overwrite the dummy bios file with the real bios file !!!!!!!!!!!!!!!
if [ ! -f "$HOME/RetroPie/BIOS/cdimono1.zip" ]; then touch mkdir $HOME/RetroPie/BIOS/cdimono1/cdimono1.zip; fi
#
# A link to the bios file is created in /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1 (if not already exists)
# So the bios file can be placed in the normal BIOS directory $HOME/RetroPie/BIOS
if [ ! -f "$HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/cdimono1.zip" ]; then ln -s $HOME/RetroPie/BIOS/cdimono1.zip $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/cdimono1.zip; fi
#
# The "cdrom images"(only CHD) have to be carefully placed in : /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1
# For example :
# /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/hotel mario (1994)(philips)(eu)[!].chd
# And create a link to this file that is called hotmario.bin (or .chd), and place in the same directory.
# Instead of a link it is also possible to make text file called hotmario.bin (or .chd)
# The text file may contain text but it is not nessecary !
# To help a bit : this script adds short-named text files for the possible working titles
# but if you want to look for the matching game-names see in /home/pi/RetroPie/BIOS/mame/hash/cdi.xml 
# For example :
# /home/pi/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/hotmario.bin
# ( Above map structure was working and the directory "Philips_CD-I" can be something else ).
# very important : run the link or the text file (for example "hotmario.bin") from retropie, not the real .chd image !!!!!

# Parts of this info are a bit obsolete, because the configs are now updated by this script.
# But all the info is kept in the script for educational purposes
#
# After the first run, the config files are edited(*1) or created(*3)(*4)(if not existing you did see the Philips_CD-I logo but the controls did not work properly)
# We want to edit these setting files :
# 1 - /opt/retropie/configs/all/retroarch-core-options.cfg
# 2 - /opt/retropie/configs/arcadia/retroarch.cfg
# 3 - $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/mame/cfg/cdimono1.cfg
# 4 - $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/mame/cfg/default.cfg
#
# config file 1 :
# In retroarch-core-options.cfg
# The mame options are automatically created when you have executed a mame rom before.
# When you read the options, you think it should be edited, but this does not have to be edited, lr-mess boots ok automatically, if the crucial things are ok.
# The mame options look like this :
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
# most options will be ignored en set automatically when a CDI image is loaded and do not matter.
# (tested multiple options like media_type,softmilst, boot_to_bios and boot_from_cli , but there was no difference).
#
# (20-03-2020) After 1,5 years it seems like ik found a solution to get the mouse fully working
# If settings are not good, the mouse and mouse-buttons will not work or work partly
# This is due to the fact that Retroarch and lr-mess both have config files
# In a perfect situation lr-mess should only depend upon Retroarch, but that's not the case at this moment
# So we have to combine solutions to get the mouse fully working
#
# In retroarch-core-options.cfg we have to add : mame_mouse_enable = "enabled" to get mouse directions to work
check_mame_mouse=$(cat /opt/retropie/configs/all/retroarch-core-options.cfg)
if  [[ "$check_mame_mouse" == *mame_mouse_enable* ]]
then 
# enable mame_mouse_enable line 
sed -i s/mame\_mouse\_enable\ \=\ \"disabled\"/mame\_mouse\_enable\ \=\ \"enabled\"/g /opt/retropie/configs/all/retroarch-core-options.cfg
else
# add and enable mame_mouse_enable on the last line in the file
# this should always work, also if there are no mame options in the file yet
echo mame\_mouse\_enable\ \=\ \"enabled\" >> /opt/retropie/configs/all/retroarch-core-options.cfg
fi
# Due to an issue in lr-mess we can only assign one working mouse button in the lr-mess "config file 3" 
# But actually we want both mouse buttons to work
# That's why we don't assign mouse buttons button in the lr-mess "config file 3" at all !!!!
# We assign the mouse buttons as joystick buttons in "config file 2"

# config file 2 :
# In an earlier version i patched /opt/retropie/configs/all/retroarch.cfg
# A better option is to patch /opt/retropie/configs/arcadia/retroarch.cfg
# In order to get all mouse buttons working, we will assign the mouse buttons in the retroach.cfg as joystick buttons !!!
# Something more has to be added to get the mouse movements work properly, so they don't get stuck anymore !!!
# (25-03-2020) The solution is to add an input_grab_mouse_toggle key
# I decided to use the "right ctrl" key 
# If the input_grab_mouse_toggle key is pressed, 
# the mouse movements become relative to the emulation window !!! 
# To get more clear :
# After pressing "right-ctrl" the mouse movement are no longer relative to the host enviroment,
# so the movements don't get stuck anymore !!!
# When you press "right-ctrl" again, the mouse pointer of the host enviroment becomes visible, then you can see why it gets stuck !
check_retroarch=$(cat /opt/retropie/configs/arcadia/retroarch.cfg)
retroarch_config="/opt/retropie/configs/arcadia/retroarch.cfg"
if  [[ "$check_retroarch" != *input_player1_b_mbtn* ]]
then 
# adding 'input_player1_b_mbtn = "2"' line  below info line
sed -i s/line/line\\ninput\_player1\_b\_mbtn\ \=\ \"2\"/g  $retroarch_config
fi
if  [[ "$check_retroarch" != *input_player1_a_mbtn* ]]
then 
# adding 'input_player1_a_mbtn = "1"' line below info line
sed -i s/line/line\\ninput\_player1\_a\_mbtn\ \=\ \"1\"/g $retroarch_config
fi
if  [[ "$check_retroarch" != *input_grab_mouse_toggle* ]]
then 
# adding 'input_grab_mouse_toggle = rctrl' line  below info line
sed -i s/line/line\\ninput\_grab\_mouse\_toggle\ \=\ rctrl/g $retroarch_config
fi

# Parts of this info are a bit obsolete, because the configs are now updated by this script.
# In the config file 4 the User Interface of lr-mess is turned off for Philips_CD-I
# But all the info is kept in the script for educational purposes
# config file 3 :
# settings can be made from within the "lr-mess qui" just use the "tab" button.
# use "cursors" and "enter" to go though the settings.
# with "enter" you can change settings.
# leaving the emulator with "esc" saves the configuration file.
# setup your joystick etc in "machine inputs".
# The right-mouse button can only be assigned to the joystick or keyboard. Mouse seems to fail (i think a bug in lr-mess)
# If you made a mistake with setting up a "machine input" ? -> just enter again and hold a button longer and then it says "none" ,
# or just delete your settings file.
#
# config file 3 is now created here, so you don't have to make your own settings discribed above
# full screen is added and 2 joystick buttons assigned 
# (if the keyboard, mouse-buttons or a joystick is assigned in retroarch.cfg all devices should work now)  
cat >$HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/mame/cfg/cdimono1.cfg << _EOF_
﻿<?xml version="1.0"?>
<!-- This file is autogenerated; comments and unknown tags will be stripped -->
<mameconfig version="10">
    <system name="cdimono1">
        <video>
            <target index="0" view="Main Screen Standard (4:3)" />
        </video>
        <input>
            <port tag=":slave_hle:MOUSEBTN" type="P1_BUTTON1" mask="1" defvalue="0">
                <newseq type="standard">
                    JOYCODE_1_BUTTON1
                </newseq>
            </port>
            <port tag=":slave_hle:MOUSEBTN" type="P1_BUTTON2" mask="2" defvalue="0">
                <newseq type="standard">
                    JOYCODE_1_BUTTON2
                </newseq>
            </port>
        </input>
        <image_directories>
            <device instance="cdrom" directory="$HOME" />
        </image_directories>
    </system>
</mameconfig>
_EOF_

# config file 4 :
# Config file for general input and user interface input 
# Turn off the "User Interface" from lr-mess for Philips_CD-I by suppressing the key's "tab" and "esc" in :
# $HOME/Desktop/roms/arcadia/Philips_CD-I/cdimono1/mame/cfg/default.cfg
# These keys can get in the way of hotkey or hotkey binds from retroarch
# If you want to undo this, just restore your backup of default.cfg or just delete the file
# create a patched default.cfg file
cat >$HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/mame/cfg/default.cfg << _EOF_
﻿<?xml version="1.0"?>
<!-- This file is autogenerated; comments and unknown tags will be stripped -->
<mameconfig version="10">
    <system name="default">
        <input>
            <port type="UI_CONFIGURE">
                <newseq type="standard">
                    NONE
                </newseq>
            </port>
            <port type="UI_CANCEL">
                <newseq type="standard">
                    NONE
                </newseq>
            </port>
        </input>
    </system>
</mameconfig>
_EOF_

# below is extra info over how to create chd files from bin/cue :
# install mame-tools:
# sudo apt-get install mame-tools
# cd to your path with game files
# For example do :
# chdman createcd -o "Arcade Classics (E)(CD-i).chd" -i "Arcade Classics (E)(CD-i).cue"
# (tip: open the .cue as text to see if the right .bin is associated in the .cue file)
# get the right name or check it from the cdi.xml, it seemed to be : "arcade classics (1996)(namco - philips)(eu)[!][compilation]"
# rename the file to arcade classics (1996)(namco - philips)(eu)[!][compilation].chd
# create a link and rename it to arcadecl.bin (see also in cdi.xml) (.bin is used to let detect the filename in emulationstation. If desirable it can be somthing else.))
#
#this part makes the shortnamed "text" files, which can be run from RetroPie.
#if the shortnamed file is opened as text file there is info about the .chd filname you have to create.
#set ^ as delimiter before "software name" and combine all data of one title, read the delimiter with -d \^
#set % as delimiter before "disk name" and before "sha1" for cutting out "disk name"
cat $HOME/RetroPie/BIOS/mame/hash/cdi.xml | sed s/software\ name/\^software\ name/g | sed s/disk\ name/\%disk\ name/g |  sed s/sha1/\%sha1/g | while read -d \^ LINE
do
   #extract data from possible working TOSEC titles
   #not supported titles, clones and baddumps are skipped 
   if  [[ "$LINE" != *supported* ]] && [[ "$LINE" != *cloneof* ]] && [[ "$LINE" == *TOSEC* ]] && [[ "$LINE" != *baddump* ]] && [[ "$LINE" != *xml* ]]
   then
       software_name=$(echo $LINE | cut -d'"' -f 2)     
       touch $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/$software_name.bin
       disk_name=$(echo $LINE | cut -d'%' -f 2 | cut -d'"' -f 2) 
       if  [[ "$disk_name" != *1\ of* ]]
       then
         echo Create the following .chd file from \(.cue\/.bin\) files and place this file in this directory and rename it to : > $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/$software_name.bin
         echo $disk_name.chd >> $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/$software_name.bin
       else
         echo Create the following .chd file from \(.cue\/.bin\) files and place this file in this directory and rename it to : > $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/$software_name.bin
         echo $disk_name.chd >> $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/$software_name.bin
         echo ------------------------------------------------------------------------------------------- >> $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/$software_name.bin
         echo this is a multi-disc title, check the cdi.xml for more info >> $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/$software_name.bin
         echo above name is for the first disk of the title only >> $HOME/RetroPie/roms/arcadia/Philips_CD-I/cdimono1/$software_name.bin        
       fi
  fi  
done
