function psource -d 'Execute POSIX shell script in the current shell context'
  /bin/sh -c '. "$@"; XDG_CONFIG_HOME="${0%/*/*}/etc" "$0" -c "set -gxL" | sed -e "/^\(HOME\|LC_CTYPE\|PATH\|PWD\|SHLVL\|USER\|XDG_CONFIG_HOME\) /d" -e "s/^/set -gx /" >&3' (status fish-path) $argv 3>| source
end
