collapsed_wd() {
  echo $(pwd | perl -pe '
   BEGIN {
      binmode STDIN,  ":encoding(UTF-8)";
      binmode STDOUT, ":encoding(UTF-8)";
   }; s|^$ENV{HOME}|~|g; s|/([^/.])[^/]*(?=/)|/$1|g; s|/\.([^/])[^/]*(?=/)|/.$1|g
')
}

function _virtualenv_prompt_info {
   if [[ -n "$(whence virtualenv_prompt_info)" ]]; then
      if [ -n "$(whence pyenv_prompt_info)" ]; then
         if [ "$1" = "inline" ]; then
            ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=%{$fg[blue]%}"::%{$fg[red]%}"
            ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=""
            virtualenv_prompt_info
         fi
         [ "$(pyenv_prompt_info)" = "${PYENV_PROMPT_DEFAULT_VERSION}" ] && virtualenv_prompt_info
      else
         virtualenv_prompt_info
      fi
   fi
}

function git_info() {
   check_git=$(command git rev-parse --is-inside-work-tree 2> /dev/null) || return 0
   echo "$(git_prompt_info)$(git_prompt_status)$FG[default]"
}

local user_color='blue'; [ $UID -eq 0 ] && user_color='red'
local wd_color='green'
local date_time="%{$fg[default]%}%*%{$reset_color%} $FG[default]]"
local user="%{$fg_bold[$user_color]%}%n %{$fg[$wd_color]%}"
local post_wd="$reset_color$FG[default] "

local prompt_line="%{$fg_bold[magenta]%}%(!.#.❱)%{$reset_color%} "

local return_status="%{$fg_bold[red]%}%(?..%?
)%{$reset_color%}"

local pwd='%~'

# Set Prompt
PROMPT='${return_status}
$FG[default]${user}${pwd}${post_wd}$(git_info)
${prompt_line}'
PROMPT2="%{$fg[red]%}\ %{$reset_color%}"
RPROMPT='$(_virtualenv_prompt_info) %*%{$reset_color%}'

# Git Fields
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[yellow]%}∼%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}✱%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?%{$reset_color%}"
