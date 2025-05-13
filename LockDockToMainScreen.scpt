-- Lock Dock to Main Screen
-- This script locks your Mac's Dock to the main display
-- It works by continuously checking and resetting the Dock position

-- Get the current Dock settings
property originalPosition : "bottom" -- Default position
property originalOrientation : "start" -- Default orientation

on run
    -- Store the current Dock position and orientation
    set originalPosition to getDockPosition()
    set originalOrientation to getDockOrientation()
    
    display dialog "Dock Locker will keep your Dock on the main screen." & return & return & "Current settings:" & return & "Position: " & originalPosition & return & "Orientation: " & originalOrientation buttons {"Cancel", "Start Locking"} default button "Start Locking"
    
    -- Begin the loop to keep the Dock in place
    my lockDock()
end run

-- Keep the Dock locked to the main screen
on lockDock()
    try
        repeat
            -- Check if Dock has moved from desired position/orientation
            if getDockPosition() is not originalPosition or getDockOrientation() is not originalOrientation then
                -- Reset to original position
                setDockPosition(originalPosition)
                setDockOrientation(originalOrientation)
                delay 0.1 -- Short delay after correction
            end if
            delay 1 -- Check every second
        end repeat
    on error errMsg
        display dialog "Error: " & errMsg buttons {"OK"} default button "OK"
    end try
end lockDock

-- Get the current Dock position (left, bottom, right)
on getDockPosition()
    return do shell script "defaults read com.apple.dock orientation 2>/dev/null || echo bottom"
end getDockPosition

-- Get the current Dock orientation (start, middle, end)
on getDockOrientation()
    return do shell script "defaults read com.apple.dock pinning 2>/dev/null || echo start"
end getDockOrientation

-- Set the Dock position
on setDockPosition(newPosition)
    do shell script "defaults write com.apple.dock orientation -string " & quoted form of newPosition
    do shell script "killall Dock"
end setDockPosition

-- Set the Dock orientation
on setDockOrientation(newOrientation)
    do shell script "defaults write com.apple.dock pinning -string " & quoted form of newOrientation
    do shell script "killall Dock"
end setDockOrientation
