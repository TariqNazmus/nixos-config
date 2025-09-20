
{
  pkgs,
  ...
}:
{
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    kitty
    git
    lazygit
    eza
    ncdu
    ripgrep
    fzf
  ];
programs.kitty = {
  enable = true;
  shellIntegration = {
    mode = "no-rc"; # This enables shell integration
  };
};
}