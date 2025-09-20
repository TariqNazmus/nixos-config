
{
  pkgs,
  ...
}:
{
  programs.fish.enable = true;
  environment.systemPackages = with pkgs; [
    git
    lazygit
    eza
    ncdu
    ripgrep
    fzf
  ];
}