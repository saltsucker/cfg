git clone --bare git@github.com:saltsucker/.cfgt.git $HOME/.cfg
function config {
	/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

mkdir -p .config-backup
# this puts all the files into the working directory
config checkout

if [ $? = 0 ]; then
	echo "Checked out config.";
else
	echo "Backing up pre-existing dot files.";
	config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;

# I don't htink this one is needed... If it succeeds then you don't need this again. it should be in the else statement I would think?
config checkout
config config status.showUntrackedFiles no
