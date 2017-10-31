## how to make caps lock a ctrl key
```gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"```

## vim plugins
```
~/.vim/pack/anton/start
$ for plugin in *; do cd $plugin; printf "%-30s" "$plugin:"; git remote -v | sed 's/ /\t/' | cut -f 2 | uniq ; cd ..; done
cscope.vim:                   https://github.com/brookhong/cscope.vim
editorconfig-vim:             https://github.com/editorconfig/editorconfig-vim.git
linediff.vim:                 https://github.com/AndrewRadev/linediff.vim.git
ReplaceWithRegister:          https://github.com/vim-scripts/ReplaceWithRegister.git
vim-autoformat:               https://github.com/Chiel92/vim-autoformat.git
vim-commentary:               git://github.com/tpope/vim-commentary.git
vim-cpp-enhanced-highlight:   https://github.com/octol/vim-cpp-enhanced-highlight.git
vim-dispatch:                 https://github.com/tpope/vim-dispatch.git
vim-editqf:                   https://github.com/jceb/vim-editqf.git
vim-fugitive:                 https://github.com/tpope/vim-fugitive.git
vim-go:                       https://github.com/fatih/vim-go.git
vim-indent-object:            http://github.com/michaeljsmith/vim-indent-object
vim-repeat:                   https://github.com/tpope/vim-repeat
vim-sensible:                 https://github.com/tpope/vim-sensible.git
vim-surround:                 https://github.com/tpope/vim-surround.git
vim-unimpaired:               git://github.com/tpope/vim-unimpaired.git
YouCompleteMe:                https://github.com/Valloric/YouCompleteMe.git
```
