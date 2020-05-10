# Plugin creators, please add your *_prompt_info function to the list
# of dummy implementations to help theme creators not receiving errors
# without the need of implementing conditional clauses.
#
# See also lib/git.zsh and lib/nvm.zsh for git_prompt_info, and nvm_prompt_info

# Dummy implementations that return false to prevent command_not_found
# errors with themes, that implement these functions

function chruby_prompt_info \
  rbenv_prompt_info \
  hg_prompt_info \
  pyenv_prompt_info \
  svn_prompt_info \
  vi_mode_prompt_info \
  virtualenv_prompt_info \
  jenv_prompt_info \
{
  return 1
}

function virtualenv_info { [ $VIRTUAL_ENV ] && echo '('$(basename $VIRTUAL_ENV)') ' }


# git theming default: Variables for theming the git info prompt
ZSH_THEME_GIT_PROMPT_PREFIX="git:("         # Prefix at the very beginning of the prompt, before the branch name
ZSH_THEME_GIT_PROMPT_SUFFIX=")"             # At the very end of the prompt
ZSH_THEME_GIT_PROMPT_DIRTY="*"              # Text to display if the branch is dirty
ZSH_THEME_GIT_PROMPT_CLEAN=""               # Text to display if the branch is clean
ZSH_THEME_RUBY_PROMPT_PREFIX="("
ZSH_THEME_RUBY_PROMPT_SUFFIX=")"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{25}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{160} ⚡%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[grey]%}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%F{64}↓%f"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%F{64}↑%f"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%F{64}↕%f"

# A multiline prompt with username, hostname, full path, return status, git branch, git dirty status, git remote status

# Check for tmux by looking at $TERM, because $TMUX won't be propagated to any nested sudo shells but $TERM will.
if [ -n "$TMUX"  ]; then
    # In a a tmux session created in a non-root or root shell.
    local LVL=$(($SHLVL - 1))
else
    # Either in a root shell created inside a non-root tmux session, or not in a tmux session.
    local LVL=$SHLVL
fi

if [[ $EUID -eq 0  ]]; then
    local SUFFIX='%F{yellow}%n%f'$(printf '%%F{yellow}\u276f%.0s%%f' {1..$LVL})
else
    local SUFFIX=$(printf '%%F{white}\u276f%.0s%%f' {1..$LVL})
fi


PROMPT='
%F{255}$(virtualenv_info)%f%F{255}%n%f%F{166}%B%(1j.*.)%(?..!)%b%f %F{166}%B%10c%b%f $(git_prompt_info) $(git_remote_status)
%B${SUFFIX}%b '
RPROMPT='%(?..%?)'
