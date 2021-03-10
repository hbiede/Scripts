#!/bin/sh
# Adapted from tibr by Hundter Biede
# https://github.com/tibr/dotfiles/blob/master/osx/set-defaults.sh
# 
# Originally inspired by zach holman
#   https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
# and mathias bynens
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# Version 1.3.13

# Ask for the administrator password upfront
sudo -vB

#######
## Dock
#######

echo \a
echo "Wipe all (default) app icons from the Dock? (y/n)"
read -r response
if [[ $response =~ ^([yY]([eE][sS])?)$ ]]; then
  defaults write com.apple.dock persistent-apps -array;
fi

# Set the icon size of Dock items to 50 pixels
defaults write com.apple.dock tilesize -int 50

# Lock the Dock size
defaults write com.apple.dock size-immutable -bool true

# Dock orientation: 'left', 'bottom', 'right'
defaults write com.apple.dock orientation left

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true
defaults write com.apple.dashboard enabled-state -int 1
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Set Menu Bar
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -bool false
defaults write com.apple.TextInputMenuAgent "NSStatusItem Visible Item-0" -bool false
defaults write com.apple.TextInputMenu "visible" -bool false
defaults write com.apple.systemuiserver menuExtras -array \
    "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
    "/System/Library/CoreServices/Menu Extras/Battery.menu" \
    "/System/Library/CoreServices/Menu Extras/Clock.menu"

# Show Percent Battery in menu bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Flash the time separators
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

# Analog menu bar clock
defaults write com.apple.menuextra.clock IsAnalog -bool false

killall Dock>/dev/null
###########
## End Dock
###########



###################
## Install Programs
###################

# Install Homebrew, fish, wget, nano, and LaTeX if not installed
if ! hash brew 2>/dev/null; then
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)";
fi
if ! hash fish 2>/dev/null; then
  brew install fish;
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/fish;
fi
if ! hash wget 2>/dev/null; then
  brew install wget;
fi
if ! hash nano 2>/dev/null; then
  brew install nano;
fi
if ! hash pdflatex 2>/dev/null; then
  brew cask install basictex;
  tlmgr init-usertree
  sudo tlmgr update --self;
  sudo tlmgr update --all;
  sudo tlmgr install minted;
  sudo tlmgr install pygmentex;
  sudo easy_install Pygments;
  sudo tlmgr install biblatex;
fi

# update important utils
brew install cmake;
brew install ffmpeg;
brew install golang;
brew install grep;
brew install hub;
brew install jq;
brew install php;
brew install python;
brew install tree;
brew install youtube-dl;
#######################
## End Install Programs
#######################



###############
## Install Apps
###############

brew install alfred
brew install bbedit
brew install caffeine
brew install clion
brew install discord
brew install goland
brew install google-chrome
brew install intellij-idea
brew install omnifocus
brew install pycharm
brew install quicklook-json
brew install rubymine
brew install sourcetree
brew install spectacle
brew install spotify
brew install the-unarchiver
brew install vlc

brew tap homebrew/cask-fonts
brew install font-jetbrains-mono
###################
## End Install Apps
###################



###############
## Default Apps
###############

brew install duti
echo "Setting file default open-ers"

