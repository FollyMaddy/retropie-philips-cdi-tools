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

Philips_CD-I works best on a X86 computer. 

----- this script is tested only a few times, so use this at own risk ! --------

Preferable : do all instructions manually and read the text in the script carefully !!!!!!!!!!!!

Notes :

VCD and VCD-games do not work ;

Right mouse button does not work. (work in progress for the libretro team)

Extra info about creating .chd files and mouse settings are in the script.

So carefully read the script !

Perhaps, later on, i will try to make a better script.

ps.

In addition, just using "mess" works better, but is too slow on Raspberry pi.

Perhaps raspberry pi 4 will do.

If so, i will try to make a script for that.

# Retropie_Philips_CD-I_gamelist_creator.py

Use :

Create Philips_CD-I gamelist.xml for Retropie from cdi.xml of lr-mame/lr-mess.

When you use lr-mess for running Philips_CD-I you make use of shortnamed link files.

This script converts the "good info" of cdi.xml from lr-mame/lr-mess to a useful retropie gamelist.xml.

For now, only the "shortnames with path" and the "longnames discriptions" are converted. 

You can read the script to find out more.




