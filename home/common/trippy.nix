{ config, ... }:
let
  c = config.lib.stylix.colors;
in
{
  programs.trippy = {
    enable = true;
    settings = {
      theme-colors = {
        bg-color = c.base00;
        text-color = c.base05;
        border-color = c.base03;
        tab-text-color = c.base0D;
        selected-bg-color = c.base02;
        selected-text-color = c.base0A;

        graph-color = c.base0D;
        chart-normal-color = c.base0B;

        hop-unknown-color = c.base04;
        header-bg-color = c.base01;
        header-text-color = c.base0D;
      };
    };
  };
}
