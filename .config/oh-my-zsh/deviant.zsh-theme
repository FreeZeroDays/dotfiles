G="#5CCC96"
R="#E33400"

# Regular clean looking prompt
PROMPT='%B%{%(?:%K{$G}%F{#000}:%K{$R}%F{#fff})%} %1~ %k%{%(?:%F{$G}:%F{$R})%}'$'\uE0B0''%{$reset_color%}%b '

# Prompt with verbose logging (Date and Time)
PROMPT='%B%{%(?:%K{$G}%F{#000}:%K{$R}%F{#fff})%} [%w  %*] %1~ %k%{%(?:%F{$G}:%F{$R})%}'$'\uE0B0''%{$reset_color%}%b '
RPROMPT=''
