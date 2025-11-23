#!/bin/bash

# Usage: toggle-app.sh <window-class> <workspace-name>
# Example: toggle-app.sh "Google-chrome" "chrome"

WINDOW_CLASS="$1"
WORKSPACE="$2"

if [ -z "$WINDOW_CLASS" ] || [ -z "$WORKSPACE" ]; then
    echo "Usage: $0 <window-class> <workspace-name>"
    exit 1
fi

# Check if any window with this class exists in i3
if ! i3-msg -t get_tree | grep -q "\"class\":\"$WINDOW_CLASS\""; then
    # Launch the application (will auto-move to workspace due to assign rule)
    case "$WINDOW_CLASS" in
        "Google-chrome")
            google-chrome &
            ;;
        "Alacritty")
            alacritty &
            ;;
        *)
            echo "Unknown application class: $WINDOW_CLASS"
            exit 1
            ;;
    esac
fi

# Switch to workspace
i3-msg workspace "$WORKSPACE"
