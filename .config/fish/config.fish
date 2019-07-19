set -gx fish_greeting

env -i -- sh -c ". \"$HOME/.env\" && exec env -u _ -u PWD -u SHLVL" | sed -e 's/^\([a-zA-Z_][a-zA-Z0-9_]*\)=\(.*\)/set -gx \1 \2/' | source

switch (uname)
  case 'Darwin'
    set -q $HOMEBREW_PREFIX; and test -x /usr/local/bin/brew; and env SHELL=/bin/fish /usr/local/bin/brew shellenv | source
  case 'Linux'
    set -q $HOMEBREW_PREFIX; and test -x /home/linuxbrew/.linuxbrew/bin/brew; and env SHELL=/bin/fish /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
    set -q $HOMEBREW_PREFIX; and test -x ~/.linuxbrew/bin/brew; and env SHELL=/bin/fish ~/.linuxbrew/bin/brew shellenv | source
end
