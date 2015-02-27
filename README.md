vim-settings
============

###Overview 
=============
manage vim plugins using paththogen and git submodule 

###Setup Setps
=============
- Back up your current ~/.vim directory and ~/.vimrc if you have  
```bash
  cp -r ~/.vim ~/vim_bk
  cp ~/.vimrc ~/.vimrc_bk
```
- Clone the repo to your local machine 
```bash
  git clone https://github.com/rjwalls/vim-settings.git ~/.vim
```
- Init and update Submodules 
```bash
cd ~/.vim 
git submodule init
git submodule foreach git pull origin master
```
- Set up vimrc 
```bash
ln -s ~/.vim/.vimrc ~/.vimrc 
```

- Change origin if you have a remote repo 
```bash
git remote set-url origin yourgitrepo
```


### Uninstall bundles
=============
```bash
git submodule deinit bundle/vim-rvm
git rm bundle/vim-rvm
#git rm --cached bundle/vim-rvm
rm -rf .git/modules/bundle/vim-rvm
```
See more info
[here](http://stackoverflow.com/questions/5828324/update-git-submodule-to-latest-commit-on-origin).

