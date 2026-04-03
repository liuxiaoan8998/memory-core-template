# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- TBD

## [1.0.0] - 2026-04-03

### Added
- Initial release of Memory Core template
- Complete documentation (README, SETUP, ARCHITECTURE, USAGE, TEST, SCRIPTS)
- File templates for lessons, decisions, projects, daily logs, reflections
- Comprehensive test suite with automated verification
- Script toolkit:
  - heartbeat.sh - Hourly maintenance
  - nightly-reflection.sh - Daily reflection prep
  - memlog.sh - Log recording
  - verify-memory-structure.sh - Structure validation
  - run-tests.sh - Test suite
  - export-to-markdown.sh - Backup/export
  - import-from-obsidian.sh - Migration from Obsidian
- CI/CD configuration with GitHub Actions
- MIT License

### Features
- Layered memory architecture (core/daily/categorized)
- Automated capture (heartbeat, nightly reflection)
- Smart retrieval (context-aware, proactive push)
- Health monitoring (activity metrics)
- Upgrade compatibility guide for existing agents

### Validation
- 7-day real-world testing (2026-03-27 to 2026-04-03)
- 24 memory files generated
- 11 lessons extracted
- 7 deep reflections completed
- 0 system failures

[Unreleased]: https://github.com/liuxiaoan8998/memory-core-template/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/liuxiaoan8998/memory-core-template/releases/tag/v1.0.0