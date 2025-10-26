#!/bin/bash
cat users.txt| while read -r line ; do
NEWUSERNAME=$(echo ${line}|cut -d ";" -f 1|xargs)
NEWUID=$(echo ${line}|cut -d ";" -f 3|xargs)
NEWGID=$(echo ${line}|cut -d ";" -f 4|xargs)
NEWNAME=$(echo ${line}|cut -d ";" -f 5|xargs)
NEWHOME=$(echo ${line}|cut -d ";" -f 6|xargs)
NEWSHELL=$(echo ${line}|cut -d ";" -f 7|xargs)
useradd -d "${NEWHOME}" -m -s "${NEWSHELL}" -u "${NEWUID}" -g "${NEWGID}" -c "${NEWNAME}" "${NEWUSERNAME}"
done

