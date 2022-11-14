# Codespaces zsh prompt theme
__zsh_prompt() {
    local prompt_username
    if [ ! -z "${GITHUB_USER}" ]; then
        prompt_username="@${GITHUB_USER}"
    else
        prompt_username="%n"
    fi
    PROMPT="${FG[078]}${prompt_username} %(?:%{$reset_color%}➜ :%{$fg_bold[red]%}➜ )" # User/exit code arrow
    PROMPT+='${FG[105]}%(5~|%-1~/…/%3~|%4~)%{$reset_color%} ' # cwd
    PROMPT+='$(git_prompt_info)' # Git status
    PROMPT+='${FG[105]}$ %{$reset_color%}'
    unset -f __zsh_prompt
}
ZSH_THEME_GIT_PROMPT_PREFIX="${FG[075]}(${FG[078]}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[075]})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=""
__zsh_prompt
