{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (config.lib.formats.rasi) mkLiteral;

  # Скрипт для меню питания
  rofi-launcher = pkgs.writeShellScriptBin "rofi-launcher" ''
    declare -A mods=(
        ["󰀻 DRUN"]="rofi -show drun"
        [" WINDOW"]="rofi -show window"
        ["󰣀 SSH"]="rofi -show ssh"
        [" RUN"]="rofi -show run"
        ["󰐥 POWERMENU"]="rofi -show powermenu"
        ["󰪚 CALC"]="rofi -show calc"
        [" FILEBROWSER"]="rofi -show filebrowser"
        ["󰄨 TOP"]="rofi -show top"
        ["󰞅 EMOJI"]="rofi -show emoji"
    )

    options=$(printf '%s\n' "''${!mods[@]}" | sort)
    chosen="$(echo -e "$options" | rofi -dmenu -p "󱁽 Выбор мода " -i)"

    if [[ -n "$chosen" && -n "''${mods[$chosen]}" ]]; then
        eval "''${mods[$chosen]}"
    fi
  '';
in
{

  home.packages = [ rofi-launcher ];

  programs.rofi = {
    enable = true;

    plugins = with pkgs; [
      rofi-calc
      rofi-emoji
      rofi-top

    ];

    # Список режимов массивом Nix
    modes = [
      "drun"
      "run"
      "ssh"
      "window"
      "calc"
      "emoji"
      "top"
      "powermenu:${pkgs.rofi-power-menu}/bin/rofi-power-menu"
    ];

    extraConfig = {
      show-icons = true;
      icon-theme = "Papirus-Dark";
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      sidebar-mode = false;

      display-drun = "󰀻 APPS";
      display-run = " RUN";
      display-window = " WIN";
      display-calc = "󰪚 CALC";
      display-emoji = "󰞅 EMOJI";
      display-top = "󰄨 TOP";
      display-mpd = "󰎈 MPD";
      display-games = "󰊴 GAMES";
      display-powermenu = "󰐥 POWERMENU";
      display-ssh = "󰣀 SSH";
      display-filebrowser = " FILEBROWSER";

      kb-row-up = "Up,Control+k";
      kb-row-down = "Down,Control+j";
      kb-row-left = "Left,Control+h";
      kb-row-right = "Right,Control+l";
      kb-accept-entry = "Control+z,Control+y,Return,KP_Enter";

      kb-remove-to-eol = "";
      kb-move-char-back = "Control+b";
      kb-remove-char-back = "BackSpace";
      kb-move-char-forward = "Control+f";
      kb-mode-complete = "Control+o";
    };

    theme = {
      "window" = {
        transparency = "real";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        fullscreen = false;
        width = mkLiteral "600px";
        x-offset = mkLiteral "0px";
        y-offset = mkLiteral "0px";

        enabled = true;
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "10px";
        cursor = "default";
      };

      "mainbox" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "30px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        children = map mkLiteral [
          "inputbar"
          "message"
          "listview"
        ];
      };

      "inputbar" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        children = map mkLiteral [ "entry" ];
      };

      "prompt" = {
        enabled = true;
      };

      "entry" = {
        enabled = true;
        padding = mkLiteral "5px 0px";
        cursor = mkLiteral "text";
        placeholder = "Search...";
      };

      "num-filtered-rows" = {
        enabled = true;
        expand = false;
      };

      "textbox-num-sep" = {
        enabled = true;
        expand = false;
        str = "/";
      };

      "num-rows" = {
        enabled = true;
        expand = false;
      };

      "case-indicator" = {
        enabled = true;
      };

      "listview" = {
        enabled = true;
        columns = 1;
        lines = 8;
        cycle = true;
        dynamic = true;
        scrollbar = true;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;

        spacing = mkLiteral "5px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        cursor = "default";
      };

      "scrollbar" = {
        handle-width = mkLiteral "5px";
        border-radius = mkLiteral "10px";
      };

      "element" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "5px 10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "10px";
        cursor = mkLiteral "pointer";
      };

      "element-icon" = {
        size = mkLiteral "24px";
        cursor = mkLiteral "inherit";
      };

      "element-text" = {
        cursor = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };

      "button" = {
        padding = mkLiteral "5px 10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "10px";
        cursor = mkLiteral "pointer";
      };

      "message" = {
        enabled = true;
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
      };

      "textbox" = {
        padding = mkLiteral "8px 10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "10px";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
        highlight = mkLiteral "none";
        blink = true;
        markup = true;
      };

      "error-message" = {
        padding = mkLiteral "10px";
        border = mkLiteral "2px solid";
        border-radius = mkLiteral "10px";
      };
    };
  };
}
