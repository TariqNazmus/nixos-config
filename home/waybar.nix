{ config, pkgs, ... }:

{
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
}