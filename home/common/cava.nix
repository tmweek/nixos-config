{ ... }:
{
  programs.cava = {
    enable = true;
    settings = {
      general.framerate = 144;
      general.bars = 12;
    };
  };

  stylix.targets.cava.rainbow.enable = true;
}
