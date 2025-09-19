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
      bind = [
        "$mod, Q, exec, kitty" # Launch Kitty terminal
        "$mod, W, exec, firefox" # Launch Firefox
        "$mod, C, killactive" # Close active window
        "$mod, M, exit" # Exit Hyprland
      ];
    };
  };
}