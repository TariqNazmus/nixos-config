{ config, pkgs, ... }:

{
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

}