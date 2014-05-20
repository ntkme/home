function fish_env -d "Load environment variables from POSIX .env"
  set -l pattern '^[:space:]*\(export[:space:][:space:]*\)\{0,1\}\([a-zA-Z_][a-zA-Z0-9_]*\)=\(.*\)[:space:]*$'
  set -l file
  for file in $argv
    set -l line
    for line in (grep $pattern $file)
      eval (echo $line | sed "s/$pattern/set -gx \\2\ \\3/")
    end
  end
end
