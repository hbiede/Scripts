#!/bin/sh
# Adapted from tibr by Hundter Biede
# https://github.com/tibr/dotfiles/blob/master/osx/set-defaults.sh
# 
# Originally inspired by zach holman
#   https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
# and mathias bynens
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
# Version 1.3.5

# Ask for the administrator password upfront
sudo -v

# Prevent System Prefs from breaking anything
killall "System Preferences"

# Show the ~/Library folder.
chflags nohidden ~/Library

# Green text highlighting
defaults write com.apple.finder AppleOtherHighlightColor "0.184314 0.863235 0.321939"
defaults write com.apple.systempreferences AppleOtherHighlightColor "0.184314 0.863235 0.321939"
defaults write NSGlobalDomain AppleHighlightColor "0.184314 0.863235 0.321939 Other"
defaults -currentHost write NSGlobalDomain AppleHighlightColor "0.184314 0.863235 0.321939 Other"

# Dark Mode w/ Red accents
defaults write NSGlobalDomain AppleInterfaceStyle Dark
defaults write NSGlobalDomain AppleAccentColor -int 0

# Set Key Repeats Appropriately
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# Install Homebrew, ffmpeg, youtube-dl, fish, wget, nano, and LaTeX if not installed
if ! hash brew 2>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
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
  sudo tlmgr install babel;
  sudo tlmgr install minted;
  sudo tlmgr install wrapfig;
  sudo tlmgr install letltxmacro;
  sudo tlmgr install fvextra;
  sudo tlmgr install xstring;
  sudo tlmgr install framed;
  sudo tlmgr install pygmentex;
  sudo easy_install Pygments;
  sudo tlmgr install biblatex;
fi

# update important utils
brew install grep;
brew install php;
brew install python;
brew install ffmpeg;
brew install youtube-dl;


###############
## Install Apps
###############

brew cask install bbedit
brew cask install alfred
brew cask install discord
brew cask install omnifocus
brew cask install google-chrome
brew cask install spotify
brew cask install quicklook-json
brew cask install sourcetree
brew cask install caffeine
brew cask install spectacle
brew cask install intellij-idea
brew cask install clion
brew cask install qbittorrent
brew cask install vlc
brew cask install the-unarchiver
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
alias updater='brew doctor; brew update; brew upgrade; brew cask doctor; brew cask upgrade; brew cleanup; sudo softwareupdate -i -a'
echo "# Defined in - @ line 0
function updater --description 'brew doctor; brew update; brew upgrade; brew cask doctor; brew cask upgrade; brew cleanup; sudo softwareupdate -i -a'
	brew doctor; brew update; brew upgrade; brew cask doctor; brew cask upgrade; brew cleanup; sudo softwareupdate -i -a
