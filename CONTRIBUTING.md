# Contributing to Memory Core

Thank you for your interest in contributing to Memory Core! This document provides guidelines for contributing.

## Code of Conduct

Be respectful and constructive in all interactions.

## How to Contribute

### Reporting Issues

If you find a bug or have a suggestion:

1. Check if the issue already exists
2. Create a new issue with:
   - Clear title
   - Detailed description
   - Steps to reproduce (for bugs)
   - Expected vs actual behavior

### Submitting Changes

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Make your changes
4. Run tests: `./scripts/run-tests.sh`
5. Commit with clear messages
6. Push to your fork
7. Create a Pull Request

### Commit Message Format

```
<type>: <subject>

<body>

<footer>
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `test`: Test changes
- `refactor`: Code refactoring
- `chore`: Maintenance tasks

Example:
```
feat: add import from Notion script

Add script to import memories from Notion workspace.
Supports pages and databases.

Closes #123
```

## Development Setup

```bash
# Clone your fork
git clone https://github.com/yourusername/memory-core-template.git
cd memory-core-template

# Run tests
./scripts/run-tests.sh

# Verify structure
./scripts/verify-memory-structure.sh
```

## Testing

All changes should include tests:

- Unit tests for scripts
- Integration tests for workflows
- Documentation updates

Run the full test suite before submitting:

```bash
./scripts/run-tests.sh
```

## Documentation

- Update README.md if adding features
- Update SCRIPTS.md if adding scripts
- Update CHANGELOG.md for all changes
- Keep examples up to date

## Style Guide

### Markdown
- Use ATX-style headers (`#` not `===`)
- Use fenced code blocks with language
- Use `-` for unordered lists
- Use `1.` for ordered lists

### Scripts
- Use `#!/bin/bash` shebang
- Include usage comments
- Use `set -e` for error handling
- Quote variables

### File Naming
- Use kebab-case: `my-file.md`
- Use dates: `2026-04-03.md`
- Be descriptive: `fix-api-timeout.md`

## Release Process

1. Update CHANGELOG.md
2. Update version in README.md
3. Create a git tag: `git tag -a v1.1.0 -m "Release v1.1.0"`
4. Push tag: `git push origin v1.1.0`
5. Create GitHub Release

## Questions?

Feel free to open an issue for discussion.

Thank you for contributing!