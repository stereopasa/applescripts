on adding folder items to this_folder after receiving these_items

    tell application "Finder"
        if not (exists folder "converted" of this_folder) then
            make new folder at this_folder with properties {name:"converted"}
        end if

        set the destination_folder to folder "converted" of this_folder as alias
        set the destination_directory to POSIX path of the destination_folder
    end tell

    repeat with i from 1 to number of items in these_items

        set this_item to item i of these_items
        set the file_path to the POSIX path of this_item
        -- set the directory_path to the POSIX path of this_folder

        try
            -- do shell script "/bin/bash -l -c 'svgo \"" & file_path & "\"'"
            -- do shell script "/bin/bash -l -c 'npx @squoosh/cli --oxipng '{\"level\":2,\"interlace\":false}' *.png"
            -- do shell script "/bin/bash -l -c 'echo '{\"level\":2,\"interlace\":false}'"
            -- display dialog "/bin/bash -l -c 'echo '{\"level\":2,\"interlace\":false}' " & file_path & "'"
            -- set theCommand to "/bin/bash -c 'npx @squoosh/cli --oxipng '{\"level\":2,\"interlace\":false}' \"" & file_path & "\"'"
            -- set theCommand to "/usr/local/bin/squoosh-cli --oxipng '{\"level\":2,\"interlace\":false}' \"" & file_path & "\""

            set nodePath to "/usr/local/bin/node "
            set squooshPath to "/usr/local/bin/squoosh-cli "
            set params to "--oxipng '{\"level\":2,\"interlace\":false}' \"" & file_path & "\" -d \"" & destination_directory & "\""

            -- display dialog destination_directory
            -- display dialog directory_path & nodePath & squooshPath & params
            do shell script nodePath & squooshPath & params

            set theCommand to "/bin/bash -c '/usr/local/bin/node /usr/local/bin/squoosh-cli --oxipng '{\"level\":2,\"interlace\":false}' \"" & file_path & "\" -s _opt'"
            -- display dialog theCommand
            -- do shell script theCommand
            -- display dialog "OK"
        on error errStr number errorNumber
            display dialog "Error: " & errStr
            return number
        end try

    end repeat

end adding folder items to