{config, lib, pkgs, ... }:
{
	xdg.configFile."sway/config".text = ''
	set $mod Mod4
	
	exec swayosd-server &
	
	input * xkb_options caps:swapescape
	bindsym $mod+c kill

	bindsym $mod+Shift+1 move container to workspace 1
	bindsym $mod+Shift+2 move container to workspace 2
	bindsym $mod+Shift+3 move container to workspace 3
	bindsym $mod+Shift+4 move container to workspace 4
	bindsym $mod+Shift+5 move container to workspace 5
	bindsym $mod+Shift+6 move container to workspace 6
	bindsym $mod+Shift+7 move container to workspace 7
	bindsym $mod+Shift+8 move container to workspace 8
	bindsym $mod+Shift+9 move container to workspace 9
	bindsym $mod+Shift+0 move container to workspace 10
	bindsym $mod+n exec swaync -c

	bindsym Mod1+Tab workspace next

	bindsym $mod+1 workspace 1
	bindsym $mod+2 workspace 2
	bindsym $mod+3 workspace 3
	bindsym $mod+4 workspace 4
	bindsym $mod+5 workspace 5
	bindsym $mod+6 workspace 6
	bindsym $mod+7 workspace 7
	bindsym $mod+8 workspace 8
	bindsym $mod+9 workspace 9
	bindsym $mod+0 workspace 10
	
	bindsym $mod+Space exec rofi -show drun
	bindsym $mod+S exec grim -g "$(slurp)" ~/Pictures/screenshot.png 

	exec waybar 
	exec swaync 
	exec swaybg -i ~/'moyai ' 
	for_window [all] titlebar off
	default_border pixel 1  
	hide_edge_borders smart  
	client.focused 	#8CAAEE #E78284 #E5C890 #C6A0F6
	client.unfocused #384E77 #0D0630 #384E77 #8BBEB2
	client.urgent  #8CAAEE #E78284 #E5C890 #C6A0F6
	client.placeholder #8CAAEE #E78284 #E5C890 #C6A0F6
	gaps outer 10 
	gaps inner 10 
	corner_radius 8 
	'';
}
