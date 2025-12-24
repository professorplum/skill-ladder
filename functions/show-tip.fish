#!/usr/bin/env fish
# show-tip.fish - Core tip display logic
# Usage: show-tip <category/level> [--context]
# Example: show-tip terminal/beginner
# Example: show-tip git/commit --context

function show-tip
    set tip_category $argv[1]
    set is_context false
    
    # Check if this is a context-aware tip (always shown)
    if contains -- --context $argv
        set is_context true
    end
    
    # For non-context tips, check if category is enabled
    if not $is_context
        # Extract category-level (e.g., "terminal-beginner" from "terminal/beginner")
        set category_level (string replace / - $tip_category)
        
        # Check if category-level is enabled
        if not category_enabled $category_level
            return
        end
    end
    
    # Build path to tips file
    # Note: This assumes tips are in ~/dotfiles/skill-ladder or current directory
    set tips_file (dirname (dirname (status -f)))/$tip_category.txt
    
    if not test -f $tips_file
        return
    end
    
    # Count tips in file
    set tip_count (count < $tips_file)
    
    if test $tip_count -eq 0
        return
    end
    
    # Use day of year for daily tip selection (same tip all day)
    set day_num (date +%j)
    set tip_index (math "($day_num % $tip_count) + 1")
    
    # Get the specific tip for today
    set tip (sed -n "$tip_index p" $tips_file)
    
    if test -z "$tip"
        return
    end
    
    # Display with appropriate label and color
    echo
    set_color cyan
    
    if string match -q "git/*" $tip_category
        echo "💡 Git Tip:"
    else if string match -q "react/*" $tip_category
        echo "💡 React Tip:"
    else if string match -q "spring/*" $tip_category
        echo "💡 Spring Tip:"
    else if string match -q "java/*" $tip_category
        echo "💡 Java Tip:"
    else if string match -q "javascript/*" $tip_category
        echo "💡 JavaScript Tip:"
    else if string match -q "python/*" $tip_category
        echo "💡 Python Tip:"
    else if string match -q "csharp/*" $tip_category
        echo "💡 C# Tip:"
    else if string match -q "html/*" $tip_category
        echo "💡 HTML Tip:"
    else if string match -q "css/*" $tip_category
        echo "💡 CSS Tip:"
    else if string match -q "azure/*" $tip_category
        echo "💡 Azure Tip:"
    else if string match -q "docker/*" $tip_category
        echo "💡 Docker Tip:"
    else
        echo "💡 Daily Dev Tip:"
    end
    
    set_color normal
    echo "   $tip"
    echo
end

function category_enabled
    set category $argv[1]
    # Look for config in ~/.config/skill-ladder or fall back to current directory
    set enabled_file ~/.config/skill-ladder/enabled-categories.txt
    if not test -f $enabled_file
        set enabled_file (dirname (dirname (status -f)))/enabled-categories.txt
    end
    
    # If no config file exists, all categories enabled by default
    if not test -f $enabled_file
        return 0
    end
    
    # Check if category is in enabled list
    if grep -q "^$category\$" $enabled_file
        return 0
    else
        return 1
    end
end

