# Ubuntu Devstack

Installation steps for setting up DevStack on a laptop using WiFi for internet access.

## Setup Network
run `wpa_passphrase <SSID> >> /etc/wpa_supplicant.conf`, then enter your passphrase.

```bash
cp interfaces /etc/network/interfaces
cp logind.conf /etc/systemd/logind.conf
cp rc.local /etc/rc.local
```

Reboot and make sure network works `ping google.com` and ssh in from the outside to `10.0.0.50`

## Update OS

```bash
apt-get update
apt-get -y dist-upgrade
apt-get -y upgrade
```

## Install Devstack

```bash
/devstack/tools/create-stack-user.sh
chown -R stack:stack /devstack
su stack
/devstack/stack.sh
```

