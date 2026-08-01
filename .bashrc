#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#Color variables
W="\033[0m"
B="\033[01;36m"
R="\033[01;31m"
G="\033[01;32m"
echo -e "
        $B. $W
       $B/#\ $W                     _     $B _ _
      $B/###\ $W      __ _ _ __ ___| |__  $B| (_)_ __  _   ___  __ 
     $B/#####\ $W    / _' | '__/ __| '_ \ $B| | | '_ \| | | \ \/ /
    $B/##.-.##\ $W  | (_| | | | (__| | | |$B| | | | | | |_| |>  <  
   $B/##(   )##\ $W  \__,_|_|  \___|_| |_|$B|_|_|_| |_|\__._/_/\_\  
  $B/#.--   --.#\ $W
 $B/'           '\ "
echo -e "       $B Leche con platano $W- Esto es$B ARCH$W conchetumare$B que wea "
echo -e "$W"

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias emedes='/usr/bin/git --git-dir=$HOME/emedes.git --work-tree=$HOME'

#export GDK_SCALE=1
#export GDK_DPI_SCALE=0.5
#alias zeal="QT_OPENGL=software QTWEBENGINE_CHROMIUM_FLAGS=--disable-gpu zeal"
