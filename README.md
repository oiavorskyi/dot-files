# Approach to the backup and restore implementation

## Backup procedure

1. Create ~/.mackup/ folder link to point to ./.mackup/ folder
2. Create ~/.mackup link to point to ./mackup.backup.public
3. Execute `mackup backup` to create copy of the public settings 
4. Execute `mackup uninstall` to copy files back and get rid of the links created by mackup

# Directory structure

public/ - contains all configuration files that are safe to store in Github

sensitive/ - contains all configuration backups that should not be stored in Github

merged/ - contains merged copies from dot-files, serves as a basis for restoring on a machine

mackup/ - contains configuration for mackup
    .mackup.backup.public - configuration used only to backup the public settings
    .mackup.backup.sensitive - configuration used only to backup the sensitive settings
    .mackup.restore - configuration used only to restore settings (merged)
    .mackup/ - contains definitions of apps not supported by mackup out of the box

backup.sh - script to backup settings from a machine

restore.sh - script to restore settings from a machine

# .gitignore
sensitive
merged
