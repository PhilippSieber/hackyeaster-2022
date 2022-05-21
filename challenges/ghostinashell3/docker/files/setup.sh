#!/usr/bin/env bash
set -e

# set password
echo "pinky:!speedy!" | chpasswd

# disable history
echo 'set +o history' >> /home/pinky/.bashrc

# disable password change
passwd -n 9999 pinky

# write random files to /tmp
for value in {1..49}; do
  echo "foo${value}bar" | md5sum | base64 | head -c 32 > /tmp/`uuidgen | tr -d '-'`
done

# make home dir readonly
chown -R root:root /home/pinky
chmod -R 755 /home/pinky

# make some dirs readonly and disable messaging.
chmod -R 755 /tmp
chmod 644 /tmp/*
chmod -R 755 /var/tmp
chmod -R 700 /dev/shm
chmod -R 700 /dev/mqueue

# set flag readable for root only
chmod 400 /home/pinky/flag.txt

# remove the file
rm -f /etc/entrypoint.d/setup.sh

# remove su
rm -f /bin/su

# start cron
crond