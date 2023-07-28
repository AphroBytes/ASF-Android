# Information script
clear
echo "Welcome to my script. Created by sevcator."
echo ""
echo "Original tutorial: https://steamcommunity.com/sharedfiles/filedetails/?id=2570297945"
echo ""
echo "Auto-Install ArchiSteamFarm"
echo ""

# Update pkg
pkg update -y -o Dpkg::Options::="--force-confnew"

# Installing packages
pkg install proot-distro -y

# Installing Ubuntu
proot-distro install ubuntu

# Installing requirements for ArchiSteamFarm
proot-distro login ubuntu -- bash -c 'apt update -y && apt upgrade -y && apt install libicu70 mono-runtime -y'

# Create a user noroot
proot-distro login ubuntu -- bash -c 'useradd -m noroot'

# Configure Autostart & motd
echo "proot-distro login ubuntu --user noroot --fix-low-ports -- bash -c 'DOTNET_GCHeapHardLimit=1C0000000 && /root/asf/ArchiSteamFarm'" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo "Welcome to Termux!" > /data/data/com.termux/files/usr/etc/motd
echo " " >> /data/data/com.termux/files/usr/etc/motd

# Joining into directory Ubuntu
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot

# Creating a folder for ASF and IPC config
mkdir /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/asf
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/asf
mkdir /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/asf/config
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/asf/config
curl -L -O https://github.com/sevcator/ASF-Android/raw/main/IPC.config
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/asf

# Downloading ArchiSteamFarm
arch=$(dpkg --print-architecture)

if [ "$arch" = "arm" ]; then
  curl -s https://api.github.com/repos/JustArchiNET/ArchiSteamFarm/latest \
  | grep "browser_download_url.*linux-arm.zip" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | xargs -n 1 curl -L -O
  unzip ASF-linux-arm.zip
  clear
  echo "All right!"
  echo ""
elif [ "$arch" = "armhf" ]; then
  curl -s https://api.github.com/repos/JustArchiNET/ArchiSteamFarm/latest \
  | grep "browser_download_url.*linux-arm.zip" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | xargs -n 1 curl -L -O
  unzip ASF-linux-arm.zip
  clear
  echo "All right!"
  echo ""
elif [ "$arch" = "arm64" ]; then
  curl -s https://api.github.com/repos/JustArchiNET/ArchiSteamFarm/latest \
  | grep "browser_download_url.*linux-arm64.zip" \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | xargs -n 1 curl -L -O
  clear
  echo "All right!"
  echo ""
else
  clear
  echo "Unknown architecture. Please install ArchiSteamFarm manually."
  echo ""
  echo "Your architecture: $arch. Please report this on GitHub Issues"
fi
