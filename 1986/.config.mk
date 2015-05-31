# Makefile configuration for RevyScript
#
# Author: munter@diku.dk
#
# This file should be copied and adapted to your local environment

# Define where the scripts are placed.
scriptdir := ../RevyTeX/scripts

# The directories where original .tex materials will be placed
sketchdir := sketches
songdir := sange
videodir := video
bitsdir := brokker
contactsdir := kontakter

# The acts plan. A cleartext file with act headings and material order
plan := aktoversigt.plan

# Define where to place output files
outputdir := www

# Where to put the datafile
json := $(outputdir)/json.js

# Auto generated PDF output placements
manus := $(outputdir)/Manuskript.pdf
acts := $(outputdir)/Aktoversigt.pdf
roles := $(outputdir)/Rolleoversigt.pdf
signup := $(outputdir)/Rolletilmelding.pdf
props := $(outputdir)/Rekvisitliste.pdf
contacts := $(outputdir)/Kontaktliste.pdf
individualdir := $(outputdir)/Individuelt