duti -s com.apple.Finder ftp
duti -s com.barebones.bbedit .sh all
duti -s com.barebones.bbedit .plist all
duti -s com.barebones.bbedit .m all
duti -s com.barebones.bbedit .h all
duti -s com.barebones.bbedit .cpp all
duti -s com.barebones.bbedit .c all
duti -s com.barebones.bbedit .java all
duti -s com.barebones.bbedit .php all
duti -s com.barebones.bbedit .swift all
duti -s com.barebones.bbedit .html all
duti -s com.barebones.bbedit .htm all
duti -s com.barebones.bbedit .css all
duti -s com.barebones.bbedit .js all
duti -s com.barebones.bbedit .jsx all
duti -s com.barebones.bbedit .ts all
duti -s com.barebones.bbedit .tsx all
duti -s com.barebones.bbedit .wkt all
duti -s com.barebones.bbedit .csv all
duti -s com.barebones.bbedit .dat all
duti -s com.barebones.bbedit .xml all
duti -s com.barebones.bbedit .json all
duti -s com.barebones.bbedit .py all
duti -s com.barebones.bbedit .tex all
duti -s com.barebones.bbedit .lua all
duti -s com.barebones.bbedit .vhdl all
duti -s com.barebones.bbedit .yaml all
duti -s com.barebones.bbedit .json all
duti -s com.barebones.bbedit .md all
duti -s com.barebones.bbedit .mf all
duti -s com.barebones.bbedit .py all
duti -s com.barebones.bbedit .txt all
duti -s com.barebones.bbedit .tex all
duti -s com.barebones.bbedit .rb all
duti -s com.barebones.bbedit .go all
duti -s com.barebones.bbedit .html all
duti -s com.apple.Preview .cr2 all
duti -s org.videolan.vlc .mp4 all
duti -s org.videolan.vlc .mov all
duti -s org.videolan.vlc .mp3 all
duti -s org.videolan.vlc .m4a all
duti -s org.videolan.vlc .avi all

brew uninstall duti

# Cleanup
brew cleanup > /dev/null
####################
## End File Defaults
####################



#########
## System
#########

# Prevent System Prefs from breaking anything
killall "System Preferences"

# Green text highlighting
defaults write com.apple.finder AppleOtherHighlightColor "0.184314 0.863235 0.321939"
defaults write com.apple.systempreferences AppleOtherHighlightColor "0.184314 0.863235 0.321939"
defaults write NSGlobalDomain AppleHighlightColor "0.184314 0.863235 0.321939 Other"
defaults -currentHost write NSGlobalDomain AppleHighlightColor "0.184314 0.863235 0.321939 Other"

# Set the menu back content
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
                   "/System/Library/CoreServices/Menu Extras/Battery.menu" \
                   "/System/Library/CoreServices/Menu Extras/Clock.menu" \
                   "/System/Library/CoreServices/Menu Extras/Volume.menu";

# Dark Mode w/ Red accents
defaults write NSGlobalDomain AppleInterfaceStyle Dark
defaults write NSGlobalDomain AppleAccentColor -int 0

# Set Key Repeats Appropriately
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# Turn off shake mouse cursor to locate
defaults write ~/Library/Preferences/.GlobalPreferences.plist CGDisableCursorLocationMagnification -bool true

# Don't set date and time automatically
sudo systemsetup -setusingnetworktime off>/dev/null

# Don't set time zone automatically using current location
sudo defaults write /Library/Preferences/com.apple.timezone.auto.plist Active -bool false

# Download newly available App Store updates in the background
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true

