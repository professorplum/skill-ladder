#!/usr/bin/env fish
# check-project-tip.fish - Detect project type and show relevant tip
# Uses Fish event system to trigger on directory changes

function check-project-tip
    # Check for various project indicators
    
    # Spring Boot / Java
    if test -f pom.xml; or test -f build.gradle; or test -f gradlew
        show-tip spring/beginner --context
        return
    end
    
    # React / JavaScript / Node.js
    if test -f package.json
        show-tip react/beginner --context
        return
    end
    
    # Python
    if test -f requirements.txt; or test -f setup.py; or test -f pyproject.toml
        show-tip python/beginner --context
        return
    end
    
    # C# / .NET
    if count *.csproj >/dev/null 2>&1; or count *.sln >/dev/null 2>&1
        show-tip csharp/beginner --context
        return
    end
    
    # Docker
    if test -f Dockerfile; or test -f docker-compose.yml; or test -f docker-compose.yaml
        show-tip docker/beginner --context
        return
    end
end

# Auto-trigger on directory change
function __skill_ladder_check_project --on-variable PWD
    check-project-tip
end

