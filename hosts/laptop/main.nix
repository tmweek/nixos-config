{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../system/default.nix
  ];

  system.stateVersion = "26.11";
}
