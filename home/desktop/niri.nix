{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:
{
  imports = [
    inputs.niri.homeModules.niri
  ];

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri;
    settings = {
      layout = {
        gaps = 16;

        focus-ring = {
          enable = false;
        };

        border = {
          enable = true;
          width = 4;
        };

        default-column-width = {
          proportion = 0.5;
        };
      };

      spawn-at-startup = [
        { argv = [ "waybar" ]; }
        { argv = [ "awww-daemon" ]; }
        {
          argv = [
            "awww"
            "img"
            "/home/shawty/wallppr.jpg"
          ];
        }
      ];

      prefer-no-csd = true;

      gestures.hot-corners.enable = false;

      hotkey-overlay.skip-at-startup = true;

      animations.enable = false;

      environment = {
        DISPLAY = ":0";
      };

      window-rules = [
        {
          matches = [ { is-active = false; } ];
          opacity = 0.9;
        }

        {
          geometry-corner-radius = {
            top-left = 16.0;
            top-right = 16.0;
            bottom-left = 16.0;
            bottom-right = 16.0;
          };
          clip-to-geometry = true;
        }

        {
          matches = [ { app-id = "xdg-desktop-portal-gtk"; } ];
          open-floating = true;
          default-floating-position = {
            x = 0;
            y = 0;
            relative-to = "top";
          };
          min-width = 400;
          min-height = 600;
        }
      ];

      layer-rules = [

        # Rofi
        {
          matches = [ { namespace = "rofi"; } ];
          opacity = 0.9;
          geometry-corner-radius = {
            top-left = 20.0;
            top-right = 20.0;
            bottom-left = 20.0;
            bottom-right = 20.0;
          };
        }
      ];

      binds = with config.lib.niri.actions; {

        # Application Launchers
        "Mod+Q" = {
          hotkey-overlay.title = "Open a Terminal: foot";
          action = spawn "foot";
        };
        "Mod+D" = {
          hotkey-overlay.title = "Run Application Menu: rofi";
          action = spawn "rofi-launcher";
        };
        "Mod+B" = {
          hotkey-overlay.title = "Open Browser: firefox";
          action = spawn "firefox";
        };
        "Mod+Slash" = {
          hotkey-overlay.title = "Open Hotkey List";
          action = show-hotkey-overlay;
        };
        # Screenshots
        "Print".action.screenshot = {
          show-pointer = false;
        };
        "Ctrl+Print".action.screenshot-screen = {
          show-pointer = false;
        };
        "Alt+Print".action.screenshot-window = {
          show-pointer = false;
        };

        # Window Management
        "Mod+E" = {
          repeat = false;
          action = close-window;
        };
        "Mod+V".action = toggle-window-floating;

        "Mod+Shift+V" = {
          repeat = false;
          action = toggle-overview;
        };
        "Mod+R".action = switch-preset-column-width;
        "Mod+F".action = maximize-column;
        "Mod+Shift+F".action = fullscreen-window;
        "Mod+Alt+F".action = maximize-window-to-edges;
        "Mod+Ctrl+F".action = expand-column-to-available-width;

        # Focus Movement
        "Mod+Z".action = focus-column-left;
        "Mod+X".action = focus-window-down;
        "Mod+S".action = focus-window-up;
        "Mod+C".action = focus-column-right;

        # Window Movement
        "Mod+Shift+Z".action = move-column-left;
        "Mod+Shift+C".action = move-column-right;
        "Mod+Shift+X".action = move-window-down;
        "Mod+Shift+S".action = move-window-up;

        # Consume / Expel
        "Mod+Ctrl+Z".action = consume-or-expel-window-left;
        "Mod+Ctrl+C".action = consume-or-expel-window-right;

        # First / Last Columns
        "Mod+Home".action = focus-column-first;
        "Mod+End".action = focus-column-last;
        "Mod+Ctrl+Home".action = move-column-to-first;
        "Mod+Ctrl+End".action = move-column-to-last;

        # Column / Window Resizing Presets
        "Mod+Shift+R".action = switch-preset-column-width-back;
        "Mod+Ctrl+Shift+R".action = switch-preset-window-height;
        "Mod+Ctrl+R".action = reset-window-height;

        # Quit
        "Mod+Shift+P".action = quit;

        # Sizing
        "Mod+Minus".action = set-column-width "-10%";
        "Mod+Equal".action = set-column-width "+10%";
        "Mod+Shift+Minus".action = set-window-height "-10%";
        "Mod+Shift+Equal".action = set-window-height "+10%";

        "Mod+Shift+W".action = toggle-column-tabbed-display;

        # Mouse & Touchpad Wheels
        "Mod+WheelScrollDown" = {
          cooldown-ms = 150;
          action = focus-workspace-down;
        };
        "Mod+WheelScrollUp" = {
          cooldown-ms = 150;
          action = focus-workspace-up;
        };
        "Mod+Ctrl+WheelScrollDown" = {
          cooldown-ms = 150;
          action = move-column-to-workspace-down;
        };
        "Mod+Ctrl+WheelScrollUp" = {
          cooldown-ms = 150;
          action = move-column-to-workspace-up;
        };

        "Mod+WheelScrollRight".action = focus-column-right;
        "Mod+WheelScrollLeft".action = focus-column-left;
        "Mod+Ctrl+WheelScrollRight".action = move-column-right;
        "Mod+Ctrl+WheelScrollLeft".action = move-column-left;

        "Mod+Shift+WheelScrollDown".action = focus-column-right;
        "Mod+Shift+WheelScrollUp".action = focus-column-left;
        "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
        "Mod+Ctrl+Shift+WheelScrollUp".action = move-column-left;

        # Workspaces (1-9)
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;

        # Session & Inhibitors
        "Mod+Escape" = {
          allow-inhibiting = false;
          action = toggle-keyboard-shortcuts-inhibit;
        };
        "Mod+Shift+E".action = quit;
        "Ctrl+Alt+Delete".action = quit;

        # Audio / Media Keys
        "XF86AudioRaiseVolume" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+";
        };
        "XF86AudioLowerVolume" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-";
        };
        "XF86AudioMute" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        };
        "XF86AudioMicMute" = {
          allow-when-locked = true;
          action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
        };

        "XF86AudioPlay" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl play-pause";
        };
        "XF86AudioPause" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl play-pause";
        };
        "XF86AudioStop" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl stop";
        };
        "XF86AudioPrev" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl previous";
        };
        "XF86AudioNext" = {
          allow-when-locked = true;
          action = spawn-sh "playerctl next";
        };

        # Brightness Keys
        "XF86MonBrightnessUp" = {
          allow-when-locked = true;
          action = spawn "brightnessctl" "-e4" "-n2" "set" "2%+";
        };
        "XF86MonBrightnessDown" = {
          allow-when-locked = true;
          action = spawn "brightnessctl" "-e4" "-n2" "set" "2%-";
        };
      };

      outputs = {
        "eDP-1" = {
          enable = true;
          mode = {
            height = 1920;
            width = 1080;
            refresh = 144.0;
          };
          scale = 1.0;
          position = {
            x = 0;
            y = 0;
          };
        };
      };

      input = {
        keyboard = {
          xkb = {
            layout = "us,ru";
            options = "grp:alt_shift_toggle";
          };
          repeat-delay = 300;
          repeat-rate = 50;
        };

        touchpad = {
          tap = true;
          dwt = true;
          natural-scroll = true;
          accel-speed = 0.2;
          accel-profile = "adaptive";
        };

        mouse = {
          natural-scroll = false;
          accel-speed = 0.0;
          accel-profile = "flat";
        };

        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "0%";
        };

        warp-mouse-to-focus.enable = true;
        workspace-auto-back-and-forth = true;
      };

      xwayland-satellite = {
        enable = true;
        path = lib.getExe pkgs.xwayland-satellite;
      };
    };
  };
}
