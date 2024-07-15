#!/bin/bash
# This script will grab my VScode settings and commit them to my public-dotfiles git repository. Simply run the script.
# Git command with the public dotfiles repository
git_cmd="/usr/bin/git --git-dir=$HOME/.public-dotfiles/ --work-tree=$HOME"

# Source paths
VS_CODE_SETTINGS_SOURCE="$HOME/Library/Application Support/Code/User/settings.json"
VS_CODE_KEYBINDINGS_SOURCE="$HOME/Library/Application Support/Code/User/keybindings.json"
ALIASES_SOURCE="$HOME/.oh-my-zsh/custom/aliases.zsh"
MACOS_SOURCE="$HOME/.oh-my-zsh/custom/macos.zsh"

# Destination directories
CONFIG_FILES_DIR="$HOME/Developer/.config-files"
VSCODE_DIR="$CONFIG_FILES_DIR/vscode"
OH_MY_ZSH_DIR="$CONFIG_FILES_DIR/oh-my-zsh"

# Create directories if they don't exist
mkdir -p "$VSCODE_DIR"
mkdir -p "$OH_MY_ZSH_DIR"

# Copy the actual VS Code settings and keybindings files
cp "$VS_CODE_SETTINGS_SOURCE" "$VSCODE_DIR/settings.json"
cp "$VS_CODE_KEYBINDINGS_SOURCE" "$VSCODE_DIR/keybindings.json"
 

# Add and commit the files to the public dotfiles repository
$git_cmd add "$VSCODE_DIR/settings.json"
$git_cmd add "$VSCODE_DIR/keybindings.json"
$git_cmd add "$OH_MY_ZSH_DIR/aliases.zsh"
$git_cmd add "$OH_MY_ZSH_DIR/macos.zsh"
$git_cmd commit -m "Update VS Code settings, keybindings, aliases, and macos custom zsh settings"
$git_cmd push -u origin main
