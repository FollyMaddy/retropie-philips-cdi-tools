# retropie-philips-cdi-tools
I have added 2 programs.
1- To set up the map structure to get philips cdi working in retropie with lr-mess
(retropie_philips_cdi_setup.sh)
2- Create Philips_CD-I gamelist.xml for Retropie from cdi.xml of lr-mame/lr-mess.

See below for more information:

1: 
bash script 
I have made Philips_CD-I working with lr-mess.
I have automated this in the script called "retropie_philips_cdi_setup.sh"
This script will setup the basic stuff.

----- this script is tested only a few times, so use this at own risk ! --------
Preferable : do all instructions manually and read the text in the script carefully !!!!!!!!!!!!

This script is made to make it possible to run Philips_CD-I "*.chd" images in lr-mess through libretro-retroarch in RetroPie
Philips_CD-I works on RPI-3 but is not very fast. 
Philips_CD-I works best on a X86 computer. 

Notes :

VCD and VCD-games do not work ;
right mouse button does not work . (work in progress for the libretro team)

Extra info about creating .chd files and mouse settings are in the script.
So carefully read the script !

Later i will try to make a better script.

ps.
In addition just using "mess" works better.
But is too slow on Raspberry pi.
Perhaps raspberry pi 4 will do.
If so i will try to make a script for that.

2:
Create Philips_CD-I gamelist.xml for Retropie from cdi.xml of lr-mame/lr-mess.

When you use lr-mess for running Philips_CD-I you make use of shortnamed link files.
This script converts the "good info" of cdi.xml from lr-mame/lr-mess to a useful retropie gamelist.xml.

For now, only the "shortnames with path" and the "longnames discriptions" are converted. 

You can read the script to find out more.
