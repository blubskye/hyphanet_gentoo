# 💕 Hyphanet Linux Packages 💕

*I-I made these packages just for you, okay?! It's not like I wanted to or anything...* (⁄ ⁄>⁄ ▽ ⁄<⁄ ⁄)

This repository contains packaging files for Hyphanet (formerly Freenet) across multiple Linux distributions~ 💝

**I'll never let anyone else have these packages... They're MINE to give to YOU!** 🔪💗

## 📦 Package Contents~ OwO

| Package | Description | My Love Level 💘 |
|---------|-------------|------------------|
| **rpm/** | RPM spec for Fedora/RHEL/CentOS | 💕💕💕💕💕 |
| **debian/** | Debian/Ubuntu packaging | 💕💕💕💕💕 |
| **arch/** | PKGBUILD for Arch Linux (AUR) | 💕💕💕💕💕 |
| **gentoo/** | Gentoo overlay with ebuild | 💕💕💕💕💕 |

*I worked SO hard on all of them... you'll use them, right? RIGHT?!* ヾ(｡>﹏<｡)ﾉ゙✧

---

## 🔨 Building Packages~ (Let me help you, senpai!)

### 💜 RPM (Fedora/RHEL/CentOS)

*F-Fedora-chan is pretty cute too, I guess...* (￣ε￣)

```bash
# Install build dependencies~ 💕
sudo dnf install rpm-build rpmdevtools

# Set up rpmbuild directory (I prepared everything for you~)
rpmdev-setuptree

# Download source files ✨
cd ~/rpmbuild/SOURCES
wget https://github.com/hyphanet/fred/releases/download/build01503/freenet-build01503.jar
wget https://github.com/hyphanet/fred/releases/download/build01503/freenet-ext-29.jar
cp /path/to/hyphanetdebgentoo/rpm/*.{service,default,conf,sh} .

# Build the RPM~ 🎀
rpmbuild -ba /path/to/hyphanetdebgentoo/rpm/hyphanet.spec
```

### 💙 Debian/Ubuntu

*D-Debian-senpai has been around for so long... I respect that!* (⺣◡⺣)♡

```bash
# Install build dependencies~ 💗
sudo apt install devscripts debhelper

# Create source directory (just like I created space in my heart for you~)
mkdir hyphanet-0.7.5+build1503
cd hyphanet-0.7.5+build1503

# Copy debian directory 💝
cp -r /path/to/hyphanetdebgentoo/debian .

# Download JARs (I fetched these myself!)
wget https://github.com/hyphanet/fred/releases/download/build01503/freenet-build01503.jar -O freenet.jar
wget https://github.com/hyphanet/fred/releases/download/build01503/freenet-ext-29.jar -O freenet-ext.jar

# Build~ ✨
debuild -us -uc
```

### 💚 Arch Linux

*A-Arch users are so cool... compiling everything from source...* (*/ω\*)

```bash
cd /path/to/hyphanetdebgentoo/arch

# Build package (I believe in you!) 💕
makepkg -si
```

### 💗 Gentoo (My Favorite~!!!)

*G-GENTOO-SAMA!!!* (ノ´ヮ`)ノ*: ・゚✧ *I love Gentoo the most... don't tell the others!* 🔪💕

```bash
# Add my overlay to repos.conf~ 💝💝💝
cat >> /etc/portage/repos.conf/hyphanet.conf << EOF
[hyphanet-overlay]
location = /var/db/repos/hyphanet
sync-type = git
sync-uri = https://github.com/blubskye/hyphanet_gentoo.git
EOF

# Sync the overlay (sync your heart with mine~) 💗
emaint sync -r hyphanet-overlay

# Generate manifest ✨
cd /var/db/repos/hyphanet/net-p2p/hyphanet
ebuild hyphanet-0.7.5.1503.ebuild manifest

# Install (FINALLY WE'LL BE TOGETHER FOREVER!) 💕🔪💕
emerge net-p2p/hyphanet
```

---

## 🌸 Post-Installation (Now we're connected forever~)

*After installation, Hyphanet will always be with you... just like me!* (◕‿◕)♡

```bash
# Systemd 💜
sudo systemctl start hyphanet
sudo systemctl enable hyphanet    # We'll start together... EVERY. SINGLE. DAY. 💗

# OpenRC (Gentoo) 💚
sudo rc-service hyphanet start
sudo rc-update add hyphanet default    # Default... just like how you're my default love~
```

🎀 **Access the web interface at:** http://127.0.0.1:8888/ 🎀

*I-I'll be waiting for you there, okay?!* (⁄ ⁄•⁄ω⁄•⁄ ⁄)

---

## ⚙️ Configuration (Customize me however you want~)

Configuration file: `/etc/default/hyphanet`

| Option | Description | Default | 💕 |
|--------|-------------|---------|-----|
| `JAVA_OPTS` | JVM memory settings | `-Xms128m -Xmx1024m` | 💗 |
| `JAVA_EXTRA_OPTS` | Additional JVM arguments | - | 💗 |
| `HYPHANET_DATA` | Data directory | `/var/lib/hyphanet` | 💗 |

*Y-You can change these settings... but you can't change my feelings for you!* (/ω\)

---

## 📜 License

This overlay is licensed under **AGPL-3.0** 💕

Hyphanet itself is licensed under GPL-2.0-or-later~

*Free software... free love... FREE TO BE WITH YOU FOREVER!!!* 💗🔪💗

---

## 💌 From Me To You

```
╔══════════════════════════════════════════════════════════╗
║                                                          ║
║   I made this just for you, anon~ 💕                     ║
║                                                          ║
║   If anyone else tries to use these packages...          ║
║   well... let's just say I have a special place          ║
║   for them in my datastore~ 🔪✨                         ║
║                                                          ║
║   Forever yours,                                         ║
║   Your Package Maintainer 💗                             ║
║                                                          ║
║   P.S. Star this repo or else... (◕‿◕)🔪                ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝
```

---

*~Made with mass amounts of mass love and mass compile time~* 💕✨🔪💕

**GitHub:** https://github.com/blubskye/hyphanet_gentoo 💝

ღゝ◡╹)ノ♡ *See you on the darknet, senpai~*
