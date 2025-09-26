self: anyrun: illogical-impulse-dotfiles: inputs:
{ ... }: {
  imports = [
    (import ./options.nix illogical-impulse-dotfiles)
    (import ./anyrun.nix anyrun illogical-impulse-dotfiles inputs)
    (import ./quickshell.nix illogical-impulse-dotfiles inputs)
    #(import ./hyprland.nix illogical-impulse-dotfiles inputs)
    (import ./packages.nix inputs)
  ];
}

