The script has been done for deb-based systems with `apt`.
Just gitclone it and run `./run`. If you are a sudoer, it will install:
- zsh (+ config)
- vim (+ config)
- mc (+ config)
- [rbenv](https://github.com/rbenv/rbenv) with [ruby-build](https://github.com/rbenv/ruby-build)
- [zsh-git-prompt](https://github.com/olivierverdier/zsh-git-prompt) (smart git status in your zsh-prompt)
- terminator (+ config) / if GUI
- sublime text 3 (from its PPA) (+ several configs) / if GUI
- tmux (+ config) / if no GUI

If you are not a sudoer, the script will just copy the configs and install github-based apps. 
