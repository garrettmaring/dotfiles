for f in $(find . -regex "\./\..*") 
do
  g=$(echo $f | cut -c 3-)
  rm ~/$g
  ln -s ~/dotfiles/$g ~/$g
done
