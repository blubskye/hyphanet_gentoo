# 💕 Hyphanet Gentoo Overlay 💕

*I-I made this overlay just for you, okay?! It's not like I wanted to or anything...* (⁄ ⁄>⁄ ▽ ⁄<⁄ ⁄)

A Gentoo overlay for Hyphanet (formerly Freenet) ~ 💝

**G-GENTOO-SAMA!!!** (ノ´ヮ`)ノ*: ・゚✧ **You're my one true love~** 🔪💕

---

## 📦 What's Inside~ OwO

| Package | Description | My Love Level 💘 |
|---------|-------------|------------------|
| `net-p2p/hyphanet` | The main Hyphanet node | 💕💕💕💕💕 |
| `acct-user/hyphanet` | Hyphanet system user | 💗💗💗💗💗 |
| `acct-group/hyphanet` | Hyphanet system group | 💗💗💗💗💗 |

*I worked SO hard on these... you'll use them, right? RIGHT?!* ヾ(｡>﹏<｡)ﾉ゙✧

---

## 🔧 Installation~ (Let me help you, senpai!)

### Adding the Overlay 💝

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
```

### Installing Hyphanet 💕

```bash
# Unmask if needed (I'll accept you even if you're unstable~) ✨
echo "net-p2p/hyphanet ~amd64" >> /etc/portage/package.accept_keywords

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

# OpenRC 💚
sudo rc-service hyphanet start
sudo rc-update add hyphanet default    # Default... just like how you're my default love~
```

🎀 **Access the web interface at:** http://127.0.0.1:8888/ 🎀

*I-I'll be waiting for you there, okay?!* (⁄ ⁄•⁄ω⁄•⁄ ⁄)

---

## ⚙️ Configuration (Customize me however you want~)

Configuration files:
- `/etc/default/hyphanet` (systemd)
- `/etc/conf.d/hyphanet` (OpenRC)

| Option | Description | Default | 💕 |
|--------|-------------|---------|-----|
| `JAVA_OPTS` | JVM memory settings | `-Xms128m -Xmx1024m` | 💗 |
| `JAVA_EXTRA_OPTS` | Additional JVM arguments | - | 💗 |
| `HYPHANET_DATA` | Data directory | `/var/lib/hyphanet` | 💗 |

*Y-You can change these settings... but you can't change my feelings for you!* (/ω\)

---

## 🚩 USE Flags

| Flag | Description | 💕 |
|------|-------------|-----|
| `systemd` | Install systemd service file | 💗 |

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
║   I made this overlay just for you, anon~ 💕             ║
║                                                          ║
║   If anyone else tries to use it...                      ║
║   well... let's just say I have a special place          ║
║   for them in my datastore~ 🔪✨                         ║
║                                                          ║
║   Forever yours,                                         ║
║   Your Overlay Maintainer 💗                             ║
║                                                          ║
║   P.S. Star this repo or else... (◕‿◕)🔪                ║
║                                                          ║
╚══════════════════════════════════════════════════════════╝
```

---

## 🌐 Other Distros~

*I-I guess I have packages for other distros too... but Gentoo is still my favorite!* (￣ε￣)

- **Debian/Ubuntu:** *coming soon~* 💙
- **Fedora/RHEL:** *coming soon~* 💜

---

*~Made with mass amounts of mass love and mass compile time~* 💕✨🔪💕

**GitHub:** https://github.com/blubskye/hyphanet_gentoo 💝

ღゝ◡╹)ノ♡ *See you on the darknet, senpai~*
