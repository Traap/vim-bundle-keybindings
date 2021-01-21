" {{{ bundle-keybindings.vim

if exists('g:loaded_bundle_keybindings')
  finish
endif
let g:loaded_bundle_keybindings=1

" -------------------------------------------------------------------------- }}}
" {{{ Bbye (Buffer Bye) for Vim

if exists('g:loaded_bbye')
  nnoremap <leader>q :Bdelete<cr>
  nnoremap <leader>Q :bufdo :Bdelete<cr>
  nnoremap <leader>X :bdelete<cr>
endif

" -------------------------------------------------------------------------- }}}
" {{{ Calender toggle

nnoremap <leader>cw :call ToggleCalendar()<cr> 

" -------------------------------------------------------------------------- }}}
" {{{ coc -Conquer of Completion 

if exists('g:did_coc_loaded')
  if exists('g:loaded_bundle_coc') 

    " TODO: Remapping the <TAB> conflicts with vimwiki. I 
    " inoremap <silent><expr> <TAB>
    "   \ pumvisible() ? "\<C-n>" :
    "   \ <SID>check_back_space() ? "\<TAB>" :
    "   \ coc#refresh()

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location
    " list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

  endif
endif
" -------------------------------------------------------------------------- }}}
" {{{ Clean trailing whitespace

nnoremap <leader>ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z
nnoremap <leader>wo :%bwipeout<cr>
nnoremap <leader>wr :%s/\r//g<cr>

" -------------------------------------------------------------------------- }}}
" {{{ Delete line and more

"Delete line
map - dd

" Substitute
nnoremap <c-s> :%s/
vnoremap <c-s> :s/

" Map O to :only so that only one view is visable.
nnoremap <silent> <leader>oo :only<cr>

" -------------------------------------------------------------------------- }}}
" {{{ Buffer selection

"  Select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG

" Easier linewise reselection of what you just pasted.
nnoremap <leader>V V`]

" -------------------------------------------------------------------------- }}}
" {{{ Buffer resize 

map <silent><a-h> :vertical resize -1<cr>
map <silent><a-j> :resize +1<cr>
map <silent><a-k> :resize -1<cr>
map <silent><a-l> :vertical resize +1<cr>

" -------------------------------------------------------------------------- }}} {{{ Copy and Paste

if has('nvim')
  " Copy
  nnoremap <silent>cc ggVGg_"+y        " See vaa keybindings below.
  vnoremap <silent>cc "+y

  " Paste
  nnoremap <silent><leader>cv "+p
else
  " Copy
  nnoremap <silent>cc ggVGg_:!xsel --nodetach -i -b<cr>:normal u<cr>
  vnoremap <silent>cc :!xsel --nodetach -i -b<cr>:normal u<cr>

  " Paste
  nnoremap <silent><leader>cv :r!xsel -o -b<cr>
endif

" -------------------------------------------------------------------------- }}}
" {{{ Drag Visual Block

if exists('g:loaded_dragvirtualblocks')
  " Remove any introduced trailing whitespace after moving.
  vmap  <expr>  <LEFT>   DVB_Drag('left')
  vmap  <expr>  <RIGHT>  DVB_Drag('right')
  vmap  <expr>  <DOWN>   DVB_Drag('down')
  vmap  <expr>  <UP>     DVB_Drag('up')
  vmap  <expr>  D        DVB_Duplicate()
  let g:DVB_TrimWS = 1
endif

" -------------------------------------------------------------------------- }}}
" {{{ Display help in vertical buffer.

nnoremap <leader>HH :silent vert bo help<cr>

" -------------------------------------------------------------------------- }}}
" {{{ Docbld

nnoremap <leader>tl :silent Dispatch rake --rakefile ~/git/docbld/Rakefile list_files<cr>:copen<cr>
nnoremap <leader>tb :silent Dispatch rake --rakefile ~/git/docbld/Rakefile texx<cr>:copen<cr>

" -------------------------------------------------------------------------- }}}
" {{{ EasyAlign

if exists('g:loaded_easy_align_plugin')
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)

  " Start interactive EasyAlign in motino/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

  nmap <bar> gaip*<bar>
endif

" -------------------------------------------------------------------------- }}}
" {{{ Execute the current line of text as a shell command.

noremap <leader>E !!$SHELL<cr>

" -------------------------------------------------------------------------- }}}
" {{{ Fix Terminal 

if has('nvim')
  nnoremap <leader>ft :call FixTerminal()<cr>
endif

" -------------------------------------------------------------------------- }}}
" {{{ Fugitive

if exists('g:loaded_fugitive')
  nnoremap <leader>gp :Gpush<cr>
  nnoremap <leader>gc :Gcommit<cr>
  nnoremap <leader>gh :silent vert bo help fugitive<cr>
  nnoremap <leader>gl :Glog<cr>
  nnoremap <leader>gP :Gpull<cr>
  nnoremap <leader>gs :Gstatus<cr>gg<c-n>
  nnoremap <leader>gD :Gvdiff<cr>
endif

" -------------------------------------------------------------------------- }}}
" {{{ Fuzzy file finders

if exists('g:loaded_bundle_fzf') 
  nnoremap <silent> <leader>ff :FZF<CR>
  nnoremap <silent> <leader>fg :FZF ~/git/<CR>
  nnoremap <silent> <leader>fv :FZF ~/git/vim/<CR>
endif

" -------------------------------------------------------------------------- }}}
" {{{ Grammarous

if exists('g:loaded_grammarous')
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
endif

" -------------------------------------------------------------------------- }}}
" {{{ LMGTFY : Let Me Google That For You

if exists('g:loaded_bundle_lmgtfy')
  nnoremap <leader>?    :call LMGTFY(expand("<cWORD>"), 0)<cr>
  nnoremap <leader>!     :call LMGTFY(expand("<cWORD>"), 1)<cr>
  xnoremap <leader>? "gy:call LMGTFY(@g, 0)<cr>gv
  xnoremap <leader>! "gy:call LMGTFY(@g, 1)<cr>gv
endif

" -------------------------------------------------------------------------- }}}
" {{{ Helptags

if exists("g:loaded_helptags")
  noremap<leader>ph :Helptags<cr>:echo 'Helptags done!'<cr>
endif

" -------------------------------------------------------------------------- }}}
" {{{ Indent/dedent/autoindent what you just pasted.

nnoremap <lt>> V`]<
nnoremap ><lt> V`]>
nnoremap =- V`]=

