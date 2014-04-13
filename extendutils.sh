#!

function line {
	echo "--------------------------------------------------------------------------------"
}
function title {
	clear
	echo "Mac Extended Utilities Tool"
	line
}
function listTools {
	echo "These tools are added:"
	echo "	- Add Printer Utility"
	echo "	- Bluetooth Setup Assistant"
	echo "	- Certificate Assistant"
	echo "	- Directory Utility"
	echo "	- Expansion Slot Utility"
	echo "	- Folder Actions Setup"
	echo "	- Install Command Line Developer Tools"
	echo "	- Network Diagnostics"
	echo "	- Network Utility"
	echo "	- RAID Utility"
	echo "	- Screen Sharing"
	echo "	- Setup Assitant"
	echo "	- System Image Utility"
	echo "	- Ticket Viewer"
	echo "	- Wireless Diagnostics"
	echo ""
	echo "Press any key to return to menu."
}
function describe {
	echo "This script creates symlinks with useful tools such as Screen Sharing from the"
	echo "CoreServices directory, and adds them to a folder called \"Extended utilities\""
	echo "in Applications."
	echo ""
	echo "	q: Quick install"
	echo "	r: Remove"
	echo "	l: List all tools"
	echo "	e: Exit"
	echo ""
}
function main {
	clear
	YN=""
	while [ "x$YN" != "xq" -a "x$YN" != "xQ" -a "x$YN" != "xr" -a "x$YN" != "xR" -a "x$YN" != "xl" -a "x$YN" != "xL" -a "x$YN" != "xe" -a "x$YN" != "xE" ]; do
		title
		describe
		echo -n "Enter selection: "
		read -n 1 YN
	done
	if [ "x$YN" = "xq" -o "x$YN" = "xQ" ]; then
		title
		install
		line
		exit 0
	fi
	if [ "x$YN" = "xr" -o "x$YN" = "xR" ]; then
		clear 
		title
		echo "Press r again to confirm removing. Any other key to return to menu. No other"
		echo "files will be removed."
		line
		echo ""
		read -n 1 CU
		if [ "x$CU" = "xr" ]; then	
			uninstall
			if [ -d /Applications/Extended\ Utilities ]; then
				title
				echo "The following files were in the extended utilities directory, and were not deleted:"
				ls -a /Applications/Extended\ Utilities/
				line
				echo "Uninstalled. Press any key."
				read -n 1 null
			else
				title
				echo "Uninstalled."
			fi
			line
			exit 0
		fi
		main
	fi
	if [ "x$YN" = "xl" -o "x$YN" = "xL" ]; then
		title
		listTools
		read -n 1 null
		main
	fi
	if [ "x$YN" = "xe" -o "x$YN" = "xE" ]; then
		title
		echo "Exited."
		line
		exit 0
	fi
}
function uninstall {
	rm -rf /Applications/Extended\ Utilities/AddPrinter.app
	rm -rf /Applications/Extended\ Utilities/Bluetooth\ Setup\ Assistant.app
	rm -rf /Applications/Extended\ Utilities/Certificate\ Assistant.app
	rm -rf /Applications/Extended\ Utilities/Directory\ Utility.app
	rm -rf /Applications/Extended\ Utilities/Expansion\ Slot\ Utility.app
	rm -rf /Applications/Extended\ Utilities/Folder\ Actions\ Setup.app
	rm -rf /Applications/Extended\ Utilities/Install\ Command\ Line\ Developer\ Tools.app
	rm -rf /Applications/Extended\ Utilities/Network\ Diagnostics.app
	rm -rf /Applications/Extended\ Utilities/Network\ Utility.app
	rm -rf /Applications/Extended\ Utilities/RAID\ Utility.app
	rm -rf /Applications/Extended\ Utilities/Screen\ Sharing.app
	rm -rf /Applications/Extended\ Utilities/Setup\ Assistant.app
	rm -rf /Applications/Extended\ Utilities/System\ Image\ Utility.app
	rm -rf /Applications/Extended\ Utilities/Ticket\ Viewer.app
	rm -rf /Applications/Extended\ Utilities/Wireless\ Diagnostics.app
	rm -f Applications/Extended\ Utilities/.DS_Store
	rm -d /Applications/Extended\ Utilities ## only if empty
}
function install {
	mkdir /Applications/Extended\ Utilities | /dev/null
	ln -sf /System/Library/CoreServices/Applications/*.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/Expansion\ Slot\ Utility.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/Folder\ Actions\ Setup.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/Install\ Command\ Line\ Developer\ Tools.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/Network\ Diagnostics.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/Screen\ Sharing.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/Setup\ Assistant.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/System\ Image\ Utility.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/Ticket\ Viewer.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/AddPrinter.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/Certificate\ Assistant.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/Bluetooth\ Setup\ Assistant.app /Applications/Extended\ Utilities/ |
	ln -sf /System/Library/CoreServices/Directory\ Utility.app /Applications/Extended\ Utilities/ |
	clear
	title
	open /Applications/Extended\ Utilities/
	echo "Tools have been installed."
	line
	exit 0
}


main


