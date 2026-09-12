{ pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    initrd.kernelModules = [
	"amdgpu"
	"nvidia"
	"nvidia_modeset"
	"nvidia_uvm"
	"nvidia_drm"
    ];

    kernelModules = [ "i2c-dev" "v4l2loopback"];

    blacklistedKernelModules = [
      "nouveau"
      "af_802154"
      "appletalk"
      "atm"
      "ax25"
      "decnet"
      "econet" 
      "ipx"
      "n-hdlc"      
      "netrom"      
      "p8022"       
      "p8023"      
      "psnap"      
      "rds"      
      "rose"      
      "tipc"       
      "x25"
      "adfs"       
      "affs"       
      "befs"       
      "bfs"      
      "cramfs"      
      "efs"      
      "erofs"       
      "exofs"       
      "f2fs"       
      "freevxfs"       
      "gfs2"       
      "hfs"       
      "hfsplus"       
      "hpfs"       
      "jffs2"      
      "jfs"      
      "ksmbd"       
      "minix"      
      "nilfs2"       
      "omfs"      
      "qnx4" 
      "qnx6"       
      "squashfs"      
      "sysv"       
      "udf"
      "vivid" 
      "firewire-core"
      "thunderbolt"
      ];

      extraModprobeConfig = ''
        options v4l2loopback exclusive_caps=1 card_label="OBS Virtual Output"
        options rtw88_core disable_lps_deep=y
        options rtw88_pci disable_aspm=y
      '';
  };
}
