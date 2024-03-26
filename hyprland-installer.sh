#!/bin/bash

mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar

# sudo pacman -S xorg-server xorg-apps xorg-xinit
git clone https://github.com/alacritty/alacritty.git
cd alacritty
sudo pacman -S cmake freetype2 fontconfig pkg-config make libxcb libxkbcommon python
sudo pacman -S cargo
cargo build --release --no-default-features --features=wayland

yay -S --noconfirm hyprland
yay -S --noconfirm hyprpaper
yay -S --noconfirm waybar
yay -S --noconfirm wofi

cat > ~/.config/hypr/hyprland.conf << EOL
# This is an example Hyprland config file.
#
# Refer to the wiki for more information.

#
# Please note not all available settings / options are set here.
# For a full list, see the wiki
#

# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=,preferred,auto,1


# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
exec-once = waybar & hyprpaper

# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Set programs that you use
\$terminal = alacritty
\$fileManager = dolphin
\$menu = wofi --show drun

# Some default env vars.
env = XDG_CURRENT_DESKTOP,Hyprland
env = XDG_SESSION_TYPE,wayland
env = XDG_SESSION_DESKTOP,Hyprland
env = XCURSOR_SIZE,24 # Default
env = QT_QPA_PLATFORMTHEME,qt5ct # Default # change to qt6ct if you have that
env = QT_QPA_PLATFOR,wayland

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us, ru
    # kb_layout = us, ru, jp
    kb_variant =
    # kb_variant = lang
    kb_model =
    kb_options = grp:lswitch
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = false
    }

    numlock_by_default = true
    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5
    gaps_out = 20
    border_size = 2
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    layout = dwindle # dwindle or master

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false
    no_cursor_warps = false
    # no_border_on_floating = true
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 10

    blur {
        enabled = true
        size = 3
        passes = 1

        vibrancy = 0.1696
    }

    drop_shadow = true
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = true

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    # animation = name, on/off, speed, curve, style (not required)
    animation = windows,        1, 7,   myBezier
    animation = windowsOut,     1, 7,   default, popin 80%
    animation = border,         1, 10,  default
    animation = borderangle,    1, 8,   default
    animation = fade,           1, 7,   default
    animation = workspaces,     1, 6,   default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = true
}

