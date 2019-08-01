function psource -d 'Execute POSIX shell script in the current shell context'
  /bin/sh -c '. "$@"; XDG_CONFIG_HOME="${0%/*/*}/etc" "$0" -c "set -gxL" | sed -e "/^HOME /d" -e "/^LC_CTYPE /d" -e "/^PATH /d" -e "/^PWD /d" -e "/^SHLVL /d" -e "/^USER /d" -e "/^XDG_CONFIG_HOME /d" -e "s/^/set -gx /" >&3' (status fish-path) $argv 3>| source
end
