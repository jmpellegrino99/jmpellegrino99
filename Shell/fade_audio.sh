#!/bin/bash

WAV_IN=$1

FADE_IN_L="0:3"
FADE_OUT_L="0:3"

LENGTH=`soxi -d $WAV_IN`

sox "$WAV_IN" "out_$WAV_OUT" fade $FADE_IN_L $LENGTH $FADE_OUT_L
