" {{{ bundle-keybindings.vim
if exists('g:loaded_bundle_keybindings')
  finish
endif
let g:loaded_bundle_keybindings=1
" -------------------------------------------------------------------------- }}}
" {{{ Bbye (Buffer Bye) for Vim
nnoremap <leader>q :Bdelete<cr>
nnoremap <leader>Q :bufdo :Bdelete<cr>
nnoremap <leader>X :bdelete<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Clean trailing whitespace
nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z
nnoremap <leader>wo :%bwipeout<cr>
nnoremap <leader>wr :%s/\r//g<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Delete line and more
"Delete line
map - dd

" Save file
noremap s :w<cr>

" Reformat lines.
vnoremap Q gq

" Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/

" Map O to :only so that only one view is visable.
nnoremap <silent> O :only<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Buffer resize
map <m-h> :vertical resize -1<cr>
map <m-j> :resize +1<cr>
map <m-k> :resize -1<cr>
map <m-l> :vertical resize +1<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Copy and Paste
if has('nvim')
  " Copy
  nnoremap <silent>cc ggVGg_"+y        " See vaa keybindings below.
  vnoremap <silent>cc "+y

  " Paste
  nnoremap <silent>cv "+p
else
  " Copy
  nnoremap <silent>cc ggVGg_:!xsel --nodetach -i -b<cr>:normal u<cr>
  vnoremap <silent>cc :!xsel --nodetach -i -b<cr>:normal u<cr>

  " Paste
  nnoremap <silent>cv :r!xsel -o -b<cr>
 endif
" -------------------------------------------------------------------------- }}}
" {{{ Drag Visual Block
" Remove any introduced trailing whitespace after moving.
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
let g:DVB_TrimWS = 1
" -------------------------------------------------------------------------- }}}
" {{{ Display help in vertical buffer.
nnoremap <leader>HH :silent vert bo help<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Docbld
nnoremap <leader>tl :silent Dispatch rake --rakefile ~/git/docbld/Rakefile list_files<cr>:copen<cr>
nnoremap <leader>tb :silent Dispatch rake --rakefile ~/git/docbld/Rakefile texx<cr>:copen<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]
" -------------------------------------------------------------------------- }}}
" {{{ EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign in motino/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nmap <bar> gaip*<bar>
" -------------------------------------------------------------------------- }}}
" {{{ Execute the current line of text as a shell command.
noremap <leader>E !!$SHELL<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Fugitive
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gh :silent vert bo help fugitive<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gP :Gpull<cr>
nnoremap <leader>gs :Gstatus<cr>gg<c-n>
nnoremap <leader>gD :Gvdiff<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Fuzzy file finders
if has('unix')
  nnoremap <silent> <leader>ff :FZF<CR>
