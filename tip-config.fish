#!/usr/bin/env fish
# tip-config.fish - Manage tip categories
# Usage: tip-config --enable <categories...>
#        tip-config --disable <categories...>
#        tip-config --status
#        tip-config --list

function tip-config
    # Use config in home directory if it exists, otherwise use repo default
    set enabled_file ~/.config/skill-ladder/enabled-categories.txt
    if not test -f $enabled_file
        # Create config directory and copy default
        mkdir -p ~/.config/skill-ladder
        if test -f (dirname (status -f))/enabled-categories.txt
            cp (dirname (status -f))/enabled-categories.txt $enabled_file
        else
            # Create default if it doesn't exist
            echo "terminal-beginner" > $enabled_file
            echo "git-beginner" >> $enabled_file
        end
    end
    
    switch $argv[1]
        case --enable
            # Add categories to enabled list
            for category in $argv[2..-1]
                # Remove if exists (avoid duplicates)
                grep -v "^$category\$" $enabled_file > $enabled_file.tmp 2>/dev/null || true
                mv $enabled_file.tmp $enabled_file
                # Add category
                echo $category >> $enabled_file
                echo "✓ Enabled: $category"
            end
            
        case --disable
            # Remove categories from enabled list
            for category in $argv[2..-1]
                grep -v "^$category\$" $enabled_file > $enabled_file.tmp 2>/dev/null || true
                mv $enabled_file.tmp $enabled_file
                echo "✗ Disabled: $category"
            end
            
        case --status
            echo
            set_color cyan
            echo "Enabled Categories:"
            set_color normal
            if test -f $enabled_file
                cat $enabled_file | sed 's/^/  • /'
            else
                echo "  (none - all categories enabled by default)"
            end
            echo
            
        case --list
            echo
            set_color cyan
            echo "Available Categories:"
            set_color normal
            echo "  Core Tools:"
            echo "    • terminal-beginner     - Basic terminal tools"
            echo "    • terminal-intermediate - Advanced terminal techniques"
            echo "    • git-beginner          - Essential git commands"
            echo "    • git-intermediate      - Advanced git workflows"
            echo
            echo "  Languages:"
            echo "    • java-beginner         - Java language basics"
            echo "    • java-intermediate     - Advanced Java features"
            echo "    • javascript-beginner   - JavaScript fundamentals"
            echo "    • javascript-intermediate - Modern JS features"
            echo "    • html-beginner         - HTML structure and semantics"
            echo "    • html-intermediate     - Advanced HTML techniques"
            echo "    • css-beginner          - CSS basics and layout"
            echo "    • css-intermediate      - Advanced CSS and responsive design"
            echo "    • csharp-beginner       - C# language essentials"
            echo "    • csharp-intermediate   - Advanced C# features"
            echo "    • python-beginner       - Python fundamentals"
            echo "    • python-intermediate   - Advanced Python patterns"
            echo
            echo "  Frameworks:"
            echo "    • react-beginner        - React basics and hooks"
            echo "    • react-intermediate    - Advanced React patterns"
            echo "    • spring-beginner       - Spring Boot fundamentals"
            echo "    • spring-intermediate   - Advanced Spring features"
            echo
            echo "  Cloud & Tools:"
            echo "    • azure-beginner        - Azure basics and CLI"
            echo "    • azure-intermediate    - Advanced Azure services"
            echo "    • docker-beginner       - Docker fundamentals"
            echo "    • docker-intermediate   - Advanced Docker techniques"
            echo
            set_color cyan
            echo "Context-Aware (Always Active):"
            set_color normal
            echo "  • Project detection (auto-detects Spring/React/Python/etc.)"
            echo "  • Git hooks (post-commit, post-checkout, post-merge)"
            echo
            set_color yellow
            echo "Tip: Enable/disable beginner vs intermediate independently:"
            set_color normal
            echo "  tip-config --enable java-beginner spring-beginner"
            echo "  tip-config --enable java-intermediate  # Later as you advance"
            echo
            
        case '*'
            echo "Usage:"
            echo "  tip-config --enable <categories...>   Enable tip categories"
            echo "  tip-config --disable <categories...>  Disable tip categories"
            echo "  tip-config --status                   Show enabled categories"
            echo "  tip-config --list                     List all available categories"
            echo
            echo "Example:"

