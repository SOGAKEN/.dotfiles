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

# fzf の設定
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




     set -g theme_git_default_branches main trunk
#     set -g theme_display_vagrant yes
#     set -g theme_display_docker_machine no
#     set -g theme_display_k8s_context yes
#     set -g theme_display_k8s_namespace no
#     set -g theme_display_aws_vault_profile yes
#     set -g theme_display_hg yes
#     set -g theme_display_virtualenv no
#     set -g theme_display_nix no
#     set -g theme_display_ruby no
#     set -g theme_display_user ssh
#     set -g theme_display_hostname ssh
#     set -g theme_display_sudo_user yes
#     set -g theme_display_vi no
#     set -g theme_display_node yes
#     set -g theme_avoid_ambiguous_glyphs yes
##     set -g theme_powerline_fonts no
     set -g theme_nerd_fonts yes
     set -g theme_show_exit_status yes
     set -g theme_display_jobs_verbose yes
     set -g default_user your_normal_user
     set -g theme_color_scheme dark
     set -g fish_prompt_pwd_dir_length 10
     set -g theme_project_dir_length 100

