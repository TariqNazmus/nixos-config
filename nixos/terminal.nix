
{
  pkgs,
  ...
}:
{
  # Add Fish to system shells
  programs.fish.enable = true;
  environment.shells = with pkgs; [ fish ];

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