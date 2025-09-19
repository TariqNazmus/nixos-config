{ config, pkgs, ... }:
{ 
    users.users.sadat = {
    isNormalUser = true;
    description = "Sadat";
    extraGroups = [ "networkmanager" "wheel" ]; # wheel for sudo, networkmanager for networking
    packages = with pkgs; [ ]; # User-specific packages can go here or in home.nix
  };
}