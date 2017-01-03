docker run -it --rm \
  -u $UID:`id -g` \
  -v $HOME:$HOME \
  -e "HOME=$HOME" \
  -e "SHELL=/usr/bin/zsh" \
  --name workspace local/workspace
