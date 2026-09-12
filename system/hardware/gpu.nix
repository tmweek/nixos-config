{ config, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" "amdgpu" ];

  hardware.nvidia = {
      open = true;
      modesetting.enable = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      powerManagement.enable = true;
      prime = {
        offload = {
          enable = true;
	  enableOffloadCmd = true;
        };
        amdgpuBusId="PCI:5:0:0";
        nvidiaBusId="PCI:1:0:0";
      };
    };
}
