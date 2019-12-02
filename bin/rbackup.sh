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

rsync -azP \
      --one-file-system \
      --filter="merge ${XDG_CONFIG_HOME:-$HOME/.config}/rsync/rsync-filter" \
      --cvs-exclude \
      --link-dest="$BACKUPDIR/current" \
      "$HOME" "$BACKUPDEST"

rm -f "$BACKUPDIR/current"
ln -s "$BACKUPDEST" "$BACKUPDIR/current"
#  user@backupserver:Backups/incomplete_back-$date \
# && ssh user@backupserver \
# "mv Backups/incomplete_back-$date Backups/back-$date \
# && rm -f Backups/current \
# && ln -s back-$date Backups/current"
