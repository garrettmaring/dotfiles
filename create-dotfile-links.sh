echo "Creating links..."
for f in $(find ~/dotfiles | grep -v "\.git" | cut -d "/" -f5 | grep -v "^$") 
do
  echo "Linking ~/$f"
  rm ~/$f
  ln -s ~/dotfiles/$f ~/$f
done
