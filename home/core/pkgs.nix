{ pkgs, ... }:
{
  home.packages = with pkgs; [

    #  | CLI |
    curl
    git
    fzf
    bat
    btop
    cava
    eza
    fastfetch
    fd
    trippy
    yazi
    wget
    curlie
    duf
    lavat
    cbonsai
    awww
    helix
    zsh
    starship
    claude-code

    #   | GUI |
    firefox
    niri
    vesktop
    qutebrowser
    foot
    waybar
    xdg-desktop-portal
    xdg-desktop-portal-gnome
    xdg-desktop-portal-gtk
    waybar
    rofi
    pipewire
    pwvucontrol
  ];
}
