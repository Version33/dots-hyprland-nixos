{
  description = "Illogical Impulse Hyprland Dotfiles";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";

    anyrun.url = "github:Kirottu/anyrun";
    anyrun.inputs.nixpkgs.follows = "nixpkgs";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    systems.url = "github:nix-systems/default-linux";

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    illogical-impulse-dotfiles = {
      url = "github:end-4/dots-hyprland";
      flake = false;
    };
  };

  outputs =
    { self, nixpkgs, anyrun, illogical-impulse-dotfiles, systems, ... }@inputs:
    let
      inherit (nixpkgs) lib;
      eachSystem = lib.genAttrs (import systems);
    in {
      legacyPackages = eachSystem
        (system: import ./pkgs { pkgs = nixpkgs.legacyPackages.${system}; });
      homeManagerModules.default =
        import ./modules self anyrun illogical-impulse-dotfiles inputs;
    };
}
