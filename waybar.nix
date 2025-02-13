{
  pkgs,
  lib,
  ...
}:
let
  betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";
in
with lib;
{
  # Configure & Theme Waybar
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-center = [ "sway/workspaces" ];
        modules-left = [
          "custom/startmenu"
          "sway/window"
          "pulseaudio"
          "cpu"
          "memory"
        ];
        modules-right = [
          "custom/exit"
          "idle_inhibitor"
          "custom/themeselector"
          "custom/notification"
          "battery"
          "clock"
          "tray"
        ];
        "sway/workspaces" = {
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
        };
        "clock" = {
          format = " {:%H:%M }";
          tooltip = true;
          tooltip-format = "<big>{:%A, %d.%B %Y }</big><tt><small>{calendar}</small></tt>";
        };
        "sway/window" = {
          max-length = 25;
          separate-outputs = false;
          rewrite = {
            "" = " Open Spotify Bro. ";
          };
        };
        "memory" = {
          interval = 5;
          format = " {}%";
          tooltip = true;
        };
        "cpu" = {
          interval = 5;
          format = " {usage:2}%";
          tooltip = true;
        };
        "disk" = {
          format = " {free}";
          tooltip = true;
        };
        "network" = {
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = " {bandwidthDownOctets}";
          format-wifi = "{icon} {signalStrength}%";
          format-disconnected = "󰤮";
          tooltip = false;
        };
        "tray" = {
          spacing = 12;
        };
        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = " ";
            headset = " ";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "sleep 0.1 && pavucontrol";
        };
        "custom/exit" = {
          tooltip = false;
          format = "";
          on-click = "sleep 0.1 && wlogout";
        };
        "custom/startmenu" = {
          tooltip = false;
          format = "󰣇 ";
          on-click = "sleep 0.1 && rofi -show drun";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = true;
        };
        "custom/notification" = {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && task-waybar";
          escape = true;
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󱘖 {capacity}%";
          format-icons = [
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
          on-click = "";
          tooltip = false;
        };
      }
    ];
    style = concatStrings [
      ''
        * {
          font-size: 16px;
          font-family: JetBrainsMono Nerd Font, Font Awesome, sans-serif;
          font-weight: bold;
        }
        window#waybar {
          background-color: rgba(30,30,46,0); /* base00 */
          border-bottom: 1px solid rgba(30,30,46,0); /* base00 */
          border-radius: 0px;
          color: #94e2d5; /* base0F */
        }
        #workspaces {
          color: #1e1e2e; /* base00 */
          background: transparent;
          margin: 4px;
          border-radius: 0px;
          border: 0px;
          font-style: normal;
        }
        #workspaces button {
          color: #585b70; /* base03 */
          background: #1e1e2e; /* base00 */
          margin: 4px 3px;
          opacity: 1;
          border: 0px;
          border-radius: 15px;
          transition: ${betterTransition};
        }
        #workspaces button.active {
          color: #1e1e2e; /* base00 */
          background: linear-gradient(45deg, #cba6f7, #94e2d5, #b4befe, #fab387); /* base0E, base0F, base0D, base09 */
          background-size: 300% 300%;
          animation: swiping 15s linear infinite;
          border-radius: 15px;
          margin: 4px 3px;
          opacity: 1.0;
          border: 0px;
          min-width: 45px;
          transition: ${betterTransition};
        }
        #workspaces button:hover {
          color: #f2cdcd; /* base05 */
          border: 0px;
          border-radius: 15px;
          transition: ${betterTransition};
        }
        @keyframes gradient_horizontal {
          0% {
            background-position: 0% 50%;
          }
          50% {
            background-position: 100% 50%;
          }
          100% {
            background-position: 0% 50%;
          }
        }
        @keyframes swiping {
          0% {
            background-position: 0% 200%;
          }
          100% {
            background-position: 200% 200%;
          }
        }
        tooltip {
          background: #1e1e2e; /* base00 */
          border: 1px solid #cba6f7; /* base0E */
          border-radius: 10px;
        }
        tooltip label {
          color: #cdd6f4; /* base07 */
        }
        #window {
          color: #585b70; /* base03 */
          background: #1e1e2e; /* base00 */
          margin: 6px 4px;
          border-radius: 15px;
          padding: 0px 10px;
        }
        #memory {
          color: #94e2d5; /* base0F */
          background: #1e1e2e; /* base00 */
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #clock {
          color: #a6e3a1; /* base0B */
          background: #1e1e2e; /* base00 */
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #cpu {
          color: #cdd6f4; /* base07 */
          background: #1e1e2e; /* base00 */
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #disk {
          color: #585b70; /* base03 */
          background: #1e1e2e; /* base00 */
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #battery {
          color: #f5c2e7; /* base08 */
          background: #1e1e2e; /* base00 */
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #network {
          color: #fab387; /* base09 */
          background: #1e1e2e; /* base00 */
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #tray {
          color: #f2cdcd; /* base05 */
          background: #1e1e2e; /* base00 */
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #pulseaudio {
          color: #b4befe; /* base0D */
          background: #1e1e2e; /* base00 */
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #custom-notification {
          color: #89b4fa; /* base0C */
          background: #1e1e2e; /* base00 */
          margin: 6px 4px;
          padding: 0px 10px;
          border-radius: 15px;
        }
        #custom-startmenu {
          color: #585b70; /* base03 */
          background: #1e1e2e; /* base00 */
          margin: 6px 4px;
          padding: 0px 8px 0px 10px;
          border-radius: 15px;
        }
        #idle_inhibitor {
          color: #fab387; /* base09 */
          background: #1e1e2e; /* base00 */
          margin: 6px 0px;
          padding: 0px 14px;
          border-radius: 0px 15px 15px 0px;
        }
        #custom-exit {
          color: #cba6f7; /* base0E */
          background: #1e1e2e; /* base00 */
          margin: 6px 0px 6px 4px;
          padding: 0px 5px 0px 10px;
          border-radius: 15px 0px 0px 15px;
        }
      ''
    ];
  };
}
