{ config, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;
in
{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    git = true;
    icons = "always";
    theme = {
      colourful = true;

      filekinds = {
        normal = { foreground = colors.base05; };
        directory = { foreground = colors.base0D; };
        symlink = { foreground = colors.base0C; };
        executable = { foreground = colors.base0B; };
      };
      perms = {
        user_read = { foreground = colors.base0A; };
        user_write = { foreground = colors.base08; };
        user_execute = { foreground = colors.base0B; };
      };
    };
  };
}
