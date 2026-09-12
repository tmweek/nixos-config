{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    settings = {
      manager = {
        show_hidden = true;
        show_symlink = true;
        sort_by = "alphabetical";
      };
    };
  };
  home.packages = with pkgs; [
    ffmpegthumbnailer
    p7zip
    jq
    poppler
  ];
}
