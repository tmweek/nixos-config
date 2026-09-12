{ pkgs, user, ... }:
{
  users.users.${user} = {
    isNormalUser = true;
    description = "${user}";
    home = "/home/${user}";

    group = "${user}";

    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
      "input"
      "docker"
      "libvirtd"
    ];

    shell = pkgs.zsh;
    ignoreShellProgramCheck = true;

    hashedPassword = "$y$j9T$IIqf3EvY5z0hQOCcBHUEF1$YvzYsgzeV74nX0T8ajdw.xZaoJFyeXJV54MugnUHXS3";
  };
  users.groups.${user} = { };

  environment.shells = [ pkgs.zsh ];
}
