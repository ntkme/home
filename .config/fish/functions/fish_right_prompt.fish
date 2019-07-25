function fish_right_prompt -d "Write out the right prompt"
  printf ' '
  ~/.config/bash/functions/battery-indicator -t bar 2>/dev/null
  printf ' %s ' (date +%T)
end
