{ config, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        exclusive = true;
        reload_style_on_change = true;
        position = "bottom";
        spacing = 0;
        height = 28;
        margin-top = 1;
        width = 250;

        modules-left = [
          "niri/workspaces"
        ];

        modules-center = [
          "mpris"
          "clock"
        ];

        modules-right = [
          "tray"
          "bluetooth"
          "network"
          "pulseaudio"
          "memory"
          "cpu"
          "battery"
        ];

        "niri/workspaces" = {
          disable-scroll = false;
          all-outputs = true;
          format = "{icon}";
          format-icons = {
            default = "○";
            active = "●";
          };
        };

        "niri/window" = {
          format = "{title}";
          max-length = 25;
        };

        cpu = {
          interval = 10;
          format = " {usage}%";
          on-click = "foot -e btop";
        };

        memory = {
          interval = 2;
          format = " {used:0.1f}G";
          on-click = "foot -e btop";
        };

        clock = {
          format = "{:%Y-%m-%d %H:%M}";
          tooltip-format = "<span>{calendar}</span>";
          calendar = {
            mode = "month";
            mode-mon-col = 3;
            on-click-right = "mode";
            format = {
              month = "<span color='#ffead3'><b>{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b>{}</b></span>";
            };
          };
        };

        network = {
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format = "{icon}";
          format-wifi = "{icon}";
          format-ethernet = "󰀂";
          format-disconnected = "󰤮";
          tooltip-format-wifi = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-ethernet = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
          tooltip-format-disconnected = "Disconnected";
          interval = 3;
          spacing = 1;
        };

        battery = {
          format = "{icon} {capacity}%";
          format-discharging = "{icon} {capacity}%";
          format-charging = "{icon} {capacity}%";
          format-plugged = " {capacity}%";
          format-icons = {
            charging = [
              "󰢜"
              "󰂆"
              "󰂇"
              "󰂈"
              "󰢝"
              "󰂉"
              "󰢞"
              "󰂊"
              "󰂋"
              "󰂅"
            ];
            default = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
          };
          format-full = "󰂅 {capacity}%";
          tooltip-format-discharging = "{power:>1.0f}W↓ {capacity}%";
          tooltip-format-charging = "{power:>1.0f}W↑ {capacity}%";
          interval = 5;
          states = {
            warning = 20;
            critical = 10;
          };
        };

        bluetooth = {
          format = "";
          format-disabled = "󰂲";
          format-connected = "󰂱";
          tooltip-format = "Devices connected: {num_connections}";
        };

        pulseaudio = {
          format = "{icon}";
          on-click = "foot -e wiremix";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          tooltip-format = "Playing at {volume}%";
          scroll-step = 5;
          format-muted = "";
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };
        };

        mpris = {
          format = "{player_icon}";
          format-paused = "{status_icon}";
          tooltip-format = "{dynamic}";
          player-icons = {
            default = "";
            mpv = "";
          };
          status-icons = {
            paused = "";
          };
          on-click = "playerctl play-pause";
          max-length = 20;
        };

        tray = {
          icon-size = 12;
          spacing = 4;
          show-passive-items = true;
        };
      };
    };
  };
}
