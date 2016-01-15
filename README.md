Script works in deb-based systems with `apt`.
Just gitclone it and do `./space`

It will install:
- zsh (+ config)
- [rbenv](https://github.com/rbenv/rbenv) with [ruby-build](https://github.com/rbenv/ruby-build)
- [zsh-git-prompt](https://github.com/olivierverdier/zsh-git-prompt) (git status in your zsh-prompt)
- terminator (+ config) / if GUI
- sublime text 3 (from webupd8team PPA) (+ sublime and ruby-syntax configs) / if GUI
- tmux (+ config) and mouse support  / if no GUI

Then change your default shell in `/etc/passwd` to zsh.
