# mac-dock-lock
AppleScript code to help lock your Mac's Dock to your main screen. This is a common issue with multiple monitors, as the Dock can sometimes appear on secondary screens or move unexpectedly.

## How to Use This Script

1. Open "Script Editor" on your Mac (you can find it in Applications > Utilities or search for it using Spotlight)
2. Copy and paste the code above into a new Script Editor document
3. Save the file with a name like "LockDockToMainScreen.scpt"
4. Run the script by clicking the "Play" button in Script Editor

The script works by:
1. Determining your current Dock position and orientation settings
2. Continuously monitoring these settings
3. Resetting the Dock to your main screen whenever it detects movement

## Customization Options

If you want to set a specific position for your Dock instead of using your current settings:
* Replace `originalPosition` with either "bottom", "left", or "right"
* Replace `originalOrientation` with either "start", "middle", or "end"

For example, to always keep the Dock at the bottom center of your main screen:

```applescript
property originalPosition : "bottom"
property originalOrientation : "middle"
