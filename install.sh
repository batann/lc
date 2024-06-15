#!/bin/bash
#############################################################

#clone repository
git clone https://github.com/batann/lc.git

#setup .config/files
cd lc/config
clear
echo -e "\033[31mSetting up \033[34m.config \033[31mfiles \033[34mand \033[31 directories\033[0m"
if [[ -d /home/batan/.config/xfce4 ]]; then
	mv /home/batan/.config/xfce4 /home/batan/.config/xfce4.org
	cp -r xfce4 /home/batan/.config/xfce4
else
	cp -r xfce4 /home/batan/.config/xfce4
fi

if [[ -d /home/batan/.config/ranger ]]; then
	mv /home/batan/.config/ranger  /home/batan/.config/ranger.org
	cp -r ranger /home/batan/.config/ranger
else
	cp -r ranger /home/batan/.config/ranger
fi
if [[ -d /home/batan/.config/Thunar ]]; then
	mv /home/batan/.config/Thunar /home/batan/.config/Thunar.org
	cp -r Thunar /home/batan/.config/Thunar
else
	cp -r Thunar /home/batan/.config/
fi
if [[ -d /home/batan/.config/autostart ]]; then
	mv /home/batan/.config/autostart /home/batan/.config/autostart.org
	cp -r autostart /home/batan/.config/
else
	cp -r autostart /home/batan/.config/
fi
if [[ -d /home/batan/.config/gtk-2.0 ]]; then
	mv /home/batan/.config/gtk-2.-0 /home/batan/.config/gtk-2.0.org
	cp -r gtk-2.0 /home/batan/.config/
else
	cp -r gtk-2.0 /home/batan/.config/
fi
if [[ -d /home/batan/.config/gtk-3.0 ]]; then
	mv /home/batan/.config/gtk-3.0 /home/batan/.config/gtk-3.0.org
	cp -r gtk-3.0 /home/batan/.config/
else
	cp -r gtk-3.0 /home/batan/.config/
fi
if [[ -d /home/batan/.config/volumeicon   ]]; then
	mv /home/batan/.config/volumeicon /home/batan/.config/volumeicon.org
	cp -r volumeicon /home/batan/.config/
else
	cp -r volumeicon /home/batan/.config/
fi
if [[ -d /home/batan/.config/xfce-superkey  ]]; then
	mv /home/batan/.config/xfce-superkey /home/batan/.config/xfce-superkey.org
	cp -r xfce-superkey /home/batan/.config/
else
	cp -r xfce-superkey /home/batan/.config/
fi
clear
cd ..
echo -e "\033[31mSetting up \033[34m/home/batan/dot/\033[31mfiles \033[34mand \033[31 directories\033[0m"

if [[ -d /home/$USER/dot ]]; then
mv /home/$USER/dot /home/$USER/dot.org
cp -r dot /home/$USER
else
	cp -r dot /home/$USER
fi
cd
dot=$(ls /home/$USER/dot/)
for i in $(ls /home/batan/dot);do mv /home/batan/.$i /home/batan/.$i.org;done
for i in $(ls /home/batan/dot);do cp /home/batan/dot/$i /home/batan/.$i;done

cd lc
#setup bin files
echo -e "\033[36m==================================================================\033[0m"
echo -e "\033[31mSetting up \033[34m/usr/bin/lc-\033[31mfiles\033[0m"
for i in $(ls /home/$USER/lc/bin);do sudo chmod +x /home/batan/lc/bin/$i && sudo mv /home/$USER/lc/bin/$i /usr/bin/;done
echo -e "\033[36m==================================================================\033[0m"
echo -e "\033[31mSetting up \033[34mVim Neovim Templates\033[31mfiles\033[0m"
if [[ -d /home/$USER/.vim/templates ]]; then
	cp templates/* /home/$USER/.vim/templates/
else
	mkdir -p /home/$USER/.vim/templates
	cp templates/* /home/$USER/.vim/templates/
fi
if [[ -d /home/$USER/.config/nvim/templates ]]; then
	cp templates/* /home/$USER/.config/nvim/templates/
else
	mkdir -p /home/$USER/.config/nvim/templates
	cp templates/* /home/$USER/.config/nvim/templates/
fi
if [[ -f /home/$USER/.vim/pack/plugins/start/vimwiki/autostart/vimwiki/default.tpl ]]; then
	mv /home/$USER/.vim/pack/plugins/start/vimwiki/autostart/vimwiki/default.tpl /home/$USER/.vim/pack/plugins/start/vimwiki/autostart/vimwiki/default.tpl.org
	cp default.tpl /home/$USER/.vim/pack/plugins/start/vimwiki/autostart/vimwiki/
else
mkdir -p /home/$USER/.vim/pack/plugins/start/vimwiki/autostart/vimwiki/
	cp default.tpl /home/$USER/.vim/pack/plugins/start/vimwiki/autostart/vimwiki/
fi

cd /lc/etc
mkdir -p /home/batan/lc/tmp/
sudo chmod +x /home/batan/lc/etc/xfce4/xinit.rc
echo -e "\033[31mSetting up \033[34m/etc/xdg/\033[31mfiles and directories...\033[0m"
if [[ -d /etc/xdg/Thunar ]]; then
	sudo mv /etc/xdg/Thunar /home/batan/lc/tmp/Thunar.org
	sudo cp -r /home/batan/lc/etc/Thunar /etc/xdg/Thunar/
else
	sudo cp -r /home/batan/lc/etc/Thunar /etc/xdg/Thunar/
fi
if [[ -d /etc/xdg/menus ]]; then
	sudo mv /etc/xdg/menus /home/batan/lc/tmp/menus.org
	sudo cp -r /home/batan/lc/etc/menus /etc/xdg/menus
else
	sudo cp -r /home/batan/lc/etc/menus /etc/xdg/menus
fi
if [[ -d /etc/xdg/xfce4 ]]; then
	sudo mv /etc/xdg/xfce4/ /home/batan/lc/tmp/xfce4.org/
	sudo cp -r /home/batan/lc/etc/xfce4 /etc/xdg/xfce4
else
	sudo cp -r /home/batan/lc/etc/xfce4 /etc/xdg/xfce4
fi

echo -e "\033[36m==================================================================\033[0m"
echo -e "\033[31mRunning the following setup scripts:     \033[34mlc-startup lc-caps\033[0m"
/usr/bin/lc-caps
/usr/bin/lc-startup-script
echo -e "\033[36m==================================================================\033[0m"

echo "DONE"

#echo -e ""
#echo -e "\033[44m\033[37mScript ran successfully!!!\033[0m"
#echo -e "\033[31mPlease reboot and if everything runs as expected remove the following files:\033[0m"
#echo -e "\033[34m /home/$USER/.vim/pack/plugins/start/vimwiki/autostart/vimwiki/default.tpl.org"
#echo -e "\033[34m /home/$USER/.config/autostart.org"
#echo -e "\033[34m /home/$USER/.config/gtk-2.0.org"
#echo -e "\033[34m /home/$USER/.config/gtk-3.0.org"
#echo -e "\033[34m /home/$USER/.config/xfce4.org"
#echo -e "\033[34m /home/$USER/.config/xfce-superkey.org"
#echo -e "\033[34m /home/$USER/.config/volumeicon.org"
#echo -e "\033[34m /home/$USER/.config/Thunar.org"
#xxx=$(ls /home/batan/dot)
#echo -e "\033[34m /home/$USER/{$xxx}.org\033[0m"




