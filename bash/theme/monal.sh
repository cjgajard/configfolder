# Format for git_prompt_status()
THEME_GIT_PROMPT_ADDED="a"
THEME_GIT_PROMPT_DELETED="d"
THEME_GIT_PROMPT_MODIFIED="m"
THEME_GIT_PROMPT_RENAMED="r"
THEME_GIT_PROMPT_STASHED="."
THEME_GIT_PROMPT_UNMERGED="w"
THEME_GIT_PROMPT_UNTRACKED="u"

THEME_GIT_PROMPT_AHEAD="+"
THEME_GIT_PROMPT_BEHIND="-"
THEME_GIT_PROMPT_DIVERGED="!"

THEME_GIT_PROMPT_PREFIX="("
THEME_GIT_PROMPT_SUFFIX=")"

THEME_GIT_INFO_PREFIX=" "
#THEME_GIT_INFO_SUFFIX=""

PS1="\W\$(git_prompt_info)\$(git_prompt_status)\$ "
