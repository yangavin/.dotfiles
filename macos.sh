#! /bin/bash

# ===== DOCK CONFIGURATION =====
# Remove all apps from the dock
defaults write com.apple.dock persistent-apps -array

# Disable the dock show-recents (removes recently used apps from dock)
defaults write com.apple.dock show-recents -bool false

# Enable the dock autohide 
defaults write com.apple.dock autohide -bool true

# ===== TRACKPAD & MOUSE CONFIGURATION =====
# Set trackpad sensitivity to high (range: 0-3, higher = more sensitive)
defaults write -g com.apple.trackpad.scaling -float 2

# Set mouse sensitivity to high (range: 0-3, higher = more sensitive)
defaults write -g com.apple.mouse.scaling -float 2.0

# Enable tap to click on trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true &&
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 &&
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# ===== KEYBOARD CONFIGURATION =====
# Set keyboard repeat rate to fastest
defaults write -g KeyRepeat -int 2
# Set initial key repeat delay to shortest
defaults write -g InitialKeyRepeat -int 15

# Disable accent characters popup when holding keys (enables key repeat for all keys)
defaults write -g ApplePressAndHoldEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# ===== SYSTEM CONFIGURATION =====
# Disable startup sound
sudo nvram StartupMute=%01

# Show battery percentage in menu bar
defaults -currentHost write com.apple.controlcenter BatteryShowPercentage -int 1
# Show bluetooth
defaults write com.apple.controlcenter "Bluetooth" -int 18

# Set Finder default view to column view
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# ===== COMPLETION MESSAGE =====
echo "macOS configuration complete!"
echo "⚠️  IMPORTANT: Please restart your computer for all changes to take effect."
echo "Some settings may not work properly until after a full restart."
