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
---------------------------------------------------------------------------------------------------
### 快捷鍵使用方法 ###

<F2> 是NerdTree 快捷鍵 Ctrl+ w + [hjkl 左上下右] or Ctrl + w + w 照順序切換
<F8> 是TagBar   快捷鍵 同上
<F3> 是rainbow_levels. 快捷鍵 (快速辨識同區程式碼)


# vimrc setting (vim_gtk)