end
" > ~/.config/fish/functions/updater.fish
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
defaults write com.barebones.bbedit BBEditorFont -data "62706c6973743030d4010203040506070a582476657273696f6e592461726368697665725424746f7058246f626a6563747312000186a05f100f4e534b657965644172636869766572d1080954726f6f748001a90b0c111b1c1d1e1f2655246e756c6cd20d0e0f105624636c6173735f101a5549466f6e7444657363726970746f724174747269627574657380088002d312130d14171a574e532e6b6579735a4e532e6f626a65637473a2151680038004a218198005800680075f10134e53466f6e7453697a654174747269627574655f10134e53466f6e744e616d654174747269627574652340280000000000005e53464d6f6e6f2d526567756c6172d2202122235a24636c6173736e616d655824636c61737365735f10134e534d757461626c6544696374696f6e617279a32224255c4e5344696374696f6e617279584e534f626a656374d2202127285f10105549466f6e7444657363726970746f72a3292a255f10105549466f6e7444657363726970746f725f10104e53466f6e7444657363726970746f7200080011001a00240029003200370049004c00510053005d00630068006f008c008e00900097009f00aa00ad00af00b100b400b600b800ba00d000e600ef00fe0103010e0117012d0131013e0147014c015f016301760000000000000201000000000000002b00000000000000000000000000000189"
defaults write com.barebones.bbedit BBPrintingFont -data "62706c6973743030d4010203040506070a582476657273696f6e592461726368697665725424746f7058246f626a6563747312000186a05f100f4e534b657965644172636869766572d1080954726f6f748001a90b0c111b1c1d1e1f2655246e756c6cd20d0e0f105624636c6173735f101a5549466f6e7444657363726970746f724174747269627574657380088002d312130d14171a574e532e6b6579735a4e532e6f626a65637473a2151680038004a218198005800680075f10134e53466f6e7453697a654174747269627574655f10134e53466f6e744e616d654174747269627574652340280000000000005e53464d6f6e6f2d526567756c6172d2202122235a24636c6173736e616d655824636c61737365735f10134e534d757461626c6544696374696f6e617279a32224255c4e5344696374696f6e617279584e534f626a656374d2202127285f10105549466f6e7444657363726970746f72a3292a255f10105549466f6e7444657363726970746f725f10104e53466f6e7444657363726970746f7200080011001a00240029003200370049004c00510053005d00630068006f008c008e00900097009f00aa00ad00af00b100b400b600b800ba00d000e600ef00fe0103010e0117012d0131013e0147014c015f016301760000000000000201000000000000002b00000000000000000000000000000189"
#############
## End BBEdit
#############



#########
## Finder
#########

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



#######
## Dock
#######

echo \a
echo "Wipe all (default) app icons from the Dock? (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
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

# Set desktop image to El Cap
mkdir -p ~/Library/Application\ Support/DesktopImageDownload/
curl http://512pixels.net/downloads/macos-wallpapers/10-11.jpg > ~/Library/Application\ Support/DesktopImageDownload/el_cap.jpg
if test -f ~/Library/Application\ Support/DesktopImageDownload/el_cap.jpg; then
    sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '~/Library/Application Support/DesktopImageDownload/el_cap.jpg'";
fi

killall Dock
###########
## End Dock
###########



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
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool

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
defaults write com.apple.Terminal Startup\ Window\ Settings -string Pro
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
    "com.apple.system.mission-control" \
    "com.apple.system.brightness" \
    "com.apple.system.mute" \
    "com.apple.system.volume"
    

killall ControlStrip
################
## End Touch Bar
################

# git
echo "[user]
	name = hbiede
	email = 6586509+hbiede@users.noreply.github.com
[core]
	excludesfile = /Users/hbiede/.gitignore_global
[difftool "sourcetree"]
	cmd = opendiff \"$LOCAL\" \"$REMOTE\"
	path = 
[mergetool "sourcetree"]
	cmd = /Applications/Sourcetree.app/Contents/Resources/opendiff-w.sh \"$LOCAL\" \"$REMOTE\" -ancestor \"$BASE\" -merge \"$MERGED\"
	trustExitCode = true
[commit]
	template = /Users/hbiede/.stCommitMsg
" > ~/.gitconfig

echo "*~
.DS_Store
./**/.idea
.idea/
./**/_minted-*/
.project
.classpath" > ~/.gitignore_global

# Update All
updater

## setup dev environments
mkdir -p ~/Desktop/Code/Personal\ Projects
cd ~/Desktop/Code/Personal\ Projects/
git clone https://github.com/hbiede/Lazy-Clock.git
git clone https://github.com/hbiede/KSMO-MapRaid-Script.git
git clone https://github.com/hbiede/ContactOutput.git
cd ~/Documents/
git clone https://github.com/hbiede/Contacts.git
git clone https://github.com/hbiede/Scripts.git
cd ~/Music/
git clone https://github.com/hbiede/Local-Music.git
### end dev setup

echo ""
echo "Rebooting to Finalize Changes"
sleep 5
sudo reboot
