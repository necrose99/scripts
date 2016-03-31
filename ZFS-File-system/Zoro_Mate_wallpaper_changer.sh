# Script to randomly set Background from files in a directory
while true;do
# specify how long to wait in seconds between changes
sleep 3600
# Directory Containing Pictures
DIR="/home/michel/Wallpapers"

# Command to Select a random jpg file from directory
# Delete the *.jpg to select any file but it may return a folder
PIC=$(ls $DIR/*.jpg | shuf -n1)

# Command to set Background Image
mateconftool-2 -t string -s /desktop/mate/background/picture_filename $PIC
done