misc {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    force_default_wallpaper = -1 # Set to 0 or 1 to disable the anime mascot wallpapers
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
device {
    name = epic-mouse-v1
    sensitivity = -0.5
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
\$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = \$mainMod, Q, exec, \$terminal
bind = \$mainMod, C, killactive,
bind = \$mainMod, M, exit,
bind = \$mainMod, E, exec, \$fileManager
bind = \$mainMod, V, togglefloating,
bind = \$mainMod, R, exec, \$menu
bind = \$mainMod, P, pseudo, # dwindle
bind = \$mainMod, J, togglesplit, # dwindle

# Move focus with mainMod + arrow keys
bind = \$mainMod, left, movefocus, l
bind = \$mainMod, right, movefocus, r
bind = \$mainMod, up, movefocus, u
bind = \$mainMod, down, movefocus, d

# Moving windows
bind = \$mainMod SHIFT, left, swapwindow, l
bind = \$mainMod SHIFT, right, swapwindow, r
bind = \$mainMod SHIFT, up, swapwindow, u
bind = \$mainMod SHIFT, down, swapwindow, d

# Moving windows                            X  Y
bind = \$mainMod CTRL, left,  resizeactive, -60 0
bind = \$mainMod CTRL, right, resizeactive,  60 0
bind = \$mainMod CTRL, up,    resizeactive,  0 -60
bind = \$mainMod CTRL, down,  resizeactive,  0  60

# Switch workspaces with mainMod + [0-9]
bind = \$mainMod, 1, workspace, 1
bind = \$mainMod, 2, workspace, 2
bind = \$mainMod, 3, workspace, 3
bind = \$mainMod, 4, workspace, 4
bind = \$mainMod, 5, workspace, 5
bind = \$mainMod, 6, workspace, 6
bind = \$mainMod, 7, workspace, 7
bind = \$mainMod, 8, workspace, 8
bind = \$mainMod, 9, workspace, 9
bind = \$mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = \$mainMod SHIFT, 1, movetoworkspacesilent, 1
bind = \$mainMod SHIFT, 2, movetoworkspacesilent, 2
bind = \$mainMod SHIFT, 3, movetoworkspacesilent, 3
bind = \$mainMod SHIFT, 4, movetoworkspacesilent, 4
bind = \$mainMod SHIFT, 5, movetoworkspacesilent, 5
bind = \$mainMod SHIFT, 6, movetoworkspacesilent, 6
bind = \$mainMod SHIFT, 7, movetoworkspacesilent, 7
bind = \$mainMod SHIFT, 8, movetoworkspacesilent, 8
bind = \$mainMod SHIFT, 9, movetoworkspacesilent, 9
bind = \$mainMod SHIFT, 0, movetoworkspacesilent, 10

# Example special workspace (scratchpad)
bind = \$mainMod, S, togglespecialworkspace, magic
bind = \$mainMod SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = \$mainMod, mouse_down, workspace, e+1
bind = \$mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = \$mainMod, mouse:272, movewindow
bindm = \$mainMod, mouse:273, resizewindow

# Waybar
bind = \$mainMod, B, exec, pkill -SIGUSR1 waybar
bind = \$mainMod, W, exec, pkill -SIGUSR2 waybar

# Wofi
bind = \$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy
EOL

cat << 'EOL' > ~/.config/waybar/config
{
    "layer": "top",
    "position": "top",
    "mod": "dock",
    "exclusive": true,
    "passthrough": false,
    "gtk-layer-shell": true,
    "height": 50,
    "modules-left": [
        "clock",
        "custom/weather",
        "custom/moon",
        "custom/wall",
        "hyprland/workspaces"
    ],
    "modules-center": [
        "hyprland/window"
    ],
    "modules-right": [
        "network",
        "bluetooth",
        "custom/temperature",
        "custom/memory",
        "battery",
        "backlight",
        "pulseaudio",
        "pulseaudio#microphone"
    ],
    "hyprland/workspaces": {
        "format": "{icon}",
        "on-scroll-up": "hyprctl dispatch workspace e+1",
        "on-scroll-down": "hyprctl dispatch workspace e-1",
        "format-icons": {
            "1": "😎",
            "2": "🌐",
            "3": "👩🏽‍💻",
            "4": "📒",
            "5": "🎵"
        },
        "persistent_workspaces": {
            "*": 1
        }
    },
    "hyprland/window": {
        "format": "{}"
    },
    "custom/weather": {
        "tooltip": true,
        "format": "{}",
        "interval": 3600,
        "exec": "~/.config/waybar/scripts/waybar-wttr.py",
        "return-type": "json"
    },
    "custom/moon": {
        "format": "{}",
        "interval": 3600,
        "exec": "moon"
    },

    "custom/wall":{
        "format": "{}",
        "interval":60,
        "exec":"r-wall & ",
        "format-alt":"r-wall &"
    },

    "custom/temperature": {
        "tooltip": true,
        "format": " {}",
        "interval": 30,
        "exec": "cpu"
    },
    "custom/memory": {
        "tooltip": true,
        "format": "🧠 {}",
        "interval": 30,
        "exec": "memory"
    },
    "tray": {
        "icon-size": 18,
        "spacing": 10
    },
    "clock": {
        "format": "{: %I:%M %p  %a, %b %e}",
        "tooltip-format": "<big>{:%Y %B}</big>\n<tt>{calendar}</tt>"
    },
    "backlight": {
        "device": "intel_backlight",
        "format": "{icon} {percent}%",
        "format-icons": [
            "󰃞",
            "󰃟",
            "󰃠"
        ],
        "on-scroll-up": "brightnessctl -q set 1%+",
        "on-scroll-down": "brightnessctl -q set 1%-"
    },
    "battery": {
        "states": {
            "good": 95,
            "warning": 40,
            "critical": 30
        },
        "format": "{icon} {capacity}%",
        "format-charging": " {capacity}%",
        "format-plugged": " {capacity}%",
        "format-alt": "{time} {icon}",
        "format-icons": [
            "󰂎",
            "󰁺",
            "󰁻",
            "󰁼",
            "󰁽",
            "󰁾",
            "󰁿",
            "󰂀",
            "󰂁",
            "󰂂",
            "󰁹"
        ]
    },
    "pulseaudio": {
        "format": "{icon} {volume}%",
        "tooltip": false,
        "format-muted": " Muted",
        "on-click": "pamixer -t",
        "on-scroll-up": "pamixer -i 5",
        "on-scroll-down": "pamixer -d 5",
        "scroll-step": 100,
        "format-icons": {
            "headphone": "",
            "hands-free": "",
            "headset": "",
            "phone": "",
            "portable": "",
            "car": "",
            "default": [
                "",
                "",
                ""
            ]
        }
    },
    "pulseaudio#microphone": {
        "format": "{format_source}",
        "format-source": " {volume}%",
        "format-source-muted": " Muted",
        "on-click": "pamixer --default-source -t",
        "on-scroll-up": "pamixer --default-source -i 5",
        "on-scroll-down": "pamixer --default-source -d 5",
        "scroll-step": 5
    },
    "network": {
        "format-wifi": "  {signalStrength}%",
        "format-ethernet": "{ipaddr}/{cidr}",
        "tooltip-format": "{essid} - {ifname} via {gwaddr}",
        "format-linked": "{ifname} (No IP)",
        "format-disconnected": "Disconnected ⚠",
        "format-alt": "{ifname}:{essid} {ipaddr}/{cidr}"
    },
    "bluetooth": {
        "format": " {status}",
        "format-disabled": "", // an empty format will hide the module
        "format-connected": " {num_connections}",
        "tooltip-format": "{device_alias}",
        "tooltip-format-connected": " {device_enumerate}",
        "tooltip-format-enumerate-connected": "{device_alias}"
    }
}
EOL

cat << 'EOL' >  ~/.config/waybar/style.css
* {
    border: none;
    border-radius: 0;
    font-family: "JetBrains Mono";
    font-weight: bold;
    font-size: 16px;
    min-height: 0;
}

window#waybar {
    background: rgba(21, 18, 27, 0);
    color: #cdd6f4;
}

tooltip {
    background: #1e1e2e;
    border-radius: 10px;
    border-width: 2px;
    border-style: solid;
    border-color: #11111b;
}

#workspaces button {
    padding: 5px;
    color: #636777;
    margin-right: 5px;
}

