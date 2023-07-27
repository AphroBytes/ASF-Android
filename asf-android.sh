# Information script
echo ""
echo "Welcome to my script. Created by sevcator."
echo ""
echo "Original tutorial: https://steamcommunity.com/sharedfiles/filedetails/?id=2570297945"
echo ""
echo "You need just drink a tea, i just install ArchiSteamFarm. Please wait and chill."
echo ""

# Update pkg
pkg update -y

# Installing packages
pkg install proot-distro -y

# Installing Ubuntu
proot-distro install ubuntu

# Installing requirements for ArchiSteamFarm
proot-distro login ubuntu -- bash -c 'apt update -y && apt upgrade -y && apt install libicu70 mono-runtime -y'

# Configure Autostart & motd
echo "proot-distro login ubuntu --fix-low-ports -- bash -c 'DOTNET_GCHeapHardLimit=1C0000000 && /root/asf/ArchiSteamFarm'" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo "Welcome to Termux!" > /data/data/com.termux/files/usr/etc/motd
echo " " >> /data/data/com.termux/files/usr/etc/motd

# Joining into directory Ubuntu
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root

# Creating a folder for ASF and IPC config
mkdir asf
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/asf
mkdir config
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/asf/config
curl -L -O https://github.com/sevcator/ASF-Android/raw/main/IPC.config
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/asf

# Downloading ArchiSteamFarm
arch=$(dpkg --print-architecture)

if [ "$arch" = "arm" ]; then
  curl -L -O https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/5.4.7.3/ASF-linux-arm.zip
  unzip ASF-linux-arm.zip
  clear
  echo "All right!"
  echo ""
elif [ "$arch" = "armhf" ]; then
  curl -L -O https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/5.4.7.3/ASF-linux-arm.zip
  unzip ASF-linux-arm.zip
  clear
  echo "All right!"
  echo ""
elif [ "$arch" = "arm64" ]; then
  curl -L -O https://github.com/JustArchiNET/ArchiSteamFarm/releases/download/5.4.7.3/ASF-linux-arm64.zip
  unzip ASF-linux-arm64.zip
  clear
  echo "All right!"
  echo ""
else
  clear
  echo "Unknown architecture. Please install ArchiSteamFarm manually."
  echo ""
fi