" ------------------------------------------------------------------------- }}}
" {{{ incsearch.vim

if exists('g:loaded_incsearch')
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
endif

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
" {{{ KJV keybindings

nnoremap gk 0mMvg_"ky :exec "r!kjv  -b -d -w 65" getreg("k")<cr>

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
" {{{ PlantUML 

if exists('g:loaded_bundle_plantuml')
  nnoremap <silent><leader>gu :call GenerateUmlDiagram()<cr>
endif

" -------------------------------------------------------------------------- }}}
" {{{ Quicker access to Ex commands and sourcing.

" Disable semicolon to see if I like searching within a line using ;
" nmap ; :
nnoremap <leader>sv :source $MYVIMRC<CR>

" -------------------------------------------------------------------------- }}}
" {{{ Quick editing of my personalization files.

" Vim files.
nnoremap <leader>eb :e ~/git/vim/bootstrap.vim<cr>
nnoremap <leader>ec :e ~/git/ssh/config.vim<cr>
nnoremap <leader>ed :e ~/git/vim/custom-dictionary.utf-8.add<cr>
nnoremap <leader>eg :e ~/git/ssh/gitconfig<cr>
nnoremap <leader>en :e ~/git/vim/nvim.vim<cr>
nnoremap <leader>ep :e ~/git/vim/plug.vim<cr>
nnoremap <leader>et :e ${HOME}/.tmux.conf<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>.  :e.<cr>

" Operating system files.
nnoremap <leader>ma :e ~/git/dotfiles/my_aliases<cr>
nnoremap <leader>mb :e ~/git/dotfiles/bashrc<cr>
nnoremap <leader>mc :e ~/git/dotfiles/my_completions<cr>
nnoremap <leader>me :e ~/git/dotfiles/my_exports<cr>
nnoremap <leader>mf :e ~/git/dotfiles/my_functions<cr>
nnoremap <leader>mp :e ~/git/dotfiles/my_paths<cr>
nnoremap <leader>mt :e ~/git/dotfiles/my_prompt<cr>
nnoremap <leader>mz :e ~/git/dotfiles/bashrc-personal<cr>