#workspaces button.active {
    background-color: #000;
}

#workspaces button.focused {
    color: #a6adc8;
    background: #eba0ac;
    border-radius: 10px;
}

#workspaces button.urgent {
    color: #11111b;
    background: #a6e3a1;
    border-radius: 10px;
}

#workspaces button:hover {
    background: #11111b;
    color: #11111b;
    border-radius: 5px;
}

#custom-power_profile,
#custom-weather,
#custom-moon,
#custom-wallpaper,
#window,
#clock,
#battery,
#pulseaudio,
#network,
#bluetooth,
#custom-temperature,
#custom-memory,
#workspaces,
#tray,
#backlight {
    background: #1e1e2e;
    opacity: 0.8;
    padding: 0px 10px;
    /* margin: 3px 0px; */
    margin: 0px 0px;
    margin-top: 10px;
    border: 1px solid #181825;
}

#custom-memory {
    color: #eba0ac;
}

#custom-temperature {
    border-radius: 10px 0px 0px 10px;
}

#custom-temperature.critical {
    color: #f00;
}

#backlight {
    border-radius: 10px 0px 0px 10px;
}

#tray {
    border-radius: 10px;
    margin-right: 10px;
}

#workspaces {
    background: #1e1e2e;
    border-radius: 10px;
    margin-left: 10px;
    padding-right: 0px;
    padding-left: 5px;
}

#custom-power_profile {
    color: #a6e3a1;
    border-left: 0px;
    border-right: 0px;
}

#window {
    border-radius: 10px;
    margin-left: 60px;
    margin-right: 60px;
}

#clock {
    color: #fab387;
    border-radius: 10px 0px 0px 10px;
    margin-left: 10px;
    border-right: 0px;
}

#network {
    color: #f9e2af;
    border-radius: 10px 0px 0px 10px;
    border-left: 0px;
    border-right: 0px;
}

#bluetooth {
    color: #89b4fa;
    border-radius: 0px 10px 10px 0px;
    margin-right: 10px
} 

#pulseaudio {
    color: #89b4fa;
    border-left: 0px;
    border-right: 0px;
}

#pulseaudio.microphone {
    color: #cba6f7;
    border-left: 0px;
    border-right: 0px;
    border-radius: 0px 10px 10px 0px;
    margin-right: 10px;
}

#battery {
    color: #a6e3a1;
    border-radius: 0 10px 10px 0;
    margin-right: 10px;
    border-left: 0px;
}
#battery.warning {
    color: #FFA500;
}
#battery.critical {
    color: #F00;
} 
#custom-moon {
    border-radius: 0px 10px 10px 0px;
    border-right: 0px;
    margin-left: 0px;
}
EOL



sudo reboot

# micro nano ~/.bash_profile
# exec Hyprland

$SHELL



























