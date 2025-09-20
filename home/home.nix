{ config, pkgs, ... }:
{
  home.username = "sadat";
  home.homeDirectory = "/home/sadat";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  

# Install user packages
  home.packages = with pkgs; [
    kitty
    waybar # A customizable bar for Wayland
    wofi # A launcher/menu for Wayland
    hyprland # Ensure Hyprland is available for the user
    fish   # Add Fish shell
    font-awesome # For Font Awesome icons
    material-icons # For Material Icons
    fira # For Fira Sans font
  ];
# Configure Fish shell
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting "Welcome to Fish, Sadat!"
      fish_add_path $HOME/.local/bin # Add user bin to PATH
    '';
  };
  #programs.kitty = {
  #enable = true;
  #shellIntegration = {
  #  mode = "no-rc"; # This enables shell integration
  #};
#};
  #home.sessionVariables = {
  #  TERMINAL = "fish";
  #};
  # Configure Waybar
# Configure Waybar
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        margin-bottom = 0;
        margin-left = 0;
        margin-right = 0;
        spacing = 0;
        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [
          "clock"
        ];
        modules-right = [
          "pulseaudio"
          "network"
          "tray"
        ];
        "hyprland/workspaces" = {
          format = "{name}";
          on-click = "activate";
        };
        "hyprland/window" = {
          format = "{}";
        };
        clock = {
          format = "{:%Y-%m-%d %H:%M}";
        };
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "🔇";
          format-icons = {
            headphone = "🎧";
            default = [ "🔈" "🔉" "🔊" ];
          };
          on-click = "pavucontrol";
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%)";
          format-ethernet = "Connected";
          format-disconnected = "Disconnected";
        };
      };
    };
    style = ''
      @define-color backgroundlight #FFFFFF;
      @define-color backgrounddark #FFFFFF;
      @define-color workspacesbackground1 #FFFFFF;
      @define-color workspacesbackground2 #CCCCCC;
      @define-color bordercolor #FFFFFF;
      @define-color textcolor1 #000000;
      @define-color textcolor2 #000000;
      @define-color textcolor3 #FFFFFF;
      @define-color iconcolor #FFFFFF;

      * {
          font-family: "Fira Sans Semibold", "Font Awesome 6 Free", "Material Icons", Roboto, Helvetica, Arial, sans-serif;
          border: none;
          border-radius: 0px;
      }

      window#waybar {
          background-color: rgba(0,0,0,0.4);
          transition-property: background-color;
          transition-duration: .5s;
      }

      .modules-left {
          padding-left: 10px;
      }

      #workspaces {
          margin: 3px 7px 3px 3px;
          font-size: 14px;
          color: @textcolor1;
      }

      #workspaces button {
          margin: 4px 5px 4px 0px;
          padding: 0px 4px;
          color: @textcolor3;
          transition: all 0.5s ease-in-out;
      }

      #workspaces button.active {
          color: @textcolor1;
          background: @workspacesbackground2;
      }

      #workspaces button:hover {
          color: @textcolor1;
          background: @workspacesbackground2;
          border-radius: 15px;
      }

      tooltip {
          border-radius: 16px;
          background-color: @backgroundlight;
          opacity: 0.9;
          padding: 20px;
          margin: 0px;
      }

      tooltip label {
          color: @textcolor2;
      }

      #window {
          margin: 0px 15px 0px 0px;
          border-radius: 12px;
          color: @textcolor1;
          font-size: 14px;
          font-weight: normal;
      }

      window#waybar.empty #window {
          background-color: transparent;
      }

      #clock {
          font-size: 15px;
          color: @textcolor1;
          margin: 0px 15px 0px 0px;
      }

      #pulseaudio {
          font-size: 14px;
          color: @textcolor1;
          border-radius: 15px;
          margin: 0px 15px 0px 0px;
      }

      #pulseaudio.muted {
          color: @textcolor1;
      }

      #network {
          font-size: 14px;
          color: @textcolor1;
          border-radius: 15px;
          margin: 0px 15px 0px 0px;
      }

      #tray {
          margin: 0px 10px 0px 0px;
      }

      #tray > .passive {
          -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: #eb4d4b;
      }
    '';
  };
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
      bind = [

        # Applications
        "$mod, RETURN, exec, kitty"    # Open the terminal
        "$mod, B, exec, firefox"          # Open the browser
        # Windows
        "$mod, Q, killactive"                                                              # Kill active window
        "$mod SHIFT, Q, exec, hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill" # Quit active window and all open instances
        "$mod, F, fullscreen, 0"                                                           # Set active window to fullscreen
        "$mod, M, fullscreen, 1"                                                           # Maximize Window
        "$mod, T, togglefloating"                                                          # Toggle active windows into floating mode
                                                       # Move focus down
        # Actions
        "$mod CTRL, R, exec, hyprctl reload"                                             # Reload Hyprland configuration

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

#$mod SHIFT, 1, movetoworkspace, 1  # Move active window to workspace 1
#$mod SHIFT, 2, movetoworkspace, 2  # Move active window to workspace 2
#$mod SHIFT, 3, movetoworkspace, 3  # Move active window to workspace 3
#$mod SHIFT, 4, movetoworkspace, 4  # Move active window to workspace 4
#$mod SHIFT, 5, movetoworkspace, 5  # Move active window to workspace 5
#$mod SHIFT, 6, movetoworkspace, 6  # Move active window to workspace 6
#$mod SHIFT, 7, movetoworkspace, 7  # Move active window to workspace 7
#$mod SHIFT, 8, movetoworkspace, 8  # Move active window to workspace 8
#$mod SHIFT, 9, movetoworkspace, 9  # Move active window to workspace 9
#$mod SHIFT, 0, movetoworkspace, 10 # Move active window to workspace 10
      ];
    };
  };
}