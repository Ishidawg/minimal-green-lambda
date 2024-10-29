#!/bin/bash

THEME_FILE="ishidaw.zsh-theme"
TARGET_DIR="$HOME/.oh-my-zsh/themes"

if [[ ! -f $THEME_FILE ]]; then
  echo "Error: $THEME_FILE not found in the current directory."
  exit 1
fi

if [[ ! -d $TARGET_DIR ]]; then
  echo "Error: Target directory $TARGET_DIR does not exist."
  echo "Please install oh-my-zsh or create the themes directory."
  exit 1
fi

cp "$THEME_FILE" "$TARGET_DIR"

if [[ $? -eq 0 ]]; then
  echo "Theme $THEME_FILE has been successfully copied to $TARGET_DIR."
else
  echo "Error: Failed to copy $THEME_FILE to $TARGET_DIR."
  exit 1
fi

ZSHRC_FILE="$HOME/.zshrc"

if grep -q 'ZSH_THEME="ishidaw"' "$ZSHRC_FILE"; then
  echo "ZSH_THEME=\"ishidaw\" is already set in $ZSHRC_FILE."
else
  echo 'ZSH_THEME="ishidaw"' >> "$ZSHRC_FILE"
  echo "Added ZSH_THEME=\"ishidaw\" to $ZSHRC_FILE."
fi

echo "Applying changes to your current session..."
source "$ZSHRC_FILE"

echo "Done! Your zsh theme is now set to 'ishidaw'."

