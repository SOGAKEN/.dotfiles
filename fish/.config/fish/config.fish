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

set -U FZF_LEGACY_KEYBINDINGS 0
set -U FZF_REVERSE_ISEARCH_OPTS "--reverse --height=100%"

#fisherパッケージoh-my-fish/plugin-pecoの設定
# function fish_user_key_bindings
#  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
#  bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F

  # vim-like
#  bind \cl forward-char

  # prevent iterm2 from closing when typing Ctrl-D (EOF)
##   bind \cd delete-char
# end



