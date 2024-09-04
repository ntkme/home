set -gx fish_greeting

psource ~/.env

switch (uname)
  case 'Darwin'
    not set -q HOMEBREW_PREFIX; and test -x /opt/homebrew/bin/brew; and /opt/homebrew/bin/brew shellenv fish | source
    not set -q HOMEBREW_PREFIX; and test -x /usr/local/bin/brew; and /usr/local/bin/brew shellenv fish | source

    not set -q JAVA_HOME; and set -gx JAVA_HOME (/usr/libexec/java_home 2>/dev/null); or set -e JAVA_HOME

  case 'Linux'
    not set -q HOMEBREW_PREFIX; and test -x ~/.linuxbrew/bin/brew; and ~/.linuxbrew/bin/brew shellenv fish | source
    not set -q HOMEBREW_PREFIX; and test -x /home/linuxbrew/.linuxbrew/bin/brew; and /home/linuxbrew/.linuxbrew/bin/brew shellenv fish | source

end
