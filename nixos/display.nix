{ config, pkgs, ... }:
{
    # Enable the X11 windowing system and Wayland support
  services.xserver.enable = true;

  # Enable Hyprland as a Wayland compositor
  programs.hyprland = {
    enable = true;
    xwayland.enable = true; # Enable XWayland for compatibility with X11 apps
  };

  # Enable SDDM display manager
  services.xserver.displayManager.sddm = {
    enable = true;
    wayland.enable = true; # Ensure SDDM uses Wayland
  };
}