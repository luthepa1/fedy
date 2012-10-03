# Name: Install Wine with Gecko
# Command: install_wine
# Value: False

install_wine() {
show_func "Installing Wine"
if [[ -d /usr/lib/wine ]]; then
	show_status "Wine already installed"
else
	add_repo "rpmfusion-free.repo"
	add_repo "rpmfusion-nonfree.repo"
	install_pkg wine
fi
	show_func "Installing Wine Gecko"
if [[ -f /usr/share/wine/gecko/wine_gecko* ]]; then
	show_status "Wine Gecko already installed"
else
	if [[ "$arch" = "32" ]]; then
		file="wine_gecko-1.7-x86.msi"
		get="http://downloads.sourceforge.net/wine/wine_gecko-1.7-x86.msi"
		get_file
		mkdir -p /usr/share/wine/gecko
		cp "$file" /usr/share/wine/gecko/
	elif [[ "$arch" = "64" ]]; then
		file="wine_gecko-1.7-x86_64.msi"
		get="http://downloads.sourceforge.net/wine/wine_gecko-1.7-x86_64.msi"
		get_file
		mkdir -p /usr/share/wine/gecko
		cp "$file" /usr/share/wine/gecko/
	fi
fi
[[ -d /usr/lib/wine && -f /usr/share/wine/gecko/wine_gecko* ]]; exit_state
}