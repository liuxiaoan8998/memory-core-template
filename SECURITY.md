# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 1.0.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

If you discover a security vulnerability, please:

1. **DO NOT** open a public issue
2. Email the maintainer directly (if known)
3. Or open a private security advisory on GitHub

## Security Considerations

### Sensitive Data

Memory Core stores conversation history and personal information. Please be aware:

- **Never commit** sensitive tokens, passwords, or keys
- **Review** daily logs before sharing
- **Secure** your workspace directory

### Data Storage

- All data is stored locally in your workspace
- No data is sent to external servers (unless configured)
- You control access to your memory files

### Best Practices

1. **Backup regularly**
   ```bash
   ./scripts/export-to-markdown.sh ./backup
   ```

2. **Review before sharing**
   - Check for sensitive information
   - Remove personal data if needed

3. **Secure your environment**
   - Use appropriate file permissions
   - Don't share workspace with untrusted users

4. **Token safety**
   - Store tokens in environment variables
   - Use `.gitignore` for sensitive files
   - Rotate tokens regularly

## Security Features

### Data Isolation

- Each Agent has its own workspace
- Memories are not shared between Agents by default
- Group chat memories are isolated

### Access Control

- File system permissions control access
- No built-in authentication (relies on OS)
- Agent behavior controlled by AGENTS.md

### Audit Trail

- Daily logs provide complete history
- INDEX.md tracks knowledge changes
- Git history (if using version control)

## Known Limitations

1. **No encryption at rest** - Files are stored as plain text Markdown
2. **No network security** - If using cloud sync, ensure secure transmission
3. **No access logging** - File access is not logged by Memory Core

## Recommendations

For sensitive use cases:

1. Use encrypted filesystem
2. Enable OS-level access controls
3. Regular security audits
4. Secure backup procedures

## Contact

For security concerns, please contact the maintainer privately.