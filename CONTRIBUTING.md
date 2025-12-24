# Contributing to Skill Ladder

Thank you for contributing! This guide will help you add high-quality tips.

## Tip Quality Standards

### Format Requirements

✅ **Good Tips:**
```
Use var for local variables when type is obvious from right side assignment
Try Stream.parallel() for parallel processing of large collections
Use @Transactional(readOnly = true) for read-only database operations
```

❌ **Bad Tips:**
```
var is useful for variables  (Not action-oriented)
You can use parallel streams  (Vague, no clear action)
Streams are a Java feature that lets you process collections  (Explanation, not action)
```

### Rules

1. **Action verbs only:** Start with "Use", "Try", "Run", "Create", "Add", etc.
2. **One line:** No multi-line tips. Keep it concise.
3. **Practical:** Include examples when possible
4. **Accurate:** Test the tip before submitting
5. **Appropriate level:**
   - Beginner: Essential concepts used daily
   - Intermediate: Advanced patterns, optimizations, lesser-known features

### Category Guidelines

**Languages (Java, JavaScript, etc.):**
- Language features only
- No framework-specific code
- Focus on syntax, stdlib, patterns

**Frameworks (React, Spring):**
- Framework-specific features
- Annotations, hooks, lifecycle
- Framework patterns and conventions

## How to Contribute

### Adding Tips to Existing Categories

1. **Fork the repository**
2. **Create a branch:**
```bash
   git checkout -b add-java-tips
```
3. **Add tips to appropriate file:**
```bash
   # For beginner Java tips
   echo "Use record types (Java 14+) for immutable data classes: record Person(String name, int age) {}" >> java/beginner.txt
```
4. **Test the tip:**
   - Verify syntax is correct
   - Ensure it works as described
   - Check it's not a duplicate
5. **Commit with clear message:**
```bash
   git commit -m "feat(java): Add record types tip for beginners"
```
6. **Push and create PR:**
```bash
   git push origin add-java-tips
   gh pr create --title "Add Java record types tip" --body "Adds beginner tip about using record types for immutable data classes"
```

### Creating New Categories

If you want to add a new language or tool:

1. **Check if it fits the scope:**
   - Is it commonly used in full-stack development?
   - Does it have 20+ tips worth of content?
   - Will it benefit the target audience?

2. **Create issue first:**
```bash
   gh issue create --title "Add Kotlin category" --body "Kotlin is widely used in Android and backend development. I'd like to add beginner and intermediate tips."
```

3. **After approval, create directory:**
```bash
   mkdir -p kotlin
   touch kotlin/beginner.txt kotlin/intermediate.txt
```

4. **Add 20 tips per level** (minimum)

5. **Update documentation:**
   - Add to README.md category list
   - Add to functions/tip-config.fish --list output
   - Optionally add project detection to functions/check-project-tip.fish

6. **Submit PR with all changes**

## Testing Your Tips

Before submitting, test in a real environment:
```bash
# Source the functions
source functions/show-tip.fish

# Test your new tip displays correctly
show-tip java/beginner

# Verify formatting looks good
# Check for typos
# Ensure accuracy
```

## Commit Message Format

Use conventional commits:
```
feat(category): Add tip about X
fix(category): Correct inaccurate tip about Y
docs: Update README with new category
refactor: Reorganize tips for clarity
```

**Examples:**
```
feat(java): Add Stream API tips for beginners
fix(react): Correct useEffect dependency array tip
docs: Add CONTRIBUTING guide
feat(kotlin): Add new Kotlin category with 40 tips
```

## Code of Conduct

- Be respectful and inclusive
- Provide constructive feedback
- Focus on teaching, not showing off
- Remember: tips are for learners at all levels

## Questions?

Open an issue or start a discussion. We're here to help!

