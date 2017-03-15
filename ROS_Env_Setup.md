# ROS install
## Mac:
1. Install brew: `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`.
2. Fix PATH problem:
```
echo export PATH='/usr/local/bin:$PATH' >> ~/.bash_profile
source ~/.bash_profile
```
3. Run brew doctor (`brew doctor`) to see if everything is OK.
4. Install ROS framework:

    follow the instruction here: [Installation Instructions for Kinetic in OS X](http://wiki.ros.org/kinetic/Installation/OSX/Homebrew/Source)
    
	(1) Executing `rosdep install --from-paths src --ignore-src --rosdistro kinetic -y` show:
	```
	Warning: qt5 is a keg-only and another version is linked to opt.
Use `brew install --force` if you want to install this version
ERROR: the following rosdeps failed to install
  homebrew: Failed to detect successful installation of [qt5]
	```
	


## Raspberry debian based:
1. Download operating system img file corresponding to board.
2. Extract img file if compressed.
3. Before writing to SD card, use `diskutil` to confirm you are writing to the right place.
4. Write img to SD card: `sudo dd if=/Path/to/img/file.img of=/dev/rdisk2 bs=1m`. 
5. If write successed, put SD card into board and boot.
6. Wireless startup auto connect configuration:

    (1) use `ifconfig` to identify what wireless interface name is. (usually `wlan0`)

    (2) open `/etc/network/interfaces` with proper privilege, replace `auto lo` or `auto eth0` with `auto wlan0`, and if there is no configuration about wlan0, add:
```
iface wlan0 inet dhcp
	wpa-ssid AUDATECH
	wpa-psk udifhduijhnklfdkahfdkahfkda
```
if there is one, make it look like above.

    (3) use `wpa_passphrase <ssid> <password>` to get wpa-psk

    (4) "reboot" wireless interface:
```
sudo ifdown wlan0
sudo ifup wlan0
```

7. Setup remote ssh access:

    (1) install openssh-server: `sudo apt-get install openssh-server`
    
    (2) enable service: `sudo systemctl enable ssh.service`
    
    (3) allow port 22 for ssh: `sudo ufw allow ssh`
    
    (4) start or restart openssh server: `sudo systemctl restart sshd.service`
    
8. Install ROS framework:

    follow the instruction here: [Ubuntu install of ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu)