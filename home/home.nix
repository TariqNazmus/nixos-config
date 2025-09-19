{ config, pkgs, ... }:
{
  home.username = "sadat";
  home.homeDirectory = "/home/sadat";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
# Install user packages
  home.packages = with pkgs; [
    waybar # A customizable bar for Wayland
    wofi # A launcher/menu for Wayland
    kitty # A terminal emulator
    hyprland # Ensure Hyprland is available for the user
  ];

  # Configure Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = ",preferred,auto,1"; # Auto-detect monitor
      exec-once = [
        "waybar &" # Launch Waybar
        "wofi --show drun &" # Launch Wofi
      ];
      input = {
        kb_layout = "us";
        follow_mouse = 1;
      };
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 2;
      };
      decoration = {
        rounding = 10;
        drop_shadow = true;
      };
      "$mod" = "SUPER";
      [

        # Applications
        $mod, RETURN, exec, kitty    # Open the terminal
        $mod, B, exec, firefox          # Open the browser
        #$mod, E, exec, ~/.config/ml4w/settings/filemanager.sh      # Open the filemanager
#$mod CTRL, E, exec, ~/.config/ml4w/settings/emojipicker.sh # Open the emoji picker
#$mod CTRL, C, exec, ~/.config/ml4w/settings/calculator.sh  # Open the calculator

# Display
#$mod SHIFT, mouse_down, exec, hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') + 0.5}") # Increase display zoom
#$mod SHIFT, mouse_up, exec, hyprctl keyword cursor:zoom_factor $(awk "BEGIN {print $(hyprctl getoption cursor:zoom_factor | grep 'float:' | awk '{print $2}') - 0.5}") # Decrease display zoom
#$mod SHIFT, Z, exec, hyprctl keyword cursor:zoom_factor 1 # Reset display zoom

# Windows
"$mod, Q, killactive"                                                              # Kill active window
"$mod SHIFT, Q, exec, hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill" # Quit active window and all open instances
"$mod, F, fullscreen, 0"                                                           # Set active window to fullscreen
"$mod, M, fullscreen, 1"                                                           # Maximize Window
"$mod, T, togglefloating"                                                          # Toggle active windows into floating mode
"$mod SHIFT, T, workspaceopt, allfloat"                                            # Toggle all windows into floating mode
#$mod, J, togglesplit                                                             # Toggle split
#$mod, left, movefocus, l                                                         # Move focus left
#$mod, right, movefocus, r                                                        # Move focus right
#$mod, up, movefocus, u                                                           # Move focus up
#$mod, down, movefocus, d                                                         # Move focus down
#$mod, mouse:272, movewindow                                                     # Move window with the mouse
#bindm = $mod, mouse:273, resizewindow                                                   # Resize window with the mouse
#$mod SHIFT, right, resizeactive, 100 0                                           # Increase window width with keyboard
#$mod SHIFT, left, resizeactive, -100 0                                           # Reduce window width with keyboard
#$mod SHIFT, down, resizeactive, 0 100                                            # Increase window height with keyboard
#$mod SHIFT, up, resizeactive, 0 -100                                             # Reduce window height with keyboard
#$mod, G, togglegroup                                                             # Toggle window group
#$mod, K, swapsplit                                                               # Swapsplit
#$mod ALT, left, swapwindow, l                                                    # Swap tiled window left
#$mod ALT, right, swapwindow, r                                                   # Swap tiled window right
#$mod ALT, up, swapwindow, u                                                      # Swap tiled window up
#$mod ALT, down, swapwindow, d                                                    # Swap tiled window down

# Actions
#$mod CTRL, R, exec, hyprctl reload                                             # Reload Hyprland configuration

# Workspaces
#$mod, 1, workspace, 1  # Open workspace 1
#$mod, 2, workspace, 2  # Open workspace 2
#$mod, 3, workspace, 3  # Open workspace 3
#$mod, 4, workspace, 4  # Open workspace 4
#$mod, 5, workspace, 5  # Open workspace 5
#$mod, 6, workspace, 6  # Open workspace 6
#$mod, 7, workspace, 7  # Open workspace 7
#$mod, 8, workspace, 8  # Open workspace 8
#$mod, 9, workspace, 9  # Open workspace 9
#$mod, 0, workspace, 10 # Open workspace 10

#        $mod SHIFT, 1, movetoworkspace, 1  # Move active window to workspace 1
#$mod SHIFT, 2, movetoworkspace, 2  # Move active window to workspace 2
#$mod SHIFT, 3, movetoworkspace, 3  # Move active window to workspace 3
#$mod SHIFT, 4, movetoworkspace, 4  # Move active window to workspace 4
#$mod SHIFT, 5, movetoworkspace, 5  # Move active window to workspace 5
#$mod SHIFT, 6, movetoworkspace, 6  # Move active window to workspace 6
#$mod SHIFT, 7, movetoworkspace, 7  # Move active window to workspace 7
#$mod SHIFT, 8, movetoworkspace, 8  # Move active window to workspace 8
#$mod SHIFT, 9, movetoworkspace, 9  # Move active window to workspace 9
#$mod SHIFT, 0, movetoworkspace, 10 # Move active window to workspace 10

        "$mod, mouse_down, workspace, e+1" # Open next workspace
        "$mod, mouse_up, workspace, e-1"    # Open previous workspace
      ];
    };
  };
}