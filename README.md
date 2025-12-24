# Skill Ladder 💡

Action-oriented development tips for climbing the skill ladder. Learn by doing with 540+ practical, one-line tips.

## What This Is

A curated tips library designed for developers learning:
- **Core Tools:** Terminal, Git
- **Languages:** Java, JavaScript, HTML, CSS, C#, Python  
- **Frameworks:** React, Spring Boot
- **Cloud/Tools:** Azure, Docker

Every tip follows the format: **"Use/Try X to accomplish Y"**

## Quick Example
```fish
# Enable categories you want to learn
tip-config --enable java-beginner spring-beginner react-beginner

# Show a tip
show-tip java/beginner
# Output: Use var for local variables when type is obvious from right side assignment
```

## Features

✅ **Skill-Leveled:** Separate beginner and intermediate tips for each category  
✅ **Action-Oriented:** Every tip is immediately applicable  
✅ **Context-Aware:** Automatic tips based on project type and git actions  
✅ **Configurable:** Enable only what you're learning right now  
✅ **Daily Rotation:** Different tip each day for variety and reinforcement

## Categories

All categories have beginner and intermediate levels:

**Core Tools**
- `terminal-beginner` / `terminal-intermediate` - CLI tools and techniques
- `git-beginner` / `git-intermediate` - Version control workflows

**Languages** (Language features only, not frameworks)
- `java-beginner` / `java-intermediate` - Java language
- `javascript-beginner` / `javascript-intermediate` - JavaScript language
- `html-beginner` / `html-intermediate` - HTML markup
- `css-beginner` / `css-intermediate` - CSS styling
- `csharp-beginner` / `csharp-intermediate` - C# language
- `python-beginner` / `python-intermediate` - Python language

**Frameworks** (Framework-specific features, annotations, patterns)
- `react-beginner` / `react-intermediate` - React hooks and patterns
- `spring-beginner` / `spring-intermediate` - Spring Boot annotations and features

**Cloud & Tools**
- `azure-beginner` / `azure-intermediate` - Azure CLI and services
- `docker-beginner` / `docker-intermediate` - Docker containers

**Context-Aware** (Always active, triggered by actions)
- `git/commit.txt` - Shown after git commits
- `git/checkout.txt` - Shown after branch switches
- `git/merge.txt` - Shown after merges

## Installation

### As Part of Dotfiles (Recommended)

This library is designed to integrate with a dotfiles setup. The dotfiles repo will clone this automatically during installation.

### Standalone Installation

You can use this library independently:
```bash
# Clone the repository
git clone https://github.com/YOURUSERNAME/skill-ladder
cd skill-ladder

# Source the functions in fish shell
source functions/show-tip.fish
source functions/tip-config.fish

# Enable categories
tip-config --enable terminal-beginner git-beginner java-beginner

# Show a tip
show-tip terminal/beginner
```

### Fish Shell Integration

Add to your `~/.config/fish/config.fish`:
```fish
# Add skill-ladder functions to path
set -gx SKILL_LADDER_PATH ~/skill-ladder

# Source functions
source $SKILL_LADDER_PATH/functions/show-tip.fish
source $SKILL_LADDER_PATH/functions/tip-config.fish
source $SKILL_LADDER_PATH/functions/check-project-tip.fish

# Show daily tips at shell startup
if status is-interactive
    show-tip terminal/beginner
    check-project-tip
end
```

## Usage

### Managing Categories
```fish
# See all available categories
tip-config --list

# Check what's currently enabled
tip-config --status

# Enable categories
tip-config --enable java-beginner spring-beginner react-beginner

# Disable categories you've mastered
tip-config --disable java-beginner

# Common progression
tip-config --enable terminal-beginner git-beginner  # Week 1
tip-config --enable java-beginner spring-beginner   # Week 2
tip-config --enable java-intermediate              # Month 2
```

### Viewing Tips
```fish
# Show tip from specific category
show-tip terminal/beginner
show-tip java/intermediate
show-tip react/beginner

# Tips rotate daily - same tip all day for reinforcement
```

### Context-Aware Tips

Tips automatically appear based on your actions:
```fish
# Enter a Spring Boot project
cd ~/my-spring-api
# Automatically shows Spring tip

# Make a commit
git commit -m "Add feature"
# Automatically shows commit workflow tip

# Switch branches
git checkout develop
# Automatically shows branch management tip
```

## Project Structure
```
skill-ladder/
├── README.md
├── CONTRIBUTING.md
├── LICENSE
├── functions/
│   ├── show-tip.fish
│   ├── tip-config.fish
│   ├── check-project-tip.fish
│   └── cd.fish
├── enabled-categories.txt
├── terminal/
│   ├── beginner.txt
│   └── intermediate.txt
├── git/
│   ├── beginner.txt
│   ├── intermediate.txt
│   ├── commit.txt
│   ├── checkout.txt
│   └── merge.txt
└── ... (all other categories)
```

## Philosophy

**Action-Oriented**  
Every tip tells you to do something, not just explains a concept.

**Skill-Leveled**  
Beginner tips cover essentials. Intermediate tips cover advanced patterns. You choose your level.

**Context-Aware**  
Tips appear when relevant - in projects you're working on, after git actions you take.

**Progressive Disclosure**  
Start with basics, add categories as you learn, upgrade from beginner to intermediate over time.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding tips and creating new categories.

## License

MIT License - See [LICENSE](LICENSE) for details

## Questions?

- 🐛 **Found an inaccurate tip?** [Open an issue](https://github.com/YOURUSERNAME/skill-ladder/issues)
- 💡 **Have a great tip to add?** [Submit a PR](https://github.com/YOURUSERNAME/skill-ladder/pulls)