" Xwindows files.
nnoremap <leader>xb :e ~/git/dotfiles/bspwmrc<cr>
nnoremap <leader>xs :e ~/git/dotfiles/sxhkdrc<cr>

" -------------------------------------------------------------------------- }}}
" {{{ rspec

if !exists("g:rspec_runner")
  map <leader><leader>t :call RunCurrentSpecFile()<CR>
  map <leader><leader>s :call RunNearestSpec()<CR>
  map <leader><leader>l :call RunLastSpec()<CR>
  map <leader><leader>a :call RunAllSpecs()<CR>
endif

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
" {{{ Tmux Runner

" Below are the suggested Tmux Runner default mappings.  I decided to explicitly
" reference them with defaults before I start changing them.
if exists('g:loaded_bundle_tmux_runner')
  nnoremap <leader>rr  :VtrResizeRunner<cr>
  nnoremap <leader>ror :VtrReorientRunner<cr>
  nnoremap <leader>sc  :VtrSendCommandToRunner<cr>
  nnoremap <leader>sf  :VtrSendFile!<cr>
  nnoremap <leader>sl  :VtrSendLinesToRunner<cr>
  nnoremap <leader>or  :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>
  nnoremap <leader>kr  :VtrKillRunner<cr>
  nnoremap <leader>fr  :VtrFocusRunner<cr>
  nnoremap <leader>dr  :VtrDetachRunner<cr>
  nnoremap <leader>ar  :VtrReattachRunner<cr>
  nnoremap <leader>cr  :VtrClearRunner<cr>
  nnoremap <leader>fc  :VtrFlushCommand<cr>
endif

" -------------------------------------------------------------------------- }}}
" {{{ Tmux Sessions

" Below are the tmux sessions I create and kill frequently.

nnoremap <silent> <leader>tao   :!ao ao<cr>
nnoremap <silent> <leader>tbash :!ao bash<cr>
nnoremap <silent> <leader>tkjv  :!ao kjv<cr>
nnoremap <silent> <leader>tssh  :!ao ssh<cr>
nnoremap <silent> <leader>tsoup :!ao soup<cr>
nnoremap <silent> <leader>tvim  :!ao vim<cr>
nnoremap <silent> <leader>twork :!ao work<cr>

nnoremap <silent> <leader>kao   :!tmux kill-session -t ao<cr>
nnoremap <silent> <leader>kbash :!tmux kill-session -t bash<cr>
nnoremap <silent> <leader>kkjv  :!tmux kill-session -t kjv<cr>
nnoremap <silent> <leader>kssh  :!tmux kill-session -t ssh<cr>
nnoremap <silent> <leader>ksoup :!tmux kill-session -t soup<cr>
nnoremap <silent> <leader>kvim  :!tmux kill-session -t vim<cr>
nnoremap <silent> <leader>kwork :!tmux kill-session -t work<cr>

" -------------------------------------------------------------------------- }}}
" {{{ Toggle Post Buffer

nnoremap <leader>pb :call TogglePostBuffer()<cr>

" -------------------------------------------------------------------------- }}}
" {{{ Toggle search results

noremap <silent><leader><space> :set hlsearch!<CR>

" -------------------------------------------------------------------------- }}}
" {{{ Use shift-key versus control-key when I'm lazy.

" nnoremap B <c-b>
" nnoremap F <c-f>

" -------------------------------------------------------------------------- }}}
" {{{ vim-plug and CocInstall

command! PU PlugUpdate | 
       \ PlugUpgrade | 
       \ CocInstall coc-dictionary, 
       \            coc-json, 
       \            coc-vmitex, 
       \            coc-wod, 
       \            coc-yaml

" -------------------------------------------------------------------------- }}}
" {{{ vim-plug-lookup

nnoremap <silent> <leader>pl    :call PlugLookup(expand("<cWORD>"))<cr>
xnoremap <silent> <leader>pl "gy:call PlugLookup(@g)<cr>gv

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
