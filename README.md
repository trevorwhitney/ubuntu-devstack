# Ubuntu Devstack

Installation steps for setting up DevStack on a laptop using WiFi for internet access.

## Prereqs

A Clean installation of Ubuntu Server 16.04

## Setup Network

You may need to do this manually from the machine itself, or you could temporarily hook up a wired network connection.

```bash
wpa_passphrase <SSID> > tmp.conf
sudo mv tmp.conf /etc/wpa_supplicant.conf
sudo cp interfaces /etc/network/interfaces
sudp cp logind.conf /etc/systemd/logind.conf
sudo cp rc.local /etc/rc.local
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
cp local.conf.example local.conf
```

Change the `ADMIN_PASSWORD` in local.conf.

```bash
sudo HOST_IP=10.0.0.50 devstack/tools/create-stack-user.sh
sudo chown -R stack:stack /devstack
su stack
sudo apt-get autoremove python3-six
cp local.conf devstack/local.conf
FORCE=yes /devstack/stack.sh
```

## Troubleshooting

When you change things, you may need to clean up with the following before stacking agin:

```bash
devstack/unstack
devstack/clean
```
