# My Dotfiles Configuration (Public)

This `--bare` Git repository manages **publicly shareable** configuration files for my personal macOS development environment using the method described at [https://www.atlassian.com/git/tutorials/dotfiles](https://www.atlassian.com/git/tutorials/dotfiles).

**Disclaimer:** These configurations are primarily for my own backup and setup on an apple silicone mac machine. While intended to be public, review them carefully before use, as they may contain settings specific to my machine. Use at your own risk.

*(Private configurations are managed in a separate repository accessed via a `config` alias).*

## Managed Files Structure

This repository tracks configuration files, storing them within a specific `Developer/.config-files/` structure relative to `$HOME`:

* `Developer/.config-files/vscode/settings.json`: VS Code user settings.
* `Developer/.config-files/vscode/keybindings.json`: VS Code user keybindings.
* `Developer/.config-files/oh-my-zsh/aliases.zsh`: Custom Oh My Zsh aliases.
* `Developer/.config-files/oh-my-zsh/macos.zsh`: Custom Oh My Zsh macOS settings.
* `Developer/.config-files/Brewfile`: Homebrew package list.

Other general dotfiles (like `.p10k.zsh`, if used) might be tracked directly in `$HOME`. `.zshrc` is managed in a private repository.

## Setup on a New Machine

1.  **Prerequisites:**
    * Git installed.
    * Homebrew installed: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
    * Oh My Zsh installed: `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

2.  **Create Staging Directories:** Ensure the target directories for checked-out files exist:
    ```bash
    mkdir -p "$HOME/Developer/.config-files/vscode"
    mkdir -p "$HOME/Developer/.config-files/oh-my-zsh"
    # Ensure Oh My Zsh custom dir exists for potential symlinking later
    mkdir -p "$HOME/.oh-my-zsh/custom"
    ```

3.  **Clone Bare Repository:** Replace `yourusername` if necessary (looks like `JamesN-dev` is correct based on your output).
    ```bash
    git clone --bare git@github.com:JamesN-dev/public-dotfiles.git $HOME/.public-dotfiles
    ```

4.  **Set up `publicconfig` Alias:**
    ```bash
    alias publicconfig='/usr/bin/git --git-dir=$HOME/.public-dotfiles/ --work-tree=$HOME'
    echo "alias publicconfig='/usr/bin/git --git-dir=$HOME/.public-dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc
    source $HOME/.zshrc
    ```

5.  **Checkout Configuration Files:** Places tracked files into `$HOME` according to repo structure (e.g., into `~/Developer/.config-files/`).
    ```bash
    publicconfig checkout
    ```
    * *Conflict Handling:* If checkout warns about overwriting existing files in `$HOME` or `~/Developer/.config-files/`, you may need to temporarily move/delete those files, checkout again, and manually merge changes if needed.

6.  **Configure Git Status:** Prevent listing all of `$HOME` as untracked.
    ```bash
    publicconfig config --local status.showUntrackedFiles no
    ```

7.  **Install Homebrew Packages:**
    ```bash
    brew bundle --file=$HOME/Developer/.config-files/Brewfile
    ```

8.  **Link Checked-Out Configs to Live Locations:** This is crucial because files were checked out into `~/Developer/.config-files`, but applications expect them elsewhere. Use symbolic links (or copy if you prefer, but links automatically reflect future checkouts).
    ```bash
    # Link VSCode settings
    # Important: Ensure target directory exists! VS Code might need to run once first.
    mkdir -p "$HOME/Library/Application Support/Code/User/"
    ln -sfv "$HOME/Developer/.config-files/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
    ln -sfv "$HOME/Developer/.config-files/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"

    # Link Oh My Zsh custom files
    ln -sfv "$HOME/Developer/.config-files/oh-my-zsh/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"
    ln -sfv "$HOME/Developer/.config-files/oh-my-zsh/macos.zsh" "$HOME/.oh-my-zsh/custom/macos.zsh"

    # Add links for any other configs managed this way
    ```
    *(The `ln -sfv` command creates a symbolic link (`-s`), forces overwrite if link exists (`-f`), and is verbose (`-v`).)*

## Updating Configuration Files

1.  **Update VS Code / Zsh Custom Files:**
    * Make changes to your live config files (`~/Library/...`, `~/.oh-my-zsh/custom/...`).
    * Run the update script (located in `~/Developer/Scripts/`) to copy live changes into the repo structure (`~/Developer/.config-files/...`) and stage them:
        ```bash
        update_configs.sh
        ```

2.  **Update Brewfile:**
    * After installing/uninstalling Homebrew packages, update the tracked Brewfile:
        ```bash
        # Generate current list (temporary location)
        brew bundle dump --force --file=$HOME/Brewfile.current
        # Overwrite tracked Brewfile with current list
        mv "$HOME/Brewfile.current" "$HOME/Developer/.config-files/Brewfile"
        # Stage the updated Brewfile
        publicconfig add "$HOME/Developer/.config-files/Brewfile"
        ```

3.  **Commit and Push:**
    * Commit all staged changes (from the script and/or Brewfile update):
        ```bash
        publicconfig commit -m "Update configuration files" # Add details as needed
        ```
    * Push to GitHub:
        ```bash
        publicconfig push
        ```