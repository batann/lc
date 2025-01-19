# {{{ >>> variables and tar.gz archives

BASE="/home/batan/BATAN"
TARG="/home/batan"

aa1="check/check.tar.gz"
aa2="100/icons.tar.gz"
aa3="100/sounds.tar.gz"
aa4="10/menu.tar.gz"
aa5="10/vimwiki.tar.gz"
aa6="10/postinstall.tar.gz"
aa7="10/html.tar.gz"
aa8="bin/bin.tar.gz"
aa9="config/config.tar.gz"
aa10=".vim/pack.tar.gz"
aa11=".vim/templates.tar.gz"
#}}}

#{{{ >>>   Extract and remove tar archives
for i in $(seq 1 11); do
	# Indirect reference to dynamically access aa1, aa2, etc.
	varname="aa$i"
	archive=${!varname}

    # Extract the directory path before the first '/'
    bb=$(echo "$archive" | sed 's!/.*$!!g')

    # For debugging or actual operation
    # Uncomment the following line to actually extract files
    tar vfxz "$archive" --directory="$bb"
done
find -type f -name '*.tar.gz' -exec rm -rf {} \;
# }}}

#{{{ >>>   Copy dot files to home
find $BASE -maxdepth 1 -type f -exec cp {} $TARG \;
#}}}

#{{{ >>>   Copy User and System Directories to corresponding folders


sudo cp -r $BASE/.task $TARG/
sudo cp -r $BASE/10 $TARG/
sudo cp -r $BASE/bin $TARG/
sudo cp -r $BASE/config $TARG/.config
sudo cp -r $BASE/.vim $TARG/
sudo cp -r $BASE/check $TARG/
sudo cp -r $BASE/100 $TARG/

if [[ d != /usr/share/fonts ]]; then
	sudo mkdir -p /usr/share/fonts
fi
sudo cp -r $BASE/usr/share/fonts/* /usr/share/fonts

if [[ d != /usr/share/plymouth/themes/ ]]; then
	sudo mkdir -p /usr/share/plymmouth/themes
fi
sudo cp -r $BASE/usr/share/plymouth/themes/anon/* /usr/share/plymouth/themes/anon

if [[ d != /usr/share/backgrounds ]]; then
	sudo mkdir -p /usr/share/backgrounds
fi
sudo cp -r $BASE/usr/share/backgrounds/* /usr/share/backgrounds/*

if [[ d != /usr/share/lightdm ]]; then
	sudo mkdir -p /usr/share/lightdm
fi
sudo cp -r $BASE/etc/lightdm/* /usr/share/lightdm/





#}}}
