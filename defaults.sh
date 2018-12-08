#!/bin/sh
# Adapted from tibr
# https://github.com/tibr/dotfiles/blob/master/osx/set-defaults.sh
# 
# Inspired by zach holman
#   https://github.com/holman/dotfiles/blob/master/osx/set-defaults.sh
# and mathias bynens
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos

# Prevent System Prefs from breaking anything
killall "System Preferences"

# Show the ~/Library folder.
chflags nohidden ~/Library

# Dark Mode w/ Red accents
defaults write NSGlobalDomain AppleInterfaceStyle Dark
defaults write NSGlobalDomain AppleAccentColor -int 0

# Install Homebrew, ffmpeg, youtube-dl, fish, wget, and nano if not installed
if ! hash brew 2>/dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
fi
if ! hash ffmpeg 2>/dev/null; then
  brew "ffmpeg", args: ["with-libvpx", "with-webp", "with-x265"];
fi
if ! hash youtube-dl 2>/dev/null; then
  brew install youtube-dl;
fi
if ! hash fish 2>/dev/null; then
  brew install fish;
fi
if ! hash wget 2>/dev/null; then
  brew install wget;
fi
if ! hash nano 2>/dev/null; then
  brew install nano;
fi

# Cleanup
brew cleanup>/dev/null && brew prune>/dev/null

# Turn off shake mouse cursor to locate
defaults write ~/Library/Preferences/.GlobalPreferences.plist CGDisableCursorLocationMagnification -bool true

# Don't set date and time automatically
sudo systemsetup -setusingnetworktime off>/dev/null

# Don't set time zome automatically using current location
sudo defaults write /Library/Preferences/com.apple.timezone.auto.plist Active -bool false

# Download newly available App Store updates in the background
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -bool true

# Expand Save/Print Dialog Boxes by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

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
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false
defaults write NSGlobalDomain AppleShowScrollBars WhenScrolling
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool true
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSPersonNameDefaultDisplayNameOrder -int 1
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
defaults -currentUser write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false
defaults -currentUser write NSGlobalDomain AppleShowScrollBars WhenScrolling
defaults -currentUser write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool true
defaults -currentUser write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults -currentUser write NSGlobalDomain NSPersonNameDefaultDisplayNameOrder -int 1
defaults -currentUser write NSGlobalDomain com.apple.sound.beep.flash -int 0
defaults -currentUser write NSGlobalDomain com.apple.swipescrolldirection -bool false
defaults -currentUser write NSGlobalDomain com.apple.trackpad.forceClick -bool false
defaults -currentUser write NSGlobalDomain com.apple.trackpad.scaling 0.9
defaults -currentUser write NSGlobalDomain ContextMenuGesture -int 1
defaults -currentUser write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults -currentUser write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults -currentUser write NSGlobalDomain com.apple.trackpad.fiveFingerPinchSwipeGesture -int 2
defaults -currentUser write NSGlobalDomain com.apple.trackpad.fourFingerHorizSwipeGesture -int 2
defaults -currentUser write NSGlobalDomain com.apple.trackpad.fourFingerPinchSwipeGesture -int 2
defaults -currentUser write NSGlobalDomain com.apple.trackpad.fourFingerVertSwipeGesture -int 2
defaults -currentUser write NSGlobalDomain com.apple.trackpad.momentumScroll -bool true
defaults -currentUser write NSGlobalDomain com.apple.trackpad.pinchGesture -bool true
defaults -currentUser write NSGlobalDomain com.apple.trackpad.rotateGesture -bool true
defaults -currentUser write NSGlobalDomain com.apple.trackpad.scrollBehavior -int 2
defaults -currentUser write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 2
defaults -currentUser write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -bool false
defaults -currentUser write NSGlobalDomain com.apple.trackpad.threeFingerTapGesture -int 0
defaults -currentUser write NSGlobalDomain com.apple.trackpad.threeFingerVertSwipeGesture -int 2
defaults -currentUser write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 0
defaults -currentUser write NSGlobalDomain com.apple.trackpad.twoFingerDoubleTapGesture -int 0
defaults -currentUser write NSGlobalDomain com.apple.trackpad.twoFingerFromRightEdgeSwipeGesture -int 0

# Double clicking menu bar doesn't do anything
defaults write NSGlobalDomain AppleActionOnDoubleClick -string "None"

# Allow Handoff between this Mac and your iCloud devices
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true

# Disable Keyboard backlighting
defaults write com.apple.BezelServices kDim -bool false

# Disable Siri
defaults write com.apple.assistant.support "Assistant Enabled" -bool false

# Limit Ad Tracking
defaults write com.apple.AdLib forceLimitAdTracking -bool true



## Finder

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredSearchViewStyle -string "Nlsv"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the home folder instead of all files when opening a new finder window
defaults write com.apple.finder NewWindowTarget PfHm

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

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
## End Finder


## Dock
# echo "Wipe all (default) app icons from the Dock? (y/n)"
# echo "(This is only really useful when setting up a new Mac, or if you don't use the Dock to launch apps.)"
# read -r response
# if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
#   defaults write com.apple.dock persistent-apps -array
# fi

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 50

# Lock the Dock size
defaults write com.apple.dock size-immutable -bool true

# Dock orientation: 'left', 'bottom', 'right'
defaults write com.apple.dock "orientation" -string "bottom"

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

# Don't show recent apps
defaults write com.apple.dock show-recents -bool false

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

killall Dock
## End Dock


## Calendar

# Start week on:
# 0: Sunday
# 6: Saturday
defaults write com.apple.iCal "first day of week" -int 0

# Scroll in week view by:
# 0: Day
# 1: Week
# 2: Week, Stop on Today
defaults write com.apple.iCal "scroll by weeks in week view" -int 1

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

## End Calendar


## Safari

# Show the full URL in the address bar (note: this still hides the scheme)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show Safari's bookmark bar.
defaults write com.apple.Safari ShowFavoritesBar -bool true

# Enable continuous spellchecking
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

# Disable auto-correct
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

# Warn about fraudulent websites
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

# Enable “Do Not Track”
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

# Disable Java
defaults write com.apple.Safari WebKitJavaEnabled -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaEnabled -bool false

# Block pop-up windows
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false

killall Safari>/dev/null
## End Safari


## Contacts

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

## End Contacts



# Change indexing order and disable some search results for Spotlight
# Yosemite-specific search results (remove them if you are using macOS 10.9 or older):
# 	MENU_DEFINITION
# 	MENU_CONVERSION
# 	MENU_EXPRESSION
# 	MENU_SPOTLIGHT_SUGGESTIONS (send search queries to Apple)
# 	MENU_WEBSEARCH             (send search queries to Apple)
# 	MENU_OTHER
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "FONTS";}' \
	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
	'{"enabled" = 1;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}'
	
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

# Alias Commands
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true; killall Finder; echo 'Hidden Files Shown'"
funcsave show
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false; killall Finder; echo 'Hidden Files Hidden'"
funcsave hide
alias updater='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup'
funcsave updater

# Update All
updater

echo ""
echo "Rebooting"
sudo reboot
