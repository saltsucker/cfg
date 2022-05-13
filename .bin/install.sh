git clone --bare git@github.com:saltsucker/cfg.git ~/.cfg
function cf {
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

mkdir -p .config-backup
# this puts all the files into the working directory
cf checkout

if [ $? = 0 ]; then
	echo "Checked out config.";
else
	echo "Backing up pre-existing dot files.";
	cf checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

# I don't htink this one is needed... If it succeeds then you don't need this again. it should be in the else statement I would think?
# cf checkout
cf config status.showUntrackedFiles no
