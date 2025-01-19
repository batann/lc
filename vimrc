

"###   LC - Startup Page

fun! Start()
    " Exit conditions
    if argc() || line2byte('$') != -1 || v:progname !~? '^[-gmnq]\=vim\=x\=\%[\.exe]$' || &insertmode
        return
    endif

    " Create a new buffer and clear it
    enew
    call setline(1, []) " Clear content explicitly

    " Set buffer options
    setlocal bufhidden=wipe buftype=nofile nobuflisted nocursorcolumn nocursorline nolist nonumber noswapfile norelativenumber

    " Add Taskwarrior tasks
    call append('$', "### Current Tasks ###")
    let tasks = split(system('task'), '\n')
    for line in tasks
        call append('$', '  >>>          ' . line)
    endfor

    " Add a separator
    call append('$', '')
    call append('$', "### Recently Modified Files ###")

    " Get the five most recently modified files
    let files = split(system("find ~/ -maxdepth 1 -type f -printf '%T@ %p\n' | sort -n -r | head -n 5 | cut -d' ' -f2-"), '\n')
    let file_number = 1
    for file in files
        if file != ''
            call append('$', printf("  [%d] %s", file_number, file))
            let file_number += 1
        endif
    endfor

    " Add a note
    call append('$', '')
    call append('$', "### Press the file number to edit ###")

    " Make buffer read-only
    setlocal nomodifiable nomodified

    " Add mappings to open the files
    for i in range(1, len(files))
        let file = files[i - 1]
        exec printf("nnoremap <buffer><silent> %d :e %s<CR>", i, file)
    endfor

    " Add key mappings for creating a new buffer
    nnoremap <buffer><silent> e :enew<CR>
    nnoremap <buffer><silent> i :enew <bar> startinsert<CR>
    nnoremap <buffer><silent> o :enew <bar> startinsert<CR>
endfun

augroup StartPage
    autocmd!
    autocmd VimEnter * call Start()
augroup END



"###   COMMON CONFIGS


set wildmode=longest,list,full
set wildmenu

if filereadable("/etc/vim/vimrc.local")
		source /etc/vim/vimrc.local
	endif

	if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

if filereadable("/etc/vim/vimrc.local")
		source /etc/vim/vimrc.local
	endif
 if exists('$TMUX')  " Support resizing in tmux
   set ttymouse=xterm2
   endif

"###   LEADER MAPPINGS   #################################
let mapleader = ","
nnoremap <Leader>te :terminal<CR>				
nnoremap <Leader>tc :terminal<CR>sudo -u batan bash $HOME/check/vim.cmd.sh <CR>			
nnoremap <Leader>xc :w !xclip -selection clipboard<CR>	"copy page to clipboard
nnoremap <leader>dd :Lexplore %:p:h<CR>		"open netrw in 20% of the screen to teh left
nnoremap <Leader>da :Lexplore<CR>		
nnoremap <leader>vv :split $MYVIMRC<CR>		"edit vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>	"source vimrc
nnoremap <leader>ra :<C-U>RangerChooser<CR>
nmap <F8> :TagbarToggle<CR>				"tagbar toggle
"###   TABLE MODE   #######################################
let g:table_mode_always_active= 1
let g:table_mode_tablesize_map='<Leader>tt'
let g:table_mode_tablesize_op_map='<Leader>T'
"###   AMY CONFIG   #######################################
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <C-space> ?
"" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>
"" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
"" Close the current buffer
"map <leader>bd :Bclose<cr>:tabclose<cr>gT
"" Close all the buffers
"map <leader>ba :bufdo bd<cr>
"map <leader>l :bnext<cr>
"map <leader>h :bprevious<cr>
"" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove
"map <leader>t<leader> :tabnext<cr>
"" Let 'tl' toggle between this and the last accessed tab
"let g:lasttab = 1
"nmap <leader>tl :exe "tabn ".g:lasttab<CR>
"au TabLeave * let g:lasttab = tabpagenr()



" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
"map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/
" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>
" Specify the behavior when switching between buffers
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry

" Return to last edit position when opening files (You want this!)
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
 "Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
