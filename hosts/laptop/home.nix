{ config, pkgs, ... }:
{
  imports = [
    ../../home/default.nix
  ];

  home.stateVersion = "26.05";
}
