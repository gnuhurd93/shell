#!/usr/bin/env bash


# script for cp php file to local and start browser


echo "Enter file path:"
read srcAddress
echo "Enter destination diractory:"
read dstAddress 
cp $srcAddress $dstAddress
/usr/bin/firefox localhost/$srcAddress
