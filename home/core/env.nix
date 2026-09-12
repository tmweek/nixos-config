{ user, ... }:
{
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
    MOZ_ENABLE_WAYLAND = "1";

    EDITOR = "helix";
    TERMINAL = "foot";
    SHELL = "oksh";

    DISPLAY = ":0";
  };
}
