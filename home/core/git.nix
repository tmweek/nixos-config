{ ... }:
{
    programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "tmweek";
        email = "tmweek@protonmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
