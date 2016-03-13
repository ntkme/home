function fish_prompt -d "Write out the prompt"
  printf '%s%s%s' (set_color yellow) (whoami) (set_color normal)
  printf ' at %s%s%s%s' ([ (uname) = "Darwin" ]; and test "$TERM_PROGRAM"; and printf '%s%s ' (set_color white) (set_color normal)) (set_color magenta) (hostname|cut -d . -f 1) (set_color normal)
  printf ' in %s%s%s' (set_color $fish_color_cwd) (prompt_pwd | sed "s,/,"(set_color red)"/"(set_color $fish_color_cwd)",g;s/\$/\\\\n/g;\$s/\\\\n//" | tr -d "\n") (set_color normal)

  if which git >/dev/null ^&1
    set -l git_branch (git rev-parse --abbrev-ref HEAD ^/dev/null)
    if test "$git_branch"
      printf ' on %s%s%s' (set_color cyan) $git_branch (set_color normal)
      set -l git_toplevel (git rev-parse --show-toplevel 2>/dev/null)
      if test "$git_toplevel"
        set_color red
        set -l git_modified (git status --porcelain --untracked-files=no --ignore-submodules=dirty)
        test "$git_modified"; and printf '!'
        set -l git_untracked (git ls-files --other --exclude-standard -- "$git_toplevel")
        test "$git_untracked"; and printf '?'
        set_color normal
      end
    end
  end

  echo

  if test "$VIRTUAL_ENV"
    printf "(%s%s%s) " (set_color blue) (basename "$VIRTUAL_ENV") (set_color normal)
  end

  begin
    which git >/dev/null ^&1; and git rev-parse ^/dev/null; and begin
      not [ (git rev-parse --show-toplevel ^/dev/null) = "$HOME" ]; or not git check-ignore --quiet "$PWD" ^/dev/null
    end; and printf '±'
  end; or begin
    which hg >/dev/null ^&1; and hg root >/dev/null ^&1; and printf '☿'
  end; or begin
    which svn >/dev/null ^&1; and svn info >/dev/null ^&1; and printf '⚡'
  end; or begin
    [ (id -u) = 0 ]; and printf '√'
  end; or begin
    printf '↪'
  end

  printf ' '
  set_color normal
end
