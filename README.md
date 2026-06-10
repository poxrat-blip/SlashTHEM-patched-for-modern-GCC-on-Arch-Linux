# SlashTHEM

**SuperLotsaAddedStuffHack — The Heavily Extended Mod**

SlashTHEM is a heavily extended variant of NetHack, based on Slash'EM Extended by AmyBSOD and SlashTHEM by Soviet5lo. This build has been patched to compile on modern Linux systems (GCC 13+).

## Screenshot

```
--,----
|[·.[·|
|.....|
|...@.|
+...d.|
|.....|
-------
Blippo the Footpad  St11 Dx20 Co16 In8 Wi10 Ch7 RogKobFemNeu
Dlvl:1  $:1868 HP:18(18) Pw:6(6) AC:1 MC:0 Exp:1
```

## Requirements

- Arch Linux or Arch-based distro (Manjaro, EndeavourOS, etc.)
- `base-devel` package group
- `ncurses` library

Install dependencies:

```bash
sudo pacman -S base-devel ncurses
```

## Build & Install

```bash
git clone https://github.com/poxrat-blip/SlashTHEM-patched-for-modern-GCC-on-Arch-Linux.git
cd SlashTHEM-patched-for-modern-GCC-on-Arch-Linux 
chmod +x install.sh
./install.sh
```

The game will be installed to `~/SlashTHEM/game/`.

## Running

```bash
~/SlashTHEM/game/slashthem-bin
```

Or add an alias to your shell config (`~/.bashrc` or `~/.zshrc`):

```bash
echo 'alias slashthem="~/SlashTHEM/game/slashthem-bin"' >> ~/.bashrc
source ~/.bashrc
```

Then just run:

```bash
slashthem
```

## Credits

- NetHack — Copyright 1985-2003 Stichting Mathematisch Centrum, M. Stephenson
- Slash'EM — Slash'EM Dev Team
- Slash'EM Extended — AmyBSOD
- SlashTHEM — Soviet5lo
- Modern GCC patches — Poxrat(Nazariy)

## License

See `license` file in the game directory.
