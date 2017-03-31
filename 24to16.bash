#!/bin/bash

set -euo pipefail

DIR_FROM="./audio/from/"
DIR_TO="./audio/to/"

# start fresh
rm -fr $DIR_TO*
cp -r $DIR_FROM* $DIR_TO

# convert files to 16 bit
find $DIR_TO -type f -name "*.wav" | \
    xargs -I file sox file -r 44100 -b 16 file.16.wav

# remove original
find audio/to/ -type f -not -name "*16.wav" | xargs rm

# rename converted
find -name "*.16.wav" -type f | rename 's/.16.wav//g'


# sox CL_Trex1.wav -r 44100 -b 8 CL_Trex1-8.wav
