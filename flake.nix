{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #stylix = {
    #  url = "github:nix-community/stylix/release-25.05";
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs = inputs@{ nixpkgs, home-manager,stylix, ... }:{
    systems = [
      "x86_64-linux"
    ];
    nixosConfigurations = {
      sadat = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; };
        modules = [
          #stylix.nixosModules.stylix
          ./nixos/configuration.nix
          ./nixos/hardware-configuration.nix
          ./nixos/systempackages.nix
          ./nixos/terminal.nix
          ./nixos/hyprland.nix
          ./nixos/display-manager.nix
          ./nixos/fonts.nix
          ./nixos/users.nix
          ./nixos/sound.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup"; # or any extension you prefer
            home-manager.users.sadat = import ./home/home.nix;
          }
        ];
      };
    };
  };
}