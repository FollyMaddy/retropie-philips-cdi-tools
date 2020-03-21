# retropie-philips-cdi-tools

I have added 2 programs.

Dependencies for both scripts : 

These programs only works if RetroPie is installed on your computer.

Also make sure you have installed the desired python-modules.

Lr-mess has to be installed by the RetroPie-setup before using the scripts!

Lr-mess is installable trough the experimental packages as source ! (3,5 hours for compilation is not unusual)

After compilation mess_libretro.so is in /opt/retropie/libretrocores/lr-mess 

Emulationstation is set to use this rom-map for lr-mess : /home/pi/RetroPie/roms/arcadia

# retropie_philips_cdi_setup.sh

Use :

This script is made to make it possible to run Philips_CD-I "*.chd" images in lr-mess through libretro-retroarch in RetroPie

It will set up the map structure to get philips cdi working in retropie with lr-mess

Philips_CD-I works on RPI-3 but is not very fast. 

Philips_CD-I works best on RPI-4 or an X86 computer. 


Notes :

VCD-video/DVC-video and VCD-games/DVC-games do not work ;

There is no mouse support.

Extra info about creating .chd files and mouse settings (if possible) are in the script.

So carefully read the script !

added in 2020 Version :

*full-screen

*full mouse support

*joystick button associations for keyboard, mouse and eventually joystick

*creation of short-name files necessary to load cd-i .chd files

*short-named files contain info about the .chd files to be created (open as textfile)


ps.

In addition, just using "mess" can work better, but is too slow on Raspberry pi.

Perhaps raspberry pi 4 will do.

(not tested for now)


# Retropie_Philips_CD-I_gamelist_creator.py

Use :

Create Philips_CD-I gamelist.xml for Retropie from cdi.xml of lr-mame/lr-mess.

When you use lr-mess for running Philips_CD-I you make use of shortnamed link files.

This script converts the "good info" of cdi.xml from lr-mame/lr-mess to a useful retropie gamelist.xml.

For now, only the "shortnames with path" and the "longnames discriptions" are converted. 

You can read the script to find out more.




