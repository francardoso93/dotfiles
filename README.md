# Dotfiles

Run install/bootstrap.sh to configure all symbolic links. This means that the target file must not exist anymore (eg: .zshrc). 

By default. the script fails when the target file already exists, but you can alter it to use the backup_all mode, which will safely generate a backup then the symbolic link with the newer file.

Important: .prop files must have ENTER at the end to be recognized by bootstrap script.