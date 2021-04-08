The script has been done for deb-based systems with `apt-get`.
Just gitclone it and run `./run`. If you are a sudoer, it will install:
- zsh (+ config)
- vim (+ config)
- mc (+ config)
- [fdfind](https://github.com/sharkdp/fd) (better than find with alias set to just `fd`)
- ncdu
- [git-prompt.zsh](https://github.com/woefe/git-prompt.zsh) (smart git status in your zsh-prompt)
- [rbenv](https://github.com/rbenv/rbenv) with [ruby-build](https://github.com/rbenv/ruby-build)
- [asdf](https://github.com/asdf-vm/asdf)
- sublime text 3 (from its PPA) (+ several configs) / if GUI

If you are not a sudoer, the script will just copy the configs and install github-based apps. 
