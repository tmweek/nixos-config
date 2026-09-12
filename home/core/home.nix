{ config, pkgs, user, lib, ... }:
{
  home.username = "${user}";
  home.homeDirectory = lib.mkDefault "/home/${user}";

  programs.home-manager.enable = true;
}
