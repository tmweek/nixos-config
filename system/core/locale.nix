{ pkgs, ... }:
{
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocales = [ "ru_RU.UTF-8/UTF-8" ];

  i18n.extraLocaleSettings = {
    LC_ALL = "ru_RU.UTF-8";
    LC_CTYPE = "ru_RU.UTF8";
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MESSAGES = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
    LC_COLLATE = "ru_RU.UTF-8";
  };

  console = {
    font = "ter-v16n";
    packages = [ pkgs.terminus_font ];
    keyMap = "ru";
  };
}
