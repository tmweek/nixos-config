{ ... }:
{
 
  networking.wireless.iwd = {
    enable = true;
    settings = {
      General.EnableNetworkConfiguration = true;
      Network = {
        EnableIPv6 = true;
        AddressRandomization = "network";
      };
      Settings.AutoConnect = true;
    };
  };
}
