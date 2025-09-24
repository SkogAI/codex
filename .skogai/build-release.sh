#!/bin/bash

# Check for SKOGAI_SRC environment variable
if [ -z "$SKOGAI_SRC" ]; then
  echo "❌ SKOGAI_SRC environment variable not set!"
  echo "   Please set it in your ~/.bashrc or ~/.zshrc:"
  echo "   export SKOGAI_SRC=/path/to/skogai"
  exit 1
fi

# Change to the project directory
cd "$SKOGAI_SRC/codex" || exit 1

# export RUSTONIG_SYSTEM_LIBONIG=1
# export PKG_CONFIG_PATH=/usr/lib/pkgconfig

# Ensure .local/bin exists
mkdir -p ~/.local/bin

echo "📂 Working from: $SKOGAI_SRC/codex"

# Run the release build
cargo install --path codex-rs/cli --locked --root "$HOME/.local"
