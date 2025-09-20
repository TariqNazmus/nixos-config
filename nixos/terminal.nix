
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

}