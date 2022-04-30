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

        try
            set nodePath to "/usr/local/bin/node "
            set squooshPath to "/usr/local/bin/squoosh-cli "
            set params to "--quant '{\"enabled\":true,\"zx\":0,\"maxNumColors\":256,\"dither\":1}' --oxipng '{\"level\":2,\"interlace\":false}' \"" & file_path & "\" -d \"" & destination_directory & "\""

            do shell script nodePath & squooshPath & params
        on error errStr number errorNumber
            display dialog "Error: " & errStr
            return number
        end try

    end repeat

end adding folder items to

-- npx @squoosh/cli --quant '{"enabled":true,"zx":0,"maxNumColors":256,"dither":1}' --oxipng '{"level":2,"interlace":false}'
