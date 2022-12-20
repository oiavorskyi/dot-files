echo
echo 'Customizing OS X configuration'

# hide the dock
defaults write com.apple.dock autohide -bool true
# delay dock appearance to have better experience with BetterSnapTool
defaults write com.apple.dock workspaces-edge-delay -float 2.0

# restart the dock to put settings in effect
killall Dock

# enable HiDPI mode for external monitors (see https://www.alphr.com/hidpi-mode-os-x/)
defaults write /Library/Preferences/com.apple.windowserver.plist DisplayResolutionEnabled -bool true

# fast key repeat rate, requires reboot to take effect
defaults write ~/Library/Preferences/.GlobalPreferences KeyRepeat -int 1
defaults write ~/Library/Preferences/.GlobalPreferences InitialKeyRepeat -int 15

# disable press and hold key popup behavior in dev apps
defaults write com.jetbrains.intellij ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

# set finder to display full path in title bar
defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true

# stop Photos from opening automatically
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
#to revert use defaults -currentHost delete com.apple.ImageCapture disableHotPlug
