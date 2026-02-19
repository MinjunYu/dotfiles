# Dotfiles for linux system

Personal configuration files for development environment.

## What's Included

- **Git** - Global git configuration with common aliases
- **i3** - Window manager configuration with app toggle scripts
- **Neovim** - Editor configuration
- **Tmux** - Tmux configuration

## Installation

This repo uses [GNU Stow](https://www.gnu.org/software/stow/) to manage symlinks.

### Install All Packages

```bash
cd ~/dotfiles
stow git i3 nvim tmux zsh
```

### Install Individual Packages

```bash
cd ~/dotfiles
stow nvim      # Install only nvim
stow -D nvim   # Uninstall nvim
```

---

## Git Configuration

**Location:** `git/config`

### Common Aliases

- `git st` - status
- `git co` - checkout
- `git br` - branch
- `git cm` - commit
- `git cma` - commit --amend
- `git d` - diff
- `git dc` - diff --cached
- `git lg` - log --oneline --graph --decorate --all
- `git last` - log -1 HEAD
- `git unstage` - reset HEAD --
- `git branches` - branch -a
- `git remotes` - remote -v

---

## i3 Window Manager

**Location:** `i3/config` and `i3/scripts/`

### Adding New App Shortcuts

To add a new application with keyboard shortcuts (like Super+key to toggle):

1. **Find the window class name:**
   ```bash
   xprop | grep WM_CLASS
   ```
   Click on the application window to get the class name.

2. **Update `i3/config`:**

   a. Add workspace variable (around line 19):
   ```bash
   set $myapp "myapp"
   ```

   b. Add window class variable (around line 25):
   ```bash
   set $myapp_class "MyAppClassName"
   ```

   c. Assign workspace to monitor (around line 42):
   ```bash
   workspace $myapp output $monitor1
   ```

   d. Add keyboard binding (around line 176):
   ```bash
   bindsym $sup+m exec --no-startup-id ~/.config/i3/scripts/toggle-app.sh $myapp_class $myapp
   ```

   e. Add Shift+key to move windows (around line 191):
   ```bash
   bindsym $sup+Shift+m move container to workspace $myapp
   ```

   f. Add window assignment (around line 253):
   ```bash
   assign [class=$myapp_class] $myapp
   for_window [class=$myapp_class] move to workspace $myapp layout tabbed
   ```

3. **Update `i3/scripts/toggle-app.sh`:**

   Add case for launching the app (around line 27):
   ```bash
   "MyAppClassName")
       myapp-command &
       ;;
   ```

4. **Reload i3:**
   ```bash
   i3-msg reload
   ```
   Or press `Super+Shift+h`

---

## tmux

### Session Scripts
**Location:** `tmux/.local/bin/`

- **`yuc`** — Creates a idempotent tmux session for the YuCommerce project with 6 windows: claude, nvim, db, backend, web, shell.

Symlinked to `~/.local/bin/yuc` via stow.

---

## Neovim

**Location:** `nvim/`

See [nvim/README.md](nvim/README.md) for detailed configuration.
