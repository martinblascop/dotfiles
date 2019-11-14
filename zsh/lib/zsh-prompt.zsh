function virtualenv_info { [ $VIRTUAL_ENV ] && echo '('$(basename $VIRTUAL_ENV)') ' }
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


ZSH_THEME_GIT_PROMPT_PREFIX="%F{25}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{160} ⚡%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[grey]%}"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="%F{64}↓%f"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="%F{64}↑%f"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="%F{64}↕%f"
