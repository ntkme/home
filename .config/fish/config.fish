psource ~/.env

set -gx fish_greeting

switch (uname)
  case 'Darwin'
    set -q $HOMEBREW_PREFIX; and test -x /usr/local/bin/brew; and env SHELL=/bin/fish /usr/local/bin/brew shellenv | source
  case 'Linux'
    set -q $HOMEBREW_PREFIX; and test -x /home/linuxbrew/.linuxbrew/bin/brew; and env SHELL=/bin/fish /home/linuxbrew/.linuxbrew/bin/brew shellenv | source
    set -q $HOMEBREW_PREFIX; and test -x ~/.linuxbrew/bin/brew; and env SHELL=/bin/fish ~/.linuxbrew/bin/brew shellenv | source
end
