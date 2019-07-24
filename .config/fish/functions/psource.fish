function psource -d 'Execute POSIX shell script in the current shell context'
  set -q __fish_bin_dir; or set __fish_bin_dir (dirname (which fish))
  begin
    /usr/bin/env -u HOME -- /bin/sh -c '. "$@"; { XDG_CONFIG_HOME="$0/../etc" "$0/fish" -c "set -gxL" | sed -e "/^\(HOME\|LC_CTYPE\|PATH\|PWD\|SHLVL\|USER\|XDG_CONFIG_HOME\) /d" -e "s/^/set -gx /"; } >&3' $__fish_bin_dir $argv 3>| source
  end | cat
end
