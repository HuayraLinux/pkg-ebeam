#!/bin/bash

export LD_LIBRARY_PATH=/opt/diva
export DISPLAY=:0

sleep 5
/opt/diva/eBeam_Stylus_Preferences &>> $HOME/.diva.preferences.log
