{ pkgs, user, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      l = "ls -lah";
      ll = "ls -l";
      sl = "ls";
      nxr = "doas nixos-rebuild switch --flake ~/nixos-config/#nixos";
      nxs = "nix-shell -p";
    };

    history.size = 1000;

    initContent = ''
      eval "$(starship init zsh)"
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
