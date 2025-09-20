
{
  pkgs,
  ...
}:
{
  

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