"
" "HELPER FUNCTUN
" function! HasPaste()
"    if &paste
"        return 'PASTE MODE  '
"    endif
"    return ''
"endfunction


" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

syntax on
filetype plugin indent on
set laststatus=2
set so=7
set foldcolumn=1
set encoding=utf8
set ffs=unix,dos
set cmdheight=1
set hlsearch
set lazyredraw
set magic
set showmatch
set mat=2
set foldcolumn=1
set encoding=utf8
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set nobackup
set nowb
set nocp
set autowrite
set hidden
set mouse=a
set noswapfile
set nu
set relativenumber
set t_Co=256
set cursorcolumn
set cursorline
set ruler
set scrolloff=10

let g:netrw_menu = 1
let g:netrw_preview = 1
let g:netrw_winsize = 20
let g:netrw_banner = 0
let g:netrw_lifestyle = 1
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4

"#############          GOOGLE CALENDAR TASK      ########################


"let g:calendar_google_calendar = 0
"let g:calendar_google_task = 0
"#source ~/.cache/calendar.vim/credentials.vim


"### VimWiki SHow Last Modified files in menu   ##############################
"function! ShowLastAccessedFiles()
"    let files = systemlist('ls -lt | head -n 5 | awk \'{print $9}\'')
"    let file_list = ['Last Accessed Files:']
"    for file in files
"        call add(file_list, '- ' . file)
"    endfor
"    return join(file_list, "\n")
"endfunction

"command! LastAccessedFiles echo ShowLastAccessedFiles()
"###################		NOTES		######################################
" Map <Leader>nn to open a specific file in a specific directory with dynamic naming
nnoremap <Leader>nn :call OpenSpecificFile()<CR>
" Function to open the specified file
function! OpenSpecificFile()
  " Set the base directory
  let s:directory = '10/notes'
  " Generate the filename based on the specified pattern with an incrementing counter
  let s:filename = 'note.' . strftime('%j.') . printf('%02d', s:getCounter()) . '.wiki'
  " Construct the full path
  let s:fullpath = expand('~/' . s:directory . '/' . s:filename)
  " Open the file
  execute 'edit ' . s:fullpath
  " Increment the counter for the next file
  call s:incrementCounter()
endfunction
" Function to get the counter from a file or initialize it
function! s:getCounter() abort
  let s:counterFile = expand('~/.vim_note_counter')
  let s:counter = filereadable(s:counterFile) ? system('cat ' . s:counterFile) : 0
  return s:counter
endfunction
" Function to increment and save the counter
function! s:incrementCounter() abort
  let s:counter = s:getCounter() + 1
  call writefile([s:counter], s:counterFile)
endfunction
" If you add this code to the .vimrc, ranger can be started using the command
" ":RangerChooser" or the keybinding "<leader>r".  Once you select one or more
" files, press enter and ranger will quit again and vim will open the selected
" files.

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !xterm -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <leader>ra :<C-U>RangerChooser<CR>



