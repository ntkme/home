~
=

$HOME

Bootstrap
---------

``` sh
( cd "$(mktemp -d)" && ( git clone https://github.com/ntkme/ntkme.git && rm -rf ~/.git && mv ntkme/.git ~/.git && ( cd && git reset --hard && touch .gitconfig && git update-index --skip-worktree README.md LICENSE.md ); rm -rf "$(pwd)" ) )
```

#### Vim

``` sh
vim +q
~/.vim/bundle/YouCompleteMe/install.py --clang-completer
```

#### Zsh

``` sh
chsh -s /bin/zsh
```

License
-------

See [LICENSE.md](LICENSE.md).
