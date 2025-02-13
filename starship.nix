{config, lib, pkgs, ... }:
{ 
	xdg.configFile."starship/starship.toml".text = ''	
	"$schema" = 'https://starship.rs/config-schema.json'

	right_format = """$all"""
	add_newline = false
	format = """$directory$git_branch$git_status$character"""

	[character]
	success_symbol = '[❯](bold green)'
	vimcmd_symbol = '[V](bold blue)'
	
	[package]
	format = "$symbol"

	[lua]
	format = "via [](bold yellow) "
	
	[c]
	format = "[$name]($style) "

	[rust]
	format = "via [󱘗](bold red) "

			
	''; 	
} 
