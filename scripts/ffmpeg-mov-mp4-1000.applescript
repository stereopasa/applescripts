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
        set base_name to do shell script "basename " & quoted form of file_path
        set ext to text -4 thru end of base_name
        set base_name to text 1 thru -5 of base_name

        try
            if kind of (info for this_item) is not "folder" then
                set dest_file to destination_directory & "/" & base_name & "_1000.mp4"
                do shell script "/usr/local/bin/ffmpeg -i " & quoted form of file_path & " -vf scale=1000:-2 " & quoted form of dest_file
            else
                -- display dialog "is folder: " & file_path
            end if
            
        on error errStr number errorNumber
            display dialog "Error: " & errStr
            return number
        end try

    end repeat

end adding folder items to