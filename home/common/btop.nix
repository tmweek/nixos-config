{ ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      proc_tree = false;
      proc_sorting = "memory";
      proc_filter_kernel = true;
      rounded_corners = false;
    };
  };
}