endif
" -------------------------------------------------------------------------- }}}
" {{{ Grammarous
nnoremap <leader>gC <plug>(grammarous-close-info-window)
nnoremap <leader>ge <plug>(grammarous-move-to-next-error)
nnoremap <leader>ge <plug>(grammarous-move-to-previous-error)
nnoremap <leader>gF <plug>(grammarous-fixall)
nnoremap <leader>gf <plug>(grammarous-fixit)
nnoremap <leader>gg :GrammarousCheck<cr>
nnoremap <leader>gM <plug>(grammarous-move-to-info-window)
nnoremap <leader>gm <plug>(grammarous-open-info-window)
nnoremap <leader>gR <plug>(grammarous-remove-error)
nnoremap <leader>gr <plug>(grammarous-reset)
nnoremap <leader>gx <plug>(grammarous-disable-rule)
" -------------------------------------------------------------------------- }}}
" {{{ LMGTFY : Let Me Google That For You
nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>? "gy:call <SID>goog(@g, 0)<cr>gv
xnoremap <leader>! "gy:call <SID>goog(@g, 1)<cr>gv
" -------------------------------------------------------------------------- }}}
" {{{ github-issues
nnoremap <leader>gi :Gissues<cr>
nnoremap <leader>ga :Giadd<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Helptags
noremap<leader>ph :Helptags<cr>:echo 'Helptags done!'<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Indent/dedent/autoindent what you just pasted.
nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=
" ------------------------------------------------------------------------- }}}
" {{{ incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
" -------------------------------------------------------------------------- }}}
" {{{ Insert Mode Completion
inoremap <c-]> <c-x><c-]>
inoremap <c-f> <c-x><c-f>
inoremap <c-l> <c-x><c-l>
" -------------------------------------------------------------------------- }}}
" {{{ Join line
" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Join an entire paragraph
nnoremap <leader>J myvipJ`ygq<CR>
" -------------------------------------------------------------------------- }}}
" {{{ Marks and Quotes
" noremap ' `
" noremap æ '
" noremap ` <C-^>
" -------------------------------------------------------------------------- }}}
" {{{ NERDtree
nnoremap <silent><leader>nf :NERDTreeFind<CR>
nnoremap <silent><C-n> :NERDTreeToggle<CR>
" -------------------------------------------------------------------------- }}}
" {{{ Quicker access to Ex commands and sourcing.
nmap ; :
nnoremap <leader>sv :source $MYVIMRC<CR>
" -------------------------------------------------------------------------- }}}
" {{{ Quick editing of my personalization files.
nnoremap <leader>ea :e ~/git/dotfiles/alias_and_functions<cr>
nnoremap <leader>eg :e ~/git/ssh/gitconfig<cr>
nnoremap <leader>ec :e ~/git/ssh/config.vim<cr>
nnoremap <leader>et :e ${HOME}/.tmux.conf<cr>
nnoremap <leader>ed :e ~/git/vim/custom-dictionary.utf-8.add<cr>
nnoremap <leader>ep :e ~/git/vim/plug.vim<cr>
nnoremap <leader>es :e ~/git/vim/settings.vim<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>.  :e.<cr>

nnoremap <leader>ma :e ~/git/dotfiles/my_aliases<cr>
nnoremap <leader>mc :e ~/git/dotfiles/my_completions<cr>
nnoremap <leader>me :e ~/git/dotfiles/my_exports<cr>
nnoremap <leader>mf :e ~/git/dotfiles/my_functions<cr>
nnoremap <leader>mp :e ~/git/dotfiles/my_paths<cr>
nnoremap <leader>mt :e ~/git/dotfiles/my_prompt<cr>
" -------------------------------------------------------------------------- }}}
" {{{ rspec
map <leader><leader>t :call RunCurrentSpecFile()<CR>
map <leader><leader>s :call RunNearestSpec()<CR>
map <leader><leader>l :call RunLastSpec()<CR>
map <leader><leader>a :call RunAllSpecs()<CR>
" -------------------------------------------------------------------------- }}}
" {{{ Select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_
" -------------------------------------------------------------------------- }}}
" {{{ Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG
" -------------------------------------------------------------------------- }}}
" {{{ Source lines
vnoremap <leader>S y:@"<CR>
nnoremap <leader>S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Sort lines
nnoremap <leader>s vip:!sort<cr>
vnoremap <leader>s :!sort<cr>
vnoremap <leader>u :sort u<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Split line (sister to [J]oin lines)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w
" -------------------------------------------------------------------------- }}}
" {{{ Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Toggle search results
noremap <silent><leader><space> :set hlsearch!<CR>
" -------------------------------------------------------------------------- }}}
" {{{ Use shift-key versus control-key when I'm lazy.
nnoremap B <c-b>
nnoremap F <c-f>
" -------------------------------------------------------------------------- }}}
" {{{ Wipeout all buffers.
nnoremap ]w :call Wipeout()<cr>
" -------------------------------------------------------------------------- }}}
" {{{ Yank visually selected test and search for it in any file.
vnoremap _g y:exe "grep /. escape(@", '\\/') . "/ *.*"<cr>
" ------------------------------------------------------------------------- }}}
" {{{ Zoom to head level.
nnoremap zh mzzt10<c-u>
" -------------------------------------------------------------------------- }}}
