# Oh-my-zsh installation path
ZSH=/usr/share/oh-my-zsh/

# Powerlevel10k theme path
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# List of plugins used
plugins=(git sudo zsh-256color zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]]; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}

# Detect AUR wrapper
if pacman -Qi yay &>/dev/null; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null; then
            arch+=("${pkg}")
        else
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

# Helpful aliases
alias c='clear' # clear terminal
alias l='eza -lh --icons=auto' # long list
alias ls='eza -1 --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list available package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code' # gui code editor

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias cd_obs='cd "/mnt/2tb/other/obsidian/obsidian/"'
#alias cd_obs='cd "/mnt/4tb/Media/obsidian/Obsidian/"'
alias cd_media='cd /mnt/4tb/media/obsidian/obsidian/irvyne/1.0\ -\ Media'
alias cd_manga='cd "/mnt/4tb/media/manga/"'
alias cd_yt='cd "/mnt/4tb/media/youtube"'

alias cd_git='cd /mnt/2tb/other/github'

alias=dl_play='
yt-dlp -f "bv[height<=720]+ba/b[height<=720]"
'

alias start_nsfw='
figlet -c Irvyne
neofetch --ascii ~/Documents/txt/other/ascii.txt
if (( RANDOM % 2 )); then
    pokemon-colorscripts --no-title -n sylveon
else
    pokemon-colorscripts --no-title -n vaporeon
fi'

alias start='
figlet -c Irvyne
neofetch
if (( RANDOM % 2 )); then
    pokemon-colorscripts --no-title -n sylveon
else
    pokemon-colorscripts --no-title -n vaporeon
fi'

# Display Pokemon
# pokemon-colorscripts --no-title -r

start



alias pokemon='pokemon-colorscripts --no-title -r'
alias startplasma='/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland'
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /home/irvyne/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=$PATH:/home/irvyne/.spicetify

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/irvyne/.dart-cli-completion/zsh-config.zsh ]] && . /home/irvyne/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]


# pnpm
export PNPM_HOME="/home/irvyne/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
