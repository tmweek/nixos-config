{ lib, pkgs, ... }:
{
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = lib.mkDefault true;
        efiSysMountPoint = "/boot";
      };

      systemd-boot = {
        enable = true;
        editor = false;
      };

      timeout = 3;
    };

    initrd = {
      verbose = false;
      systemd.enable = true;
    };

    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override { selected_themes = [ "rings" ]; })
      ];
    };

    kernelParams = [
      "nvidia-drm.modeset=1"
      "nvidia-drm.fbdev=1"
      "amd_pstate=active"
      "amd_iommu=force"
      "processor.max_cstate=5"
      "quiet"
      "splash"
      "loglevel=3"
      "init_on_alloc=1"
      "init_on_free=1"
      "page_alloc.shuffle=1"
      "nowatchdog"
      "psi=1"
    ];

    kernel.sysctl = {
      "vm.swappiness" = 10;
      "vm.vfs_cache_pressure" = 50;
      "vm.dirty_ratio" = 10;
      "vm.dirty_background_ratio" = 5;
      "kernel.nmi_watchdog" = 0;
      "dev.i915.perf_stream_paranoid" = 0;
      "net.core.netdev_budget" = 600;
      "net.core.netdev_max_backlog" = 16384;
      "net.ipv4.tcp_no_metrics_save" = 1;
      "net.ipv4.tcp_moderate_rcvbuf" = 1;

    };

    consoleLogLevel = 0;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd niri-session";
        user = "shawty";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    niri
    niri-session
    zsh
    bash
  '';
}
