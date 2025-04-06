# Commit Instructions

## Public Repository (`publicconfig`)

**Target:** `git@github.com:JamesN-dev/public-dotfiles.git`
**Manages:** Public configs (VSCode, Zsh custom, Brewfile via `Developer/`, README, `.p10k.zsh`, Cheatsheets etc.)

---

### A. Update VSCode / Zsh Custom Files (via Script)

Use this when you change live configs in `~/Library/Application Support/Code/User/` or `~/.oh-my-zsh/custom/`.

1.  **Run the update script:** (Script copies live files to `Developer/.config-files/` and stages them)
    ```bash
    update_configs.sh
    ```
2.  **Commit the staged changes:** (Script only stages, doesn't commit)
    ```bash
    publicconfig commit -m "Update config files via script (VSCode, Zsh Custom)"
    ```
3.  **Push:**
    ```bash
    publicconfig push
    ```

---

### B. Update Brewfile

Use this after installing/uninstalling Homebrew packages.

1.  **Dump current list to temp file:**
    ```bash
    brew bundle dump --force --file=$HOME/Brewfile.current
    ```
2.  **Overwrite tracked Brewfile:**
    ```bash
    mv "$HOME/Brewfile.current" "$HOME/Developer/.config-files/Brewfile"
    ```
3.  **Stage the updated Brewfile:**
    ```bash
    publicconfig add "$HOME/Developer/.config-files/Brewfile"
    ```
4.  **Commit:**
    ```bash
    publicconfig commit -m "Update Brewfile"
    ```
5.  **Push:**
    ```bash
    publicconfig push
    ```

---

### C. Update Files Tracked Directly (README, p10k, Cheatsheets, etc.)

Use this for files tracked directly in `$HOME` or `$HOME/Developer/cheatsheets/`.

1.  **Edit the file(s)** (e.g., `$HOME/README.md`, `$HOME/.p10k.zsh`, files in `$HOME/Developer/cheatsheets/`).
2.  **Stage ALL changes** in the specific file or folder:
    ```bash
    # Example for README
    publicconfig add "$HOME/README.md"
    ```
    ```bash
    # Example for P10k config
    publicconfig add "$HOME/.p10k.zsh"
    ```
    ```bash
    # Example for the whole cheatsheets folder
    publicconfig add "$HOME/Developer/cheatsheets/"
    ```
3.  **Commit:**
    ```bash
    # Use a descriptive message
    publicconfig commit -m "Update <specific file/folder name>"
    ```
4.  **Push:**
    ```bash
    publicconfig push
    ```

---

### D. Add New Files/Folders

1.  **Stage the new item:**
    ```bash
    publicconfig add <path/to/new/item>
    ```
2.  **Commit:**
    ```bash
    publicconfig commit -m "Add <new item description>"
    ```
3.  **Push:**
    ```bash
    publicconfig push
    ```

---
---

## Private Repository (`config`)

**Target:** `private dotfiles github repo url`
**Manages:** Private configs 

---

### A. Update `.zshrc`

1.  **Edit** `$HOME/.zshrc`.
2.  **Stage:**
    ```bash
    config add "$HOME/.zshrc"
    ```
3.  **Commit:**
    ```bash
    config commit -m "Update .zshrc"
    ```
4.  **Push:**
    ```bash
    config push
    ```

---

### B. Update Other Private Files

1.  **Edit/Create** file (e.g. `$HOME/.private_keys`).
2.  **Stage:**
    ```bash
    config add <path/to/private/file>
    ```
3.  **Commit:**
    ```bash
    config commit -m "Update <private file description>"
    ```
4.  **Push:**
    ```bash
    config push
    ```