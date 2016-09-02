#!/usr/bin/osascript

on run argv

-- set instances to text items of argv
-- set num_servers to count instances

set num_servers to item 1 of argv

set num_columns to (round (num_servers ^ 0.5) rounding up)

set right_arrow to ASCII character 29

set created_panels to 1

tell application "iTerm"
    activate

    set w to (create window with default profile)

    -- resize to full screen (zoom)
    tell application "System Events" to keystroke "=" using {command down, option down}

    tell w
        tell current tab of w

            -- create columns (split vertically until we n - 1 times)
            repeat num_columns - 1 times
                    tell application "System Events" to keystroke "d" using {command down}
                    set created_panels to created_panels + 1
            end repeat

            if created_panels is greater than 1
                set remaining to num_servers - created_panels
                repeat remaining times
                    tell application "System Events" to keystroke right_arrow using {option down, command down}
                    tell application "System Events" to keystroke "d" using {command down, shift down}
                end repeat
            end if

        end tell
    end tell
end tell

end run