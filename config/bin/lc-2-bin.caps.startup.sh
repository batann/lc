#!/bin/bash
###   IN case the google calendar and google tasknote credentials were removed from cache ###################################
if [[ -d /home/batan/.cache/calendar.vim/ ]]; then
	echo -e "\033[41mcalendar.vim directory exists\033[0m"
exit
fi
mkdir -p /home/batan/.cache/calendar.vim/
	cp /home/batan/dot/credentials.vim /home/batan/.cache/calendar.vim/credentials.vim
###   BIND Esc to CapsLock and bind LeftCtrl to CapsLock as well ######################
/usr/bin/lc-caps
xmodmap -e "clear lock"
xmodmap -e "remove Control = Control_L"
xmodmap -e "keycode 66 = Control_L"
xmodmap -e "add Control = Control_L"
xcape -e "Control_L=Escape"

###   EXPORTING LC-FZF-layout   ########################################################

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
 --color=fg:#195190,bg:#121212,hl:#788a9c
 --color=fg+:#cccccc,bg+:#195190,hl+:#99c2ff
 --color=info:#d9b309,prompt:#b83737,pointer:#af5fff
 --color=marker:#ffe87f,spinner:#af5fff,header:#b83737'

###   Renewing bin files   #############################################################

if [[ -f /home/batan/dot/bin.tar.gz ]];
then
	sudo rm /home/batan/dot/bin.tar.gz
	cd /home/batan/dot/bin/
	tar vfcz bin.tar.gz lc-*
	 mv /home/batan/dot/bin/bin.tar.gz /home/batan/dot/bin.tar.gz


sudo tar vfxz /home/batan/dot/bin.tar.gz --directory /usr/bin/
for i in $(tar list -f /home/batan/dot/bin.tar.gz);do sudo chmod +x /usr/bin/$i;done
clear
echo -e ${Purple}"=================================="${GGreen}
tar list -f /home/batan/dot/bin.tar.gz
echo ${NC}
else
clear
echo "Exiting...."
fi

############################################################################

if [[ -f $HOME/.musik.kdl ]]; then
    mv $HOME/.musik.kdl $HOME/.musik.kdl.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/musik.kdl $HOME/.musik.kdl
else
    cp -r $HOME/dot/musik.kdl $HOME/.musik.kdl
fi
############################################################################

if [[ -f $HOME/.pod.opml ]]; then
    mv $HOME/.pod.opml $HOME/.pod.opml.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/pod.opml $HOME/.pod.opml
else
    cp -r $HOME/dot/pod.opml $HOME/.pod.opml
fi
############################################################################
if [[ -d /home/batan/.cache/calendar.vim ]]; then
cp dot/credentials/tel.petar.credentials.vim  /home/batan/.cache/calendar.vim/credentials.vim
else
mkdir /home/batan/.cache/calendar.vim/
cp dot/credentials/tel.petar.credentials.vim /home/batan/.cache/calendar.vim/credentials.vim
fi
clear
############################################################################

if [[ -f $HOME/.bashrc ]]; then
    mv $HOME/.bashrc $HOME/.bashrc.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/bashrc $HOME/.bashrc
else
    cp -r $HOME/dot/bashrc $HOME/.bashrc
fi
############################################################################
if [[ -f $HOME/.bashrc.aliases ]]; then
    mv $HOME/.bashrc.aliases $HOME/.bashrc.alaises.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/bashrc.aliases $HOME/.bashrc.aliases
else
    cp -r $HOME/dot/bashrc.aliases $HOME/.bashrc.aliases
fi
############################################################################

if [[ -f $HOME/.vimrc ]]; then
    mv $HOME/.vimrc $HOME/.vimrc.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/vimrc $HOME/.vimrc
else
    cp -r $HOME/dot/vimrc $HOME/.vimrc
fi
############################################################################

if [[ -f $HOME/.taskrc ]]; then
    mv $HOME/.taskrc $HOME/.taskrc.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/taskrc $HOME/.taskrc
else
    cp -r $HOME/dot/taskrc $HOME/.taskrc
fi
############################################################################

if [[ -f $HOME/.xboardrc ]]; then
    mv $HOME/.xboardrc $HOME/.xboardrc.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/xboardrc $HOME/.xboardrc
else
    cp -r $HOME/dot/xboardrc $HOME/.xboardrc
fi
############################################################################

if [[ -f $HOME/.tkremind ]]; then
    mv $HOME/.tkremind $HOME/.tkremind.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/tkremind $HOME/.tkremind
else
    cp -r $HOME/dot/tkremind $HOME/.tkremind
fi
############################################################################

if [[ -f $HOME/.xterm.conf ]]; then
    mv $HOME/.xterm.conf $HOME/.xterm.conf.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/xterm.conf $HOME/.xterm.conf
else
    cp -r $HOME/dot/xterm.conf $HOME/.xterm.conf
fi
############################################################################
if [[ -f $HOME/.Xresources ]]; then
    mv $HOME/.Xresources $HOME/.Xresources.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/Xresources $HOME/.Xresources
else
    cp -r $HOME/dot/Xresources $HOME/.Xresources
fi
############################################################################
if [[ -f $HOME/.bash_profile ]]; then
    mv $HOME/.bash_profile $HOME/.bash_profile.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/bash_profile $HOME/.bash_profile
else
    cp -r $HOME/dot/bash_profile $HOME/.bash_profile
fi
############################################################################
    if [[ -f $HOME/.tmux.config ]]; then
    mv $HOME/.tmux.config $HOME/.tmux.config.bak.$ddd.$(date +%H:%M)
    cp -r $HOME/dot/tmux.config $HOME/.tmux.config
else
    cp -r $HOME/dot/tmux.config $HOME/.tmux.config
fi
############################################################################

if [[ -f .vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tpl ]]; then
    mv $HOME/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tpl $HOME/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tlp.$ddd.$(date +%H:%M)
    cp $HOME/dot/default.tlp $HOME/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tlp
fi
############################################################################
if [[ -f /etc/hosts ]]; then
sudo mv /etc/hosts /etc/hosts.original.$ddd.$(date +%H:%M)
    sudo cp -r $HOME/dot/hosts /etc/hosts
else
    sudo cp  $HOME/dot/hosts /etc/hosts
fi
############################################################################
source ~/.bashrc


