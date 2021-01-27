set -gx fish_greeting

psource ~/.env

switch (uname)
  case 'Darwin'
    not set -q HOMEBREW_PREFIX; and test -x /opt/homebrew/bin/brew; and SHELL=/bin/fish /opt/homebrew/bin/brew shellenv | source
    not set -q HOMEBREW_PREFIX; and test -x /usr/local/bin/brew; and SHELL=/bin/fish /usr/local/bin/brew shellenv | source

    not set -q DOCKER_HOST; and type -q docker-machine; and docker-machine env 2>/dev/null | source

    not set -q JAVA_HOME; and set -gx JAVA_HOME (/usr/libexec/java_home 2>/dev/null); or set -e JAVA_HOME

  case 'Linux'
    not set -q HOMEBREW_PREFIX; and test -x ~/.linuxbrew/bin/brew; and SHELL=/bin/fish ~/.linuxbrew/bin/brew shellenv | source
    not set -q HOMEBREW_PREFIX; and test -x /home/linuxbrew/.linuxbrew/bin/brew; and SHELL=/bin/fish /home/linuxbrew/.linuxbrew/bin/brew shellenv | source

end
