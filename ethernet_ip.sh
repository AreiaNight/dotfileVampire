#!/bin/sh


echo "%{F#3ecae6}󱠩 $(ifconfig eth0 | grep "inet " | awk '{print $2}')%{u-}"

