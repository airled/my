The script has been done for deb-based systems with `apt`.
Just gitclone it and do `./space`. If you are sudoer, it will install:
- zsh (+ config)
- mc (+ config)
- [rbenv](https://github.com/rbenv/rbenv) with [ruby-build](https://github.com/rbenv/ruby-build)
- [zsh-git-prompt](https://github.com/olivierverdier/zsh-git-prompt) (smart git status in your zsh-prompt)
- terminator (+ config) / if GUI
- sublime text 3 (from webupd8team PPA) (+ several configs) / if GUI
- tmux (+ config) and mouse support in console / if no GUI

Then you should change your default shell in `/etc/passwd` to zsh.

If you are not sudoer, the script will just copy configs and install github-based apps (cause it doesn't need to be sudoer). 
