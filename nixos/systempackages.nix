{ config, pkgs, ... }:
{
    programs = {

    firefox.enable = false; # Firefox is not installed by default

    dconf.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    adb.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

   environment.systemPackages = with pkgs; [
    curl
    wget
  ];
}