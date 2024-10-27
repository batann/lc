#!/bin/bash
EXCLUDE="install.sh|default.tpl"
clear
cd /home/batan/.config/dot
if [[ -d .git ]];
then
	sudo trash .git
fi
if [[ -f /home/batan/.config/dot/default.tpl ]];
then
	sudo cp default.tpl /home/batan/.config/vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tpl
fi
for i in $(ls -A|grep -vE "$EXCLUDE");
do
if [[ -f /home/batan/.$i ]];
then
	mv /home/batan/.$i /home/batan/.$i.bak.$(date +%j-$%H-%M)
fi
	cp $i /home/batan/.$i
done

for i in $(ls |grep -v "$EXCLUDE");
do
	echo -e "   \033[31m>>>   \033[34m $i \033[36mis now in /home/batan/.$i .\033[0m"
done
cd

