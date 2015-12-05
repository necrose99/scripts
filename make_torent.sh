
command -v mktorrent >/dev/null

[ -n "$version" ] || version="$anon_dist_build_version"

## Thanks to:
## https://github.com/moba/createtortorrents/blob/master/createtorrents.sh

#TRACKERS="udp://tracker.openbittorrent.com:80/announce,udp://tracker.publicbt.com:80/announce,http://tracker.openbittorrent.com:80/announce,http://tracker.publicbt.com:80/announce,udp://tracker.ccc.de/announce"

TRACKERS="http://announce.torrentsmd.com:6969/announce"#!/bin/bash

## This file is part of Whonix.
## Copyright (C) 2012 - 2014 Patrick Schleizer <adrelanos@riseup.net>
## See the file COPYING for copying conditions.

set -x
true "INFO: Currently running script: $BASH_SOURCE${1+"$@"}"
set -o pipefail

MYDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$MYDIR"

source ../../../help-steps/pre
source ../../../help-steps/colors
source ../../../help-steps/variables


sudo -E -u "$user_name" mkdir --parents "$WHONIX_BINARY/torrent-$version"
chown --recursive "$user_name:$user_name" "$WHONIX_BINARY/torrent-$version"

## Not well supported by BitTorrent clients.
## Multi file webseeds do not work
##     https://trac.transmissionbt.com/ticket/4437
## (fixed upstream, but takes a while to propagate to Debian stable)
#sudo -E -u "$user_name" mktorrent \
#   --verbose \
#   --announce="$TRACKERS" \
#   --web-seed "http://mirror.whonix.de/Whonix-Gateway-7.ova" \
#   --web-seed "http://mirror.whonix.de/Whonix-Workstation-7.ova" \
#   ~/7

## CoralCDN:
## .8008.nyud.net can no longer be appended to http://mirror.whonix.de,
## because CoralCDN appears to no longer support files greater than 50 MB.

if [ "$WHONIX_BUILD_VIRTUALBOX" = "true" ]; then
   if [ ! -r "$binary_image_ova" ]; then
      error "$binary_image_ova not readable!"
   fi
fi

if [ "$WHONIX_BUILD_QCOW2" = "true" ]; then
   if [ ! -r "$libvirt_target_xz_archive" ]; then
      error "$libvirt_target_xz_archive not readable!"
   fi
fi

if [ "$WHONIX_BUILD_VIRTUALBOX" = "true" ]; then
   sudo -E -u "$user_name" \
      mktorrent \
         --verbose \
         --announce="$TRACKERS" \
         --web-seed "http://mirror.whonix.de/$version/$VMNAME-$version.ova" \
         -o "$binary_image_ova_torrent" \
         "$binary_image_ova"
fi

if [ "$WHONIX_BUILD_QCOW2" = "true" ]; then
   sudo -E -u "$user_name" \
      mktorrent \
         --verbose \
         --announce="$TRACKERS" \
         --web-seed "http://mirror.whonix.de/$version/$VMNAME-$version.libvirt.xz" \
         -o "$libvirt_target_xz_archive_torrent" \
         "$libvirt_target_xz_archive"
fi

## Working.
#echo "$(perl -MURI::Escape -e 'print uri_escape("http://mirror.whonix.de/Whonix-Gateway-7.ova");' "$2")"
#echo "$(perl -MURI::Escape -e 'print uri_escape("http://mirror.whonix.de/Whonix-Workstation-7.ova");' "$2")"

## Not working.
#echo "$(perl -MURI::Escape -e 'print uri_escape("http://mirror.whonix.de/Whonix-Gateway-7.ova");' "$2")"
#echo "$(perl -MURI::Escape -e 'print uri_escape("http://mirror.whonix.de/Whonix-Workstation-7.ova");' "$2")"

benchmarktimeend ## sets benchmark_took_time (implemented in help-steps/pre)
true "${bold}INFO: End of: $BASH_SOURCE | $whonix_build_error_counter error(s) detected. (benchmark: $benchmark_took_time)${reset}"
