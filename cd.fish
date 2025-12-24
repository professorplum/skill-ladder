#!/usr/bin/env fish
# cd.fish - Wrapper for cd that checks for project tips

function cd
    # Call builtin cd
    builtin cd $argv
    
    # Check if we entered a project
    check-project-tip
end

