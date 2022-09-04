if status is-interactive
    # Commands to run in interactive sessions can go here
    # export LSCOLORS=Gxfxcxdxbxegedabagacad
end
# starship init fish | source


# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "exa -l -g --icons"
alias lla "exa -la"
alias g git
alias reshell "exec $SHELL -l"

# fzf の設定
set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"


# ghq + fzf
function ghq_fzf_repo -d 'Repository search'
  ghq list --full-path | fzf --reverse --height=100% | read select
  [ -n "$select" ]; and cd "$select"
  echo " $select "
  commandline -f repaint
end

# fish key bindings
function fish_user_key_bindings
  bind \cg ghq_fzf_repo
end



# bobthefish 設定
set -U theme_display_date no 
set -U theme_display_cmd_duration no
