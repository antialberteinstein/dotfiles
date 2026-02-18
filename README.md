# My Dotfiles

Welcome to my personal dotfiles repository. This collection contains configurations for my development environment, including Neovim, Fish shell, Hyprland, and more.

## 📂 Repository Structure

- **`.config/`**: Configuration files for various applications (Neovim, Hyprland, Waybar, etc.).
- **`scripts/`**: Automated setup scripts for different Linux distributions.
- **`.bashrc`**: Bash configuration file.
- **`Pictures/`**: Wallpapers and other assets (if applicable).

## 🚀 Installation

### Option 1: Clone Repository (Recommended)

It is recommended to clone this repository to your home directory or a specific `dotfiles` folder.

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### Option 2: Manual Installation (Symlinking/Copying)

If you cannot clone directly or prefer manual control, you can assume the repository is located at `~/dotfiles` (or wherever you downloaded it) and link the files:

#### 1. Configuration Files (`.config`)

Link or copy directories from `.config/` to your local `~/.config/`.

```bash
# Example: Linking Neovim config
ln -s ~/dotfiles/.config/nvim ~/.config/nvim

# Example: Linking all configs (creates symlinks)
cp -rs ~/dotfiles/.config/* ~/.config/
# OR manually copy if you prefer detached configs
cp -r ~/dotfiles/.config/* ~/.config/
```

**Included Configs:**
- `nvim` (Neovim)
- `fish` (Fish Shell)
- `hypr` (Hyprland Window Manager)
- `waybar` (Status Bar)
- `dunst` (Notifications)
- `kitty` (Terminal Emulator)
- `tmux` (Terminal Multiplexer)
- `git` (Git Config)
- `gtk-3.0` / `gtk-4.0` (GTK Themes)

#### 2. Shell Configuration

Link the `.bashrc` if you use Bash:

```bash
ln -s ~/dotfiles/.bashrc ~/.bashrc
```

## 🛠 Automated Setup Scripts

This repository includes scripts to automate package installation and environment setup for **Fedora**, **Ubuntu**, and **Arch Linux**.

> **Note:** Run these scripts from their respective directories.

### 🐧 Fedora

**Location:** `scripts/fedora/`

1.  **Root Setup (Packages & Hyprland):**
    ```bash
    cd ~/dotfiles/scripts/fedora
    sudo ./01-setup-root.sh
    ```
2.  **Environment Setup (Conda/Python):**
    ```bash
    ./02-setup.sh
    ```
3.  **UI & Fonts:**
    ```bash
    ./03-setup.sh
    ```
4.  **Applications (Obsidian):**
    ```bash
    ./04-setup.sh
    ```
5.  **Shell Plugins (Tmux/Fish):**
    ```bash
    ./05-setup.sh
    ```

### 🟠 Ubuntu / Debian

**Location:** `scripts/ubuntu/`

1.  **Root Setup:**
    ```bash
    cd ~/dotfiles/scripts/ubuntu
    sudo ./01-setup-root.sh
    ```
    *Note: Installing Hyprland on Ubuntu can be complex. The script sets up dependencies but may require manual steps for the WM itself.*

2.  **Follow the same order as Fedora (02-05).**

### 🔵 Arch Linux

**Location:** `scripts/arch/`

1.  **Root Setup:**
    ```bash
    cd ~/dotfiles/scripts/arch
    sudo ./01-setup-root.sh
    ```
    *Note: The script checks for `yay` to install AUR packages (like `swaylock-effects-git`). Install `yay` or `paru` beforehand if possible.*

2.  **Follow the same order as Fedora (02-05).**

## 🧩 Key Components

- **Window Manager:** [Hyprland](https://hyprland.org/) (Wayland)
- **Editor:** [Neovim](https://neovim.io/) (Custom config in `.config/nvim`)
- **Shell:** [Fish](https://fishshell.com/) with [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish)
- **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/)
- **Bar:** [Waybar](https://github.com/Alexays/Waybar)
- **Launcher:** [Rofi](https://github.com/lbonn/rofi) (Wayland fork)
