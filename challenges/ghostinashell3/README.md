# solution
- ssh to the docker
- find /tmp folder
- find /opt/bannerkoder/cipher.sh
  - directly or via /etc/crontabs/root
- openssl enc -aes-256-cbc -d -in /home/pinky/flag.enc -kfile /tmp/7367111C2875730D00686C13B98E7F36
