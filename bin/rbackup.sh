#!/usr/bin/env bash
# https://web.archive.org/web/20190219014953/https://blog.interlinked.org/tutorials/rsync_time_machine.html
date=`date "+%Y-%m-%dT%H_%M_%S"`
day=`date "+%Y-%m-%d"`
HOME="/Users/mwarren/"
BACKUPDIR="/Users/mwarren/Backups"
daydir="$BACKUPDIR/$day"
if [[ ! -d "$daydir" ]]; then
    mkdir "$daydir"
fi

BACKUPDEST="$daydir/back-$date"

#  --delete \
#  --delete-excluded \
#      --verbose --verbose \
#      --dry-run \

# original options were -azP. Arch Linux wiki suggests
# https://wiki.archlinux.org/index.php/rsync#Snapshot_backup
# -aPh instead. Quick reference from rsync manpage.
#
# -a, --archive               archive mode; equals -rlptgoD (no -H,-A,-X)
# -h, --human-readable        output numbers in a human-readable format
# -P                          same as --partial --progress
#     --partial               keep partially transferred files
#     --progress              show progress during transfer
# -x, --one-file-system       don't cross filesystem boundaries
# -z, --compress              compress file data during the transfer


rsync -aPh \
      --one-file-system \
      --filter="merge ${XDG_CONFIG_HOME:-$HOME/.config}/rsync/rsync-filter" \
      --cvs-exclude \
      --link-dest="$BACKUPDIR/current" \
      "$HOME" "$BACKUPDEST"

# BACKUPDIR="/Users/mwarren/Backups"
rm -f "$BACKUPDIR/current"
ln -s "$BACKUPDEST" "$BACKUPDIR/current"

#  user@backupserver:Backups/incomplete_back-$date \
# && ssh user@backupserver \
# "mv Backups/incomplete_back-$date Backups/back-$date \
# && rm -f Backups/current \
# && ln -s back-$date Backups/current"
