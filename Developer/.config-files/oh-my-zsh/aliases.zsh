#Custom Aliases
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
#eza aliases
# ll: List with long format, showing groups and icons
alias ll="eza -l -g --icons"
# lla: List with long format, showing groups, icons, and hidden files
alias lla="eza -l -g --icons -a"
# llt: List with long format, showing groups, icons, in a tree structure
alias llt="eza -l -g --icons -T"
# llt1: Tree view with icons, smart grouping, total size, depth 1
alias llt1="eza -l -g -T --icons=always --smart-group --total-size --color-scale -L=1"
# llt2: Tree view with icons, smart grouping, total size, depth 2
alias llt2="eza -l -g -T --icons=always --smart-group --total-size --color-scale -L=2"
# llt3: Tree view with icons, smart grouping, total size, depth 3
alias llt3="eza -l -g -T --icons=always --smart-group --total-size --color-scale -L=3"
# llm: List with long format, showing groups, icons, and total size
alias llm="eza -l -g --icons --total-size"
# lly: Detailed view with icons, smart grouping, total size, grid format, no quotes
alias lly="eza -l -g --icons=always --smart-group --total-size --grid --no-quotes"
# llz: Detailed view for current directory with icons, smart grouping, total size, absolute paths, header
alias llz="eza -l -g --icons=always --smart-group --total-size --absolute=on --header"
alias goog="google"
alias yt="youtube"
alias testalias='echo This is a test alias'
