{ pkgs, ... }:

{
  programs.vesktop = {
    enable = true;

    # Настройки самого клиента Vesktop (Electron/Window)
    settings = {
      appBadge = false;
      arRPC = true;
      checkUpdates = false;
      customTitleBar = false; # Стандартный системный заголовок (быстрее и нативнее)
      disableMinSize = true;
      minimizeToTray = true;
      tray = true;
      splashBackground = "#000000";
      splashColor = "#ffffff";
      splashTheming = true;
      staticTitle = true;
      hardwareAcceleration = true; # Важно для плавности и откликов
      discordBranch = "stable";
    };

    # Настройки плагинов Vencord
    vencord = {
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        disableMinSize = true;
        useQuickCss = true;

        plugins = {
          # Кастомные функции
          FakeNitro.enabled = true;
          MessageLogger = {
            enabled = true;
            ignoreSelf = true;
          };

          # Приватность и телеметрия
          NoTrack.enabled = true;        # Блокировка отправки аналитики в Discord
          SilentTyping.enabled = true;   # Отключение индикатора «печатает...»
          
          # Удобство и производительность
          VolumeBooster.enabled = true;  # Усиление громкости
          ShowHiddenChannels.enabled = true;
        };
      };

      # Минималистичный QuickCSS (скрываем мусор в чате)
      extraQuickCss = ''
        [aria-label="Send a gift"],
        [aria-label="Open GIF picker"],
        [aria-label="Open sticker picker"] {
          display: none !important;
        }
      '';
    };
  };
}
