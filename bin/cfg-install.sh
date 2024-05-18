#!/usr/bin/env bash
# d93fw64xnUYW524FTvUJ
git clone --bare git@bitbucket.org:m_warren/cfg.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
    echo "Checked out config.";
else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

# Additional commands I like to use. GPG for signature checks in Emacs' package system.
# Also see https://elpa.gnu.org/packages/gnu-elpa-keyring-update.html
#
# https://stackoverflow.com/questions/1167746/how-to-assign-a-heredoc-value-to-a-variable-in-bash/1655389
# avoiding cat for fun
read -r -d '' ADDONS <<'EOF'
Additional things to install:
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew install coreutils python gpg
  brew install emacs-mac --with-imagemagick --with-librsvg --with-mac-metal --with-native-compilation --with-starter --with-xwidgets --with-treesitter
EOF
echo "$ADDONS"