"###################		TEMPLATES		################################
autocmd! BufNewFile *.sh 0r ~/.vim/templates/sklt.sh
autocmd! BufNewFile *popup.html 0r ~/.vim/templates/popup.html
autocmd! BufNewFile *popup.css 0r ~/.vim/templates/popup.css
autocmd! BufNewFile *popup.js 0r ~/.vim/templates/popup.js
autocmd! BufNewFile *.sh 0r ~/.vim/templates/sklt.t.sh
autocmd! BufNewFile *.html 0r ~/.vim/templates/sklt.html
autocmd! BufNewFile *.txt 0r ~/.vim/templates/sklt.txt
autocmd! BufNewFile *.w.wiki 0r ~/.vim/templates/sklt.w.wiki
autocmd! BufNewFile /home/batan/.config/reminder/*.rem 0r ~/.vim/templates/sklt.rem | normal! 11G| +START
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  augroup END
endif " has autocmd


command! -nargs=0 T3 :call T3CreateTemplate()

function! T3CreateTemplate()
    let g:header1 = input('Enter value for Header 1: ')
    let g:header2 = input('Enter value for Header 2: ')
    let g:header3 = input('Enter value for Header 3: ')

    execute "normal! i+=================================+\r"
    execute "normal! i|LC-Linux Solutions Rule the World|\r"
    execute "normal! i+----------+-----------+----------+\r"
    execute "normal! i|".g:header1."|".g:header2."|".g:header3."|\r"
    execute "normal! i|----------|----------|----------|\r"
    execute "normal! i|          |          |          |\r"
endfunction


" default task report type
let g:task_report_name     = 'next'
" custom reports have to be listed explicitly to make them available
let g:task_report_command  = []
" whether the field under the cursor is highlighted
let g:task_highlight_field = 1
" can not make change to task data when set to 1
let g:task_readonly        = 0
" vim built-in term for task undo in gvim
let g:task_gui_term        = 1
" allows user to override task configurations. Seperated by space. Defaults to ''
let g:task_rc_override     = 'rc.defaultwidth=999'
" default fields to ask when adding a new task
let g:task_default_prompt  = ['due', 'description']
" whether the info window is splited vertically
let g:task_info_vsplit     = 0
" info window size
let g:task_info_size       = 15
" info window position
let g:task_info_position   = 'belowright'
" directory to store log files defaults to taskwarrior data.location
let g:task_log_directory   = '~/.task'
" max number of historical entries
let g:task_log_max         = '20'
" forward arrow shown on statusline
let g:task_left_arrow      = ' <<'
" backward arrow ...
let g:task_left_arrow      = '>> '
set nocompatible
filetype plugin on
syntax on
let g:vimwiki_list = [{
  \ 'path': '$HOME/10/vimwiki/templates/',
  \ 'template_path': '$HOME/10/vimwiki/templates',
  \ 'template_default': 'default',
  \ 'template_ext': '.html'}]
let g:vimwiki_hl_headers = 1
let wiki_2 = {}
let wiki_2.path = '/home/batan/10/vimwiki/vimwiki2/'
let wiki_2.path_html = '/home/batan/10/vimwiki/vimwiki2_html/'

let wiki_1 = {}
let wiki_1.path = '/home/batan/10/vimwiki/'
let wiki_1.path_html = '/home/batan/10/vimwiki_html/'

let wiki_3 = {}
let wiki_3.path = '/home/batan/10/vimwiki/vimwiki3/'
let wiki_3.path_html = '/home/batan/10/vimwiki/vimwiki3_html/'

let wiki_4 = {}
let wiki_4.path = '/home/batan/10/vimwiki/vimwiki4/'
let wiki_4.path_html = '/home/batan/10/vimwiki/vimwiki4_html/'

let wiki_5 = {}
let wiki_5.path = '/home/batan/10/vimwiki/vimwiki5/'
let wiki_5.path_html = '/home/batan/10/vimwiki/vimwiki5_html/'

let wiki_6 = {}
let wiki_6.path = '/home/batan/10/vimwiki/vimwiki6/'
let wiki_6.path_html = '/home/batan/10/vimwiki/vimwiki6_html/'

let wiki_7 = {}
let wiki_7.path = '/home/batan/10/vimwiki/vimwiki7/'
let wiki_7.path_html = '/home/batan/10/vimwiki/vimwiki7_html/'

let wiki_8 = {}
let wiki_8.path = '/home/batan/10/vimwiki/vimwiki8/'
let wiki_8.path_html = '/home/batan/10/vimwiki/vimwiki8_html/'

let wiki_9 = {}
let wiki_9.path = '/home/batan/10/vimwiki/vimwiki9/'
let wiki_9.path_html = '/home/batan/10/vimwiki/vimwiki9_html/'

let wiki_10 = {}
let wiki_10.path = '/home/batan/10/vimwiki/vimwiki10/'
let wiki_10.path_html = '/home/batan/10/vimwiki/vimwiki10_html/'
let g:vimwiki_list=[wiki_1, wiki_2, wiki_3, wiki_4, wiki_5, wiki_6, wiki_7, wiki_8, wiki_9, wiki_10]
" ###   WORDPROCESSOR   #########################################
func! WordProcessorMode()
 setlocal textwidth=80
 setlocal smartindent
 setlocal spell spelllang=en_us
 setlocal noexpandtab
endfu

com! WP call WordProcessorMode()
"###############################################################

