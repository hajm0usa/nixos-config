{
  description = "HajMousa's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        # overlays = [ (import ./overlays) ];
      };

      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        sauron = lib.nixosSystem {
          inherit system;
          # specialArgs = { inherit inputs pkgs; };
          modules = [
            ./hosts/sauron
            ./modules/nixos

            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.hajmousa = import ./users/hajmousa;
              };
            }
          ];
        };
      };

      #apps.${system} = {
      #  build = {
      #   type = "app";
      #    program = toString (
      #      pkgs.writeShellScript "build" ''
      #        sudo nixos-rebuild build --flake .#sauron
      #      ''
      #    );
      #  };
      #
      #        switch = {
      #          type = "app";
      #          program = toString (
      #            pkgs.writeShellScript "switch" ''
      #              sudo nixos-rebuild switch --flake .#sauron
      #            ''
      #          );
      #        };
      #
      #        update = {
      #          type = "app";
      #          program = toString (
      #            pkgs.writeShellScript "update" ''
      #              nix flake update
      #              sudo nixos-rebuild switch --flake .#sauron
      #            ''
      #          );
      #        };
      #};
    };
}
