sudo dkms remove -m asus-wmi -v 1.0 --all
sudo rm -r /usr/src/asus-wmi-1.0

sudo mkdir /usr/src/asus-wmi-1.0
sudo cp -r ~/asus-wmi-screenpad/* /usr/src/asus-wmi-1.0/
cd /usr/src/asus-wmi-1.0/
sudo sh prepare-for-current-kernel.sh
sudo dkms add -m asus-wmi -v 1.0

sudo dkms build -m asus-wmi -v 1.0
sudo dkms install --force -m asus-wmi -v 1.0
