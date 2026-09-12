{ config, ... }:
{
  systemd.oomd = {
    enable = true;
    enableRootSlice = true;   
    enableSystemSlice = true;  
    enableUserSlices = true;  
  };

  systemd.services."user@".serviceConfig = {
    ManagedOOMMemoryPressure = "kill";
    ManagedOOMMemoryPressureLimit = "85%vg";
  };

}
