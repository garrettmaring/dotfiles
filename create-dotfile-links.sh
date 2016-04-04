echo "Creating links..."
for f in $(find ~/dotfiles -regex "\./\..*") 
do
  g=$(echo $f | cut -c 3-)
  rm ~/$g
  ln -s ~/dotfiles/$g ~/$g
done
