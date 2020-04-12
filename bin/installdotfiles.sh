DOTFILE_DIR="../dotfiles"
ORIGINAL_DOTFILES="$(HOME)/original_dotfiles"

mkdir -p $ORIGINAL_DOTFILES

for file in $DOTFILE_DIR; do
  mv ~/$file ~/$ORIGINAL_DOTFILES/
  ln -s $dotfile_dir/$file ~/$file
done

source ~/.zshrc
