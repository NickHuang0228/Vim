# Vim# This is belong to nickhuang vimrc setting modify at 2021/07/19 #

Install Vundle: 

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

---------------------------------------------------------------------------------------------------


'Following the Below '(for linux)

'這是為了確保在linux 下同時運作Kite and Auto-pairs 按Backspace時不會出現AutopairsDelete()'

輸入 ： let g:AutoPairsMapBS = 0
---------------------------------------------------------------------------------------------------
'Following the Below ' (for Windows)

'Windows 特別git bash [ctags] 無法使用 可以把ctags.exe 放在git_bash 資料夾內'

ex : C:\\Program Files\\Git\\usr\\bin\\ctags.exe


'Add tmux'
安裝msys2.exe 
In a msys2 window, use Pacman to install tmux (pacman -S tmux).
Copy tmux and msys-event binaries from msys2 bin folder (probably C:\msys64\usr\bin) to git bash bin folder (probably C:\Program Files\Git\usr\bin).


'Python Bug'
設定Git bash開啟python 默認 : python -i 
可以到 ~/.bashrc 裡面 設定 alias python = 'python -i' 就可以用python 了

'Install C++ Setting'
安裝mingw 後 Path 記得加 : $ export PATH=/c/MinGW/bin:$PATH
---------------------------------------------------------------------------------------------------
### 快捷鍵使用方法 ###

<F2> 是NerdTree 快捷鍵 Ctrl+ w + [hjkl 左上下右] or Ctrl + w + w 照順序切換
<F8> 是TagBar   快捷鍵 同上
<F3> 是rainbow_levels. 快捷鍵 (快速辨識同區程式碼)


# vimrc setting (vim_gtk)



