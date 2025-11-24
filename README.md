# Dotfiles for linux system

## Window Management
i3 with Bash script

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

**Examples in this config:**
- `Super+t` - Alacritty terminal
- `Super+c` - Google Chrome
- `Super+i` - IntelliJ IDEA
- `Super+z` - FileZilla

## Neovim
