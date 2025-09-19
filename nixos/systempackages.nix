{ config, pkgs, ... }:
{ environment.systemPackages = with pkgs; [
    git # Already installed, but good to ensure it’s here
    curl
    wget
  ];
}