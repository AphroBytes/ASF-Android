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
echo "proot-distro login ubuntu --user noroot --fix-low-ports -- bash -c 'export DOTNET_GCHeapHardLimit=1C0000000 && /home/noroot/asf/ArchiSteamFarm'" >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo "Welcome to Termux!" > /data/data/com.termux/files/usr/etc/motd
echo " " >> /data/data/com.termux/files/usr/etc/motd

# Joining into directory Ubuntu
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot

# Creating a folder for ASF and IPC config
mkdir /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf
mkdir /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/config
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/config
curl -L -O https://github.com/sevcator/ASF-Android/raw/main/IPC.config
cd /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf

# Downloading ArchiSteamFarm
arch=$(dpkg --print-architecture)

if [ "$arch" = "arm" ]; then
  curl -L https://raw.githubusercontent.com/sevcator/ASF-Android/main/arm-dw.sh -o /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/arm-dw.sh
  bash /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/arm-dw.sh
  unzip /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/ASF-linux-arm.zip
  clear
  echo "All right!"
  echo ""
elif [ "$arch" = "armhf" ]; then
  curl -L https://raw.githubusercontent.com/sevcator/ASF-Android/main/arm-dw.sh -o /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/arm-dw.sh
  bash /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/arm-dw.sh
  unzip /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/ASF-linux-arm.zip
  clear
  echo "All right!"
  echo ""
elif [ "$arch" = "arm64" ]; then
  curl -L https://raw.githubusercontent.com/sevcator/ASF-Android/main/arm64-dw.sh -o /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/arm64-dw.sh
  bash /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/arm64-dw.sh
  unzip /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/ASF-linux-arm64.zip
  clear
  echo "All right!"
  echo ""
elif [ "$arch" = "aarch64" ]; then
  curl -L https://raw.githubusercontent.com/sevcator/ASF-Android/main/arm64-dw.sh -o /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/arm64-dw.sh
  bash /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/arm64-dw.sh
  unzip /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/home/noroot/asf/ASF-linux-arm64.zip
  clear
  echo "All right!"
  echo ""
else
  clear
  echo "Unknown architecture. Please install ArchiSteamFarm manually."
  echo ""
  echo "Your architecture: $arch. Please report this on GitHub Issues"
fi
