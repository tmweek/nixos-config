{ inputs, user, ... }:
{
  imports = [ inputs.impermanence.nixosModules.impermanence ];

  fileSystems."/persist".neededForBoot = true;
  programs.fuse.userAllowOther = true;

  environment.persistence."/persist" = {
    hideMounts = true;

    directories = [
      "/etc/ssh"
      "/etc/nixos"
      "/var/lib/bluetooth"
      "/var/lib/nixos"
      "/var/lib/systemd"
      "/var/lib/libvirt"
      "/var/lib/iwd"
    ];

    files = [
      "/etc/machine-id"
    ];

    users.${user} = {
      directories = [
        "Downloads"
        "Documents"
        "Pictures"
        "Videos"
        "Music"
        "Projects"

        ".ssh"
        ".gnupg"
        ".local/share/gnupg"
        ".local/share/keyrings"

        ".mozilla"

        {
          directory = ".local/share/Steam";
          method = "symlink";
        }
      ];

      files = [
        ".zsh_history"
      ];
    };
  };
}
