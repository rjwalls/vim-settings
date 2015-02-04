vim-settings
============

Update submodules:
```
git submodule foreach git pull origin master
```
See more info
[here](http://stackoverflow.com/questions/5828324/update-git-submodule-to-latest-commit-on-origin).


Uninstall bundles:
```bash
git submodule deinit bundle/vim-rvm
git rm bundle/vim-rvm
#git rm --cached bundle/vim-rvm
rm -rf .git/modules/bundle/vim-rvm
```
