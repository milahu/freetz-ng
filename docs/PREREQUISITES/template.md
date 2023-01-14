# PREREQUISITES: Installation der benötigten Pakete
Eine einfache Möglichkeit die benötigten Pakete zu installieren besteht darin, diesen Code per Copy and Paste auf der Konsole auszuführen, zB in PuTTY per Rechtsclick!

### Getestete Distributionen
 - [Fedora](#fedora)
 - [Debian](#debian)
 - [Ubuntu](#ubuntu)
 - [Kali](#kali)
 - sonst keine

### Problematische Distributionen
 - Gentoo

### Alle anderen Distributionen
... sind ungetestet und können funktionieren oder auch nicht. Dies hängt stark von den Fähigkeiten des Bedieners ab.

### Distribution ermitteln
Wenn man vergessen hat welche Linux Version installiert ist kann dies so prüfen:

 - Linux Distribution:
```
$ hostnamectl status
  Operating System: Fedora 33 (Thirty Three)
	    Kernel: Linux 5.10.15-200.fc33.x86_64
```

 - Ubuntu/Debian Version:
```
$ lsb_release -d
Description:    Ubuntu 14.04.6 LTS
```

 - Maschinen Typ: `i686` bei 32-Bit x86 und `x86_64` bei 64-Bit x86:
```
$ uname -m
aarch64
```

### Fedora

 - System aktualisieren:
```
sudo dnf -y update && sudo systemctl daemon-reload
```

 - Fedora 36/37 64-Bit:
```
sudo dnf -y groupinstall 'Development Tools' 'Development Libraries'
sudo dnf -y install %%FEDORA36%%
```

 - Fedora 35 64-Bit:
```
sudo dnf -y groupinstall 'Development Tools' 'Development Libraries'
sudo dnf -y install %%FEDORA35%%
```

 - Fedora 33/34 64-Bit:
```
sudo dnf -y groupinstall 'Development Tools' 'Development Libraries'
sudo dnf -y install %%FEDORA33%%
```

 - Falls auf dem folgenden System ein 64-Bit Linux installiert ist wird zusätzlich benötigt:
```
sudo yum -y install ncurses-devel.i686 glibc-devel.i686 libgcc.i686
```

 - Fedora ~20 32-Bit:
```
sudo yum -y install ImageMagick subversion gcc gcc-c++ binutils autoconf automake libtool make bzip2 ncurses-devel zlib-devel flex bison patch texinfo gettext pkgconfig ecj perl perl-String-CRC32 wget glib2-devel git libacl-devel libattr-devel libcap-devel
```

### Debian

 - System aktualisieren:
```
sudo apt -y update
sudo apt -y upgrade
sudo apt -y dist-upgrade
```
 - Debian 11 (Bullseye) 64-Bit:
```
sudo apt -y install %%DEBIAN11%%
```


### Ubuntu

 - Deutsche Tastaturbelegung:<br>
Siehe [ubuntu.com: LocaleConf](https://help.ubuntu.com/community/LocaleConf)
```
sudo apt-get -y install console-data && sudo locale-gen de_DE && sudo dpkg-reconfigure console-data && exit
```

 - 32-Bit (Multiarch) aktivieren:<br>
Siehe [debian.org: Multiarch HOWTO](https://wiki.debian.org/Multiarch/HOWTO) und [heise.de: Pakete für mehrere CPU-Architekturen in Linux installieren](http://heise.de/-2056403)
```
# dpkg --print-foreign-architectures
sudo dpkg --add-architecture i386
sudo apt-get -y update
```

 - System aktualisieren:
```
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
```

 - Ubuntu 22 64-Bit:
```
sudo apt-get -y install %%UBUNTU22%%
```

 - Ubuntu 20 64-Bit:
```
sudo apt-get -y install %%UBUNTU20%%
# sqlite-32bit lässt sich mit apt nicht installieren, aber mit apt-get schon. Siehe auch: https://developpaper.com/ubuntu-solves-the-problem-of-libsqlite3-0-dependency-recommended/
sudo apt -y install libzstd-dev:i386 sqlite3:i386
```

 - Ubuntu 18 64-Bit:
```
sudo apt-get -y install %%UBUNTU18%%
```

 - Ubuntu 15/16 64-Bit:
```
sudo apt-get -y install %%UBUNTU15%%
```

 - Ubuntu 14 64-Bit:
```
sudo apt-get -y install pv cpio rsync kmod imagemagick inkscape graphicsmagick subversion git bc unar wget sudo gcc g++ binutils autoconf automake autopoint libtool     make bzip2 libncurses5-dev libreadline-dev zlib1g-dev flex bison patch texinfo tofrodos gettext pkg-config ecj realpath perl libstring-crc32-perl ruby ruby1.9 gawk libusb-dev unzip intltool libacl1-dev libcap-dev libc6-dev-i386 lib32ncurses5-dev gcc-multilib bsdmainutils lib32stdc++6 libglib2.0-dev ccache cmake lib32z1-dev libsqlite3-dev sqlite3 netcat curl openssl build-essential automake1.9
```
Zusätzlich muss manuell installiert werden:
```
cmake min v3.4.3  https://ftp.osuosl.org/pub/blfs/conglomeration/cmake/cmake-3.4.3.tar.gz
cpio min v2.12    https://ftp.gnu.org/gnu/cpio/cpio-2.12.tar.bz2
make min v3.82    https://ftp.gnu.org/gnu/make/make-3.82.tar.bz2
libzstd min v0    https://github.com/facebook/zstd/releases/download/v1.4.9/zstd-1.4.9.tar.gz
```
Und ausserdem falls ccache gebaut werden soll:
```
cmake min v3.10   https://ftp.osuosl.org/pub/blfs/conglomeration/cmake/cmake-3.10.3.tar.gz
gmp min v4.2      https://ftp.gnu.org/gnu/gmp/gmp-4.2.4.tar.bz2
mpfr min v2.4     https://ftp.gnu.org/gnu/mpfr/mpfr-2.4.2.tar.xz
mpc min v0.8      https://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz
gcc min v6        https://ftp.gnu.org/gnu/gcc/gcc-6.5.0/gcc-6.5.0.tar.xz
# export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib:/usr/local/lib64:/usr/local/lib32"
```

 - Falls auf den folgenden Systemen ein 64-Bit Linux installiert ist wird zusätzlich benötigt:
```
sudo apt-get -y install libc6-dev-i386 lib32ncurses5-dev gcc-multilib lib32stdc++6
```

 - Ubuntu 15 32-Bit / Debian 8: Zusätzlich zu Ubuntu 13/14 32-Bit wird benötigt:
```
sudo apt-get -y install libtool-bin
```

 - Ubuntu 13/14 32-Bit:
```
sudo apt-get -y install graphicsmagick subversion gcc g++ binutils autoconf automake automake1.9 libtool make bzip2 libncurses5-dev libreadline-dev zlib1g-dev flex bison patch texinfo tofrodos gettext pkg-config ecj fastjar realpath perl libstring-crc32-perl ruby ruby1.8 gawk python libusb-dev unzip intltool libacl1-dev libcap-dev
```

 - Ubuntu 9/10/11/12 32-Bit:
```
sudo apt-get -y install imagemagick subversion gcc g++ bzip2 binutils automake patch autoconf libtool pkg-config make libncurses5-dev libreadline-dev zlib1g-dev flex bison patch texinfo tofrodos gettext pkg-config ecj fastjar realpath perl libstring-crc32-perl ruby ruby1.8 gawk python libusb-dev unzip intltool libglib2.0-dev xz-utils git-core libacl1-dev libattr1-dev libcap-dev
```

 - Ubuntu 9.04 32-Bit (kein automake 1.8, "ecj" statt "ecj-bootstrap"):
```
sudo apt-get -y install imagemagick subversion gcc g++ binutils autoconf automake automake1.9 libtool make bzip2 libncurses5-dev libreadline-dev zlib1g-dev flex bison patch texinfo tofrodos gettext pkg-config jikes ecj fastjar realpath perl libstring-crc32-perl ruby ruby1.8 gawk python libusb-dev unzip intltool libglib2.0-dev xz-utils git-core libacl1-dev libattr1-dev libcap-dev
```

### Kali
Kali rolling wurde schon erfolgreich zum Bauen benutzt. Einfach die Pakete installieren, die für Ubuntu vorgeschlagen werden.
Das meiste wird bei Kali sowieso schon dabei installiert sein.

