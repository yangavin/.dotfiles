#!/bin/bash

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

echo "🍎 Configuring macOS defaults..."
echo

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Boot Sound                                                                  #
###############################################################################

print_status "Disabling boot sound..."
sudo nvram SystemAudioVolume=" "
print_success "Boot sound disabled"

###############################################################################
# Menu Bar                                                                    #
###############################################################################

print_status "Showing battery percentage in menu bar..."
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
print_success "Battery percentage enabled in menu bar"

###############################################################################
# Trackpad                                                                    #
###############################################################################

print_status "Enabling tap to click on trackpad..."
# Enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
print_success "Tap to click enabled"

print_status "Enabling two-finger swipe for page navigation..."
# Enable two-finger swipe between pages
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
# Also enable it specifically for Safari and other browsers
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackForwardNavigationGesturesEnabled -bool true
print_success "Two-finger swipe navigation enabled"

###############################################################################
# Spotlight                                                                  #
###############################################################################

print_status "Disabling Spotlight indexing and shortcuts..."
# Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

# Change indexing order and disable some search results
defaults write com.apple.spotlight orderedItems -array \
    '{"enabled" = 0;"name" = "APPLICATIONS";}' \
    '{"enabled" = 0;"name" = "SYSTEM_PREFS";}' \
    '{"enabled" = 0;"name" = "DIRECTORIES";}' \
    '{"enabled" = 0;"name" = "PDF";}' \
    '{"enabled" = 0;"name" = "FONTS";}' \
    '{"enabled" = 0;"name" = "DOCUMENTS";}' \
    '{"enabled" = 0;"name" = "MESSAGES";}' \
    '{"enabled" = 0;"name" = "CONTACT";}' \
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

# Disable Spotlight keyboard shortcuts (Cmd+Space)
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:64:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist 2>/dev/null || true
/usr/libexec/PlistBuddy -c "Set :AppleSymbolicHotKeys:65:enabled false" ~/Library/Preferences/com.apple.symbolichotkeys.plist 2>/dev/null || true

# Load new settings before rebuilding the index
killall mds > /dev/null 2>&1 || true
# Make sure indexing is enabled for the main volume
sudo mdutil -i on / > /dev/null
# Rebuild the index from scratch
sudo mdutil -E / > /dev/null

print_success "Spotlight disabled and shortcuts removed"

###############################################################################
# Keyboard                                                                   #
###############################################################################

print_status "Disabling accented characters popup when holding keys..."
# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
print_success "Accented characters popup disabled"

print_status "Setting key repeat rate to maximum speed..."
# Set a blazingly fast keyboard repeat rate
# InitialKeyRepeat: 120, 94, 68, 35, 25, 15 (15 is fastest)
# KeyRepeat: 120, 90, 60, 30, 12, 6, 2 (2 is fastest)
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 2
print_success "Key repeat rate set to maximum speed"

###############################################################################
# Additional Useful Settings                                                 #
###############################################################################

print_status "Applying additional useful macOS settings..."

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show path bar in Finder
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

print_success "Additional settings applied"

###############################################################################
# Restart affected applications                                              #
###############################################################################

print_status "Restarting affected applications..."

for app in "Activity Monitor" \
    "Address Book" \
    "Calendar" \
    "cfprefsd" \
    "Contacts" \
    "Dock" \
    "Finder" \
    "Google Chrome" \
    "Mail" \
    "Messages" \
    "Opera" \
    "Photos" \
    "Safari" \
    "SizeUp" \
    "Spectacle" \
    "SystemUIServer" \
    "Terminal" \
    "Transmission" \
    "Tweetbot" \
    "Twitter" \
    "iCal"; do
    killall "${app}" &> /dev/null || true
done

print_success "Applications restarted"

echo
print_success "🎉 macOS configuration completed!"
echo
print_status "Changes applied:"
echo "  ✓ Boot sound disabled"
echo "  ✓ Battery percentage shown in menu bar"
echo "  ✓ Tap to click enabled on trackpad"
echo "  ✓ Trackpad speed set to maximum"
echo "  ✓ Two-finger swipe navigation enabled"
echo "  ✓ Spotlight disabled and shortcuts removed"
echo "  ✓ Accented characters popup disabled"
echo "  ✓ Key repeat rate set to maximum speed"
echo "  ✓ Additional useful settings applied"
echo
print_warning "Some changes may require a logout/restart to take full effect."
print_warning "You may need to manually disable Spotlight in System Preferences > Spotlight > Search Results"
echo
print_status "Enjoy your optimized macOS experience! 🚀" 