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
    thunar # File manager
    gvfs   # For Thunar trash and mount support
  ];
  # Import component configurations
  imports = [
    ./terminal-utils.nix
    ./waybar.nix
    ./hyprland.nix
  ];
}