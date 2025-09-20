
{
  pkgs,
  ...
}:
{
  programs.fish.enable = true;
  programs.kitty = {
  enable = true;
  shellIntegration = {
    mode = "no-rc"; # This enables shell integration
  };
};
  environment.systemPackages = with pkgs; [
    kitty
    git
    lazygit
    eza
    ncdu
    ripgrep
    fzf
  ];
}