#!/bin/bash

paths=( "/home/user1" "/home/user2" )
trackers=( ${trackers_1}${trackers_2} ${trackers_3})
trackers_1=( "http://tracker.cryptohaze.com/announce" "http://tracker.openbittorrent.com:80/announce" "http://tracker.openbittorrent.com:80/announce")
trackers_2=( "http://denis.stalker.h3q.com:6969/announce " "udp://tracker.coppersurfer.tk:6969" "udp://open.demonii.com:1337" )
trackers_3=(trackers=( "udp://tracker.internetwarriors.net:1337" "udp://tracker.leechers-paradise.org:6969" "udp://tracker.blackunicorn.xyz:6969")
## Unlimited Tracking power...... 

echo "Choose desired path"
select path in "${paths[@]}"
do
  break
done

echo "Choose desired tracker:"
select tracker in "${trackers[@]}"
do
  break
done

echo "Set the private flag"
select private in "yes" "no"
do
  case "$private" in
    yes) flag="-p"
         ;;
    no)  flag=""
         ;;  
  esac
  break
done

read -p "Piece length: " piece

read -p "Specify source: " source

cd "$path"
mktorrent -a ${-w}"$tracker" $flag -l $piece "$source"

# -w for webseeds urls 
#http://mirror.switch.ch/ftp/mirror/pentoo/
-w="$webseeds=( ${webseeds_1}${webseeds_2} ${webseeds_3})
webseeds_1="http://pentoo.west.us.mirror.inerail.net/Pentoo_amd64_default/,http://www.pentoo.ch/isos/Pentoo_amd64_default/"
webseeds_2=",http://www.pentoo.ch/isos/Pentoo_x86_hardened/,http://pentoo.east.us.mirror.inerail.net/Pentoo_amd64_hardened,http://pentoo.west.us.mirror.inerail.net/Pentoo_amd64_hardened,"
#webseeds_3="http://www.pentoo.ch/isos/Pentoo_x86_default/,http://pentoo.east.us.mirror.inerail.net/Pentoo_x86_hardened/,http://pentoo.west.us.mirror.inerail.net/Pentoo_x86_hardened/"
