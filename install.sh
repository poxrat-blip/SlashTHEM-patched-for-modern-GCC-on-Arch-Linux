#!/bin/bash
# SlashTHEM install script for Arch-based Linux
set -e

GAME_DIR="$HOME/SlashTHEM/game"
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> SlashTHEM installer"
echo "==> Install directory: $GAME_DIR"
echo ""

# Check dependencies
echo "==> Checking dependencies..."
for pkg in gcc make yacc ncurses; do
    if ! command -v $pkg &>/dev/null && ! pacman -Qi ncurses &>/dev/null; then
        echo "    Missing: $pkg"
        echo "    Run: sudo pacman -S base-devel ncurses"
        exit 1
    fi
done
echo "    OK"

# Patch Makefile paths
echo "==> Configuring Makefile..."
cd "$SRC_DIR"

sed -i "s|PREFIX   = /usr|PREFIX   = $HOME/SlashTHEM|" Makefile 2>/dev/null || true
sed -i "s|GAMEDIR  = .*|GAMEDIR  = $GAME_DIR|" Makefile 2>/dev/null || true
sed -i "s|SHELLDIR = .*local/bin|SHELLDIR = $GAME_DIR|" Makefile 2>/dev/null || true
sed -i 's|CHOWN = chown|CHOWN = true|' Makefile 2>/dev/null || true
sed -i 's|CHGRP = chgrp|CHGRP = true|' Makefile 2>/dev/null || true
sed -i 's|WINTTYLIB = -ltermlib|WINTTYLIB = -lncurses|' src/Makefile 2>/dev/null || true

echo "    OK"

# Build
echo "==> Building (this may take a while)..."
make 2>&1 | grep -E "error:|warning:.*error|Ошибка" | head -20 || true
make > /tmp/slashthem_build.log 2>&1
if [ $? -ne 0 ]; then
    echo "    Build failed! See /tmp/slashthem_build.log"
    exit 1
fi
echo "    Build OK"

# Install
echo "==> Installing to $GAME_DIR..."
make install >> /tmp/slashthem_build.log 2>&1 || true

# Copy real binary
cp "$SRC_DIR/src/slashthem" "$GAME_DIR/slashthem-bin"
chmod +x "$GAME_DIR/slashthem-bin"

echo ""
echo "==> Done! Run the game with:"
echo "    $GAME_DIR/slashthem-bin"
echo ""
echo "==> Or add an alias to your shell:"
echo "    echo 'alias slashthem=\"$GAME_DIR/slashthem-bin\"' >> ~/.bashrc"
echo "    source ~/.bashrc"