# Expand Save/Print Dialog Boxes by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Trackpad: enable tap to click for this user and for the login screen
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: Set gestures (Man, there are a lot of gesture settings to be fiddled. I am not certain what the defaults are, but I'm setting basically everything in case defaults change)
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -int 1
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadHorizScroll -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadCornerSecondaryClick -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRotate -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 2
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerDoubleTapGesture -int 1
defaults write com.apple.AppleMultitouchTrackpad TrackpadTwoFingerFromRightEdgeSwipeGesture -int 0
defaults write com.apple.AppleMultitouchMouse MouseButtonMode -string "TwoButton"
defaults write com.apple.AppleMultitouchMouse MouseHorizontalScroll -bool true
defaults write com.apple.AppleMultitouchMouse MouseMomentumScroll -bool true
defaults write com.apple.AppleMultitouchMouse MouseOneFingerDoubleTapGesture -int 1
defaults write com.apple.AppleMultitouchMouse MouseTwoFingerDoubleTapGesture -int 3
defaults write com.apple.AppleMultitouchMouse MouseTwoFingerHorizSwipeGesture -int 2
defaults write com.apple.AppleMultitouchMouse MouseVerticalScroll -bool true

defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Paste and Match Style" -string "@v"
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false
defaults write NSGlobalDomain AppleShowScrollBars WhenScrolling
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool true
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSPersonNameDefaultDisplayNameOrder -int 1
defaults write NSGlobalDomain com.apple.mouse.scaling -real 1
defaults write NSGlobalDomain com.apple.sound.beep.flash -int 0
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool false
defaults write NSGlobalDomain com.apple.trackpad.scaling 0.9
defaults write NSGlobalDomain ContextMenuGesture -int 1
defaults write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults write NSGlobalDomain com.apple.trackpad.fiveFingerPinchSwipeGesture -int 2
defaults write NSGlobalDomain com.apple.trackpad.fourFingerHorizSwipeGesture -int 2
defaults write NSGlobalDomain com.apple.trackpad.fourFingerPinchSwipeGesture -int 2
defaults write NSGlobalDomain com.apple.trackpad.fourFingerVertSwipeGesture -int 2
defaults write NSGlobalDomain com.apple.trackpad.momentumScroll -bool true
defaults write NSGlobalDomain com.apple.trackpad.pinchGesture -bool true
defaults write NSGlobalDomain com.apple.trackpad.rotateGesture -bool true
defaults write NSGlobalDomain com.apple.trackpad.scrollBehavior -int 2
defaults write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 2
defaults write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -bool false
defaults write NSGlobalDomain com.apple.trackpad.threeFingerTapGesture -int 0
defaults write NSGlobalDomain com.apple.trackpad.threeFingerVertSwipeGesture -int 2
defaults write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 0
defaults write NSGlobalDomain com.apple.trackpad.twoFingerDoubleTapGesture -int 0
defaults write NSGlobalDomain com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture -int 0

defaults -currentHost write NSGlobalDomain NSUserKeyEquivalents -dict-add "Paste and Match Style" -string "@v"
defaults -currentHost write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false
defaults -currentHost write NSGlobalDomain AppleShowScrollBars WhenScrolling
defaults -currentHost write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool true
defaults -currentHost write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults -currentHost write NSGlobalDomain NSPersonNameDefaultDisplayNameOrder -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.scaling -real 1
defaults -currentHost write NSGlobalDomain com.apple.sound.beep.flash -int 0
defaults -currentHost write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults -currentHost write NSGlobalDomain com.apple.trackpad.forceClick -bool false
defaults -currentHost write NSGlobalDomain com.apple.trackpad.scaling 0.9
defaults -currentHost write NSGlobalDomain ContextMenuGesture -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fiveFingerPinchSwipeGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fourFingerHorizSwipeGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fourFingerPinchSwipeGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fourFingerVertSwipeGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.momentumScroll -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.pinchGesture -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.rotateGesture -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.scrollBehavior -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -bool false
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerTapGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerVertSwipeGesture -int 2
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.twoFingerDoubleTapGesture -int 0
defaults -currentHost write NSGlobalDomain com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture -int 0

# Double clicking menu bar doesn't do anything
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "None"

# Allow Handoff between this Mac and your iCloud devices
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true

# Disable Siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool false

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Set the time zone
sudo systemsetup -settimezone "America/Chicago" > /dev/null

# Restart automatically on power loss
sudo pmset -a autorestart 1
	
# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Prevent Photos from opening automatically when a device is plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Hide Ruler in TextEdit
defaults write com.apple.TextEdit ShowRuler -bool false

# Display HTML files as HTML code instead of formatted text in TextEdit
defaults write com.apple.TextEdit IgnoreHTML -bool true

# Don't automatically sync connected devices
defaults write com.apple.itunes dontAutomaticallySyncIPods -bool true

# Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Don't prompt to start time machine on connection to new Hard Drives
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Install Terminal fonts system wide
cp /System/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/*.otf ~/Library/Fonts/
#############
## End System
#############

#######
## Fish
#######

# Alias Commands
mkdir ~/.config/fish/functions
touch ~/.config/fish/functions/show.fish
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true; killall Finder; echo 'Hidden Files Shown'"
echo "# Defined in - @ line 0
function show --description alias\ show=defaults\ write\ com.apple.finder\ AppleShowAllFiles\ -bool\ true\;\ killall\ Finder\;\ echo\ \'Hidden\ Files\ Shown\'
	defaults write com.apple.finder AppleShowAllFiles -bool true; killall Finder; echo 'Hidden Files Shown';
end
" > ~/.config/fish/functions/show.fish
touch ~/.config/fish/functions/hide.fish
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false; killall Finder; echo 'Hidden Files Hidden'"
echo "# Defined in - @ line 0
function hide --description alias\ hide=defaults\ write\ com.apple.finder\ AppleShowAllFiles\ -bool\ false\;\ killall\ Finder\;\ echo\ \'Hidden\ Files\ Hidden\'
	defaults write com.apple.finder AppleShowAllFiles -bool false; killall Finder; echo 'Hidden Files Hidden';
end
" > ~/.config/fish/functions/hide.fish
touch ~/.config/fish/functions/updater.fish
alias updater='brew doctor; brew update; brew upgrade; brew cask doctor; brew upgrade --cask; brew cleanup; sudo softwareupdate -i -a'
echo "# Defined in - @ line 0
function updater --description 'brew doctor; brew update; brew upgrade; brew cleanup; sudo softwareupdate -i -a'
	brew doctor; brew update; brew upgrade; brew cleanup; sudo softwareupdate -i -a
end
" > ~/.config/fish/functions/updater.fish
echo "# Defined in - @ line 0
function fish_greeting
	echo 'POWAH!!!'
end
" > ~/.config/fish/functions/fish_greeting.fish
set fish_greeting
echo 'set -g fish_user_paths "/usr/local/sbin" $fish_user_paths' >> ~/.config/fish/config.fish
###########
## End Fish
###########


#########
## BBEdit
#########

# Set the color scheme of BBEdit
defaults write com.barebones.bbedit SelectedColorSchemeNameDarkMode -string "Xcode Dark"

# Use spaces for tabs in BBEdit
defaults write com.barebones.bbedit EditorAutoExpandTabs -int 1

# Set the BBEdit font to SF Mono
defaults write com.barebones.bbedit BBEditorFont -data "62706c6973743030d40102030405062627582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a907080d1718191a1b2255246e756c6cd2090a0b0c5624636c6173735f101a4e53466f6e7444657363726970746f724174747269627574657380088002d30e0f09101316574e532e6b6579735a4e532e6f626a65637473a2111280038004a214158005800680075f10134e53466f6e7453697a654174747269627574655f10134e53466f6e744e616d654174747269627574652340280000000000005f10154a6574427261696e734d6f6e6f2d526567756c6172d21c1d1e1f5a24636c6173736e616d655824636c61737365735f10134e534d757461626c6544696374696f6e617279a31e20215c4e5344696374696f6e617279584e534f626a656374d21c1d23245f10104e53466f6e7444657363726970746f72a225215f10104e53466f6e7444657363726970746f725f100f4e534b657965644172636869766572d1282954726f6f74800100080011001a0023002d0032003700410047004c0053007000720074007b0083008e0091009300950098009a009c009e00b400ca00d300eb00f000fb0104011a011e012b01340139014c014f016201740177017c0000000000000201000000000000002a0000000000000000000000000000017e"
defaults write com.barebones.bbedit BBPrintingFont -data "62706c6973743030d40102030405062627582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a907080d1718191a1b2255246e756c6cd2090a0b0c5624636c6173735f101a4e53466f6e7444657363726970746f724174747269627574657380088002d30e0f09101316574e532e6b6579735a4e532e6f626a65637473a2111280038004a214158005800680075f10134e53466f6e7453697a654174747269627574655f10134e53466f6e744e616d654174747269627574652340280000000000005f10154a6574427261696e734d6f6e6f2d526567756c6172d21c1d1e1f5a24636c6173736e616d655824636c61737365735f10134e534d757461626c6544696374696f6e617279a31e20215c4e5344696374696f6e617279584e534f626a656374d21c1d23245f10104e53466f6e7444657363726970746f72a225215f10104e53466f6e7444657363726970746f725f100f4e534b657965644172636869766572d1282954726f6f74800100080011001a0023002d0032003700410047004c0053007000720074007b0083008e0091009300950098009a009c009e00b400ca00d300eb00f000fb0104011a011e012b01340139014c014f016201740177017c0000000000000201000000000000002a0000000000000000000000000000017e"

mkdir ~/Library/Application\ Support/BBEdit/Language\ Modules/

# C# language module
curl http://luminaryapps.com/code/CSharpLanguageModule.plist > ~/Library/Application\ Support/BBEdit/Language\ Modules/CSharpLanguageModule.plist

# Highlight matches of selected text
defaults write com.barebones.bbedit UseLineHeightHighlightingForInstancesOfSelectedText -int 1

# Pressing the tab key indents all selected text
defaults write com.barebones.bbedit AllowTabToIndentText -int 1
#############
## End BBEdit
#############



#########
## Finder
#########

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredSearchViewStyle -string "Nlsv"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope SCcf

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show the home folder instead of all files when opening a new finder window
defaults write com.apple.finder NewWindowTarget PfHm

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Enable snap-to-grid for icons on the desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Set grid spacing for icons on the desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 80" ~/Library/Preferences/com.apple.finder.plist

# Set the size of icons on the desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist

# Disable iCloud as default save location
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

killall Finder
#############
## End Finder
#############



###########
## Calendar
###########

# Start week on:
# 0: Sunday
# 6: Saturday
defaults write com.apple.iCal "first day of week" -int 0

# Scroll in week view by:
# 0: Day
# 1: Week
# 2: Week, Stop on Today
defaults write com.apple.iCal "scroll by weeks in week view" -int 1

# Show Calendar Sidebar
defaults write com.apple.iCal CalendarSidebarShown -bool true

# Day starts at (in minutes):
defaults write com.apple.iCal "first minute of work hours" -int 480

# Day ends at (in minutes):
defaults write com.apple.iCal "last minute of work hours" -int 1200

# Turn on timezone support
defaults write com.apple.iCal "TimeZone support enabled" -bool true

# Show events in year view
defaults write com.apple.iCal "Show heat map in Year View" -bool true

# Ask before sending changes to events
defaults write com.apple.iCal WarnBeforeSendingInvitations -bool true

# Set display length for Calendar
defaults write com.apple.iCal "number of hours displayed" -int 16

killall Calendar>/dev/null
###############
## End Calendar
###############



#########
## Safari
#########

# Set up Safari for development
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true

# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Disable Java
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

killall Safari>/dev/null
#############
## End Safari
#############



###########
## Contacts
###########

# Enable the debug menu in Address Book
defaults write com.apple.AddressBook ABShowDebugMenu -bool true

# Sort Order for Contacts
defaults write com.apple.AddressBook ABNameSortingFormat -string "sortingLastName sortingFirstName"

# Show full names in Contacts
defaults write com.apple.AddressBook ABShortNameStyle -int 0

# Export notes in vCards
defaults write com.apple.AddressBook ABIncludeNotesInVCard -bool true

# Export photos in vCards
defaults write com.apple.AddressBook ABIncludePhotosInVCard -bool true

# Show first name:
# 1: Before last name
# 2: Following last name
defaults write NSGlobalDomain NSPersonNameDefaultDisplayNameOrder -int 1

# Don't prefer nicknames
defaults write NSGlobalDomain NSPersonNameDefaultShouldPreferNicknamesPreference -bool false

killall Contacts>/dev/null
###############
## End Contacts
###############


###########
## Terminal
###########

# Set default display settings of Terminal 
plutil -replace Window\ Settings.Pro.rowCount -integer 32 ~/Library/Preferences/com.apple.Terminal.plist
plutil -replace Window\ Settings.Pro.columnCount -integer 118 ~/Library/Preferences/com.apple.Terminal.plist
defaults write com.apple.Terminal Startup\ Window\ Settings -string "Pro"
###############
## End Terminal
###############


############
## Touch Bar
############

defaults write com.apple.controlstrip FullCustomized -array \
    "com.apple.system.mission-control" \
    "NSTouchBarItemIdentifierFlexibleSpace" \
    "com.apple.system.group.brightness" \
    "com.apple.system.group.keyboard-brightness" \
    "com.apple.system.group.media" \
    "com.apple.system.group.volume"

defaults write com.apple.controlstrip MiniCustomized -array \
    "com.apple.system.brightness" \
    "com.apple.system.mute" \
    "com.apple.system.volume" \
    "com.apple.system.mission-control"
    

killall ControlStrip
################
## End Touch Bar
################

## git

echo "[user]
	name = hbiede
	email = 6586509+hbiede@users.noreply.github.com
[core]
	excludesfile = ~/.gitignore_global
	autocrlf = input
	editor = nano
	ignoreCase = true
[branch]
	autosetuprebase = always
" > ~/.gitconfig

echo "# Backup files
*~

# Binaries for programs and plugins
*.class
*.exe
*.dll
*.so
*.dylib
__pycache__/
./**/__pycache__/
**/bin
**/out/
**/target/
**/build/

# Log file
*.log

# BlueJ files
*.ctxt

# Mobile Tools for Java (J2ME)
.mtj.tmp/

# Package Files #
*.jar
*.war
*.nar
*.ear
*.zip
*.tar.gz
*.rar

# virtual machine crash logs, see http://www.java.com/en/download/help/error_hotspot.xml
hs_err_pid*

# IntelliJ
**/.idea/
*.iml

# Eclipse
.classpath
.project

# Mac file system metadata
.DS_Store
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns
.com.apple.timemachine.donotpresent
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk

# LaTeX
*.aux
*.toc
*.bbl
*.blg
*.out
*.run.xml
*.lof
*.lot
*.fls
*.fmt
*.fot
*.cb
*.cb2
.*.lb
.pdf # If empty string is given to generator

## LaTeX - Beamer
*.nav
*.pre
*.snm
*.vrb

## LaTeX - Glossaries
*.acn
*.acr
*.glg
*.glo
*.gls
*.glsdefs
*.glstex

## LaTeX - Minted
**/_minted-*/
*.pyg

# Ruby
*.gem
*.rbc

# CMake
cmake-build-*/

# C Object files
*.o
*.ko
*.obj
*.elf

# Jupyter
.ipynb_checkpoints
**/.ipynb_checkpoints/*
**/profile_default/
ipython_config.py

# iOS App packaging
*.ipa

# XCode User settings
**/xcuserdata/

# Fastlane - Automated XCode screenshot tool
**/fastlane/report.xml
**/fastlane/Preview.html
**/fastlane/screenshots/**/*.png
**/fastlane/test_output

# PuTTY Private key
*.ppk

# SSH
**/.ssh/id_*
**/.ssh/*_id_*
**/.ssh/known_hosts

# Node
**/node_modules/*" > ~/.gitignore_global
git config --global init.defaultBranch main

## setup dev environments
mkdir -p ~/Desktop/Code/Personal\ Projects
cd ~/Desktop/Code/Personal\ Projects/
git clone git@github.com:hbiede/Lazy-Clock.git
git clone git@github.com:hbiede/Layer-Saver-Script.git
git clone git@github.com:hbiede/portfolio.git
cd ~/Documents/
git clone git@github.com:hbiede/Contacts.git
git clone git@github.com:hbiede/Scripts.git
## end dev setup

## fun gits
cd ~/Music/
git clone git@github.com:hbiede/Local-Music.git
cd ~/Library/Application\ Support/
git clone git@github.com:hbiede/factorio.git
## end fun gits

echo -e "\nRebooting to Finalize Changes"
sleep 5
sudo reboot
