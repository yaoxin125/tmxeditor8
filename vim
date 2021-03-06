.vimrc                                                                                              000644  000765  000024  00000004400 13303524470 013100  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         set confirm
set autowrite
set history=100
set fenc=utf-8
if has("syntax")
syntax on
syntax enable
endif
"colorscheme ron
"设置行号
set nu
"设置缩进
set tabstop=4
set sts=4
set smartindent
set expandtab
set softtabstop=4
set shiftwidth=4
"设置自动格式化（格式出问题就删掉这行）
"set formatoptions=tcrqn
"设置括号配对情况
set showmatch
set matchtime=2
"设置没有自动备份
set noswapfile
"set nobackup
"设置纵向虚线对齐
"底部显示光标的位置的状态行
set ruler
"设置查找
"搜索模式忽略大小写
set ignorecase
"如果搜索模式包含大小写则不适用ignorecase
set smartcase
"启动循环搜索
set wrapscan
"高亮显示搜索到的文本
set hlsearch
"逐字符高亮
"set incsearch
"使用鼠标
"按住 shift 才由鼠标右键处理操作
set mouse=a
"和系统共用剪贴板
set clipboard+=unnamed
"突出显示当前行
"set cursorline
"开启折叠，并设置空格来开关折叠
"set foldenable
"set foldmethod=syntax
"set foldcolumn=0
"setlocal foldlevel=1
"set foldclose=all
"nnoremap 《space》 @=（（foldclosed（line（‘。’））《0）？‘zc’：‘zo’）《CR》
"搜索和undo时不展开设置好的折叠
"set foldopen-=search
"set foldopen-=undo
"set autochdir
colorscheme desert
set nocompatible
filetype on
filetype plugin indent on
"nnoremap <silent> <F8> :TlistToggle<CR>
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:miniBufExplMapWindowNavVim=1
nmap <F2> :WMToggle <CR>
nmap <F9> :bp <CR>
nmap <F10> :bn <CR>
nnoremap <silent> <F3> :Rgrep<CR>
let g:NERDTreeChDirMode = 2 
let g:ctrlp_working_path_mode = 'rw' 

function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
       return "\<Tab>"
    else
       return "\<C-N>"
   endif
endfunction
vmap <Tab> <S-i> <Tab> <Esc>
inoremap <Tab> <C-R>=CleverTab()<CR>

function! PrintStatement() range
    let key = getreg("a")
    let filename = substitute(expand("%"),".*/","","")
    let a = "print(\"vimprint>>".filename.":".line(".")." ".key.":\",".key.")"
    call append(line("."),a)
endfunction

vmap <F4> "ay <Esc> :call PrintStatement() <CR> j<S-$>
set backspace=2
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
vmap <C-x> :!pbcopy<CR>   
vmap <C-c> :w !pbcopy<CR><CR>
map <F6> :BufExplorer<CR>
                                                                                                                                                                                                                                                                .vim/                                                                                               000755  000765  000024  00000000000 13211171044 012623  5                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         .vim/.netrwhist                                                                                     000644  000765  000024  00000000125 13211167570 014662  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         let g:netrw_dirhistmax  =10
let g:netrw_dirhist_cnt =1
let g:netrw_dirhist_1='/root'
                                                                                                                                                                                                                                                                                                                                                                                                                                           .vim/plugin/                                                                                        000755  000765  000024  00000000000 13211207261 014122  5                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         .vim/doc/                                                                                           000755  000765  000024  00000000000 13147505652 013406  5                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         .vim/autoload/                                                                                      000755  000765  000024  00000000000 13147505620 014444  5                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         .vim/syntax/                                                                                        000755  000765  000024  00000000000 13147473735 014175  5                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         .vim/syntax/config.vim                                                                              000644  000765  000024  00000003701 12761632222 016145  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:		configure.in script: M4 with sh
" Maintainer:	Christian Hammesr <ch@lathspell.westend.com>
" Last Change:	2015 Jan 14
" 				(patch from Yngve Inntjore Levinsen to detect AC_MSG)
" 				(patch from Khym Chanur to add @Spell)

" Well, I actually even do not know much about m4. This explains why there
" is probably very much missing here, yet !
" But I missed good highlighting when editing my GNU autoconf/automake
" script, so I wrote this quick and dirty patch.


" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" define the config syntax
syn match   configdelimiter "[()\[\];,]"
syn match   configoperator  "[=|&\*\+\<\>]"
syn match   configcomment   "\(dnl.*\)\|\(#.*\)" contains=configDnl,@Spell
syn match   configfunction  "\<[A-Z_][A-Z0-9_]*\>"
syn match   confignumber    "[-+]\=\<\d\+\(\.\d*\)\=\>"
syn keyword configDnl   	dnl contained
syn keyword configkeyword   if then else fi test for in do done
syn keyword configspecial   cat rm eval

" This shortens the script, see syn-ext-match..
syn region  configstring    start=+\z(["'`]\)+ skip=+\\\z1+ end=+\z1+ contains=@Spell

" Anything inside AC_MSG_TYPE([...])  and AC_MSG_TYPE(...) is a string.
syn region  configstring matchgroup=configfunction start="AC_MSG_[A-Z]*\ze(\[" matchgroup=configdelimiter end="\])" contains=configdelimiter,@Spell
syn region  configstring matchgroup=configfunction start="AC_MSG_[A-Z]*\ze([^[]" matchgroup=configdelimiter end=")" contains=configdelimiter,@Spell

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link configdelimiter Delimiter
hi def link configoperator  Operator
hi def link configcomment   Comment
hi def link configDnl  	 Comment
hi def link configfunction  Function
hi def link confignumber    Number
hi def link configkeyword   Keyword
hi def link configspecial   Special
hi def link configstring    String


let b:current_syntax = "config"

" vim: ts=4
                                                               .vim/syntax/javascript.vim                                                                          000644  000765  000024  00000011625 12761632536 017062  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:	JavaScript
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" Updaters:	Scott Shattuck (ss) <ss@technicalpursuit.com>
" URL:		http://www.fleiner.com/vim/syntax/javascript.vim
" Changes:	(ss) added keywords, reserved words, and other identifiers
"		(ss) repaired several quoting and grouping glitches
"		(ss) fixed regex parsing issue with multiple qualifiers [gi]
"		(ss) additional factoring of keywords, globals, and members
" Last Change:	2012 Oct 05
" 		2013 Jun 12: adjusted javaScriptRegexpString (Kevin Locke)

" tuning parameters:
" unlet javaScript_fold

if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
elseif exists("b:current_syntax") && b:current_syntax == "javascript"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim


syn keyword javaScriptCommentTodo      TODO FIXME XXX TBD contained
syn match   javaScriptLineComment      "\/\/.*" contains=@Spell,javaScriptCommentTodo
syn match   javaScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  javaScriptComment	       start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo
syn match   javaScriptSpecial	       "\\\d\d\d\|\\."
syn region  javaScriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=javaScriptSpecial,@htmlPreproc
syn region  javaScriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=javaScriptSpecial,@htmlPreproc

syn match   javaScriptSpecialCharacter "'\\.'"
syn match   javaScriptNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  javaScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gim]\{0,2\}\s*$+ end=+/[gim]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline

syn keyword javaScriptConditional	if else switch
syn keyword javaScriptRepeat		while for do in
syn keyword javaScriptBranch		break continue
syn keyword javaScriptOperator		new delete instanceof typeof
syn keyword javaScriptType		Array Boolean Date Function Number Object String RegExp
syn keyword javaScriptStatement		return with
syn keyword javaScriptBoolean		true false
syn keyword javaScriptNull		null undefined
syn keyword javaScriptIdentifier	arguments this var let
syn keyword javaScriptLabel		case default
syn keyword javaScriptException		try catch finally throw
syn keyword javaScriptMessage		alert confirm prompt status
syn keyword javaScriptGlobal		self window top parent
syn keyword javaScriptMember		document event location 
syn keyword javaScriptDeprecated	escape unescape
syn keyword javaScriptReserved		abstract boolean byte char class const debugger double enum export extends final float goto implements import int interface long native package private protected public short static super synchronized throws transient volatile 

if exists("javaScript_fold")
    syn match	javaScriptFunction	"\<function\>"
    syn region	javaScriptFunctionFold	start="\<function\>.*[^};]$" end="^\z1}.*$" transparent fold keepend

    syn sync match javaScriptSync	grouphere javaScriptFunctionFold "\<function\>"
    syn sync match javaScriptSync	grouphere NONE "^}"

    setlocal foldmethod=syntax
    setlocal foldtext=getline(v:foldstart)
else
    syn keyword javaScriptFunction	function
    syn match	javaScriptBraces	   "[{}\[\]]"
    syn match	javaScriptParens	   "[()]"
endif

syn sync fromstart
syn sync maxlines=100

if main_syntax == "javascript"
  syn sync ccomment javaScriptComment
endif

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link javaScriptComment		Comment
hi def link javaScriptLineComment		Comment
hi def link javaScriptCommentTodo		Todo
hi def link javaScriptSpecial		Special
hi def link javaScriptStringS		String
hi def link javaScriptStringD		String
hi def link javaScriptCharacter		Character
hi def link javaScriptSpecialCharacter	javaScriptSpecial
hi def link javaScriptNumber		javaScriptValue
hi def link javaScriptConditional		Conditional
hi def link javaScriptRepeat		Repeat
hi def link javaScriptBranch		Conditional
hi def link javaScriptOperator		Operator
hi def link javaScriptType			Type
hi def link javaScriptStatement		Statement
hi def link javaScriptFunction		Function
hi def link javaScriptBraces		Function
hi def link javaScriptError		Error
hi def link javaScrParenError		javaScriptError
hi def link javaScriptNull			Keyword
hi def link javaScriptBoolean		Boolean
hi def link javaScriptRegexpString		String

hi def link javaScriptIdentifier		Identifier
hi def link javaScriptLabel		Label
hi def link javaScriptException		Exception
hi def link javaScriptMessage		Keyword
hi def link javaScriptGlobal		Keyword
hi def link javaScriptMember		Keyword
hi def link javaScriptDeprecated		Exception 
hi def link javaScriptReserved		Keyword
hi def link javaScriptDebug		Debug
hi def link javaScriptConstant		Label


let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
                                                                                                           .vim/syntax/java.vim                                                                                000644  000765  000024  00000043073 12761633400 015626  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:	Java
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" URL:		http://www.fleiner.com/vim/syntax/java.vim
" Last Change:	2015 March 01

" Please check :help java.vim for comments on some of the options available.

" quit when a syntax file was already loaded
if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  " we define it here so that included files can test for it
  let main_syntax='java'
  syn region javaFold start="{" end="}" transparent fold
endif

let s:cpo_save = &cpo
set cpo&vim

" some characters that cannot be in a java program (outside a string)
syn match javaError "[\\@`]"
syn match javaError "<<<\|\.\.\|=>\|||=\|&&=\|\*\/"

syn match javaOK "\.\.\."

" use separate name so that it can be deleted in javacc.vim
syn match   javaError2 "#\|=<"
hi def link javaError2 javaError



" keyword definitions
syn keyword javaExternal	native package
syn match javaExternal		"\<import\>\(\s\+static\>\)\?"
syn keyword javaError		goto const
syn keyword javaConditional	if else switch
syn keyword javaRepeat		while for do
syn keyword javaBoolean		true false
syn keyword javaConstant	null
syn keyword javaTypedef		this super
syn keyword javaOperator	new instanceof
syn keyword javaType		boolean char byte short int long float double
syn keyword javaType		void
syn keyword javaStatement	return
syn keyword javaStorageClass	static synchronized transient volatile final strictfp serializable
syn keyword javaExceptions	throw try catch finally
syn keyword javaAssert		assert
syn keyword javaMethodDecl	synchronized throws
syn keyword javaClassDecl	extends implements interface
" to differentiate the keyword class from MyClass.class we use a match here
syn match   javaTypedef		"\.\s*\<class\>"ms=s+1
syn keyword javaClassDecl	enum
syn match   javaClassDecl	"^class\>"
syn match   javaClassDecl	"[^.]\s*\<class\>"ms=s+1
syn match   javaAnnotation	"@\([_$a-zA-Z][_$a-zA-Z0-9]*\.\)*[_$a-zA-Z][_$a-zA-Z0-9]*\>\(([^)]*)\)\=" contains=javaString
syn match   javaClassDecl	"@interface\>"
syn keyword javaBranch		break continue nextgroup=javaUserLabelRef skipwhite
syn match   javaUserLabelRef	"\k\+" contained
syn match   javaVarArg		"\.\.\."
syn keyword javaScopeDecl	public protected private abstract

if exists("java_highlight_java_lang_ids")
  let java_highlight_all=1
endif
if exists("java_highlight_all")  || exists("java_highlight_java")  || exists("java_highlight_java_lang") 
  " java.lang.*
  syn match javaLangClass "\<System\>"
  syn keyword javaR_JavaLang NegativeArraySizeException ArrayStoreException IllegalStateException RuntimeException IndexOutOfBoundsException UnsupportedOperationException ArrayIndexOutOfBoundsException ArithmeticException ClassCastException EnumConstantNotPresentException StringIndexOutOfBoundsException IllegalArgumentException IllegalMonitorStateException IllegalThreadStateException NumberFormatException NullPointerException TypeNotPresentException SecurityException
  syn cluster javaTop add=javaR_JavaLang
  syn cluster javaClasses add=javaR_JavaLang
  hi def link javaR_JavaLang javaR_Java
  syn keyword javaC_JavaLang Process RuntimePermission StringKeySet CharacterData01 Class ThreadLocal ThreadLocalMap CharacterData0E Package Character StringCoding Long ProcessImpl ProcessEnvironment Short AssertionStatusDirectives 1PackageInfoProxy UnicodeBlock InheritableThreadLocal AbstractStringBuilder StringEnvironment ClassLoader ConditionalSpecialCasing CharacterDataPrivateUse StringBuffer StringDecoder Entry StringEntry WrappedHook StringBuilder StrictMath State ThreadGroup Runtime CharacterData02 MethodArray Object CharacterDataUndefined Integer Gate Boolean Enum Variable Subset StringEncoder Void Terminator CharsetSD IntegerCache CharacterCache Byte CharsetSE Thread SystemClassLoaderAction CharacterDataLatin1 StringValues StackTraceElement Shutdown ShortCache String ConverterSD ByteCache Lock EnclosingMethodInfo Math Float Value Double SecurityManager LongCache ProcessBuilder StringEntrySet Compiler Number UNIXProcess ConverterSE ExternalData CaseInsensitiveComparator CharacterData00 NativeLibrary
  syn cluster javaTop add=javaC_JavaLang
  syn cluster javaClasses add=javaC_JavaLang
  hi def link javaC_JavaLang javaC_Java
  syn keyword javaE_JavaLang IncompatibleClassChangeError InternalError UnknownError ClassCircularityError AssertionError ThreadDeath IllegalAccessError NoClassDefFoundError ClassFormatError UnsupportedClassVersionError NoSuchFieldError VerifyError ExceptionInInitializerError InstantiationError LinkageError NoSuchMethodError Error UnsatisfiedLinkError StackOverflowError AbstractMethodError VirtualMachineError OutOfMemoryError
  syn cluster javaTop add=javaE_JavaLang
  syn cluster javaClasses add=javaE_JavaLang
  hi def link javaE_JavaLang javaE_Java
  syn keyword javaX_JavaLang CloneNotSupportedException Exception NoSuchMethodException IllegalAccessException NoSuchFieldException Throwable InterruptedException ClassNotFoundException InstantiationException
  syn cluster javaTop add=javaX_JavaLang
  syn cluster javaClasses add=javaX_JavaLang
  hi def link javaX_JavaLang javaX_Java

  hi def link javaR_Java javaR_
  hi def link javaC_Java javaC_
  hi def link javaE_Java javaE_
  hi def link javaX_Java javaX_
  hi def link javaX_		     javaExceptions
  hi def link javaR_		     javaExceptions
  hi def link javaE_		     javaExceptions
  hi def link javaC_		     javaConstant

  syn keyword javaLangObject clone equals finalize getClass hashCode
  syn keyword javaLangObject notify notifyAll toString wait
  hi def link javaLangObject		     javaConstant
  syn cluster javaTop add=javaLangObject
endif

if filereadable(expand("<sfile>:p:h")."/javaid.vim")
  source <sfile>:p:h/javaid.vim
endif

if exists("java_space_errors")
  if !exists("java_no_trail_space_error")
    syn match	javaSpaceError	"\s\+$"
  endif
  if !exists("java_no_tab_space_error")
    syn match	javaSpaceError	" \+\t"me=e-1
  endif
endif

syn region  javaLabelRegion	transparent matchgroup=javaLabel start="\<case\>" matchgroup=NONE end=":" contains=javaNumber,javaCharacter,javaString
syn match   javaUserLabel	"^\s*[_$a-zA-Z][_$a-zA-Z0-9_]*\s*:"he=e-1 contains=javaLabel
syn keyword javaLabel		default

" highlighting C++ keywords as errors removed, too many people find it
" annoying.  Was: if !exists("java_allow_cpp_keywords")

" The following cluster contains all java groups except the contained ones
syn cluster javaTop add=javaExternal,javaError,javaError,javaBranch,javaLabelRegion,javaLabel,javaConditional,javaRepeat,javaBoolean,javaConstant,javaTypedef,javaOperator,javaType,javaType,javaStatement,javaStorageClass,javaAssert,javaExceptions,javaMethodDecl,javaClassDecl,javaClassDecl,javaClassDecl,javaScopeDecl,javaError,javaError2,javaUserLabel,javaLangObject,javaAnnotation,javaVarArg


" Comments
syn keyword javaTodo		 contained TODO FIXME XXX
if exists("java_comment_strings")
  syn region  javaCommentString    contained start=+"+ end=+"+ end=+$+ end=+\*/+me=s-1,he=s-1 contains=javaSpecial,javaCommentStar,javaSpecialChar,@Spell
  syn region  javaComment2String   contained start=+"+	end=+$\|"+  contains=javaSpecial,javaSpecialChar,@Spell
  syn match   javaCommentCharacter contained "'\\[^']\{1,6\}'" contains=javaSpecialChar
  syn match   javaCommentCharacter contained "'\\''" contains=javaSpecialChar
  syn match   javaCommentCharacter contained "'[^\\]'"
  syn cluster javaCommentSpecial add=javaCommentString,javaCommentCharacter,javaNumber
  syn cluster javaCommentSpecial2 add=javaComment2String,javaCommentCharacter,javaNumber
endif
syn region  javaComment		 start="/\*"  end="\*/" contains=@javaCommentSpecial,javaTodo,@Spell
syn match   javaCommentStar	 contained "^\s*\*[^/]"me=e-1
syn match   javaCommentStar	 contained "^\s*\*$"
syn match   javaLineComment	 "//.*" contains=@javaCommentSpecial2,javaTodo,@Spell
hi def link javaCommentString javaString
hi def link javaComment2String javaString
hi def link javaCommentCharacter javaCharacter

syn cluster javaTop add=javaComment,javaLineComment

if !exists("java_ignore_javadoc") && main_syntax != 'jsp'
  syntax case ignore
  " syntax coloring for javadoc comments (HTML)
  syntax include @javaHtml <sfile>:p:h/html.vim
  unlet b:current_syntax
  " HTML enables spell checking for all text that is not in a syntax item. This
  " is wrong for Java (all identifiers would be spell-checked), so it's undone
  " here.
  syntax spell default

  syn region  javaDocComment	start="/\*\*"  end="\*/" keepend contains=javaCommentTitle,@javaHtml,javaDocTags,javaDocSeeTag,javaTodo,@Spell
  syn region  javaCommentTitle	contained matchgroup=javaDocComment start="/\*\*"   matchgroup=javaCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-1,he=s-1 contains=@javaHtml,javaCommentStar,javaTodo,@Spell,javaDocTags,javaDocSeeTag

  syn region javaDocTags	 contained start="{@\(code\|link\|linkplain\|inherit[Dd]oc\|doc[rR]oot\|value\)" end="}"
  syn match  javaDocTags	 contained "@\(param\|exception\|throws\|since\)\s\+\S\+" contains=javaDocParam
  syn match  javaDocParam	 contained "\s\S\+"
  syn match  javaDocTags	 contained "@\(version\|author\|return\|deprecated\|serial\|serialField\|serialData\)\>"
  syn region javaDocSeeTag	 contained matchgroup=javaDocTags start="@see\s\+" matchgroup=NONE end="\_."re=e-1 contains=javaDocSeeTagParam
  syn match  javaDocSeeTagParam  contained @"\_[^"]\+"\|<a\s\+\_.\{-}</a>\|\(\k\|\.\)*\(#\k\+\((\_[^)]\+)\)\=\)\=@ extend
  syntax case match
endif

" match the special comment /**/
syn match   javaComment		 "/\*\*/"

" Strings and constants
syn match   javaSpecialError	 contained "\\."
syn match   javaSpecialCharError contained "[^']"
syn match   javaSpecialChar	 contained "\\\([4-9]\d\|[0-3]\d\d\|[\"\\'ntbrf]\|u\x\{4\}\)"
syn region  javaString		start=+"+ end=+"+ end=+$+ contains=javaSpecialChar,javaSpecialError,@Spell
" next line disabled, it can cause a crash for a long line
"syn match   javaStringError	  +"\([^"\\]\|\\.\)*$+
syn match   javaCharacter	 "'[^']*'" contains=javaSpecialChar,javaSpecialCharError
syn match   javaCharacter	 "'\\''" contains=javaSpecialChar
syn match   javaCharacter	 "'[^\\]'"
syn match   javaNumber		 "\<\(0[bB][0-1]\+\|0[0-7]*\|0[xX]\x\+\|\d\(\d\|_\d\)*\)[lL]\=\>"
syn match   javaNumber		 "\(\<\d\(\d\|_\d\)*\.\(\d\(\d\|_\d\)*\)\=\|\.\d\(\d\|_\d\)*\)\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\="
syn match   javaNumber		 "\<\d\(\d\|_\d\)*[eE][-+]\=\d\(\d\|_\d\)*[fFdD]\=\>"
syn match   javaNumber		 "\<\d\(\d\|_\d\)*\([eE][-+]\=\d\(\d\|_\d\)*\)\=[fFdD]\>"

" unicode characters
syn match   javaSpecial "\\u\d\{4\}"

syn cluster javaTop add=javaString,javaCharacter,javaNumber,javaSpecial,javaStringError

if exists("java_highlight_functions")
  if java_highlight_functions == "indent"
    syn match  javaFuncDef "^\(\t\| \{8\}\)[_$a-zA-Z][_$a-zA-Z0-9_. \[\]<>]*([^-+*/]*)" contains=javaScopeDecl,javaType,javaStorageClass,@javaClasses,javaAnnotation
    syn region javaFuncDef start=+^\(\t\| \{8\}\)[$_a-zA-Z][$_a-zA-Z0-9_. \[\]<>]*([^-+*/]*,\s*+ end=+)+ contains=javaScopeDecl,javaType,javaStorageClass,@javaClasses,javaAnnotation
    syn match  javaFuncDef "^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]<>]*([^-+*/]*)" contains=javaScopeDecl,javaType,javaStorageClass,@javaClasses,javaAnnotation
    syn region javaFuncDef start=+^  [$_a-zA-Z][$_a-zA-Z0-9_. \[\]<>]*([^-+*/]*,\s*+ end=+)+ contains=javaScopeDecl,javaType,javaStorageClass,@javaClasses,javaAnnotation
  else
    " This line catches method declarations at any indentation>0, but it assumes
    " two things:
    "	1. class names are always capitalized (ie: Button)
    "	2. method names are never capitalized (except constructors, of course)
    "syn region javaFuncDef start=+^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)\s\+\)*\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^>]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\s*([^0-9]+ end=+)+ contains=javaScopeDecl,javaType,javaStorageClass,javaComment,javaLineComment,@javaClasses
    syn region javaFuncDef start=+^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)\s\+\)*\(<.*>\s\+\)\?\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^(){}]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\s*(+ end=+)+ contains=javaScopeDecl,javaType,javaStorageClass,javaComment,javaLineComment,@javaClasses,javaAnnotation
  endif
  syn match javaLambdaDef "[a-zA-Z_][a-zA-Z0-9_]*\s*->"
  syn match  javaBraces  "[{}]"
  syn cluster javaTop add=javaFuncDef,javaBraces,javaLambdaDef
endif

if exists("java_highlight_debug")

  " Strings and constants
  syn match   javaDebugSpecial		contained "\\\d\d\d\|\\."
  syn region  javaDebugString		contained start=+"+  end=+"+  contains=javaDebugSpecial
  syn match   javaDebugStringError	+"\([^"\\]\|\\.\)*$+
  syn match   javaDebugCharacter	contained "'[^\\]'"
  syn match   javaDebugSpecialCharacter contained "'\\.'"
  syn match   javaDebugSpecialCharacter contained "'\\''"
  syn match   javaDebugNumber		contained "\<\(0[0-7]*\|0[xX]\x\+\|\d\+\)[lL]\=\>"
  syn match   javaDebugNumber		contained "\(\<\d\+\.\d*\|\.\d\+\)\([eE][-+]\=\d\+\)\=[fFdD]\="
  syn match   javaDebugNumber		contained "\<\d\+[eE][-+]\=\d\+[fFdD]\=\>"
  syn match   javaDebugNumber		contained "\<\d\+\([eE][-+]\=\d\+\)\=[fFdD]\>"
  syn keyword javaDebugBoolean		contained true false
  syn keyword javaDebugType		contained null this super
  syn region javaDebugParen  start=+(+ end=+)+ contained contains=javaDebug.*,javaDebugParen

  " to make this work you must define the highlighting for these groups
  syn match javaDebug "\<System\.\(out\|err\)\.print\(ln\)*\s*("me=e-1 contains=javaDebug.* nextgroup=javaDebugParen
  syn match javaDebug "\<p\s*("me=e-1 contains=javaDebug.* nextgroup=javaDebugParen
  syn match javaDebug "[A-Za-z][a-zA-Z0-9_]*\.printStackTrace\s*("me=e-1 contains=javaDebug.* nextgroup=javaDebugParen
  syn match javaDebug "\<trace[SL]\=\s*("me=e-1 contains=javaDebug.* nextgroup=javaDebugParen

  syn cluster javaTop add=javaDebug

  hi def link javaDebug		 Debug
  hi def link javaDebugString		 DebugString
  hi def link javaDebugStringError	 javaError
  hi def link javaDebugType		 DebugType
  hi def link javaDebugBoolean		 DebugBoolean
  hi def link javaDebugNumber		 Debug
  hi def link javaDebugSpecial		 DebugSpecial
  hi def link javaDebugSpecialCharacter DebugSpecial
  hi def link javaDebugCharacter	 DebugString
  hi def link javaDebugParen		 Debug

  hi def link DebugString		 String
  hi def link DebugSpecial		 Special
  hi def link DebugBoolean		 Boolean
  hi def link DebugType		 Type
endif

if exists("java_mark_braces_in_parens_as_errors")
  syn match javaInParen		 contained "[{}]"
  hi def link javaInParen	javaError
  syn cluster javaTop add=javaInParen
endif

" catch errors caused by wrong parenthesis
syn region  javaParenT	transparent matchgroup=javaParen  start="(" end=")" contains=@javaTop,javaParenT1
syn region  javaParenT1 transparent matchgroup=javaParen1 start="(" end=")" contains=@javaTop,javaParenT2 contained
syn region  javaParenT2 transparent matchgroup=javaParen2 start="(" end=")" contains=@javaTop,javaParenT  contained
syn match   javaParenError	 ")"
" catch errors caused by wrong square parenthesis
syn region  javaParenT	transparent matchgroup=javaParen  start="\[" end="\]" contains=@javaTop,javaParenT1
syn region  javaParenT1 transparent matchgroup=javaParen1 start="\[" end="\]" contains=@javaTop,javaParenT2 contained
syn region  javaParenT2 transparent matchgroup=javaParen2 start="\[" end="\]" contains=@javaTop,javaParenT  contained
syn match   javaParenError	 "\]"

hi def link javaParenError	javaError

if exists("java_highlight_functions")
   syn match javaLambdaDef "([a-zA-Z0-9_<>\[\], \t]*)\s*->"
   " needs to be defined after the parenthesis error catcher to work
endif

if !exists("java_minlines")
  let java_minlines = 10
endif
exec "syn sync ccomment javaComment minlines=" . java_minlines

" The default highlighting.
hi def link javaLambdaDef		Function
hi def link javaFuncDef		Function
hi def link javaVarArg			Function
hi def link javaBraces			Function
hi def link javaBranch			Conditional
hi def link javaUserLabelRef		javaUserLabel
hi def link javaLabel			Label
hi def link javaUserLabel		Label
hi def link javaConditional		Conditional
hi def link javaRepeat			Repeat
hi def link javaExceptions		Exception
hi def link javaAssert			Statement
hi def link javaStorageClass		StorageClass
hi def link javaMethodDecl		javaStorageClass
hi def link javaClassDecl		javaStorageClass
hi def link javaScopeDecl		javaStorageClass
hi def link javaBoolean		Boolean
hi def link javaSpecial		Special
hi def link javaSpecialError		Error
hi def link javaSpecialCharError	Error
hi def link javaString			String
hi def link javaCharacter		Character
hi def link javaSpecialChar		SpecialChar
hi def link javaNumber			Number
hi def link javaError			Error
hi def link javaStringError		Error
hi def link javaStatement		Statement
hi def link javaOperator		Operator
hi def link javaComment		Comment
hi def link javaDocComment		Comment
hi def link javaLineComment		Comment
hi def link javaConstant		Constant
hi def link javaTypedef		Typedef
hi def link javaTodo			Todo
hi def link javaAnnotation		PreProc

hi def link javaCommentTitle		SpecialComment
hi def link javaDocTags		Special
hi def link javaDocParam		Function
hi def link javaDocSeeTagParam		Function
hi def link javaCommentStar		javaComment

hi def link javaType			Type
hi def link javaExternal		Include

hi def link htmlComment		Special
hi def link htmlCommentPart		Special
hi def link javaSpaceError		Error

let b:current_syntax = "java"

if main_syntax == 'java'
  unlet main_syntax
endif

let b:spell_options="contained"
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
                                                                                                                                                                                                                                                                                                                                                                                                                                                                     .vim/syntax/jsp.vim                                                                                 000644  000765  000024  00000005166 12761632536 015513  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:	JSP (Java Server Pages)
" Maintainer:	Rafael Garcia-Suarez <rgarciasuarez@free.fr>
" URL:		http://rgarciasuarez.free.fr/vim/syntax/jsp.vim
" Last change:	2004 Feb 02
" Credits : Patch by Darren Greaves (recognizes <jsp:...> tags)
"	    Patch by Thomas Kimpton (recognizes jspExpr inside HTML tags)

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'jsp'
endif

" Source HTML syntax
runtime! syntax/html.vim
unlet b:current_syntax

" Next syntax items are case-sensitive
syn case match

" Include Java syntax
syn include @jspJava syntax/java.vim

syn region jspScriptlet matchgroup=jspTag start=/<%/  keepend end=/%>/ contains=@jspJava
syn region jspComment			  start=/<%--/	      end=/--%>/
syn region jspDecl	matchgroup=jspTag start=/<%!/ keepend end=/%>/ contains=@jspJava
syn region jspExpr	matchgroup=jspTag start=/<%=/ keepend end=/%>/ contains=@jspJava
syn region jspDirective			  start=/<%@/	      end=/%>/ contains=htmlString,jspDirName,jspDirArg

syn keyword jspDirName contained include page taglib
syn keyword jspDirArg contained file uri prefix language extends import session buffer autoFlush
syn keyword jspDirArg contained isThreadSafe info errorPage contentType isErrorPage
syn region jspCommand			  start=/<jsp:/ start=/<\/jsp:/ keepend end=/>/ end=/\/>/ contains=htmlString,jspCommandName,jspCommandArg
syn keyword jspCommandName contained include forward getProperty plugin setProperty useBean param params fallback
syn keyword jspCommandArg contained id scope class type beanName page flush name value property
syn keyword jspCommandArg contained code codebase name archive align height
syn keyword jspCommandArg contained width hspace vspace jreversion nspluginurl iepluginurl

" Redefine htmlTag so that it can contain jspExpr
syn clear htmlTag
syn region htmlTag start=+<[^/%]+ end=+>+ contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster,jspExpr,javaScript

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
" java.vim has redefined htmlComment highlighting
hi def link htmlComment	 Comment
hi def link htmlCommentPart Comment
" Be consistent with html highlight settings
hi def link jspComment	 htmlComment
hi def link jspTag		 htmlTag
hi def link jspDirective	 jspTag
hi def link jspDirName	 htmlTagName
hi def link jspDirArg	 htmlArg
hi def link jspCommand	 jspTag
hi def link jspCommandName  htmlTagName
hi def link jspCommandArg	 htmlArg

if main_syntax == 'jsp'
  unlet main_syntax
endif

let b:current_syntax = "jsp"

" vim: ts=8
                                                                                                                                                                                                                                                                                                                                                                                                          .vim/syntax/sql.vim                                                                                 000644  000765  000024  00000002140 12761356540 015501  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file loader
" Language:    SQL
" Maintainer:  David Fishburn <fishburn at ianywhere dot com>
" Last Change: Thu Sep 15 2005 10:30:02 AM
" Version:     1.0

" Description: Checks for a:
"                  buffer local variable,
"                  global variable,
"              If the above exist, it will source the type specified.
"              If none exist, it will source the default sql.vim file.
"
" quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

" Default to the standard Vim distribution file
let filename = 'sqloracle'

" Check for overrides.  Buffer variables have the highest priority.
if exists("b:sql_type_override")
    " Check the runtimepath to see if the file exists
    if globpath(&runtimepath, 'syntax/'.b:sql_type_override.'.vim') != ''
        let filename = b:sql_type_override
    endif
elseif exists("g:sql_type_default")
    if globpath(&runtimepath, 'syntax/'.g:sql_type_default.'.vim') != ''
        let filename = g:sql_type_default
    endif
endif

" Source the appropriate file
exec 'runtime syntax/'.filename.'.vim'

" vim:sw=4:
                                                                                                                                                                                                                                                                                                                                                                                                                                .vim/syntax/javacc.vim                                                                              000644  000765  000024  00000004320 12761632536 016135  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:	JavaCC, a Java Compiler Compiler written by JavaSoft
" Maintainer:	Claudio Fleiner <claudio@fleiner.com>
" URL:		http://www.fleiner.com/vim/syntax/javacc.vim
" Last Change:	2012 Oct 05

" Uses java.vim, and adds a few special things for JavaCC Parser files.
" Those files usually have the extension  *.jj

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" source the java.vim file
runtime! syntax/java.vim
unlet b:current_syntax

"remove catching errors caused by wrong parenthesis (does not work in javacc
"files) (first define them in case they have not been defined in java)
syn match	javaParen "--"
syn match	javaParenError "--"
syn match	javaInParen "--"
syn match	javaError2 "--"
syn clear	javaParen
syn clear	javaParenError
syn clear	javaInParen
syn clear	javaError2

" remove function definitions (they look different) (first define in
" in case it was not defined in java.vim)
"syn match javaFuncDef "--"
syn clear javaFuncDef
syn match javaFuncDef "[$_a-zA-Z][$_a-zA-Z0-9_. \[\]]*([^-+*/()]*)[ \t]*:" contains=javaType

syn keyword javaccPackages options DEBUG_PARSER DEBUG_LOOKAHEAD DEBUG_TOKEN_MANAGER
syn keyword javaccPackages COMMON_TOKEN_ACTION IGNORE_CASE CHOICE_AMBIGUITY_CHECK
syn keyword javaccPackages OTHER_AMBIGUITY_CHECK STATIC LOOKAHEAD ERROR_REPORTING
syn keyword javaccPackages USER_TOKEN_MANAGER  USER_CHAR_STREAM JAVA_UNICODE_ESCAPE
syn keyword javaccPackages UNICODE_INPUT JDK_VERSION
syn match javaccPackages "PARSER_END([^)]*)"
syn match javaccPackages "PARSER_BEGIN([^)]*)"
syn match javaccSpecToken "<EOF>"
" the dot is necessary as otherwise it will be matched as a keyword.
syn match javaccSpecToken ".LOOKAHEAD("ms=s+1,me=e-1
syn match javaccToken "<[^> \t]*>"
syn keyword javaccActionToken TOKEN SKIP MORE SPECIAL_TOKEN
syn keyword javaccError DEBUG IGNORE_IN_BNF

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link javaccSpecToken Statement
hi def link javaccActionToken Type
hi def link javaccPackages javaScopeDecl
hi def link javaccToken String
hi def link javaccError Error

let b:current_syntax = "javacc"
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
                                                                                                                                                                                                                                                                                                                .vim/syntax/cpp.vim                                                                                 000644  000765  000024  00000005445 13004735060 015464  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:	C++
" Current Maintainer:	vim-jp (https://github.com/vim-jp/vim-cpp)
" Previous Maintainer:	Ken Shan <ccshan@post.harvard.edu>
" Last Change:	2016 Oct 28

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Read the C syntax to start with
runtime! syntax/c.vim
unlet b:current_syntax

" C++ extensions
syn keyword cppStatement	new delete this friend using
syn keyword cppAccess		public protected private
syn keyword cppModifier		inline virtual explicit export
syn keyword cppType		bool wchar_t
syn keyword cppExceptions	throw try catch
syn keyword cppOperator		operator typeid
syn keyword cppOperator		and bitor or xor compl bitand and_eq or_eq xor_eq not not_eq
syn match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*<"me=e-1
syn match cppCast		"\<\(const\|static\|dynamic\|reinterpret\)_cast\s*$"
syn keyword cppStorageClass	mutable
syn keyword cppStructure	class typename template namespace
syn keyword cppBoolean		true false
syn keyword cppConstant		__cplusplus

" C++ 11 extensions
if !exists("cpp_no_cpp11")
  syn keyword cppModifier	override final
  syn keyword cppType		nullptr_t auto
  syn keyword cppExceptions	noexcept
  syn keyword cppStorageClass	constexpr decltype thread_local
  syn keyword cppConstant	nullptr
  syn keyword cppConstant	ATOMIC_FLAG_INIT ATOMIC_VAR_INIT
  syn keyword cppConstant	ATOMIC_BOOL_LOCK_FREE ATOMIC_CHAR_LOCK_FREE
  syn keyword cppConstant	ATOMIC_CHAR16_T_LOCK_FREE ATOMIC_CHAR32_T_LOCK_FREE
  syn keyword cppConstant	ATOMIC_WCHAR_T_LOCK_FREE ATOMIC_SHORT_LOCK_FREE
  syn keyword cppConstant	ATOMIC_INT_LOCK_FREE ATOMIC_LONG_LOCK_FREE
  syn keyword cppConstant	ATOMIC_LLONG_LOCK_FREE ATOMIC_POINTER_LOCK_FREE
  syn region cppRawString	matchgroup=cppRawStringDelimiter start=+\%(u8\|[uLU]\)\=R"\z([[:alnum:]_{}[\]#<>%:;.?*\+\-/\^&|~!=,"']\{,16}\)(+ end=+)\z1"+ contains=@Spell
endif

" C++ 14 extensions
if !exists("cpp_no_cpp14")
  syn case ignore
  syn match cppNumber		display "\<0b[01]\('\=[01]\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
  syn match cppNumber		display "\<[1-9]\('\=\d\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
  syn match cppNumber		display "\<0x\x\('\=\x\+\)*\(u\=l\{0,2}\|ll\=u\)\>"
  syn case match
endif

" The minimum and maximum operators in GNU C++
syn match cppMinMax "[<>]?"

" Default highlighting
hi def link cppAccess		cppStatement
hi def link cppCast		cppStatement
hi def link cppExceptions		Exception
hi def link cppOperator		Operator
hi def link cppStatement		Statement
hi def link cppModifier		Type
hi def link cppType		Type
hi def link cppStorageClass	StorageClass
hi def link cppStructure		Structure
hi def link cppBoolean		Boolean
hi def link cppConstant		Constant
hi def link cppRawStringDelimiter	Delimiter
hi def link cppRawString		String
hi def link cppNumber		Number

let b:current_syntax = "cpp"

" vim: ts=8
                                                                                                                                                                                                                           .vim/syntax/json.vim                                                                                000644  000765  000024  00000013602 12761632536 015662  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:	JSON
" Maintainer:	Eli Parra <eli@elzr.com>
" Last Change:	2014 Aug 23
" Version:      0.12

if !exists("main_syntax")
  " quit when a syntax file was already loaded
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'json'
endif

syntax match   jsonNoise           /\%(:\|,\)/

" NOTE that for the concealing to work your conceallevel should be set to 2

" Syntax: Strings
" Separated into a match and region because a region by itself is always greedy
syn match  jsonStringMatch /"\([^"]\|\\\"\)\+"\ze[[:blank:]\r\n]*[,}\]]/ contains=jsonString
if has('conceal')
	syn region  jsonString oneline matchgroup=jsonQuote start=/"/  skip=/\\\\\|\\"/  end=/"/ concealends contains=jsonEscape contained
else
	syn region  jsonString oneline matchgroup=jsonQuote start=/"/  skip=/\\\\\|\\"/  end=/"/ contains=jsonEscape contained
endif

" Syntax: JSON does not allow strings with single quotes, unlike JavaScript.
syn region  jsonStringSQError oneline  start=+'+  skip=+\\\\\|\\"+  end=+'+

" Syntax: JSON Keywords
" Separated into a match and region because a region by itself is always greedy
syn match  jsonKeywordMatch /"\([^"]\|\\\"\)\+"[[:blank:]\r\n]*\:/ contains=jsonKeyword
if has('conceal')
   syn region  jsonKeyword matchgroup=jsonQuote start=/"/  end=/"\ze[[:blank:]\r\n]*\:/ concealends contained
else
   syn region  jsonKeyword matchgroup=jsonQuote start=/"/  end=/"\ze[[:blank:]\r\n]*\:/ contained
endif

" Syntax: Escape sequences
syn match   jsonEscape    "\\["\\/bfnrt]" contained
syn match   jsonEscape    "\\u\x\{4}" contained

" Syntax: Numbers
syn match   jsonNumber    "-\=\<\%(0\|[1-9]\d*\)\%(\.\d\+\)\=\%([eE][-+]\=\d\+\)\=\>\ze[[:blank:]\r\n]*[,}\]]"

" ERROR WARNINGS **********************************************
if (!exists("g:vim_json_warnings") || g:vim_json_warnings==1)
	" Syntax: Strings should always be enclosed with quotes.
	syn match   jsonNoQuotesError  "\<[[:alpha:]][[:alnum:]]*\>"
	syn match   jsonTripleQuotesError  /"""/

	" Syntax: An integer part of 0 followed by other digits is not allowed.
	syn match   jsonNumError  "-\=\<0\d\.\d*\>"

	" Syntax: Decimals smaller than one should begin with 0 (so .1 should be 0.1).
	syn match   jsonNumError  "\:\@<=[[:blank:]\r\n]*\zs\.\d\+"

	" Syntax: No comments in JSON, see http://stackoverflow.com/questions/244777/can-i-comment-a-json-file
	syn match   jsonCommentError  "//.*"
	syn match   jsonCommentError  "\(/\*\)\|\(\*/\)"

	" Syntax: No semicolons in JSON
	syn match   jsonSemicolonError  ";"

	" Syntax: No trailing comma after the last element of arrays or objects
	syn match   jsonTrailingCommaError  ",\_s*[}\]]"

	" Syntax: Watch out for missing commas between elements
	syn match   jsonMissingCommaError /\("\|\]\|\d\)\zs\_s\+\ze"/
	syn match   jsonMissingCommaError /\(\]\|\}\)\_s\+\ze"/ "arrays/objects as values
	syn match   jsonMissingCommaError /}\_s\+\ze{/ "objects as elements in an array
	syn match   jsonMissingCommaError /\(true\|false\)\_s\+\ze"/ "true/false as value
endif

" ********************************************** END OF ERROR WARNINGS
" Allowances for JSONP: function call at the beginning of the file,
" parenthesis and semicolon at the end.
" Function name validation based on
" http://stackoverflow.com/questions/2008279/validate-a-javascript-function-name/2008444#2008444
syn match  jsonPadding "\%^[[:blank:]\r\n]*[_$[:alpha:]][_$[:alnum:]]*[[:blank:]\r\n]*("
syn match  jsonPadding ");[[:blank:]\r\n]*\%$"

" Syntax: Boolean
syn match  jsonBoolean /\(true\|false\)\(\_s\+\ze"\)\@!/

" Syntax: Null
syn keyword  jsonNull      null

" Syntax: Braces
syn region  jsonFold matchgroup=jsonBraces start="{" end=/}\(\_s\+\ze\("\|{\)\)\@!/ transparent fold
syn region  jsonFold matchgroup=jsonBraces start="\[" end=/]\(\_s\+\ze"\)\@!/ transparent fold

" Define the default highlighting.
" Only when an item doesn't have highlighting yet
hi def link jsonPadding         Operator
hi def link jsonString          String
hi def link jsonTest          Label
hi def link jsonEscape          Special
hi def link jsonNumber          Number
hi def link jsonBraces          Delimiter
hi def link jsonNull            Function
hi def link jsonBoolean         Boolean
hi def link jsonKeyword         Label

if (!exists("g:vim_json_warnings") || g:vim_json_warnings==1)
hi def link jsonNumError        Error
hi def link jsonCommentError    Error
hi def link jsonSemicolonError  Error
hi def link jsonTrailingCommaError     Error
hi def link jsonMissingCommaError      Error
hi def link jsonStringSQError        	Error
hi def link jsonNoQuotesError        	Error
hi def link jsonTripleQuotesError     	Error
endif
hi def link jsonQuote           Quote
hi def link jsonNoise           Noise

let b:current_syntax = "json"
if main_syntax == 'json'
  unlet main_syntax
endif

" Vim settings
" vim: ts=8 fdm=marker

" MIT License
" Copyright (c) 2013, Jeroen Ruigrok van der Werven, Eli Parra
"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the Software), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
"The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
"THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"See https://twitter.com/elzr/status/294964017926119424
                                                                                                                              .vim/syntax/lua.vim                                                                                 000644  000765  000024  00000033344 12761632540 015472  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:	Lua 4.0, Lua 5.0, Lua 5.1 and Lua 5.2
" Maintainer:	Marcus Aurelius Farias <masserahguard-lua 'at' yahoo com>
" First Author:	Carlos Augusto Teixeira Mendes <cmendes 'at' inf puc-rio br>
" Last Change:	2012 Aug 12
" Options:	lua_version = 4 or 5
"		lua_subversion = 0 (4.0, 5.0) or 1 (5.1) or 2 (5.2)
"		default 5.2

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

if !exists("lua_version")
  " Default is lua 5.2
  let lua_version = 5
  let lua_subversion = 2
elseif !exists("lua_subversion")
  " lua_version exists, but lua_subversion doesn't. So, set it to 0
  let lua_subversion = 0
endif

syn case match

" syncing method
syn sync minlines=100

" Comments
syn keyword luaTodo            contained TODO FIXME XXX
syn match   luaComment         "--.*$" contains=luaTodo,@Spell
if lua_version == 5 && lua_subversion == 0
  syn region luaComment        matchgroup=luaComment start="--\[\[" end="\]\]" contains=luaTodo,luaInnerComment,@Spell
  syn region luaInnerComment   contained transparent start="\[\[" end="\]\]"
elseif lua_version > 5 || (lua_version == 5 && lua_subversion >= 1)
  " Comments in Lua 5.1: --[[ ... ]], [=[ ... ]=], [===[ ... ]===], etc.
  syn region luaComment        matchgroup=luaComment start="--\[\z(=*\)\[" end="\]\z1\]" contains=luaTodo,@Spell
endif

" First line may start with #!
syn match luaComment "\%^#!.*"

" catch errors caused by wrong parenthesis and wrong curly brackets or
" keywords placed outside their respective blocks
syn region luaParen      transparent                     start='(' end=')' contains=ALLBUT,luaParenError,luaTodo,luaSpecial,luaIfThen,luaElseifThen,luaElse,luaThenEnd,luaBlock,luaLoopBlock,luaIn,luaStatement
syn region luaTableBlock transparent matchgroup=luaTable start="{" end="}" contains=ALLBUT,luaBraceError,luaTodo,luaSpecial,luaIfThen,luaElseifThen,luaElse,luaThenEnd,luaBlock,luaLoopBlock,luaIn,luaStatement

syn match  luaParenError ")"
syn match  luaBraceError "}"
syn match  luaError "\<\%(end\|else\|elseif\|then\|until\|in\)\>"

" function ... end
syn region luaFunctionBlock transparent matchgroup=luaFunction start="\<function\>" end="\<end\>" contains=ALLBUT,luaTodo,luaSpecial,luaElseifThen,luaElse,luaThenEnd,luaIn

" if ... then
syn region luaIfThen transparent matchgroup=luaCond start="\<if\>" end="\<then\>"me=e-4           contains=ALLBUT,luaTodo,luaSpecial,luaElseifThen,luaElse,luaIn nextgroup=luaThenEnd skipwhite skipempty

" then ... end
syn region luaThenEnd contained transparent matchgroup=luaCond start="\<then\>" end="\<end\>" contains=ALLBUT,luaTodo,luaSpecial,luaThenEnd,luaIn

" elseif ... then
syn region luaElseifThen contained transparent matchgroup=luaCond start="\<elseif\>" end="\<then\>" contains=ALLBUT,luaTodo,luaSpecial,luaElseifThen,luaElse,luaThenEnd,luaIn

" else
syn keyword luaElse contained else

" do ... end
syn region luaBlock transparent matchgroup=luaStatement start="\<do\>" end="\<end\>"          contains=ALLBUT,luaTodo,luaSpecial,luaElseifThen,luaElse,luaThenEnd,luaIn

" repeat ... until
syn region luaLoopBlock transparent matchgroup=luaRepeat start="\<repeat\>" end="\<until\>"   contains=ALLBUT,luaTodo,luaSpecial,luaElseifThen,luaElse,luaThenEnd,luaIn

" while ... do
syn region luaLoopBlock transparent matchgroup=luaRepeat start="\<while\>" end="\<do\>"me=e-2 contains=ALLBUT,luaTodo,luaSpecial,luaIfThen,luaElseifThen,luaElse,luaThenEnd,luaIn nextgroup=luaBlock skipwhite skipempty

" for ... do and for ... in ... do
syn region luaLoopBlock transparent matchgroup=luaRepeat start="\<for\>" end="\<do\>"me=e-2   contains=ALLBUT,luaTodo,luaSpecial,luaIfThen,luaElseifThen,luaElse,luaThenEnd nextgroup=luaBlock skipwhite skipempty

syn keyword luaIn contained in

" other keywords
syn keyword luaStatement return local break
if lua_version > 5 || (lua_version == 5 && lua_subversion >= 2)
  syn keyword luaStatement goto
  syn match luaLabel "::\I\i*::"
endif
syn keyword luaOperator and or not
syn keyword luaConstant nil
if lua_version > 4
  syn keyword luaConstant true false
endif

" Strings
if lua_version < 5
  syn match  luaSpecial contained "\\[\\abfnrtv\'\"]\|\\[[:digit:]]\{,3}"
elseif lua_version == 5
  if lua_subversion == 0
    syn match  luaSpecial contained #\\[\\abfnrtv'"[\]]\|\\[[:digit:]]\{,3}#
    syn region luaString2 matchgroup=luaString start=+\[\[+ end=+\]\]+ contains=luaString2,@Spell
  else
    if lua_subversion == 1
      syn match  luaSpecial contained #\\[\\abfnrtv'"]\|\\[[:digit:]]\{,3}#
    else " Lua 5.2
      syn match  luaSpecial contained #\\[\\abfnrtvz'"]\|\\x[[:xdigit:]]\{2}\|\\[[:digit:]]\{,3}#
    endif
    syn region luaString2 matchgroup=luaString start="\[\z(=*\)\[" end="\]\z1\]" contains=@Spell
  endif
endif
syn region luaString  start=+'+ end=+'+ skip=+\\\\\|\\'+ contains=luaSpecial,@Spell
syn region luaString  start=+"+ end=+"+ skip=+\\\\\|\\"+ contains=luaSpecial,@Spell

" integer number
syn match luaNumber "\<\d\+\>"
" floating point number, with dot, optional exponent
syn match luaNumber  "\<\d\+\.\d*\%([eE][-+]\=\d\+\)\=\>"
" floating point number, starting with a dot, optional exponent
syn match luaNumber  "\.\d\+\%([eE][-+]\=\d\+\)\=\>"
" floating point number, without dot, with exponent
syn match luaNumber  "\<\d\+[eE][-+]\=\d\+\>"

" hex numbers
if lua_version >= 5
  if lua_subversion == 1
    syn match luaNumber "\<0[xX]\x\+\>"
  elseif lua_subversion >= 2
    syn match luaNumber "\<0[xX][[:xdigit:].]\+\%([pP][-+]\=\d\+\)\=\>"
  endif
endif

syn keyword luaFunc assert collectgarbage dofile error next
syn keyword luaFunc print rawget rawset tonumber tostring type _VERSION

if lua_version == 4
  syn keyword luaFunc _ALERT _ERRORMESSAGE gcinfo
  syn keyword luaFunc call copytagmethods dostring
  syn keyword luaFunc foreach foreachi getglobal getn
  syn keyword luaFunc gettagmethod globals newtag
  syn keyword luaFunc setglobal settag settagmethod sort
  syn keyword luaFunc tag tinsert tremove
  syn keyword luaFunc _INPUT _OUTPUT _STDIN _STDOUT _STDERR
  syn keyword luaFunc openfile closefile flush seek
  syn keyword luaFunc setlocale execute remove rename tmpname
  syn keyword luaFunc getenv date clock exit
  syn keyword luaFunc readfrom writeto appendto read write
  syn keyword luaFunc PI abs sin cos tan asin
  syn keyword luaFunc acos atan atan2 ceil floor
  syn keyword luaFunc mod frexp ldexp sqrt min max log
  syn keyword luaFunc log10 exp deg rad random
  syn keyword luaFunc randomseed strlen strsub strlower strupper
  syn keyword luaFunc strchar strrep ascii strbyte
  syn keyword luaFunc format strfind gsub
  syn keyword luaFunc getinfo getlocal setlocal setcallhook setlinehook
elseif lua_version == 5
  syn keyword luaFunc getmetatable setmetatable
  syn keyword luaFunc ipairs pairs
  syn keyword luaFunc pcall xpcall
  syn keyword luaFunc _G loadfile rawequal require
  if lua_subversion == 0
    syn keyword luaFunc getfenv setfenv
    syn keyword luaFunc loadstring unpack
    syn keyword luaFunc gcinfo loadlib LUA_PATH _LOADED _REQUIREDNAME
  else
    syn keyword luaFunc load select
    syn match   luaFunc /\<package\.cpath\>/
    syn match   luaFunc /\<package\.loaded\>/
    syn match   luaFunc /\<package\.loadlib\>/
    syn match   luaFunc /\<package\.path\>/
    if lua_subversion == 1
      syn keyword luaFunc getfenv setfenv
      syn keyword luaFunc loadstring module unpack
      syn match   luaFunc /\<package\.loaders\>/
      syn match   luaFunc /\<package\.preload\>/
      syn match   luaFunc /\<package\.seeall\>/
    elseif lua_subversion == 2
      syn keyword luaFunc _ENV rawlen
      syn match   luaFunc /\<package\.config\>/
      syn match   luaFunc /\<package\.preload\>/
      syn match   luaFunc /\<package\.searchers\>/
      syn match   luaFunc /\<package\.searchpath\>/
      syn match   luaFunc /\<bit32\.arshift\>/
      syn match   luaFunc /\<bit32\.band\>/
      syn match   luaFunc /\<bit32\.bnot\>/
      syn match   luaFunc /\<bit32\.bor\>/
      syn match   luaFunc /\<bit32\.btest\>/
      syn match   luaFunc /\<bit32\.bxor\>/
      syn match   luaFunc /\<bit32\.extract\>/
      syn match   luaFunc /\<bit32\.lrotate\>/
      syn match   luaFunc /\<bit32\.lshift\>/
      syn match   luaFunc /\<bit32\.replace\>/
      syn match   luaFunc /\<bit32\.rrotate\>/
      syn match   luaFunc /\<bit32\.rshift\>/
    endif
    syn match luaFunc /\<coroutine\.running\>/
  endif
  syn match   luaFunc /\<coroutine\.create\>/
  syn match   luaFunc /\<coroutine\.resume\>/
  syn match   luaFunc /\<coroutine\.status\>/
  syn match   luaFunc /\<coroutine\.wrap\>/
  syn match   luaFunc /\<coroutine\.yield\>/
  syn match   luaFunc /\<string\.byte\>/
  syn match   luaFunc /\<string\.char\>/
  syn match   luaFunc /\<string\.dump\>/
  syn match   luaFunc /\<string\.find\>/
  syn match   luaFunc /\<string\.format\>/
  syn match   luaFunc /\<string\.gsub\>/
  syn match   luaFunc /\<string\.len\>/
  syn match   luaFunc /\<string\.lower\>/
  syn match   luaFunc /\<string\.rep\>/
  syn match   luaFunc /\<string\.sub\>/
  syn match   luaFunc /\<string\.upper\>/
  if lua_subversion == 0
    syn match luaFunc /\<string\.gfind\>/
  else
    syn match luaFunc /\<string\.gmatch\>/
    syn match luaFunc /\<string\.match\>/
    syn match luaFunc /\<string\.reverse\>/
  endif
  if lua_subversion == 0
    syn match luaFunc /\<table\.getn\>/
    syn match luaFunc /\<table\.setn\>/
    syn match luaFunc /\<table\.foreach\>/
    syn match luaFunc /\<table\.foreachi\>/
  elseif lua_subversion == 1
    syn match luaFunc /\<table\.maxn\>/
  elseif lua_subversion == 2
    syn match luaFunc /\<table\.pack\>/
    syn match luaFunc /\<table\.unpack\>/
  endif
  syn match   luaFunc /\<table\.concat\>/
  syn match   luaFunc /\<table\.sort\>/
  syn match   luaFunc /\<table\.insert\>/
  syn match   luaFunc /\<table\.remove\>/
  syn match   luaFunc /\<math\.abs\>/
  syn match   luaFunc /\<math\.acos\>/
  syn match   luaFunc /\<math\.asin\>/
  syn match   luaFunc /\<math\.atan\>/
  syn match   luaFunc /\<math\.atan2\>/
  syn match   luaFunc /\<math\.ceil\>/
  syn match   luaFunc /\<math\.sin\>/
  syn match   luaFunc /\<math\.cos\>/
  syn match   luaFunc /\<math\.tan\>/
  syn match   luaFunc /\<math\.deg\>/
  syn match   luaFunc /\<math\.exp\>/
  syn match   luaFunc /\<math\.floor\>/
  syn match   luaFunc /\<math\.log\>/
  syn match   luaFunc /\<math\.max\>/
  syn match   luaFunc /\<math\.min\>/
  if lua_subversion == 0
    syn match luaFunc /\<math\.mod\>/
    syn match luaFunc /\<math\.log10\>/
  else
    if lua_subversion == 1
      syn match luaFunc /\<math\.log10\>/
    endif
    syn match luaFunc /\<math\.huge\>/
    syn match luaFunc /\<math\.fmod\>/
    syn match luaFunc /\<math\.modf\>/
    syn match luaFunc /\<math\.cosh\>/
    syn match luaFunc /\<math\.sinh\>/
    syn match luaFunc /\<math\.tanh\>/
  endif
  syn match   luaFunc /\<math\.pow\>/
  syn match   luaFunc /\<math\.rad\>/
  syn match   luaFunc /\<math\.sqrt\>/
  syn match   luaFunc /\<math\.frexp\>/
  syn match   luaFunc /\<math\.ldexp\>/
  syn match   luaFunc /\<math\.random\>/
  syn match   luaFunc /\<math\.randomseed\>/
  syn match   luaFunc /\<math\.pi\>/
  syn match   luaFunc /\<io\.close\>/
  syn match   luaFunc /\<io\.flush\>/
  syn match   luaFunc /\<io\.input\>/
  syn match   luaFunc /\<io\.lines\>/
  syn match   luaFunc /\<io\.open\>/
  syn match   luaFunc /\<io\.output\>/
  syn match   luaFunc /\<io\.popen\>/
  syn match   luaFunc /\<io\.read\>/
  syn match   luaFunc /\<io\.stderr\>/
  syn match   luaFunc /\<io\.stdin\>/
  syn match   luaFunc /\<io\.stdout\>/
  syn match   luaFunc /\<io\.tmpfile\>/
  syn match   luaFunc /\<io\.type\>/
  syn match   luaFunc /\<io\.write\>/
  syn match   luaFunc /\<os\.clock\>/
  syn match   luaFunc /\<os\.date\>/
  syn match   luaFunc /\<os\.difftime\>/
  syn match   luaFunc /\<os\.execute\>/
  syn match   luaFunc /\<os\.exit\>/
  syn match   luaFunc /\<os\.getenv\>/
  syn match   luaFunc /\<os\.remove\>/
  syn match   luaFunc /\<os\.rename\>/
  syn match   luaFunc /\<os\.setlocale\>/
  syn match   luaFunc /\<os\.time\>/
  syn match   luaFunc /\<os\.tmpname\>/
  syn match   luaFunc /\<debug\.debug\>/
  syn match   luaFunc /\<debug\.gethook\>/
  syn match   luaFunc /\<debug\.getinfo\>/
  syn match   luaFunc /\<debug\.getlocal\>/
  syn match   luaFunc /\<debug\.getupvalue\>/
  syn match   luaFunc /\<debug\.setlocal\>/
  syn match   luaFunc /\<debug\.setupvalue\>/
  syn match   luaFunc /\<debug\.sethook\>/
  syn match   luaFunc /\<debug\.traceback\>/
  if lua_subversion == 1
    syn match luaFunc /\<debug\.getfenv\>/
    syn match luaFunc /\<debug\.setfenv\>/
    syn match luaFunc /\<debug\.getmetatable\>/
    syn match luaFunc /\<debug\.setmetatable\>/
    syn match luaFunc /\<debug\.getregistry\>/
  elseif lua_subversion == 2
    syn match luaFunc /\<debug\.getmetatable\>/
    syn match luaFunc /\<debug\.setmetatable\>/
    syn match luaFunc /\<debug\.getregistry\>/
    syn match luaFunc /\<debug\.getuservalue\>/
    syn match luaFunc /\<debug\.setuservalue\>/
    syn match luaFunc /\<debug\.upvalueid\>/
    syn match luaFunc /\<debug\.upvaluejoin\>/
  endif
endif

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link luaStatement		Statement
hi def link luaRepeat		Repeat
hi def link luaFor			Repeat
hi def link luaString		String
hi def link luaString2		String
hi def link luaNumber		Number
hi def link luaOperator		Operator
hi def link luaIn			Operator
hi def link luaConstant		Constant
hi def link luaCond		Conditional
hi def link luaElse		Conditional
hi def link luaFunction		Function
hi def link luaComment		Comment
hi def link luaTodo		Todo
hi def link luaTable		Structure
hi def link luaError		Error
hi def link luaParenError		Error
hi def link luaBraceError		Error
hi def link luaSpecial		SpecialChar
hi def link luaFunc		Identifier
hi def link luaLabel		Label


let b:current_syntax = "lua"

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: et ts=8 sw=2
                                                                                                                                                                                                                                                                                            .vim/syntax/d.vim                                                                                   000644  000765  000024  00000067727 12654724236 015155  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file for the D programming language (version 1.076 and 2.069).
"
" Language:     D
" Maintainer:   Jesse Phillips <Jesse.K.Phillips+D@gmail.com>
" Last Change:  2016 Feb 2
" Version:      0.28
"
" Contributors:
"   - Jason Mills: original Maintainer
"   - Kirk McDonald
"   - Tim Keating
"   - Frank Benoit
"   - Shougo Matsushita
"   - Ellery Newcomer
"   - Steven N. Oliver
"   - Sohgo Takeuchi
"   - Robert Clipsham
"   - Petar Kirov
"
" Please submit bugs/comments/suggestions to the github repo: 
" https://github.com/JesseKPhillips/d.vim
"
" Options:
"   d_comment_strings - Set to highlight strings and numbers in comments.
"
"   d_hl_operator_overload - Set to highlight D's specially named functions
"   that when overloaded implement unary and binary operators (e.g. opCmp).
"
"   d_hl_object_types - Set to highlight some common types from object.di.

" Quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" Support cpoptions
let s:cpo_save = &cpo
set cpo&vim

" Set the current syntax to be known as d
let b:current_syntax = "d"

" Keyword definitions
"
syn keyword dExternal              contained import module
syn keyword dAssert                assert
syn keyword dConditional           if else switch
syn keyword dBranch                goto break continue
syn keyword dRepeat                while for do foreach foreach_reverse
syn keyword dBoolean               true false
syn keyword dConstant              null
syn keyword dConstant              __FILE__ __LINE__ __EOF__ __VERSION__
syn keyword dConstant              __DATE__ __TIME__ __TIMESTAMP__ __VENDOR__
syn keyword dConstant              __MODULE__ __FUNCTION__ __PRETTY_FUNCTION__
syn keyword dTypedef               alias typedef
syn keyword dStructure             template interface class struct union
syn keyword dEnum                  enum
syn keyword dOperator              new delete typeof typeid cast align is
syn keyword dOperator              this super
if exists("d_hl_operator_overload")
  syn keyword dOpOverload          opNeg opCom opPostInc opPostDec opCast opAdd
  syn keyword dOpOverload          opSub opSub_r opMul opDiv opDiv_r opMod 
  syn keyword dOpOverload          opMod_r opAnd opOr opXor opShl opShl_r opShr
  syn keyword dOpOverload          opShr_r opUShr opUShr_r opCat
  syn keyword dOpOverload          opCat_r opEquals opCmp
  syn keyword dOpOverload          opAssign opAddAssign opSubAssign opMulAssign
  syn keyword dOpOverload          opDivAssign opModAssign opAndAssign 
  syn keyword dOpOverload          opOrAssign opXorAssign opShlAssign 
  syn keyword dOpOverload          opShrAssign opUShrAssign opCatAssign
  syn keyword dOpOverload          opIndex opIndexAssign opIndexOpAssign
  syn keyword dOpOverload          opCall opSlice opSliceAssign opSliceOpAssign 
  syn keyword dOpOverload          opPos opAdd_r opMul_r opAnd_r opOr_r opXor_r
  syn keyword dOpOverload          opIn opIn_r opPow opDispatch opStar opDot 
  syn keyword dOpOverload          opApply opApplyReverse opDollar
  syn keyword dOpOverload          opUnary opIndexUnary opSliceUnary
  syn keyword dOpOverload          opBinary opBinaryRight
endif

syn keyword dType                  byte ubyte short ushort int uint long ulong cent ucent
syn keyword dType                  void bool Object
syn keyword dType                  float double real
syn keyword dType                  ushort int uint long ulong float
syn keyword dType                  char wchar dchar string wstring dstring
syn keyword dType                  ireal ifloat idouble creal cfloat cdouble
syn keyword dType                  size_t ptrdiff_t sizediff_t equals_t hash_t
if exists("d_hl_object_types")
  syn keyword dType                Object Throwable AssociativeArray Error Exception
  syn keyword dType                Interface OffsetTypeInfo TypeInfo TypeInfo_Typedef
  syn keyword dType                TypeInfo_Enum TypeInfo_Pointer TypeInfo_Array
  syn keyword dType                TypeInfo_StaticArray TypeInfo_AssociativeArray
  syn keyword dType                TypeInfo_Function TypeInfo_Delegate TypeInfo_Class
  syn keyword dType                ClassInfo TypeInfo_Interface TypeInfo_Struct
  syn keyword dType                TypeInfo_Tuple TypeInfo_Const TypeInfo_Invariant
  syn keyword dType                TypeInfo_Shared TypeInfo_Inout MemberInfo
  syn keyword dType                MemberInfo_field MemberInfo_function ModuleInfo
endif
syn keyword dDebug                 deprecated unittest invariant
syn keyword dExceptions            throw try catch finally
syn keyword dScopeDecl             public protected private export package 
syn keyword dStatement             debug return with
syn keyword dStatement             function delegate __ctfe mixin macro __simd
syn keyword dStatement             in out body
syn keyword dStorageClass          contained in out scope
syn keyword dStorageClass          inout ref lazy pure nothrow
syn keyword dStorageClass          auto static override final abstract volatile
syn keyword dStorageClass          __gshared __vector
syn keyword dStorageClass          synchronized shared immutable const lazy
syn keyword dIdentifier            _arguments _argptr __vptr __monitor
syn keyword dIdentifier             _ctor _dtor __argTypes __overloadset
syn keyword dScopeIdentifier       contained exit success failure
syn keyword dTraitsIdentifier      contained isAbstractClass isArithmetic
syn keyword dTraitsIdentifier      contained isAssociativeArray isFinalClass
syn keyword dTraitsIdentifier      contained isPOD isNested isFloating
syn keyword dTraitsIdentifier      contained isIntegral isScalar isStaticArray
syn keyword dTraitsIdentifier      contained isUnsigned isVirtualFunction
syn keyword dTraitsIdentifier      contained isVirtualMethod isAbstractFunction
syn keyword dTraitsIdentifier      contained isFinalFunction isStaticFunction
syn keyword dTraitsIdentifier      contained isOverrideFunction isTemplate
syn keyword dTraitsIdentifier      contained isRef isOut isLazy hasMember
syn keyword dTraitsIdentifier      contained identifier getAliasThis
syn keyword dTraitsIdentifier      contained getAttributes getFunctionAttributes getMember
syn keyword dTraitsIdentifier      contained getOverloads getPointerBitmap getProtection
syn keyword dTraitsIdentifier      contained getVirtualFunctions getVirtualIndex
syn keyword dTraitsIdentifier      contained getVirtualMethods getUnitTests
syn keyword dTraitsIdentifier      contained parent classInstanceSize allMembers
syn keyword dTraitsIdentifier      contained derivedMembers isSame compiles
syn keyword dPragmaIdentifier      contained inline lib mangle msg startaddress GNU_asm
syn keyword dExternIdentifier      contained C C++ D Windows Pascal System Objective-C
syn keyword dAttribute             contained safe trusted system
syn keyword dAttribute             contained property disable nogc
syn keyword dVersionIdentifier     contained DigitalMars GNU LDC SDC D_NET
syn keyword dVersionIdentifier     contained X86 X86_64 ARM PPC PPC64 IA64 MIPS MIPS64 Alpha
syn keyword dVersionIdentifier     contained SPARC SPARC64 S390 S390X HPPA HPPA64 SH SH64
syn keyword dVersionIdentifier     contained linux Posix OSX FreeBSD Windows Win32 Win64
syn keyword dVersionIdentifier     contained OpenBSD BSD Solaris AIX SkyOS SysV3 SysV4 Hurd
syn keyword dVersionIdentifier     contained Cygwin MinGW
syn keyword dVersionIdentifier     contained LittleEndian BigEndian
syn keyword dVersionIdentifier     contained D_InlineAsm_X86 D_InlineAsm_X86_64
syn keyword dVersionIdentifier     contained D_Version2 D_Coverage D_Ddoc D_LP64 D_PIC
syn keyword dVersionIdentifier     contained unittest assert none all

syn cluster dComment contains=dNestedComment,dBlockComment,dLineComment

" Highlight the sharpbang
syn match dSharpBang "\%^#!.*"     display

" Attributes/annotations
syn match dAnnotation	"@[_$a-zA-Z][_$a-zA-Z0-9_]*\>" contains=dAttribute

" Version Identifiers
syn match dVersion      "\<version\>"
syn match dVersion      "\<version\s*([_a-zA-Z][_a-zA-Z0-9]*\>"he=s+7 contains=dVersionIdentifier

" Scope Identifiers
syn match dStatement    "\<scope\>"
syn match dStatement    "\<scope\s*([_a-zA-Z][_a-zA-Z0-9]*\>"he=s+5 contains=dScopeIdentifier

" Traits Statement
syn match dStatement    "\<__traits\>"
syn match dStatement    "\<__traits\s*([_a-zA-Z][_a-zA-Z0-9]*\>"he=s+8 contains=dTraitsIdentifier

" Pragma Statement
syn match dPragma       "\<pragma\>"
syn match dPragma       "\<pragma\s*([_a-zA-Z][_a-zA-Z0-9]*\>"he=s+6 contains=dPragmaIdentifier

" Necessary to highlight C++ in extern modifiers.
syn match dExternIdentifier "C\(++\)\?" contained

" Extern Identifiers
syn match dExternal     "\<extern\>"
syn match dExtern       "\<extern\s*([_a-zA-Z][_a-zA-Z0-9\+]*\>"he=s+6 contains=dExternIdentifier

" Make import a region to prevent highlighting keywords
syn region dImport start="\<import\_s" end=";" contains=dExternal,@dComment

" Make module a region to prevent highlighting keywords
syn region dImport start="\<module\_s" end=";" contains=dExternal,@dComment

" dTokens is used by the token string highlighting
syn cluster dTokens contains=dExternal,dConditional,dBranch,dRepeat,dBoolean
syn cluster dTokens add=dConstant,dTypedef,dStructure,dOperator,dOpOverload
syn cluster dTokens add=dType,dDebug,dExceptions,dScopeDecl,dStatement
syn cluster dTokens add=dStorageClass,dPragma,dAssert,dAnnotation,dEnum
syn cluster dTokens add=dParenString,dBrackString,dAngleString,dCurlyString
syn cluster dTokens add=dTokenString,dDelimString,dHereString

" Create a match for parameter lists to identify storage class
syn region paramlist start="(" end=")" contains=@dTokens

" Labels
"
" We contain dScopeDecl so public: private: etc. are not highlighted like labels
syn match dUserLabel    "^\s*[_$a-zA-Z][_$a-zA-Z0-9_]*\s*:"he=e-1 contains=dLabel,dScopeDecl,dEnum
syn keyword dLabel      case default

syn cluster dTokens add=dUserLabel,dLabel

" Comments
"
syn match	dCommentError	display "\*/"
syn match	dNestedCommentError	display "+/"

syn keyword dTodo                                                                contained TODO FIXME TEMP REFACTOR REVIEW HACK BUG XXX
syn match dCommentStar	contained "^\s*\*[^/]"me=e-1
syn match dCommentStar	contained "^\s*\*$"
syn match dCommentPlus	contained "^\s*+[^/]"me=e-1
syn match dCommentPlus	contained "^\s*+$"
if exists("d_comment_strings")
  syn region dBlockCommentString	contained start=+"+ end=+"+ end=+\*/+me=s-1,he=s-1 contains=dCommentStar,dUnicode,dEscSequence,@Spell
  syn region dNestedCommentString	contained start=+"+ end=+"+ end="+"me=s-1,he=s-1 contains=dCommentPlus,dUnicode,dEscSequence,@Spell
  syn region dLineCommentString		contained start=+"+ end=+$\|"+ contains=dUnicode,dEscSequence,@Spell
endif

syn region dBlockComment	start="/\*"  end="\*/" contains=dBlockCommentString,dTodo,dCommentStartError,@Spell fold
syn region dNestedComment	start="/+"  end="+/" contains=dNestedComment,dNestedCommentString,dTodo,@Spell fold
syn match  dLineComment	"//.*" contains=dLineCommentString,dTodo,@Spell

hi link dLineCommentString	dBlockCommentString
hi link dBlockCommentString	dString
hi link dNestedCommentString	dString
hi link dCommentStar		dBlockComment
hi link dCommentPlus		dNestedComment

syn cluster dTokens add=dBlockComment,dNestedComment,dLineComment

" /+ +/ style comments and strings that span multiple lines can cause
" problems. To play it safe, set minlines to a large number.
syn sync minlines=200
" Use ccomment for /* */ style comments
syn sync ccomment dBlockComment

" Characters
"
syn match dSpecialCharError contained "[^']"

" Escape sequences (oct,specal char,hex,wchar, character entities \&xxx;)
" These are not contained because they are considered string literals.
syn match dEscSequence	"\\\(\o\{1,3}\|[\"\\'\\?ntbrfva]\|u\x\{4}\|U\x\{8}\|x\x\x\)"
syn match dEscSequence	"\\&[^;& \t]\+;"
syn match dCharacter	"'[^']*'" contains=dEscSequence,dSpecialCharError
syn match dCharacter	"'\\''" contains=dEscSequence
syn match dCharacter	"'[^\\]'"

syn cluster dTokens add=dEscSequence,dCharacter

" Unicode characters
"
syn match dUnicode "\\u\d\{4\}"

" String.
"
syn match	dFormat		display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlL]\|ll\)\=\([bdiuoxXDOUfeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
syn match	dFormat		display "%%" contained

syn region dString	start=+"+ end=+"[cwd]\=+ skip=+\\\\\|\\"+ contains=dFormat,dEscSequence,@Spell
syn region dRawString	start=+`+ end=+`[cwd]\=+ contains=@Spell
syn region dRawString	start=+r"+ end=+"[cwd]\=+ contains=@Spell
syn region dHexString	start=+x"+ end=+"[cwd]\=+ contains=@Spell
syn region dDelimString	start=+q"\z(.\)+ end=+\z1"+ contains=@Spell
syn region dHereString	start=+q"\z(\I\i*\)\n+ end=+^\z1"+ contains=@Spell


" Nesting delimited string contents
"
syn region dNestParenString start=+(+ end=+)+ contained transparent contains=dNestParenString,@Spell
syn region dNestBrackString start=+\[+ end=+\]+ contained transparent contains=dNestBrackString,@Spell
syn region dNestAngleString start=+<+ end=+>+ contained transparent contains=dNestAngleString,@Spell
syn region dNestCurlyString start=+{+ end=+}+ contained transparent contains=dNestCurlyString,@Spell

" Nesting delimited strings
"
syn region dParenString	matchgroup=dParenString start=+q"(+ end=+)"+ contains=dNestParenString,@Spell
syn region dBrackString	matchgroup=dBrackString start=+q"\[+ end=+\]"+ contains=dNestBrackString,@Spell
syn region dAngleString	matchgroup=dAngleString start=+q"<+ end=+>"+ contains=dNestAngleString,@Spell
syn region dCurlyString	matchgroup=dCurlyString start=+q"{+ end=+}"+ contains=dNestCurlyString,@Spell

hi link dParenString dNestString
hi link dBrackString dNestString
hi link dAngleString dNestString
hi link dCurlyString dNestString

syn cluster dTokens add=dString,dRawString,dHexString,dDelimString,dNestString

" Token strings
"
syn region dNestTokenString start=+{+ end=+}+ contained contains=dNestTokenString,@dTokens,dFormat
syn region dTokenString matchgroup=dTokenStringBrack transparent start=+q{+ end=+}+ contains=dNestTokenString,@dTokens,dFormat

syn cluster dTokens add=dTokenString

" Numbers
"
syn case ignore

syn match dDec		display "\<\d[0-9_]*\(u\=l\=\|l\=u\=\)\>"

" Hex number
syn match dHex		display "\<0x[0-9a-f_]\+\(u\=l\=\|l\=u\=\)\>"

syn match dOctal	display "\<0[0-7_]\+\(u\=l\=\|l\=u\=\)\>"
" flag an octal number with wrong digits
syn match dOctalError	display "\<0[0-7_]*[89][0-9_]*"

" binary numbers
syn match dBinary	display "\<0b[01_]\+\(u\=l\=\|l\=u\=\)\>"

"floating point without the dot
syn match dFloat	display "\<\d[0-9_]*\(fi\=\|l\=i\)\>"
"floating point number, with dot, optional exponent
syn match dFloat	display "\<\d[0-9_]*\.[0-9_]*\(e[-+]\=[0-9_]\+\)\=[fl]\=i\="
"floating point number, starting with a dot, optional exponent
syn match dFloat	display "\(\.[0-9_]\+\)\(e[-+]\=[0-9_]\+\)\=[fl]\=i\=\>"
"floating point number, without dot, with exponent
"syn match dFloat	display "\<\d\+e[-+]\=\d\+[fl]\=\>"
syn match dFloat	display "\<\d[0-9_]*e[-+]\=[0-9_]\+[fl]\=\>"

"floating point without the dot
syn match dHexFloat	display "\<0x[0-9a-f_]\+\(fi\=\|l\=i\)\>"
"floating point number, with dot, optional exponent
syn match dHexFloat	display "\<0x[0-9a-f_]\+\.[0-9a-f_]*\(p[-+]\=[0-9_]\+\)\=[fl]\=i\="
"floating point number, without dot, with exponent
syn match dHexFloat	display "\<0x[0-9a-f_]\+p[-+]\=[0-9_]\+[fl]\=i\=\>"

syn cluster dTokens add=dDec,dHex,dOctal,dOctalError,dBinary,dFloat,dHexFloat

syn case match

" Pragma (preprocessor) support
" TODO: Highlight following Integer and optional Filespec.
syn region  dPragma start="#\s*\(line\>\)" skip="\\$" end="$"

" Block
"
syn region dBlock	start="{" end="}" transparent fold


" The default highlighting.
"
hi def link dBinary              Number
hi def link dDec                 Number
hi def link dHex                 Number
hi def link dOctal               Number
hi def link dFloat               Float
hi def link dHexFloat            Float
hi def link dDebug               Debug
hi def link dBranch              Conditional
hi def link dConditional         Conditional
hi def link dLabel               Label
hi def link dUserLabel           Label
hi def link dRepeat              Repeat
hi def link dExceptions          Exception
hi def link dAssert              Statement
hi def link dStatement           Statement
hi def link dScopeDecl           dStorageClass
hi def link dStorageClass        StorageClass
hi def link dBoolean             Boolean
hi def link dUnicode             Special
hi def link dTokenStringBrack    String
hi def link dHereString          String
hi def link dNestString          String
hi def link dDelimString         String
hi def link dRawString           String
hi def link dString              String
hi def link dHexString           String
hi def link dCharacter           Character
hi def link dEscSequence         SpecialChar
hi def link dFormat              SpecialChar
hi def link dSpecialCharError    Error
hi def link dOctalError          Error
hi def link dOperator            Operator
hi def link dOpOverload          Identifier
hi def link dConstant            Constant
hi def link dTypedef             Typedef
hi def link dEnum                Structure
hi def link dStructure           Structure
hi def link dTodo                Todo
hi def link dType                Type
hi def link dLineComment         Comment
hi def link dBlockComment        Comment
hi def link dNestedComment       Comment
hi def link dCommentError        Error
hi def link dNestedCommentError  Error
hi def link dCommentStartError   Error
hi def link dExternal            Include
hi def link dAnnotation          PreProc
hi def link dSharpBang           PreProc
hi def link dAttribute           StorageClass
hi def link dIdentifier          Identifier
hi def link dVersion             dStatement
hi def link dVersionIdentifier   Identifier
hi def link dScopeIdentifier     Identifier
hi def link dTraitsIdentifier    Identifier
hi def link dPragma              PreProc
hi def link dPragmaIdentifier    Identifier
hi def link dExtern              dExternal
hi def link dExternIdentifier    Identifier

" Marks contents of the asm statment body as special

syn match dAsmStatement "\<asm\>"
syn region dAsmBody start="asm[\n]*\s*{"hs=e+1 end="}"he=e-1 contains=dAsmStatement,dAsmOpCode,@dComment,DUserLabel

hi def link dAsmBody dUnicode
hi def link dAsmStatement dStatement
hi def link dAsmOpCode Identifier

syn keyword dAsmOpCode contained	aaa		aad		aam		aas
syn keyword dAsmOpCode contained	add		addpd		addps		addsd
syn keyword dAsmOpCode contained	and		andnpd		andnps		andpd
syn keyword dAsmOpCode contained	arpl		bound		bsf		bsr
syn keyword dAsmOpCode contained	bt		btc		btr		bts
syn keyword dAsmOpCode contained	call		bswap		andps		addss
syn keyword dAsmOpCode contained	cbw		cdq		clc		cld
syn keyword dAsmOpCode contained	cli		clts		cmc		cmova
syn keyword dAsmOpCode contained	cmovb		cmovbe		cmovc		cmove
syn keyword dAsmOpCode contained	cmovge		cmovl		cmovle		cmovna
syn keyword dAsmOpCode contained	cmovnae		cmovg		cmovae		clflush
syn keyword dAsmOpCode contained	cmovnb		cmovnbe		cmovnc		cmovne
syn keyword dAsmOpCode contained	cmovnge		cmovnl		cmovnle		cmovno
syn keyword dAsmOpCode contained	cmovns		cmovnz		cmovo		cmovp
syn keyword dAsmOpCode contained	cmovpo		cmovs		cmovz		cmp
syn keyword dAsmOpCode contained	cmppd		cmovpe		cmovnp		cmovng
syn keyword dAsmOpCode contained	cmpps		cmps		cmpsb		cmpsd
syn keyword dAsmOpCode contained	cmpsw		cmpxch8b	cmpxchg		comisd
syn keyword dAsmOpCode contained	cpuid		cvtdq2pd	cvtdq2ps	cvtpd2dq
syn keyword dAsmOpCode contained	cvtpd2ps	cvtpi2pd	cvtpi2ps	cvtps2dq
syn keyword dAsmOpCode contained	cvtps2pd	cvtpd2pi	comiss		cmpss
syn keyword dAsmOpCode contained	cvtps2pi	cvtsd2si	cvtsd2ss	cvtsi2sd
syn keyword dAsmOpCode contained	cvtss2sd	cvtss2si	cvttpd2dq	cvttpd2pi
syn keyword dAsmOpCode contained	cvttps2pi	cvttsd2si	cvttss2si	cwd
syn keyword dAsmOpCode contained	da		daa		das		db
syn keyword dAsmOpCode contained	dd		cwde		cvttps2dq	cvtsi2ss
syn keyword dAsmOpCode contained	de		dec		df		di
syn keyword dAsmOpCode contained	divpd		divps		divsd		divss
syn keyword dAsmOpCode contained	dq		ds		dt		dw
syn keyword dAsmOpCode contained	enter		f2xm1		fabs		fadd
syn keyword dAsmOpCode contained	faddp		emms		dl		div
syn keyword dAsmOpCode contained	fbld		fbstp		fchs		fclex
syn keyword dAsmOpCode contained	fcmovbe		fcmove		fcmovnb		fcmovnbe
syn keyword dAsmOpCode contained	fcmovnu		fcmovu		fcom		fcomi
syn keyword dAsmOpCode contained	fcomp		fcompp		fcos		fdecstp
syn keyword dAsmOpCode contained	fdisi		fcomip		fcmovne		fcmovb
syn keyword dAsmOpCode contained	fdiv		fdivp		fdivr		fdivrp
syn keyword dAsmOpCode contained	ffree		fiadd		ficom		ficomp
syn keyword dAsmOpCode contained	fidivr		fild		fimul		fincstp
syn keyword dAsmOpCode contained	fist		fistp		fisub		fisubr
syn keyword dAsmOpCode contained	fld		finit		fidiv		feni
syn keyword dAsmOpCode contained	fld1		fldcw		fldenv		fldl2e
syn keyword dAsmOpCode contained	fldlg2		fldln2		fldpi		fldz
syn keyword dAsmOpCode contained	fmulp		fnclex		fndisi		fneni
syn keyword dAsmOpCode contained	fnop		fnsave		fnstcw		fnstenv
syn keyword dAsmOpCode contained	fnstsw		fninit		fmul		fldl2t
syn keyword dAsmOpCode contained	fpatan		fprem		fprem1		fptan
syn keyword dAsmOpCode contained	frstor		fsave		fscale		fsetpm
syn keyword dAsmOpCode contained	fsincos		fsqrt		fst		fstcw
syn keyword dAsmOpCode contained	fstp		fstsw		fsub		fsubp
syn keyword dAsmOpCode contained	fsubr		fstenv		fsin		frndint
syn keyword dAsmOpCode contained	fsubrp		ftst		fucom		fucomi
syn keyword dAsmOpCode contained	fucomp		fucompp		fwait		fxam
syn keyword dAsmOpCode contained	fxrstor		fxsave		fxtract		fyl2x
syn keyword dAsmOpCode contained	hlt		idiv		imul		in
syn keyword dAsmOpCode contained	inc		fyl2xp1		fxch		fucomip
syn keyword dAsmOpCode contained	ins		insb		insd		insw
syn keyword dAsmOpCode contained	into		invd		invlpg		iret
syn keyword dAsmOpCode contained	ja		jae		jb		jbe
syn keyword dAsmOpCode contained	jcxz		je		jecxz		jg
syn keyword dAsmOpCode contained	jge		jc		iretd		int
syn keyword dAsmOpCode contained	jl		jle		jmp		jna
syn keyword dAsmOpCode contained	jnb		jnbe		jnc		jne
syn keyword dAsmOpCode contained	jnge		jnl		jnle		jno
syn keyword dAsmOpCode contained	jns		jnz		jo		jp
syn keyword dAsmOpCode contained	jpe		jnp		jng		jnae
syn keyword dAsmOpCode contained	jpo		js		jz		lahf
syn keyword dAsmOpCode contained	ldmxcsr		lds		lea		leave
syn keyword dAsmOpCode contained	lfence		lfs		lgdt		lgs
syn keyword dAsmOpCode contained	lldt		lmsw		lock		lods
syn keyword dAsmOpCode contained	lodsb		lidt		les		lar
syn keyword dAsmOpCode contained	lodsd		lodsw		loop		loope
syn keyword dAsmOpCode contained	loopnz		loopz		lsl		lss
syn keyword dAsmOpCode contained	maskmovdqu	maskmovq	maxpd		maxps
syn keyword dAsmOpCode contained	maxss		mfence		minpd		minps
syn keyword dAsmOpCode contained	minsd		maxsd		ltr		loopne
syn keyword dAsmOpCode contained	minss		mov		movapd		movaps
syn keyword dAsmOpCode contained	movdq2q		movdqa		movdqu		movhlps
syn keyword dAsmOpCode contained	movhps		movlhps		movlpd		movlps
syn keyword dAsmOpCode contained	movmskps	movntdq		movnti		movntpd
syn keyword dAsmOpCode contained	movntps		movmskpd	movhpd		movd
syn keyword dAsmOpCode contained	movntq		movq		movq2dq		movs
syn keyword dAsmOpCode contained	movsd		movss		movsw		movsx
syn keyword dAsmOpCode contained	movups		movzx		mul		mulpd
syn keyword dAsmOpCode contained	mulsd		mulss		neg		nop
syn keyword dAsmOpCode contained	not		mulps		movupd		movsb
syn keyword dAsmOpCode contained	or		orpd		orps		out
syn keyword dAsmOpCode contained	outsb		outsd		outsw		packssdw
syn keyword dAsmOpCode contained	packuswb	paddb		paddd		paddq
syn keyword dAsmOpCode contained	paddsw		paddusb		paddusw		paddw
syn keyword dAsmOpCode contained	pand		paddsb		packsswb	outs
syn keyword dAsmOpCode contained	pandn		pavgb		pavgw		pcmpeqb
syn keyword dAsmOpCode contained	pcmpeqw		pcmpgtb		pcmpgtd		pcmpgtw
syn keyword dAsmOpCode contained	pinsrw		pmaddwd		pmaxsw		pmaxub
syn keyword dAsmOpCode contained	pminub		pmovmskb	pmulhuw		pmulhw
syn keyword dAsmOpCode contained	pmullw		pminsw		pextrw		pcmpeqd
syn keyword dAsmOpCode contained	pmuludq		pop		popa		popad
syn keyword dAsmOpCode contained	popfd		por		prefetchnta	prefetcht0
syn keyword dAsmOpCode contained	prefetcht2	psadbw		pshufd		pshufhw
syn keyword dAsmOpCode contained	pshufw		pslld		pslldq		psllq
syn keyword dAsmOpCode contained	psllw		pshuflw		prefetcht1	popf
syn keyword dAsmOpCode contained	psrad		psraw		psrld		psrldq
syn keyword dAsmOpCode contained	psrlw		psubb		psubd		psubq
syn keyword dAsmOpCode contained	psubsw		psubusb		psubusw		psubw
syn keyword dAsmOpCode contained	punpckhdq	punpckhqdq	punpckhwd	punpcklbw
syn keyword dAsmOpCode contained	punpckldq	punpckhbw	psubsb		psrlq
syn keyword dAsmOpCode contained	punpcklqdq	punpcklwd	push		pusha
syn keyword dAsmOpCode contained	pushf		pushfd		pxor		rcl
syn keyword dAsmOpCode contained	rcpss		rcr		rdmsr		rdpmc
syn keyword dAsmOpCode contained	rep		repe		repne		repnz
syn keyword dAsmOpCode contained	repz		rdtsc		rcpps		pushad
syn keyword dAsmOpCode contained	ret		retf		rol		ror
syn keyword dAsmOpCode contained	rsqrtps		rsqrtss		sahf		sal
syn keyword dAsmOpCode contained	sbb		scas		scasb		scasd
syn keyword dAsmOpCode contained	seta		setae		setb		setbe
syn keyword dAsmOpCode contained	setc		scasw		sar		rsm
syn keyword dAsmOpCode contained	sete		setg		setge		setl
syn keyword dAsmOpCode contained	setna		setnae		setnb		setnbe
syn keyword dAsmOpCode contained	setne		setng		setnge		setnl
syn keyword dAsmOpCode contained	setno		setnp		setns		setnz
syn keyword dAsmOpCode contained	seto		setnle		setnc		setle
syn keyword dAsmOpCode contained	setp		setpe		setpo		sets
syn keyword dAsmOpCode contained	sfence		sgdt		shl		shld
syn keyword dAsmOpCode contained	shrd		shufpd		shufps		sidt
syn keyword dAsmOpCode contained	smsw		sqrtpd		sqrtps		sqrtsd
syn keyword dAsmOpCode contained	sqrtss		sldt		shr		setz
syn keyword dAsmOpCode contained	stc		std		sti		stmxcsr
syn keyword dAsmOpCode contained	stosb		stosd		stosw		str
syn keyword dAsmOpCode contained	subpd		subps		subsd		subss
syn keyword dAsmOpCode contained	sysexit		test		ucomisd		ucomiss
syn keyword dAsmOpCode contained	ud2		sysenter	sub		stos
syn keyword dAsmOpCode contained	unpckhpd	unpckhps	unpcklpd	unpcklps
syn keyword dAsmOpCode contained	verw		wbinvd		wrmsr		xadd
syn keyword dAsmOpCode contained	xchg		xlatb		xor		xorpd
syn keyword dAsmOpCode contained	xorps		pfrcpit1	pfmin		movddup
syn keyword dAsmOpCode contained	addsubpd	addsubps	fisttp		haddps
syn keyword dAsmOpCode contained	hsubpd		hsubps		lddqu		monitor
syn keyword dAsmOpCode contained	haddpd		xlat		wait		verr
syn keyword dAsmOpCode contained	movshdup	movsldup	mwait		pfcmpeq
syn keyword dAsmOpCode contained	pavgusb		pf2id		pfacc		pfadd
syn keyword dAsmOpCode contained	pfcmpge		pfcmpgt		pfmax		pfmul
syn keyword dAsmOpCode contained	pfnacc		pfpnacc		pfrcp		pfrcpit1
syn keyword dAsmOpCode contained	pfrsqit1	pfrsqrt		pfsub		pfsubr
syn keyword dAsmOpCode contained	pmulhrw 	pswapd		syscall		sysret
syn keyword dAsmOpCode contained	vpmuldq		xgetbv		cmpxchg8b	cmpxchg16b
syn keyword dAsmOpCode contained	pabsb		pabsd		pabsw		palignr
syn keyword dAsmOpCode contained	phaddd		phaddsw		phaddw		phsubd
syn keyword dAsmOpCode contained	phsubsw		phsubw		pmaddubsw	pmulhrsw
syn keyword dAsmOpCode contained	pshufb		psignb		psignd		psignw
syn keyword dAsmOpCode contained	popfq		pushfq		blendpd		blendps
syn keyword dAsmOpCode contained	blendvpd	blendvps	extractps	insertps
syn keyword dAsmOpCode contained	movntdqa	mpsadbw		packusdw	pblendvb
syn keyword dAsmOpCode contained	pblendw		pcmpeqq		pextrb		pextrd
syn keyword dAsmOpCode contained	pextrq		phminposuw	pinsrb		pinsrd
syn keyword dAsmOpCode contained	pinsrq		pmaxsb		pmaxsd		pmaxud
syn keyword dAsmOpCode contained	pmaxuw		pminsb		pminsd		pminud
syn keyword dAsmOpCode contained	pminuw		pmulld		ptest		roundpd
syn keyword dAsmOpCode contained	roundps		roundsd		roundss		pmuldq
syn keyword dAsmOpCode contained	pmovsxbd	pmovsxdq	pmovzxbq	pmovzxdq
syn keyword dAsmOpCode contained	pmovsxbq	pmovsxwd	pmovzxbq	pmovzxwd
syn keyword dAsmOpCode contained	pmovsxbw	pmovsxwq	pmovzxbw	pmovzxwq
syn keyword dAsmOpCode contained	crc32		pcmpestri	pcmpestrm	pcmpgtq
syn keyword dAsmOpCode contained	pcmpistri	pcmpistrm	popcnt		pi2fd
syn keyword dAsmOpCode contained	adc

let &cpo = s:cpo_save
unlet s:cpo_save
                                         .vim/syntax/php.vim                                                                                 000644  000765  000024  00000236043 13023255212 015466  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language: php PHP 3/4/5/7
" Maintainer: Jason Woofenden <jason@jasonwoof.com>
" Last Change: Dec 11, 2016
" URL: https://jasonwoof.com/gitweb/?p=vim-syntax.git;a=blob;f=php.vim;hb=HEAD
" Former Maintainers: Peter Hodge <toomuchphp-vim@yahoo.com>
"         Debian VIM Maintainers <pkg-vim-maintainers@lists.alioth.debian.org>
"
" Note: If you are using a colour terminal with dark background, you will probably find
"       the 'elflord' colorscheme is much better for PHP's syntax than the default
"       colourscheme, because elflord's colours will better highlight the break-points
"       (Statements) in your code.
"
" Options:  php_sql_query = 1  for SQL syntax highlighting inside strings
"           php_htmlInStrings = 1  for HTML syntax highlighting inside strings
"           php_baselib = 1  for highlighting baselib functions
"           php_asp_tags = 1  for highlighting ASP-style short tags
"           php_parent_error_close = 1  for highlighting parent error ] or )
"           php_parent_error_open = 1  for skipping an php end tag, if there exists an open ( or [ without a closing one
"           php_oldStyle = 1  for using old colorstyle
"           php_noShortTags = 1  don't sync <? ?> as php
"           php_folding = 1  for folding classes and functions
"           php_folding = 2  for folding all { } regions
"           php_sync_method = x
"                             x=-1 to sync by search ( default )
"                             x>0 to sync at least x lines backwards
"                             x=0 to sync from start
"
"       Added by Peter Hodge On June 9, 2006:
"           php_special_functions = 1|0 to highlight functions with abnormal behaviour
"           php_alt_comparisons = 1|0 to highlight comparison operators in an alternate colour
"           php_alt_assignByReference = 1|0 to highlight '= &' in an alternate colour
"
"           Note: these all default to 1 (On), so you would set them to '0' to turn them off.
"                 E.g., in your .vimrc or _vimrc file:
"                   let php_special_functions = 0
"                   let php_alt_comparisons = 0
"                   let php_alt_assignByReference = 0
"                 Unletting these variables will revert back to their default (On).
"
"
" Note:
" Setting php_folding=1 will match a closing } by comparing the indent
" before the class or function keyword with the indent of a matching }.
" Setting php_folding=2 will match all of pairs of {,} ( see known
" bugs ii )

" Known Bugs:
"  - setting  php_parent_error_close  on  and  php_parent_error_open  off
"    has these two leaks:
"     i) A closing ) or ] inside a string match to the last open ( or [
"        before the string, when the the closing ) or ] is on the same line
"        where the string started. In this case a following ) or ] after
"        the string would be highlighted as an error, what is incorrect.
"    ii) Same problem if you are setting php_folding = 2 with a closing
"        } inside an string on the first line of this string.

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'php'
endif

runtime! syntax/html.vim
unlet b:current_syntax

" accept old options
if !exists("php_sync_method")
  if exists("php_minlines")
    let php_sync_method=php_minlines
  else
    let php_sync_method=-1
  endif
endif

if exists("php_parentError") && !exists("php_parent_error_open") && !exists("php_parent_error_close")
  let php_parent_error_close=1
  let php_parent_error_open=1
endif

syn cluster htmlPreproc add=phpRegion,phpRegionAsp,phpRegionSc

syn include @sqlTop syntax/sql.vim
syn sync clear
unlet b:current_syntax
syn cluster sqlTop remove=sqlString,sqlComment
if exists( "php_sql_query")
  syn cluster phpAddStrings contains=@sqlTop
endif

if exists( "php_htmlInStrings")
  syn cluster phpAddStrings add=@htmlTop
endif

" make sure we can use \ at the begining of the line to do a continuation
let s:cpo_save = &cpo
set cpo&vim

syn case match

" Env Variables
syn keyword phpEnvVar GATEWAY_INTERFACE SERVER_NAME SERVER_SOFTWARE SERVER_PROTOCOL REQUEST_METHOD QUERY_STRING DOCUMENT_ROOT HTTP_ACCEPT HTTP_ACCEPT_CHARSET HTTP_ENCODING HTTP_ACCEPT_LANGUAGE HTTP_CONNECTION HTTP_HOST HTTP_REFERER HTTP_USER_AGENT REMOTE_ADDR REMOTE_PORT SCRIPT_FILENAME SERVER_ADMIN SERVER_PORT SERVER_SIGNATURE PATH_TRANSLATED SCRIPT_NAME REQUEST_URI contained

" Internal Variables
syn keyword phpIntVar GLOBALS PHP_ERRMSG PHP_SELF HTTP_GET_VARS HTTP_POST_VARS HTTP_COOKIE_VARS HTTP_POST_FILES HTTP_ENV_VARS HTTP_SERVER_VARS HTTP_SESSION_VARS HTTP_RAW_POST_DATA HTTP_STATE_VARS _GET _POST _COOKIE _FILES _SERVER _ENV _SERVER _REQUEST _SESSION  contained

" Constants
syn keyword phpCoreConstant PHP_VERSION PHP_OS DEFAULT_INCLUDE_PATH PEAR_INSTALL_DIR PEAR_EXTENSION_DIR PHP_EXTENSION_DIR PHP_BINDIR PHP_LIBDIR PHP_DATADIR PHP_SYSCONFDIR PHP_LOCALSTATEDIR PHP_CONFIG_FILE_PATH PHP_OUTPUT_HANDLER_START PHP_OUTPUT_HANDLER_CONT PHP_OUTPUT_HANDLER_END contained

" Predefined constants
" Generated by: curl -q http://php.net/manual/en/errorfunc.constants.php | grep -oP 'E_\w+' | sort -u
syn keyword phpCoreConstant E_ALL E_COMPILE_ERROR E_COMPILE_WARNING E_CORE_ERROR E_CORE_WARNING E_DEPRECATED E_ERROR E_NOTICE E_PARSE E_RECOVERABLE_ERROR E_STRICT E_USER_DEPRECATED E_USER_ERROR E_USER_NOTICE E_USER_WARNING E_WARNING contained

syn case ignore

syn keyword phpConstant  __LINE__ __FILE__ __FUNCTION__ __METHOD__ __CLASS__ __DIR__ __NAMESPACE__  contained


" Function and Methods ripped from php_manual_de.tar.gz Jan 2003
syn keyword phpFunctions  apache_child_terminate apache_get_modules apache_get_version apache_getenv apache_lookup_uri apache_note apache_request_headers apache_response_headers apache_setenv ascii2ebcdic ebcdic2ascii getallheaders virtual contained
syn keyword phpFunctions  array_change_key_case array_chunk array_column array_combine array_count_values array_diff_assoc array_diff_key array_diff_uassoc array_diff_ukey array_diff array_fill_keys array_fill array_filter array_flip array_intersect_assoc array_intersect_key array_intersect_uassoc array_intersect_ukey array_intersect array_key_exists array_keys array_map array_merge_recursive array_merge array_multisort array_pad array_pop array_product array_push array_rand array_reduce array_replace_recursive array_replace array_reverse array_search array_shift array_slice array_splice array_sum array_udiff_assoc array_udiff_uassoc array_udiff array_uintersect_assoc array_uintersect_uassoc array_uintersect array_unique array_unshift array_values array_walk_recursive array_walk arsort asort count current each end in_array key_exists key krsort ksort natcasesort natsort next pos prev range reset rsort shuffle sizeof sort uasort uksort usort contained
syn keyword phpFunctions  aspell_check aspell_new aspell_suggest  contained
syn keyword phpFunctions  bcadd bccomp bcdiv bcmod bcmul bcpow bcpowmod bcscale bcsqrt bcsub  contained
syn keyword phpFunctions  bzclose bzcompress bzdecompress bzerrno bzerror bzerrstr bzflush bzopen bzread bzwrite  contained
syn keyword phpFunctions  cal_days_in_month cal_from_jd cal_info cal_to_jd easter_date easter_days frenchtojd gregoriantojd jddayofweek jdmonthname jdtofrench jdtogregorian jdtojewish jdtojulian jdtounix jewishtojd juliantojd unixtojd  contained
syn keyword phpFunctions  ccvs_add ccvs_auth ccvs_command ccvs_count ccvs_delete ccvs_done ccvs_init ccvs_lookup ccvs_new ccvs_report ccvs_return ccvs_reverse ccvs_sale ccvs_status ccvs_textvalue ccvs_void contained
syn keyword phpFunctions  call_user_method_array call_user_method class_exists get_class_methods get_class_vars get_class get_declared_classes get_object_vars get_parent_class is_a is_subclass_of method_exists contained
syn keyword phpFunctions  com VARIANT com_addref com_get com_invoke com_isenum com_load_typelib com_load com_propget com_propput com_propset com_release com_set  contained
syn keyword phpFunctions  cpdf_add_annotation cpdf_add_outline cpdf_arc cpdf_begin_text cpdf_circle cpdf_clip cpdf_close cpdf_closepath_fill_stroke cpdf_closepath_stroke cpdf_closepath cpdf_continue_text cpdf_curveto cpdf_end_text cpdf_fill_stroke cpdf_fill cpdf_finalize_page cpdf_finalize cpdf_global_set_document_limits cpdf_import_jpeg cpdf_lineto cpdf_moveto cpdf_newpath cpdf_open cpdf_output_buffer cpdf_page_init cpdf_place_inline_image cpdf_rect cpdf_restore cpdf_rlineto cpdf_rmoveto cpdf_rotate_text cpdf_rotate cpdf_save_to_file cpdf_save cpdf_scale cpdf_set_action_url cpdf_set_char_spacing cpdf_set_creator cpdf_set_current_page cpdf_set_font_directories cpdf_set_font_map_file cpdf_set_font cpdf_set_horiz_scaling cpdf_set_keywords cpdf_set_leading cpdf_set_page_animation cpdf_set_subject cpdf_set_text_matrix cpdf_set_text_pos cpdf_set_text_rendering cpdf_set_text_rise cpdf_set_title cpdf_set_viewer_preferences cpdf_set_word_spacing cpdf_setdash cpdf_setflat cpdf_setgray_fill cpdf_setgray_stroke cpdf_setgray cpdf_setlinecap cpdf_setlinejoin cpdf_setlinewidth cpdf_setmiterlimit cpdf_setrgbcolor_fill cpdf_setrgbcolor_stroke cpdf_setrgbcolor cpdf_show_xy cpdf_show cpdf_stringwidth cpdf_stroke cpdf_text cpdf_translate  contained
syn keyword phpFunctions  crack_check crack_closedict crack_getlastmessage crack_opendict contained
syn keyword phpFunctions  ctype_alnum ctype_alpha ctype_cntrl ctype_digit ctype_graph ctype_lower ctype_print ctype_punct ctype_space ctype_upper ctype_xdigit  contained
syn keyword phpFunctions  curl_close curl_errno curl_error curl_exec curl_getinfo curl_init curl_multi_add_handle curl_multi_close curl_multi_exec curl_multi_getcontent curl_multi_info_read curl_multi_init curl_multi_remove_handle curl_multi_select curl_setopt curl_version contained
syn keyword phpFunctions  cybercash_base64_decode cybercash_base64_encode cybercash_decr cybercash_encr contained
syn keyword phpFunctions  cyrus_authenticate cyrus_bind cyrus_close cyrus_connect cyrus_query cyrus_unbind  contained
syn keyword phpFunctions  checkdate date getdate gettimeofday gmdate gmmktime gmstrftime localtime microtime mktime strftime strtotime time contained
syn keyword phpFunctions  dba_close dba_delete dba_exists dba_fetch dba_firstkey dba_handlers dba_insert dba_key_split dba_list dba_nextkey dba_open dba_optimize dba_popen dba_replace dba_sync  contained
syn keyword phpFunctions  dbase_add_record dbase_close dbase_create dbase_delete_record dbase_get_header_info dbase_get_record_with_names dbase_get_record dbase_numfields dbase_numrecords dbase_open dbase_pack dbase_replace_record  contained
syn keyword phpFunctions  dblist dbmclose dbmdelete dbmexists dbmfetch dbmfirstkey dbminsert dbmnextkey dbmopen dbmreplace  contained
syn keyword phpFunctions  dbplus_add dbplus_aql dbplus_chdir dbplus_close dbplus_curr dbplus_errcode dbplus_errno dbplus_find dbplus_first dbplus_flush dbplus_freealllocks dbplus_freelock dbplus_freerlocks dbplus_getlock dbplus_getunique dbplus_info dbplus_last dbplus_lockrel dbplus_next dbplus_open dbplus_prev dbplus_rchperm dbplus_rcreate dbplus_rcrtexact dbplus_rcrtlike dbplus_resolve dbplus_restorepos dbplus_rkeys dbplus_ropen dbplus_rquery dbplus_rrename dbplus_rsecindex dbplus_runlink dbplus_rzap dbplus_savepos dbplus_setindex dbplus_setindexbynumber dbplus_sql dbplus_tcl dbplus_tremove dbplus_undo dbplus_undoprepare dbplus_unlockrel dbplus_unselect dbplus_update dbplus_xlockrel dbplus_xunlockrel contained
syn keyword phpFunctions  dbx_close dbx_compare dbx_connect dbx_error dbx_escape_string dbx_fetch_row dbx_query dbx_sort  contained
syn keyword phpFunctions  dio_close dio_fcntl dio_open dio_read dio_seek dio_stat dio_tcsetattr dio_truncate dio_write  contained
syn keyword phpFunctions  chdir chroot dir closedir getcwd opendir readdir rewinddir scandir  contained
syn keyword phpFunctions  domxml_new_doc domxml_open_file domxml_open_mem domxml_version domxml_xmltree domxml_xslt_stylesheet_doc domxml_xslt_stylesheet_file domxml_xslt_stylesheet xpath_eval_expression xpath_eval xpath_new_context xptr_eval xptr_new_context contained
syn keyword phpMethods  name specified value create_attribute create_cdata_section create_comment create_element_ns create_element create_entity_reference create_processing_instruction create_text_node doctype document_element dump_file dump_mem get_element_by_id get_elements_by_tagname html_dump_mem xinclude entities internal_subset name notations public_id system_id get_attribute_node get_attribute get_elements_by_tagname has_attribute remove_attribute set_attribute tagname add_namespace append_child append_sibling attributes child_nodes clone_node dump_node first_child get_content has_attributes has_child_nodes insert_before is_blank_node last_child next_sibling node_name node_type node_value owner_document parent_node prefix previous_sibling remove_child replace_child replace_node set_content set_name set_namespace unlink_node data target process result_dump_file result_dump_mem contained
syn keyword phpFunctions  dotnet_load contained
syn keyword phpFunctions  debug_backtrace debug_print_backtrace error_log error_reporting restore_error_handler set_error_handler trigger_error user_error  contained
syn keyword phpFunctions  escapeshellarg escapeshellcmd exec passthru proc_close proc_get_status proc_nice proc_open proc_terminate shell_exec system contained
syn keyword phpFunctions  fam_cancel_monitor fam_close fam_monitor_collection fam_monitor_directory fam_monitor_file fam_next_event fam_open fam_pending fam_resume_monitor fam_suspend_monitor contained
syn keyword phpFunctions  fbsql_affected_rows fbsql_autocommit fbsql_change_user fbsql_close fbsql_commit fbsql_connect fbsql_create_blob fbsql_create_clob fbsql_create_db fbsql_data_seek fbsql_database_password fbsql_database fbsql_db_query fbsql_db_status fbsql_drop_db fbsql_errno fbsql_error fbsql_fetch_array fbsql_fetch_assoc fbsql_fetch_field fbsql_fetch_lengths fbsql_fetch_object fbsql_fetch_row fbsql_field_flags fbsql_field_len fbsql_field_name fbsql_field_seek fbsql_field_table fbsql_field_type fbsql_free_result fbsql_get_autostart_info fbsql_hostname fbsql_insert_id fbsql_list_dbs fbsql_list_fields fbsql_list_tables fbsql_next_result fbsql_num_fields fbsql_num_rows fbsql_password fbsql_pconnect fbsql_query fbsql_read_blob fbsql_read_clob fbsql_result fbsql_rollback fbsql_select_db fbsql_set_lob_mode fbsql_set_transaction fbsql_start_db fbsql_stop_db fbsql_tablename fbsql_username fbsql_warnings  contained
syn keyword phpFunctions  fdf_add_doc_javascript fdf_add_template fdf_close fdf_create fdf_enum_values fdf_errno fdf_error fdf_get_ap fdf_get_attachment fdf_get_encoding fdf_get_file fdf_get_flags fdf_get_opt fdf_get_status fdf_get_value fdf_get_version fdf_header fdf_next_field_name fdf_open_string fdf_open fdf_remove_item fdf_save_string fdf_save fdf_set_ap fdf_set_encoding fdf_set_file fdf_set_flags fdf_set_javascript_action fdf_set_opt fdf_set_status fdf_set_submit_form_action fdf_set_target_frame fdf_set_value fdf_set_version  contained
syn keyword phpFunctions  filepro_fieldcount filepro_fieldname filepro_fieldtype filepro_fieldwidth filepro_retrieve filepro_rowcount filepro contained
syn keyword phpFunctions  basename chgrp chmod chown clearstatcache copy delete dirname disk_free_space disk_total_space diskfreespace fclose feof fflush fgetc fgetcsv fgets fgetss file_exists file_get_contents file_put_contents file fileatime filectime filegroup fileinode filemtime fileowner fileperms filesize filetype flock fnmatch fopen fpassthru fputs fread fscanf fseek fstat ftell ftruncate fwrite glob is_dir is_executable is_file is_link is_readable is_uploaded_file is_writable is_writeable link linkinfo lstat mkdir move_uploaded_file parse_ini_file pathinfo pclose popen readfile readlink realpath rename rewind rmdir set_file_buffer stat symlink tempnam tmpfile touch umask unlink  contained
syn keyword phpFunctions  fribidi_log2vis contained
syn keyword phpFunctions  ftp_alloc ftp_cdup ftp_chdir ftp_chmod ftp_close ftp_connect ftp_delete ftp_exec ftp_fget ftp_fput ftp_get_option ftp_get ftp_login ftp_mdtm ftp_mkdir ftp_nb_continue ftp_nb_fget ftp_nb_fput ftp_nb_get ftp_nb_put ftp_nlist ftp_pasv ftp_put ftp_pwd ftp_quit ftp_raw ftp_rawlist ftp_rename ftp_rmdir ftp_set_option ftp_site ftp_size ftp_ssl_connect ftp_systype  contained
syn keyword phpFunctions  call_user_func_array call_user_func create_function func_get_arg func_get_args func_num_args function_exists get_defined_functions register_shutdown_function register_tick_function unregister_tick_function contained
syn keyword phpFunctions  bind_textdomain_codeset bindtextdomain dcgettext dcngettext dgettext dngettext gettext ngettext textdomain  contained
syn keyword phpFunctions  gmp_abs gmp_add gmp_and gmp_clrbit gmp_cmp gmp_com gmp_div_q gmp_div_qr gmp_div_r gmp_div gmp_divexact gmp_fact gmp_gcd gmp_gcdext gmp_hamdist gmp_init gmp_intval gmp_invert gmp_jacobi gmp_legendre gmp_mod gmp_mul gmp_neg gmp_or gmp_perfect_square gmp_popcount gmp_pow gmp_powm gmp_prob_prime gmp_random gmp_scan0 gmp_scan1 gmp_setbit gmp_sign gmp_sqrt gmp_sqrtrem gmp_sqrtrm gmp_strval gmp_sub gmp_xor  contained
syn keyword phpFunctions  header headers_list headers_sent setcookie  contained
syn keyword phpFunctions  hw_api_attribute hwapi_hgcsp hw_api_content hw_api_object contained
syn keyword phpMethods  key langdepvalue value values checkin checkout children mimetype read content copy dbstat dcstat dstanchors dstofsrcanchors count reason find ftstat hwstat identify info insert insertanchor insertcollection insertdocument link lock move assign attreditable count insert remove title value object objectbyanchor parents description type remove replace setcommitedversion srcanchors srcsofdst unlock user userlist contained
syn keyword phpFunctions  hw_Array2Objrec hw_changeobject hw_Children hw_ChildrenObj hw_Close hw_Connect hw_connection_info hw_cp hw_Deleteobject hw_DocByAnchor hw_DocByAnchorObj hw_Document_Attributes hw_Document_BodyTag hw_Document_Content hw_Document_SetContent hw_Document_Size hw_dummy hw_EditText hw_Error hw_ErrorMsg hw_Free_Document hw_GetAnchors hw_GetAnchorsObj hw_GetAndLock hw_GetChildColl hw_GetChildCollObj hw_GetChildDocColl hw_GetChildDocCollObj hw_GetObject hw_GetObjectByQuery hw_GetObjectByQueryColl hw_GetObjectByQueryCollObj hw_GetObjectByQueryObj hw_GetParents hw_GetParentsObj hw_getrellink hw_GetRemote hw_getremotechildren hw_GetSrcByDestObj hw_GetText hw_getusername hw_Identify hw_InCollections hw_Info hw_InsColl hw_InsDoc hw_insertanchors hw_InsertDocument hw_InsertObject hw_mapid hw_Modifyobject hw_mv hw_New_Document hw_objrec2array hw_Output_Document hw_pConnect hw_PipeDocument hw_Root hw_setlinkroot hw_stat hw_Unlock hw_Who contained
syn keyword phpFunctions  ibase_add_user ibase_affected_rows ibase_blob_add ibase_blob_cancel ibase_blob_close ibase_blob_create ibase_blob_echo ibase_blob_get ibase_blob_import ibase_blob_info ibase_blob_open ibase_close ibase_commit_ret ibase_commit ibase_connect ibase_delete_user ibase_drop_db ibase_errcode ibase_errmsg ibase_execute ibase_fetch_assoc ibase_fetch_object ibase_fetch_row ibase_field_info ibase_free_event_handler ibase_free_query ibase_free_result ibase_gen_id ibase_modify_user ibase_name_result ibase_num_fields ibase_num_params ibase_param_info ibase_pconnect ibase_prepare ibase_query ibase_rollback_ret ibase_rollback ibase_set_event_handler ibase_timefmt ibase_trans ibase_wait_event  contained
syn keyword phpFunctions  iconv_get_encoding iconv_mime_decode_headers iconv_mime_decode iconv_mime_encode iconv_set_encoding iconv_strlen iconv_strpos iconv_strrpos iconv_substr iconv ob_iconv_handler contained
syn keyword phpFunctions  ifx_affected_rows ifx_blobinfile_mode ifx_byteasvarchar ifx_close ifx_connect ifx_copy_blob ifx_create_blob ifx_create_char ifx_do ifx_error ifx_errormsg ifx_fetch_row ifx_fieldproperties ifx_fieldtypes ifx_free_blob ifx_free_char ifx_free_result ifx_get_blob ifx_get_char ifx_getsqlca ifx_htmltbl_result ifx_nullformat ifx_num_fields ifx_num_rows ifx_pconnect ifx_prepare ifx_query ifx_textasvarchar ifx_update_blob ifx_update_char ifxus_close_slob ifxus_create_slob ifxus_free_slob ifxus_open_slob ifxus_read_slob ifxus_seek_slob ifxus_tell_slob ifxus_write_slob  contained
syn keyword phpFunctions  exif_imagetype exif_read_data exif_thumbnail gd_info getimagesize image_type_to_mime_type image2wbmp imagealphablending imageantialias imagearc imagechar imagecharup imagecolorallocate imagecolorallocatealpha imagecolorat imagecolorclosest imagecolorclosestalpha imagecolorclosesthwb imagecolordeallocate imagecolorexact imagecolorexactalpha imagecolormatch imagecolorresolve imagecolorresolvealpha imagecolorset imagecolorsforindex imagecolorstotal imagecolortransparent imagecopy imagecopymerge imagecopymergegray imagecopyresampled imagecopyresized imagecreate imagecreatefromgd2 imagecreatefromgd2part imagecreatefromgd imagecreatefromgif imagecreatefromjpeg imagecreatefrompng imagecreatefromstring imagecreatefromwbmp imagecreatefromxbm imagecreatefromxpm imagecreatetruecolor imagedashedline imagedestroy imageellipse imagefill imagefilledarc imagefilledellipse imagefilledpolygon imagefilledrectangle imagefilltoborder imagefontheight imagefontwidth imageftbbox imagefttext imagegammacorrect imagegd2 imagegd imagegif imageinterlace imageistruecolor imagejpeg imageline imageloadfont imagepalettecopy imagepng imagepolygon imagepsbbox imagepscopyfont imagepsencodefont imagepsextendfont imagepsfreefont imagepsloadfont imagepsslantfont imagepstext imagerectangle imagerotate imagesavealpha imagesetbrush imagesetpixel imagesetstyle imagesetthickness imagesettile imagestring imagestringup imagesx imagesy imagetruecolortopalette imagettfbbox imagettftext imagetypes imagewbmp iptcembed iptcparse jpeg2wbmp png2wbmp read_exif_data contained
syn keyword phpFunctions  imap_8bit imap_alerts imap_append imap_base64 imap_binary imap_body imap_bodystruct imap_check imap_clearflag_full imap_close imap_createmailbox imap_delete imap_deletemailbox imap_errors imap_expunge imap_fetch_overview imap_fetchbody imap_fetchheader imap_fetchstructure imap_get_quota imap_get_quotaroot imap_getacl imap_getmailboxes imap_getsubscribed imap_header imap_headerinfo imap_headers imap_last_error imap_list imap_listmailbox imap_listscan imap_listsubscribed imap_lsub imap_mail_compose imap_mail_copy imap_mail_move imap_mail imap_mailboxmsginfo imap_mime_header_decode imap_msgno imap_num_msg imap_num_recent imap_open imap_ping imap_qprint imap_renamemailbox imap_reopen imap_rfc822_parse_adrlist imap_rfc822_parse_headers imap_rfc822_write_address imap_scanmailbox imap_search imap_set_quota imap_setacl imap_setflag_full imap_sort imap_status imap_subscribe imap_thread imap_timeout imap_uid imap_undelete imap_unsubscribe imap_utf7_decode imap_utf7_encode imap_utf8  contained
syn keyword phpFunctions  assert_options assert dl extension_loaded get_cfg_var get_current_user get_defined_constants get_extension_funcs get_include_path get_included_files get_loaded_extensions get_magic_quotes_gpc get_magic_quotes_runtime get_required_files getenv getlastmod getmygid getmyinode getmypid getmyuid getopt getrusage ini_alter ini_get_all ini_get ini_restore ini_set main memory_get_usage php_ini_scanned_files php_logo_guid php_sapi_name php_uname phpcredits phpinfo phpversion putenv restore_include_path set_include_path set_magic_quotes_runtime set_time_limit version_compare zend_logo_guid zend_version contained
syn keyword phpFunctions  ingres_autocommit ingres_close ingres_commit ingres_connect ingres_fetch_array ingres_fetch_object ingres_fetch_row ingres_field_length ingres_field_name ingres_field_nullable ingres_field_precision ingres_field_scale ingres_field_type ingres_num_fields ingres_num_rows ingres_pconnect ingres_query ingres_rollback  contained
syn keyword phpFunctions  ircg_channel_mode ircg_disconnect ircg_fetch_error_msg ircg_get_username ircg_html_encode ircg_ignore_add ircg_ignore_del ircg_is_conn_alive ircg_join ircg_kick ircg_lookup_format_messages ircg_msg ircg_nick ircg_nickname_escape ircg_nickname_unescape ircg_notice ircg_part ircg_pconnect ircg_register_format_messages ircg_set_current ircg_set_file ircg_set_on_die ircg_topic ircg_whois  contained
syn keyword phpFunctions  java_last_exception_clear java_last_exception_get contained
syn keyword phpFunctions  json_decode json_encode json_last_error contained
syn keyword phpFunctions  ldap_8859_to_t61 ldap_add ldap_bind ldap_close ldap_compare ldap_connect ldap_count_entries ldap_delete ldap_dn2ufn ldap_err2str ldap_errno ldap_error ldap_explode_dn ldap_first_attribute ldap_first_entry ldap_first_reference ldap_free_result ldap_get_attributes ldap_get_dn ldap_get_entries ldap_get_option ldap_get_values_len ldap_get_values ldap_list ldap_mod_add ldap_mod_del ldap_mod_replace ldap_modify ldap_next_attribute ldap_next_entry ldap_next_reference ldap_parse_reference ldap_parse_result ldap_read ldap_rename ldap_search ldap_set_option ldap_set_rebind_proc ldap_sort ldap_start_tls ldap_t61_to_8859 ldap_unbind  contained
syn keyword phpFunctions  lzf_compress lzf_decompress lzf_optimized_for contained
syn keyword phpFunctions  ezmlm_hash mail contained
syn keyword phpFunctions  mailparse_determine_best_xfer_encoding mailparse_msg_create mailparse_msg_extract_part_file mailparse_msg_extract_part mailparse_msg_free mailparse_msg_get_part_data mailparse_msg_get_part mailparse_msg_get_structure mailparse_msg_parse_file mailparse_msg_parse mailparse_rfc822_parse_addresses mailparse_stream_encode mailparse_uudecode_all contained
syn keyword phpFunctions  abs acos acosh asin asinh atan2 atan atanh base_convert bindec ceil cos cosh decbin dechex decoct deg2rad exp expm1 floor fmod getrandmax hexdec hypot is_finite is_infinite is_nan lcg_value log10 log1p log max min mt_getrandmax mt_rand mt_srand octdec pi pow rad2deg rand round sin sinh sqrt srand tan tanh  contained
syn keyword phpFunctions  mb_convert_case mb_convert_encoding mb_convert_kana mb_convert_variables mb_decode_mimeheader mb_decode_numericentity mb_detect_encoding mb_detect_order mb_encode_mimeheader mb_encode_numericentity mb_ereg_match mb_ereg_replace mb_ereg_search_getpos mb_ereg_search_getregs mb_ereg_search_init mb_ereg_search_pos mb_ereg_search_regs mb_ereg_search_setpos mb_ereg_search mb_ereg mb_eregi_replace mb_eregi mb_get_info mb_http_input mb_http_output mb_internal_encoding mb_language mb_output_handler mb_parse_str mb_preferred_mime_name mb_regex_encoding mb_regex_set_options mb_send_mail mb_split mb_strcut mb_strimwidth mb_strlen mb_strpos mb_strrpos mb_strtolower mb_strtoupper mb_strwidth mb_substitute_character mb_substr_count mb_substr  contained
syn keyword phpFunctions  mcal_append_event mcal_close mcal_create_calendar mcal_date_compare mcal_date_valid mcal_day_of_week mcal_day_of_year mcal_days_in_month mcal_delete_calendar mcal_delete_event mcal_event_add_attribute mcal_event_init mcal_event_set_alarm mcal_event_set_category mcal_event_set_class mcal_event_set_description mcal_event_set_end mcal_event_set_recur_daily mcal_event_set_recur_monthly_mday mcal_event_set_recur_monthly_wday mcal_event_set_recur_none mcal_event_set_recur_weekly mcal_event_set_recur_yearly mcal_event_set_start mcal_event_set_title mcal_expunge mcal_fetch_current_stream_event mcal_fetch_event mcal_is_leap_year mcal_list_alarms mcal_list_events mcal_next_recurrence mcal_open mcal_popen mcal_rename_calendar mcal_reopen mcal_snooze mcal_store_event mcal_time_valid mcal_week_of_year contained
syn keyword phpFunctions  mcrypt_cbc mcrypt_cfb mcrypt_create_iv mcrypt_decrypt mcrypt_ecb mcrypt_enc_get_algorithms_name mcrypt_enc_get_block_size mcrypt_enc_get_iv_size mcrypt_enc_get_key_size mcrypt_enc_get_modes_name mcrypt_enc_get_supported_key_sizes mcrypt_enc_is_block_algorithm_mode mcrypt_enc_is_block_algorithm mcrypt_enc_is_block_mode mcrypt_enc_self_test mcrypt_encrypt mcrypt_generic_deinit mcrypt_generic_end mcrypt_generic_init mcrypt_generic mcrypt_get_block_size mcrypt_get_cipher_name mcrypt_get_iv_size mcrypt_get_key_size mcrypt_list_algorithms mcrypt_list_modes mcrypt_module_close mcrypt_module_get_algo_block_size mcrypt_module_get_algo_key_size mcrypt_module_get_supported_key_sizes mcrypt_module_is_block_algorithm_mode mcrypt_module_is_block_algorithm mcrypt_module_is_block_mode mcrypt_module_open mcrypt_module_self_test mcrypt_ofb mdecrypt_generic  contained
syn keyword phpFunctions  mcve_adduser mcve_adduserarg mcve_bt mcve_checkstatus mcve_chkpwd mcve_chngpwd mcve_completeauthorizations mcve_connect mcve_connectionerror mcve_deleteresponse mcve_deletetrans mcve_deleteusersetup mcve_deluser mcve_destroyconn mcve_destroyengine mcve_disableuser mcve_edituser mcve_enableuser mcve_force mcve_getcell mcve_getcellbynum mcve_getcommadelimited mcve_getheader mcve_getuserarg mcve_getuserparam mcve_gft mcve_gl mcve_gut mcve_initconn mcve_initengine mcve_initusersetup mcve_iscommadelimited mcve_liststats mcve_listusers mcve_maxconntimeout mcve_monitor mcve_numcolumns mcve_numrows mcve_override mcve_parsecommadelimited mcve_ping mcve_preauth mcve_preauthcompletion mcve_qc mcve_responseparam mcve_return mcve_returncode mcve_returnstatus mcve_sale mcve_setblocking mcve_setdropfile mcve_setip mcve_setssl_files mcve_setssl mcve_settimeout mcve_settle mcve_text_avs mcve_text_code mcve_text_cv mcve_transactionauth mcve_transactionavs mcve_transactionbatch mcve_transactioncv mcve_transactionid mcve_transactionitem mcve_transactionssent mcve_transactiontext mcve_transinqueue mcve_transnew mcve_transparam mcve_transsend mcve_ub mcve_uwait mcve_verifyconnection mcve_verifysslcert mcve_void  contained
syn keyword phpFunctions  mhash_count mhash_get_block_size mhash_get_hash_name mhash_keygen_s2k mhash contained
syn keyword phpFunctions  mime_content_type contained
syn keyword phpFunctions  ming_setcubicthreshold ming_setscale ming_useswfversion SWFAction SWFBitmap swfbutton_keypress SWFbutton SWFDisplayItem SWFFill SWFFont SWFGradient SWFMorph SWFMovie SWFShape SWFSprite SWFText SWFTextField contained
syn keyword phpMethods  getHeight getWidth addAction addShape setAction setdown setHit setOver setUp addColor move moveTo multColor remove Rotate rotateTo scale scaleTo setDepth setName setRatio skewX skewXTo skewY skewYTo moveTo rotateTo scaleTo skewXTo skewYTo getwidth addEntry getshape1 getshape2 add nextframe output remove save setbackground setdimension setframes setrate streammp3 addFill drawCurve drawCurveTo drawLine drawLineTo movePen movePenTo setLeftFill setLine setRightFill add nextframe remove setframes addString getWidth moveTo setColor setFont setHeight setSpacing addstring align setbounds setcolor setFont setHeight setindentation setLeftMargin setLineSpacing setMargins setname setrightMargin contained
syn keyword phpFunctions  connection_aborted connection_status connection_timeout constant define defined die eval exit get_browser highlight_file highlight_string ignore_user_abort pack show_source sleep uniqid unpack usleep contained
syn keyword phpFunctions  udm_add_search_limit udm_alloc_agent udm_api_version udm_cat_list udm_cat_path udm_check_charset udm_check_stored udm_clear_search_limits udm_close_stored udm_crc32 udm_errno udm_error udm_find udm_free_agent udm_free_ispell_data udm_free_res udm_get_doc_count udm_get_res_field udm_get_res_param udm_load_ispell_data udm_open_stored udm_set_agent_param contained
syn keyword phpFunctions  msession_connect msession_count msession_create msession_destroy msession_disconnect msession_find msession_get_array msession_get msession_getdata msession_inc msession_list msession_listvar msession_lock msession_plugin msession_randstr msession_set_array msession_set msession_setdata msession_timeout msession_uniq msession_unlock  contained
syn keyword phpFunctions  msql_affected_rows msql_close msql_connect msql_create_db msql_createdb msql_data_seek msql_dbname msql_drop_db msql_dropdb msql_error msql_fetch_array msql_fetch_field msql_fetch_object msql_fetch_row msql_field_seek msql_fieldflags msql_fieldlen msql_fieldname msql_fieldtable msql_fieldtype msql_free_result msql_freeresult msql_list_dbs msql_list_fields msql_list_tables msql_listdbs msql_listfields msql_listtables msql_num_fields msql_num_rows msql_numfields msql_numrows msql_pconnect msql_query msql_regcase msql_result msql_select_db msql_selectdb msql_tablename msql  contained
syn keyword phpFunctions  mssql_bind mssql_close mssql_connect mssql_data_seek mssql_execute mssql_fetch_array mssql_fetch_assoc mssql_fetch_batch mssql_fetch_field mssql_fetch_object mssql_fetch_row mssql_field_length mssql_field_name mssql_field_seek mssql_field_type mssql_free_result mssql_free_statement mssql_get_last_message mssql_guid_string mssql_init mssql_min_error_severity mssql_min_message_severity mssql_next_result mssql_num_fields mssql_num_rows mssql_pconnect mssql_query mssql_result mssql_rows_affected mssql_select_db  contained
syn keyword phpFunctions  muscat_close muscat_get muscat_give muscat_setup_net muscat_setup contained
syn keyword phpFunctions  mysql_affected_rows mysql_change_user mysql_client_encoding mysql_close mysql_connect mysql_create_db mysql_data_seek mysql_db_name mysql_db_query mysql_drop_db mysql_errno mysql_error mysql_escape_string mysql_fetch_array mysql_fetch_assoc mysql_fetch_field mysql_fetch_lengths mysql_fetch_object mysql_fetch_row mysql_field_flags mysql_field_len mysql_field_name mysql_field_seek mysql_field_table mysql_field_type mysql_free_result mysql_get_client_info mysql_get_host_info mysql_get_proto_info mysql_get_server_info mysql_info mysql_insert_id mysql_list_dbs mysql_list_fields mysql_list_processes mysql_list_tables mysql_num_fields mysql_num_rows mysql_pconnect mysql_ping mysql_query mysql_real_escape_string mysql_result mysql_select_db mysql_stat mysql_tablename mysql_thread_id mysql_unbuffered_query  contained
syn keyword phpFunctions  mysqli_affected_rows mysqli_autocommit mysqli_bind_param mysqli_bind_result mysqli_change_user mysqli_character_set_name mysqli_close mysqli_commit mysqli_connect mysqli_data_seek mysqli_debug mysqli_disable_reads_from_master mysqli_disable_rpl_parse mysqli_dump_debug_info mysqli_enable_reads_from_master mysqli_enable_rpl_parse mysqli_errno mysqli_error mysqli_execute mysqli_fetch_array mysqli_fetch_assoc mysqli_fetch_field_direct mysqli_fetch_field mysqli_fetch_fields mysqli_fetch_lengths mysqli_fetch_object mysqli_fetch_row mysqli_fetch mysqli_field_count mysqli_field_seek mysqli_field_tell mysqli_free_result mysqli_get_client_info mysqli_get_host_info mysqli_get_proto_info mysqli_get_server_info mysqli_get_server_version mysqli_info mysqli_init mysqli_insert_id mysqli_kill mysqli_master_query mysqli_num_fields mysqli_num_rows mysqli_options mysqli_param_count mysqli_ping mysqli_prepare_result mysqli_prepare mysqli_profiler mysqli_query mysqli_read_query_result mysqli_real_connect mysqli_real_escape_string mysqli_real_query mysqli_reload mysqli_rollback mysqli_rpl_parse_enabled mysqli_rpl_probe mysqli_rpl_query_type mysqli_select_db mysqli_send_long_data mysqli_send_query mysqli_slave_query mysqli_ssl_set mysqli_stat mysqli_stmt_affected_rows mysqli_stmt_close mysqli_stmt_errno mysqli_stmt_error mysqli_stmt_store_result mysqli_store_result mysqli_thread_id mysqli_thread_safe mysqli_use_result mysqli_warning_count  contained
syn keyword phpFunctions  ncurses_addch ncurses_addchnstr ncurses_addchstr ncurses_addnstr ncurses_addstr ncurses_assume_default_colors ncurses_attroff ncurses_attron ncurses_attrset ncurses_baudrate ncurses_beep ncurses_bkgd ncurses_bkgdset ncurses_border ncurses_bottom_panel ncurses_can_change_color ncurses_cbreak ncurses_clear ncurses_clrtobot ncurses_clrtoeol ncurses_color_content ncurses_color_set ncurses_curs_set ncurses_def_prog_mode ncurses_def_shell_mode ncurses_define_key ncurses_del_panel ncurses_delay_output ncurses_delch ncurses_deleteln ncurses_delwin ncurses_doupdate ncurses_echo ncurses_echochar ncurses_end ncurses_erase ncurses_erasechar ncurses_filter ncurses_flash ncurses_flushinp ncurses_getch ncurses_getmaxyx ncurses_getmouse ncurses_getyx ncurses_halfdelay ncurses_has_colors ncurses_has_ic ncurses_has_il ncurses_has_key ncurses_hide_panel ncurses_hline ncurses_inch ncurses_init_color ncurses_init_pair ncurses_init ncurses_insch ncurses_insdelln ncurses_insertln ncurses_insstr ncurses_instr ncurses_isendwin ncurses_keyok ncurses_keypad ncurses_killchar ncurses_longname ncurses_meta ncurses_mouse_trafo ncurses_mouseinterval ncurses_mousemask ncurses_move_panel ncurses_move ncurses_mvaddch ncurses_mvaddchnstr ncurses_mvaddchstr ncurses_mvaddnstr ncurses_mvaddstr ncurses_mvcur ncurses_mvdelch ncurses_mvgetch ncurses_mvhline ncurses_mvinch ncurses_mvvline ncurses_mvwaddstr ncurses_napms ncurses_new_panel ncurses_newpad ncurses_newwin ncurses_nl ncurses_nocbreak ncurses_noecho ncurses_nonl ncurses_noqiflush ncurses_noraw ncurses_pair_content ncurses_panel_above ncurses_panel_below ncurses_panel_window ncurses_pnoutrefresh ncurses_prefresh ncurses_putp ncurses_qiflush ncurses_raw ncurses_refresh ncurses_replace_panel ncurses_reset_prog_mode ncurses_reset_shell_mode ncurses_resetty ncurses_savetty ncurses_scr_dump ncurses_scr_init ncurses_scr_restore ncurses_scr_set ncurses_scrl ncurses_show_panel ncurses_slk_attr ncurses_slk_attroff ncurses_slk_attron ncurses_slk_attrset ncurses_slk_clear ncurses_slk_color ncurses_slk_init ncurses_slk_noutrefresh ncurses_slk_refresh ncurses_slk_restore ncurses_slk_set ncurses_slk_touch ncurses_standend ncurses_standout ncurses_start_color ncurses_termattrs ncurses_termname ncurses_timeout ncurses_top_panel ncurses_typeahead ncurses_ungetch ncurses_ungetmouse ncurses_update_panels ncurses_use_default_colors ncurses_use_env ncurses_use_extended_names ncurses_vidattr ncurses_vline ncurses_waddch ncurses_waddstr ncurses_wattroff ncurses_wattron ncurses_wattrset ncurses_wborder ncurses_wclear ncurses_wcolor_set ncurses_werase ncurses_wgetch ncurses_whline ncurses_wmouse_trafo ncurses_wmove ncurses_wnoutrefresh ncurses_wrefresh ncurses_wstandend ncurses_wstandout ncurses_wvline contained
syn keyword phpFunctions  checkdnsrr closelog debugger_off debugger_on define_syslog_variables dns_check_record dns_get_mx dns_get_record fsockopen gethostbyaddr gethostbyname gethostbynamel getmxrr getprotobyname getprotobynumber getservbyname getservbyport ip2long long2ip openlog pfsockopen socket_get_status socket_set_blocking socket_set_timeout syslog contained
syn keyword phpFunctions  yp_all yp_cat yp_err_string yp_errno yp_first yp_get_default_domain yp_master yp_match yp_next yp_order contained
syn keyword phpFunctions  notes_body notes_copy_db notes_create_db notes_create_note notes_drop_db notes_find_note notes_header_info notes_list_msgs notes_mark_read notes_mark_unread notes_nav_create notes_search notes_unread notes_version contained
syn keyword phpFunctions  nsapi_request_headers nsapi_response_headers nsapi_virtual  contained
syn keyword phpFunctions  aggregate_info aggregate_methods_by_list aggregate_methods_by_regexp aggregate_methods aggregate_properties_by_list aggregate_properties_by_regexp aggregate_properties aggregate aggregation_info deaggregate  contained
syn keyword phpFunctions  ocibindbyname ocicancel ocicloselob ocicollappend ocicollassign ocicollassignelem ocicollgetelem ocicollmax ocicollsize ocicolltrim ocicolumnisnull ocicolumnname ocicolumnprecision ocicolumnscale ocicolumnsize ocicolumntype ocicolumntyperaw ocicommit ocidefinebyname ocierror ociexecute ocifetch ocifetchinto ocifetchstatement ocifreecollection ocifreecursor ocifreedesc ocifreestatement ociinternaldebug ociloadlob ocilogoff ocilogon ocinewcollection ocinewcursor ocinewdescriptor ocinlogon ocinumcols ociparse ociplogon ociresult ocirollback ocirowcount ocisavelob ocisavelobfile ociserverversion ocisetprefetch ocistatementtype ociwritelobtofile ociwritetemporarylob contained
syn keyword phpFunctions  odbc_autocommit odbc_binmode odbc_close_all odbc_close odbc_columnprivileges odbc_columns odbc_commit odbc_connect odbc_cursor odbc_data_source odbc_do odbc_error odbc_errormsg odbc_exec odbc_execute odbc_fetch_array odbc_fetch_into odbc_fetch_object odbc_fetch_row odbc_field_len odbc_field_name odbc_field_num odbc_field_precision odbc_field_scale odbc_field_type odbc_foreignkeys odbc_free_result odbc_gettypeinfo odbc_longreadlen odbc_next_result odbc_num_fields odbc_num_rows odbc_pconnect odbc_prepare odbc_primarykeys odbc_procedurecolumns odbc_procedures odbc_result_all odbc_result odbc_rollback odbc_setoption odbc_specialcolumns odbc_statistics odbc_tableprivileges odbc_tables  contained
syn keyword phpFunctions  openssl_csr_export_to_file openssl_csr_export openssl_csr_new openssl_csr_sign openssl_error_string openssl_free_key openssl_get_privatekey openssl_get_publickey openssl_open openssl_pkcs7_decrypt openssl_pkcs7_encrypt openssl_pkcs7_sign openssl_pkcs7_verify openssl_pkey_export_to_file openssl_pkey_export openssl_pkey_get_private openssl_pkey_get_public openssl_pkey_new openssl_private_decrypt openssl_private_encrypt openssl_public_decrypt openssl_public_encrypt openssl_seal openssl_sign openssl_verify openssl_x509_check_private_key openssl_x509_checkpurpose openssl_x509_export_to_file openssl_x509_export openssl_x509_free openssl_x509_parse openssl_x509_read contained
syn keyword phpFunctions  ora_bind ora_close ora_columnname ora_columnsize ora_columntype ora_commit ora_commitoff ora_commiton ora_do ora_error ora_errorcode ora_exec ora_fetch_into ora_fetch ora_getcolumn ora_logoff ora_logon ora_numcols ora_numrows ora_open ora_parse ora_plogon ora_rollback  contained
syn keyword phpFunctions  flush ob_clean ob_end_clean ob_end_flush ob_flush ob_get_clean ob_get_contents ob_get_flush ob_get_length ob_get_level ob_get_status ob_gzhandler ob_implicit_flush ob_list_handlers ob_start output_add_rewrite_var output_reset_rewrite_vars  contained
syn keyword phpFunctions  overload  contained
syn keyword phpFunctions  ovrimos_close ovrimos_commit ovrimos_connect ovrimos_cursor ovrimos_exec ovrimos_execute ovrimos_fetch_into ovrimos_fetch_row ovrimos_field_len ovrimos_field_name ovrimos_field_num ovrimos_field_type ovrimos_free_result ovrimos_longreadlen ovrimos_num_fields ovrimos_num_rows ovrimos_prepare ovrimos_result_all ovrimos_result ovrimos_rollback  contained
syn keyword phpFunctions  pcntl_exec pcntl_fork pcntl_signal pcntl_waitpid pcntl_wexitstatus pcntl_wifexited pcntl_wifsignaled pcntl_wifstopped pcntl_wstopsig pcntl_wtermsig contained
syn keyword phpFunctions  preg_grep preg_match_all preg_match preg_quote preg_replace_callback preg_replace preg_split  contained
syn keyword phpFunctions  pdf_add_annotation pdf_add_bookmark pdf_add_launchlink pdf_add_locallink pdf_add_note pdf_add_outline pdf_add_pdflink pdf_add_thumbnail pdf_add_weblink pdf_arc pdf_arcn pdf_attach_file pdf_begin_page pdf_begin_pattern pdf_begin_template pdf_circle pdf_clip pdf_close_image pdf_close_pdi_page pdf_close_pdi pdf_close pdf_closepath_fill_stroke pdf_closepath_stroke pdf_closepath pdf_concat pdf_continue_text pdf_curveto pdf_delete pdf_end_page pdf_end_pattern pdf_end_template pdf_endpath pdf_fill_stroke pdf_fill pdf_findfont pdf_get_buffer pdf_get_font pdf_get_fontname pdf_get_fontsize pdf_get_image_height pdf_get_image_width pdf_get_majorversion pdf_get_minorversion pdf_get_parameter pdf_get_pdi_parameter pdf_get_pdi_value pdf_get_value pdf_initgraphics pdf_lineto pdf_makespotcolor pdf_moveto pdf_new pdf_open_CCITT pdf_open_file pdf_open_gif pdf_open_image_file pdf_open_image pdf_open_jpeg pdf_open_memory_image pdf_open_pdi_page pdf_open_pdi pdf_open_png pdf_open_tiff pdf_open pdf_place_image pdf_place_pdi_page pdf_rect pdf_restore pdf_rotate pdf_save pdf_scale pdf_set_border_color pdf_set_border_dash pdf_set_border_style pdf_set_char_spacing pdf_set_duration pdf_set_font pdf_set_horiz_scaling pdf_set_info_author pdf_set_info_creator pdf_set_info_keywords pdf_set_info_subject pdf_set_info_title pdf_set_info pdf_set_leading pdf_set_parameter pdf_set_text_matrix pdf_set_text_pos pdf_set_text_rendering pdf_set_text_rise pdf_set_value pdf_set_word_spacing pdf_setcolor pdf_setdash pdf_setflat pdf_setfont pdf_setgray_fill pdf_setgray_stroke pdf_setgray pdf_setlinecap pdf_setlinejoin pdf_setlinewidth pdf_setmatrix pdf_setmiterlimit pdf_setpolydash pdf_setrgbcolor_fill pdf_setrgbcolor_stroke pdf_setrgbcolor pdf_show_boxed pdf_show_xy pdf_show pdf_skew pdf_stringwidth pdf_stroke pdf_translate contained
syn keyword phpFunctions  pfpro_cleanup pfpro_init pfpro_process_raw pfpro_process pfpro_version  contained
syn keyword phpFunctions  pg_affected_rows pg_cancel_query pg_client_encoding pg_close pg_connect pg_connection_busy pg_connection_reset pg_connection_status pg_convert pg_copy_from pg_copy_to pg_dbname pg_delete pg_end_copy pg_escape_bytea pg_escape_string pg_fetch_all pg_fetch_array pg_fetch_assoc pg_fetch_object pg_fetch_result pg_fetch_row pg_field_is_null pg_field_name pg_field_num pg_field_prtlen pg_field_size pg_field_type pg_free_result pg_get_notify pg_get_pid pg_get_result pg_host pg_insert pg_last_error pg_last_notice pg_last_oid pg_lo_close pg_lo_create pg_lo_export pg_lo_import pg_lo_open pg_lo_read_all pg_lo_read pg_lo_seek pg_lo_tell pg_lo_unlink pg_lo_write pg_meta_data pg_num_fields pg_num_rows pg_options pg_pconnect pg_ping pg_port pg_put_line pg_query pg_result_error pg_result_seek pg_result_status pg_select pg_send_query pg_set_client_encoding pg_trace pg_tty pg_unescape_bytea pg_untrace pg_update  contained
syn keyword phpFunctions  posix_ctermid posix_get_last_error posix_getcwd posix_getegid posix_geteuid posix_getgid posix_getgrgid posix_getgrnam posix_getgroups posix_getlogin posix_getpgid posix_getpgrp posix_getpid posix_getppid posix_getpwnam posix_getpwuid posix_getrlimit posix_getsid posix_getuid posix_isatty posix_kill posix_mkfifo posix_setegid posix_seteuid posix_setgid posix_setpgid posix_setsid posix_setuid posix_strerror posix_times posix_ttyname posix_uname contained
syn keyword phpFunctions  printer_abort printer_close printer_create_brush printer_create_dc printer_create_font printer_create_pen printer_delete_brush printer_delete_dc printer_delete_font printer_delete_pen printer_draw_bmp printer_draw_chord printer_draw_elipse printer_draw_line printer_draw_pie printer_draw_rectangle printer_draw_roundrect printer_draw_text printer_end_doc printer_end_page printer_get_option printer_list printer_logical_fontheight printer_open printer_select_brush printer_select_font printer_select_pen printer_set_option printer_start_doc printer_start_page printer_write contained
syn keyword phpFunctions  pspell_add_to_personal pspell_add_to_session pspell_check pspell_clear_session pspell_config_create pspell_config_ignore pspell_config_mode pspell_config_personal pspell_config_repl pspell_config_runtogether pspell_config_save_repl pspell_new_config pspell_new_personal pspell_new pspell_save_wordlist pspell_store_replacement pspell_suggest contained
syn keyword phpFunctions  qdom_error qdom_tree  contained
syn keyword phpFunctions  readline_add_history readline_clear_history readline_completion_function readline_info readline_list_history readline_read_history readline_write_history readline  contained
syn keyword phpFunctions  recode_file recode_string recode  contained
syn keyword phpFunctions  ereg_replace ereg eregi_replace eregi split spliti sql_regcase  contained
syn keyword phpFunctions  ftok msg_get_queue msg_receive msg_remove_queue msg_send msg_set_queue msg_stat_queue sem_acquire sem_get sem_release sem_remove shm_attach shm_detach shm_get_var shm_put_var shm_remove_var shm_remove  contained
syn keyword phpFunctions  sesam_affected_rows sesam_commit sesam_connect sesam_diagnostic sesam_disconnect sesam_errormsg sesam_execimm sesam_fetch_array sesam_fetch_result sesam_fetch_row sesam_field_array sesam_field_name sesam_free_result sesam_num_fields sesam_query sesam_rollback sesam_seek_row sesam_settransaction contained
syn keyword phpFunctions  session_cache_expire session_cache_limiter session_decode session_destroy session_encode session_get_cookie_params session_id session_is_registered session_module_name session_name session_regenerate_id session_register session_save_path session_set_cookie_params session_set_save_handler session_start session_unregister session_unset session_write_close contained
syn keyword phpFunctions  shmop_close shmop_delete shmop_open shmop_read shmop_size shmop_write contained
syn keyword phpFunctions  snmp_get_quick_print snmp_set_quick_print snmpget snmprealwalk snmpset snmpwalk snmpwalkoid contained
syn keyword phpFunctions  socket_accept socket_bind socket_clear_error socket_close socket_connect socket_create_listen socket_create_pair socket_create socket_get_option socket_getpeername socket_getsockname socket_iovec_add socket_iovec_alloc socket_iovec_delete socket_iovec_fetch socket_iovec_free socket_iovec_set socket_last_error socket_listen socket_read socket_readv socket_recv socket_recvfrom socket_recvmsg socket_select socket_send socket_sendmsg socket_sendto socket_set_block socket_set_nonblock socket_set_option socket_shutdown socket_strerror socket_write socket_writev contained
syn keyword phpFunctions  sqlite_array_query sqlite_busy_timeout sqlite_changes sqlite_close sqlite_column sqlite_create_aggregate sqlite_create_function sqlite_current sqlite_error_string sqlite_escape_string sqlite_fetch_array sqlite_fetch_single sqlite_fetch_string sqlite_field_name sqlite_has_more sqlite_last_error sqlite_last_insert_rowid sqlite_libencoding sqlite_libversion sqlite_next sqlite_num_fields sqlite_num_rows sqlite_open sqlite_popen sqlite_query sqlite_rewind sqlite_seek sqlite_udf_decode_binary sqlite_udf_encode_binary sqlite_unbuffered_query  contained
syn keyword phpFunctions  stream_context_create stream_context_get_options stream_context_set_option stream_context_set_params stream_copy_to_stream stream_filter_append stream_filter_prepend stream_filter_register stream_get_contents stream_get_filters stream_get_line stream_get_meta_data stream_get_transports stream_get_wrappers stream_register_wrapper stream_select stream_set_blocking stream_set_timeout stream_set_write_buffer stream_socket_accept stream_socket_client stream_socket_get_name stream_socket_recvfrom stream_socket_sendto stream_socket_server stream_wrapper_register contained
syn keyword phpFunctions  addcslashes addslashes bin2hex chop chr chunk_split convert_cyr_string count_chars crc32 crypt explode fprintf get_html_translation_table hebrev hebrevc html_entity_decode htmlentities htmlspecialchars implode join levenshtein localeconv ltrim md5_file md5 metaphone money_format nl_langinfo nl2br number_format ord parse_str print printf quoted_printable_decode quotemeta rtrim setlocale sha1_file sha1 similar_text soundex sprintf sscanf str_ireplace str_pad str_repeat str_replace str_rot13 str_shuffle str_split str_word_count strcasecmp strchr strcmp strcoll strcspn strip_tags stripcslashes stripos stripslashes stristr strlen strnatcasecmp strnatcmp strncasecmp strncmp strpos strrchr strrev strripos strrpos strspn strstr strtok strtolower strtoupper strtr substr_compare substr_count substr_replace substr trim ucfirst ucwords vprintf vsprintf wordwrap contained
syn keyword phpFunctions  swf_actiongeturl swf_actiongotoframe swf_actiongotolabel swf_actionnextframe swf_actionplay swf_actionprevframe swf_actionsettarget swf_actionstop swf_actiontogglequality swf_actionwaitforframe swf_addbuttonrecord swf_addcolor swf_closefile swf_definebitmap swf_definefont swf_defineline swf_definepoly swf_definerect swf_definetext swf_endbutton swf_enddoaction swf_endshape swf_endsymbol swf_fontsize swf_fontslant swf_fonttracking swf_getbitmapinfo swf_getfontinfo swf_getframe swf_labelframe swf_lookat swf_modifyobject swf_mulcolor swf_nextid swf_oncondition swf_openfile swf_ortho2 swf_ortho swf_perspective swf_placeobject swf_polarview swf_popmatrix swf_posround swf_pushmatrix swf_removeobject swf_rotate swf_scale swf_setfont swf_setframe swf_shapearc swf_shapecurveto3 swf_shapecurveto swf_shapefillbitmapclip swf_shapefillbitmaptile swf_shapefilloff swf_shapefillsolid swf_shapelinesolid swf_shapelineto swf_shapemoveto swf_showframe swf_startbutton swf_startdoaction swf_startshape swf_startsymbol swf_textwidth swf_translate swf_viewport contained
syn keyword phpFunctions  sybase_affected_rows sybase_close sybase_connect sybase_data_seek sybase_deadlock_retry_count sybase_fetch_array sybase_fetch_assoc sybase_fetch_field sybase_fetch_object sybase_fetch_row sybase_field_seek sybase_free_result sybase_get_last_message sybase_min_client_severity sybase_min_error_severity sybase_min_message_severity sybase_min_server_severity sybase_num_fields sybase_num_rows sybase_pconnect sybase_query sybase_result sybase_select_db sybase_set_message_handler sybase_unbuffered_query contained
syn keyword phpFunctions  tidy_access_count tidy_clean_repair tidy_config_count tidy_diagnose tidy_error_count tidy_get_body tidy_get_config tidy_get_error_buffer tidy_get_head tidy_get_html_ver tidy_get_html tidy_get_output tidy_get_release tidy_get_root tidy_get_status tidy_getopt tidy_is_xhtml tidy_load_config tidy_parse_file tidy_parse_string tidy_repair_file tidy_repair_string tidy_reset_config tidy_save_config tidy_set_encoding tidy_setopt tidy_warning_count  contained
syn keyword phpMethods  attributes children get_attr get_nodes has_children has_siblings is_asp is_comment is_html is_jsp is_jste is_text is_xhtml is_xml next prev tidy_node contained
syn keyword phpFunctions  token_get_all token_name  contained
syn keyword phpFunctions  base64_decode base64_encode get_meta_tags http_build_query parse_url rawurldecode rawurlencode urldecode urlencode  contained
syn keyword phpFunctions  doubleval empty floatval get_defined_vars get_resource_type gettype import_request_variables intval is_array is_bool is_callable is_double is_float is_int is_integer is_long is_null is_numeric is_object is_real is_resource is_scalar is_string isset print_r serialize settype strval unserialize unset var_dump var_export contained
syn keyword phpFunctions  vpopmail_add_alias_domain_ex vpopmail_add_alias_domain vpopmail_add_domain_ex vpopmail_add_domain vpopmail_add_user vpopmail_alias_add vpopmail_alias_del_domain vpopmail_alias_del vpopmail_alias_get_all vpopmail_alias_get vpopmail_auth_user vpopmail_del_domain_ex vpopmail_del_domain vpopmail_del_user vpopmail_error vpopmail_passwd vpopmail_set_user_quota  contained
syn keyword phpFunctions  w32api_deftype w32api_init_dtype w32api_invoke_function w32api_register_function w32api_set_call_method contained
syn keyword phpFunctions  wddx_add_vars wddx_deserialize wddx_packet_end wddx_packet_start wddx_serialize_value wddx_serialize_vars contained
syn keyword phpFunctions  utf8_decode utf8_encode xml_error_string xml_get_current_byte_index xml_get_current_column_number xml_get_current_line_number xml_get_error_code xml_parse_into_struct xml_parse xml_parser_create_ns xml_parser_create xml_parser_free xml_parser_get_option xml_parser_set_option xml_set_character_data_handler xml_set_default_handler xml_set_element_handler xml_set_end_namespace_decl_handler xml_set_external_entity_ref_handler xml_set_notation_decl_handler xml_set_object xml_set_processing_instruction_handler xml_set_start_namespace_decl_handler xml_set_unparsed_entity_decl_handler contained
syn keyword phpFunctions  xmlrpc_decode_request xmlrpc_decode xmlrpc_encode_request xmlrpc_encode xmlrpc_get_type xmlrpc_parse_method_descriptions xmlrpc_server_add_introspection_data xmlrpc_server_call_method xmlrpc_server_create xmlrpc_server_destroy xmlrpc_server_register_introspection_callback xmlrpc_server_register_method xmlrpc_set_type  contained
syn keyword phpFunctions  xslt_create xslt_errno xslt_error xslt_free xslt_output_process xslt_set_base xslt_set_encoding xslt_set_error_handler xslt_set_log xslt_set_sax_handler xslt_set_sax_handlers xslt_set_scheme_handler xslt_set_scheme_handlers contained
syn keyword phpFunctions  yaz_addinfo yaz_ccl_conf yaz_ccl_parse yaz_close yaz_connect yaz_database yaz_element yaz_errno yaz_error yaz_es_result yaz_get_option yaz_hits yaz_itemorder yaz_present yaz_range yaz_record yaz_scan_result yaz_scan yaz_schema yaz_search yaz_set_option yaz_sort yaz_syntax yaz_wait contained
syn keyword phpFunctions  zip_close zip_entry_close zip_entry_compressedsize zip_entry_compressionmethod zip_entry_filesize zip_entry_name zip_entry_open zip_entry_read zip_open zip_read  contained
syn keyword phpFunctions  gzclose gzcompress gzdeflate gzencode gzeof gzfile gzgetc gzgets gzgetss gzinflate gzopen gzpassthru gzputs gzread gzrewind gzseek gztell gzuncompress gzwrite readgzfile zlib_get_coding_type  contained

if exists( "php_baselib" )
  syn keyword phpMethods  query next_record num_rows affected_rows nf f p np num_fields haltmsg seek link_id query_id metadata table_names nextid connect halt free register unregister is_registered delete url purl self_url pself_url hidden_session add_query padd_query reimport_get_vars reimport_post_vars reimport_cookie_vars set_container set_tokenname release_token put_headers get_id get_id put_id freeze thaw gc reimport_any_vars start url purl login_if is_authenticated auth_preauth auth_loginform auth_validatelogin auth_refreshlogin auth_registerform auth_doregister start check have_perm permsum perm_invalid contained
  syn keyword phpFunctions  page_open page_close sess_load sess_save  contained
endif

" Conditional
syn keyword phpConditional  declare else enddeclare endswitch elseif endif if switch  contained

" Repeat
syn keyword phpRepeat as do endfor endforeach endwhile for foreach while  contained

" Repeat
syn keyword phpLabel  case default switch contained

" Statement
syn keyword phpStatement  return break continue exit goto  contained

" Keyword
syn keyword phpKeyword  var const contained

" Type
syn keyword phpType bool boolean int integer real double float string array object NULL  contained

" Structure
syn keyword phpStructure  namespace extends implements instanceof parent self contained

" Operator
syn match phpOperator "[-=+%^&|*!.~?:]" contained display
syn match phpOperator "[-+*/%^&|.]="  contained display
syn match phpOperator "/[^*/]"me=e-1  contained display
syn match phpOperator "\$"  contained display
syn match phpOperator "&&\|\<and\>" contained display
syn match phpOperator "||\|\<x\=or\>" contained display
syn match phpRelation "[!=<>]=" contained display
syn match phpRelation "[<>]"  contained display
syn match phpMemberSelector "->"  contained display
syn match phpVarSelector  "\$"  contained display

" Identifier
syn match phpIdentifier "$\h\w*"  contained contains=phpEnvVar,phpIntVar,phpVarSelector display
syn match phpIdentifierSimply "${\h\w*}"  contains=phpOperator,phpParent  contained display
syn region  phpIdentifierComplex  matchgroup=phpParent start="{\$"rs=e-1 end="}"  contains=phpIdentifier,phpMemberSelector,phpVarSelector,phpIdentifierComplexP contained extend
syn region  phpIdentifierComplexP matchgroup=phpParent start="\[" end="]" contains=@phpClInside contained

" Interpolated indentifiers (inside strings)
	syn match phpBrackets "[][}{]" contained display
	" errors
		syn match phpInterpSimpleError "\[[^]]*\]" contained display  " fallback (if nothing else matches)
		syn match phpInterpSimpleError "->[^a-zA-Z_]" contained display
		" make sure these stay above the correct DollarCurlies so they don't take priority
		syn match phpInterpBogusDollarCurley "${[^}]*}" contained display  " fallback (if nothing else matches)
	syn match phpinterpSimpleBracketsInner "\w\+" contained
	syn match phpInterpSimpleBrackets "\[\h\w*]" contained contains=phpBrackets,phpInterpSimpleBracketsInner
	syn match phpInterpSimpleBrackets "\[\d\+]" contained contains=phpBrackets,phpInterpSimpleBracketsInner
	syn match phpInterpSimpleBrackets "\[0[xX]\x\+]" contained contains=phpBrackets,phpInterpSimpleBracketsInner
	syn match phpInterpSimple "\$\h\w*\(\[[^]]*\]\|->\h\w*\)\?" contained contains=phpInterpSimpleBrackets,phpIdentifier,phpInterpSimpleError,phpMethods,phpMemberSelector display
	syn match phpInterpVarname "\h\w*" contained
	syn match phpInterpMethodName "\h\w*" contained " default color
	syn match phpInterpSimpleCurly "\${\h\w*}"  contains=phpInterpVarname contained extend
	syn region phpInterpDollarCurley1Helper matchgroup=phpParent start="{" end="\[" contains=phpInterpVarname contained
	syn region phpInterpDollarCurly1 matchgroup=phpParent start="\${\h\w*\["rs=s+1 end="]}" contains=phpInterpDollarCurley1Helper,@phpClConst contained extend

	syn match phpInterpDollarCurley2Helper "{\h\w*->" contains=phpBrackets,phpInterpVarname,phpMemberSelector contained

	syn region phpInterpDollarCurly2 matchgroup=phpParent start="\${\h\w*->"rs=s+1 end="}" contains=phpInterpDollarCurley2Helper,phpInterpMethodName contained

	syn match phpInterpBogusDollarCurley "${\h\w*->}" contained display
	syn match phpInterpBogusDollarCurley "${\h\w*\[]}" contained display

	syn region phpInterpComplex matchgroup=phpParent start="{\$"rs=e-1 end="}" contains=phpIdentifier,phpMemberSelector,phpVarSelector,phpIdentifierComplexP contained extend
	syn region phpIdentifierComplexP matchgroup=phpParent start="\[" end="]" contains=@phpClInside contained
	" define a cluster to get all interpolation syntaxes for double-quoted strings
	syn cluster phpInterpDouble contains=phpInterpSimple,phpInterpSimpleCurly,phpInterpDollarCurly1,phpInterpDollarCurly2,phpInterpBogusDollarCurley,phpInterpComplex

" Methoden
syn match phpMethodsVar "->\h\w*" contained contains=phpMethods,phpMemberSelector display

" Include
syn keyword phpInclude  include require include_once require_once use contained

" Peter Hodge - added 'clone' keyword
" Define
syn keyword phpDefine new clone contained

" Boolean
syn keyword phpBoolean  true false  contained

" Number
syn match phpNumber "-\=\<\d\+\>" contained display
syn match phpNumber "\<0x\x\{1,8}\>"  contained display

" Float
syn match phpFloat  "\(-\=\<\d+\|-\=\)\.\d\+\>" contained display

" Backslash escapes
	syn case match
	" for double quotes and heredoc
	syn match phpBackslashSequences  "\\[fnrtv\\\"$]" contained display
	syn match phpBackslashSequences  "\\\d\{1,3}"  contained contains=phpOctalError display
	syn match phpBackslashSequences  "\\x\x\{1,2}" contained display
	" additional sequence for double quotes only
	syn match phpBackslashDoubleQuote "\\[\"]" contained display
	" for single quotes only
	syn match phpBackslashSingleQuote "\\[\\']" contained display
	syn case ignore


" Error
syn match phpOctalError "[89]"  contained display
if exists("php_parent_error_close")
  syn match phpParentError  "[)\]}]"  contained display
endif

" Todo
syn keyword phpTodo todo fixme xxx  contained

" Comment
if exists("php_parent_error_open")
  syn region  phpComment  start="/\*" end="\*/" contained contains=phpTodo,@Spell
else
  syn region  phpComment  start="/\*" end="\*/" contained contains=phpTodo,@Spell extend
endif
syn match phpComment  "#.\{-}\(?>\|$\)\@="  contained contains=phpTodo,@Spell
syn match phpComment  "//.\{-}\(?>\|$\)\@=" contained contains=phpTodo,@Spell

" String
if exists("php_parent_error_open")
  syn region  phpStringDouble matchgroup=phpStringDouble start=+"+ skip=+\\\\\|\\"+ end=+"+  contains=@phpAddStrings,phpBackslashSequences,phpBackslashDoubleQuote,@phpInterpDouble,@Spell contained keepend
  syn region  phpBacktick matchgroup=phpBacktick start=+`+ skip=+\\\\\|\\"+ end=+`+  contains=@phpAddStrings,phpIdentifier,phpBackslashSequences,phpIdentifierSimply,phpIdentifierComplex contained keepend
  syn region  phpStringSingle matchgroup=phpStringSingle start=+'+ skip=+\\\\\|\\'+ end=+'+  contains=@phpAddStrings,phpBackslashSingleQuote,@Spell contained keepend
else
  syn region  phpStringDouble matchgroup=phpStringDouble start=+"+ skip=+\\\\\|\\"+ end=+"+  contains=@phpAddStrings,phpBackslashSequences,phpBackslashDoubleQuote,@phpInterpDouble,@Spell contained extend keepend
  syn region  phpBacktick matchgroup=phpBacktick start=+`+ skip=+\\\\\|\\"+ end=+`+  contains=@phpAddStrings,phpIdentifier,phpBackslashSequences,phpIdentifierSimply,phpIdentifierComplex contained extend keepend
  syn region  phpStringSingle matchgroup=phpStringSingle start=+'+ skip=+\\\\\|\\'+ end=+'+  contains=@phpAddStrings,phpBackslashSingleQuote,@Spell contained keepend extend
endif

" HereDoc and NowDoc
syn case match

" HereDoc
syn region  phpHereDoc  matchgroup=Delimiter start="\(<<<\)\@<=\(\"\=\)\z(\I\i*\)\2$" end="^\z1\(;\=$\)\@=" contained contains=phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpBackslashSequences,phpMethodsVar,@Spell keepend extend
" including HTML,JavaScript,SQL even if not enabled via options
syn region  phpHereDoc  matchgroup=Delimiter start="\(<<<\)\@<=\(\"\=\)\z(\(\I\i*\)\=\(html\)\c\(\i*\)\)\2$" end="^\z1\(;\=$\)\@="  contained contains=@htmlTop,phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpBackslashSequences,phpMethodsVar,@Spell keepend extend
syn region  phpHereDoc  matchgroup=Delimiter start="\(<<<\)\@<=\(\"\=\)\z(\(\I\i*\)\=\(sql\)\c\(\i*\)\)\2$" end="^\z1\(;\=$\)\@=" contained contains=@sqlTop,phpIdentifier,phpIdentifierSimply,phpIdentifierComplex,phpBackslashSequences,phpMethodsVar,@Spell keepend extend
syn region  phpHereDoc  matchgroup=Delimiter start="\(<<<\)\@<=\(\"\=\)\z(\(\I\i*\)\=\(javascript\)\c\(\i*\)\)\2$" end="^\z1\(;\=$\)\@="  contained contains=@htmlJavascript,phpIdentifierSimply,phpIdentifier,phpIdentifierComplex,phpBackslashSequences,phpMethodsVar,@Spell keepend extend

" NowDoc
syn region  phpNowDoc  matchgroup=Delimiter start="\(<<<\)\@<='\z(\I\i*\)'$" end="^\z1\(;\=$\)\@=" contained contains=@Spell keepend extend
" including HTML,JavaScript,SQL even if not enabled via options
syn region  phpNowDoc  matchgroup=Delimiter start="\(<<<\)\@<='\z(\(\I\i*\)\=\(html\)\c\(\i*\)\)'$" end="^\z1\(;\=$\)\@="  contained contains=@htmlTop,@Spell keepend extend
syn region  phpNowDoc  matchgroup=Delimiter start="\(<<<\)\@<='\z(\(\I\i*\)\=\(sql\)\c\(\i*\)\)'$" end="^\z1\(;\=$\)\@=" contained contains=@sqlTop,@Spell keepend extend
syn region  phpNowDoc  matchgroup=Delimiter start="\(<<<\)\@<='\z(\(\I\i*\)\=\(javascript\)\c\(\i*\)\)'$" end="^\z1\(;\=$\)\@="  contained contains=@htmlJavascript,@Spell keepend extend
syn case ignore

" Parent
if exists("php_parent_error_close") || exists("php_parent_error_open")
  syn match phpParent "[{}]"  contained
  syn region  phpParent matchgroup=Delimiter start="(" end=")"  contained contains=@phpClInside transparent
  syn region  phpParent matchgroup=Delimiter start="\[" end="\]"  contained contains=@phpClInside transparent
  if !exists("php_parent_error_close")
    syn match phpParent "[\])]" contained
  endif
else
  syn match phpParent "[({[\]})]" contained
endif

syn cluster phpClConst  contains=phpFunctions,phpIdentifier,phpConditional,phpRepeat,phpStatement,phpOperator,phpRelation,phpStringSingle,phpStringDouble,phpBacktick,phpNumber,phpFloat,phpKeyword,phpType,phpBoolean,phpStructure,phpMethodsVar,phpConstant,phpCoreConstant,phpException
syn cluster phpClInside contains=@phpClConst,phpComment,phpLabel,phpParent,phpParentError,phpInclude,phpHereDoc,phpNowDoc
syn cluster phpClFunction contains=@phpClInside,phpDefine,phpParentError,phpStorageClass
syn cluster phpClTop  contains=@phpClFunction,phpFoldFunction,phpFoldClass,phpFoldInterface,phpFoldTry,phpFoldCatch

" Php Region
if exists("php_parent_error_open")
  if exists("php_noShortTags")
    syn region   phpRegion  matchgroup=Delimiter start="<?php" end="?>" contains=@phpClTop
  else
    syn region   phpRegion  matchgroup=Delimiter start="<?\(php\)\=" end="?>" contains=@phpClTop
  endif
  syn region   phpRegionSc  matchgroup=Delimiter start=+<script language="php">+ end=+</script>+  contains=@phpClTop
  if exists("php_asp_tags")
    syn region   phpRegionAsp matchgroup=Delimiter start="<%\(=\)\=" end="%>" contains=@phpClTop
  endif
else
  if exists("php_noShortTags")
    syn region   phpRegion  matchgroup=Delimiter start="<?php" end="?>" contains=@phpClTop keepend
  else
    syn region   phpRegion  matchgroup=Delimiter start="<?\(php\)\=" end="?>" contains=@phpClTop keepend
  endif
  syn region   phpRegionSc  matchgroup=Delimiter start=+<script language="php">+ end=+</script>+  contains=@phpClTop keepend
  if exists("php_asp_tags")
    syn region   phpRegionAsp matchgroup=Delimiter start="<%\(=\)\=" end="%>" contains=@phpClTop keepend
  endif
endif

" Fold
if exists("php_folding") && php_folding==1
" match one line constructs here and skip them at folding
  syn keyword phpSCKeyword  abstract final private protected public static  contained
  syn keyword phpFCKeyword  function  contained
  syn keyword phpStorageClass global  contained
  syn match phpDefine "\(\s\|^\)\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function\(\s\+.*[;}]\)\@="  contained contains=phpSCKeyword
  syn match phpStructure  "\(\s\|^\)\(abstract\s\+\|final\s\+\)*class\(\s\+.*}\)\@="  contained
  syn match phpStructure  "\(\s\|^\)interface\(\s\+.*}\)\@="  contained
  syn match phpException  "\(\s\|^\)try\(\s\+.*}\)\@="  contained
  syn match phpException  "\(\s\|^\)catch\(\s\+.*}\)\@="  contained

  set foldmethod=syntax
  syn region  phpFoldHtmlInside matchgroup=Delimiter start="?>" end="<?\(php\)\=" contained transparent contains=@htmlTop
  syn region  phpFoldFunction matchgroup=Storageclass start="^\z(\s*\)\(abstract\s\+\|final\s\+\|private\s\+\|protected\s\+\|public\s\+\|static\s\+\)*function\s\([^};]*$\)\@="rs=e-9 matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldHtmlInside,phpFCKeyword contained transparent fold extend
  syn region  phpFoldFunction matchgroup=Define start="^function\s\([^};]*$\)\@=" matchgroup=Delimiter end="^}" contains=@phpClFunction,phpFoldHtmlInside contained transparent fold extend
  syn region  phpFoldClass  matchgroup=Structure start="^\z(\s*\)\(abstract\s\+\|final\s\+\)*class\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction,phpSCKeyword contained transparent fold extend
  syn region  phpFoldInterface  matchgroup=Structure start="^\z(\s*\)interface\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent fold extend
  syn region  phpFoldCatch  matchgroup=Exception start="^\z(\s*\)catch\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent fold extend
  syn region  phpFoldTry  matchgroup=Exception start="^\z(\s*\)try\s\+\([^}]*$\)\@=" matchgroup=Delimiter end="^\z1}" contains=@phpClFunction,phpFoldFunction contained transparent fold extend
elseif exists("php_folding") && php_folding==2
  syn keyword phpDefine function  contained
  syn keyword phpStructure  abstract class interface  contained
  syn keyword phpException  catch throw try contained
  syn keyword phpStorageClass final global private protected public static  contained

  set foldmethod=syntax
  syn region  phpFoldHtmlInside matchgroup=Delimiter start="?>" end="<?\(php\)\=" contained transparent contains=@htmlTop
  syn region  phpParent matchgroup=Delimiter start="{" end="}"  contained contains=@phpClFunction,phpFoldHtmlInside transparent fold
else
  syn keyword phpDefine function  contained
  syn keyword phpStructure  abstract class interface  contained
  syn keyword phpException  catch throw try contained
  syn keyword phpStorageClass final global private protected public static  contained
endif

" TODO: fold on "trait". For now just make sure it gets colored:
syn keyword phpStructure trait

" ================================================================
" Peter Hodge - June 9, 2006
" Some of these changes (highlighting isset/unset/echo etc) are not so
" critical, but they make things more colourful. :-)

" different syntax highlighting for 'echo', 'print', 'switch', 'die' and 'list' keywords
" to better indicate what they are.
syntax keyword phpDefine echo print contained
syntax keyword phpStructure list contained
syntax keyword phpConditional switch contained
syntax keyword phpStatement die contained

" Highlighting for PHP5's user-definable magic class methods
syntax keyword phpSpecialFunction containedin=ALLBUT,phpComment,phpStringDouble,phpStringSingle,phpIdentifier
  \  __construct __destruct __call __callStatic __get __set __isset __unset __sleep __wakeup __toString __invoke __set_state __clone __debugInfo
" Highlighting for __autoload slightly different from line above
syntax keyword phpSpecialFunction containedin=ALLBUT,phpComment,phpStringDouble,phpStringSingle,phpIdentifier,phpMethodsVar
  \ __autoload
hi def link phpSpecialFunction phpOperator

" Highlighting for PHP5's built-in classes
" - built-in classes harvested from get_declared_classes() in 5.1.4
syntax keyword phpClasses containedin=ALLBUT,phpComment,phpStringDouble,phpStringSingle,phpIdentifier,phpMethodsVar
  \ stdClass __PHP_Incomplete_Class php_user_filter Directory ArrayObject
  \ Exception ErrorException LogicException BadFunctionCallException BadMethodCallException DomainException
  \ RecursiveIteratorIterator IteratorIterator FilterIterator RecursiveFilterIterator ParentIterator LimitIterator
  \ CachingIterator RecursiveCachingIterator NoRewindIterator AppendIterator InfiniteIterator EmptyIterator
  \ ArrayIterator RecursiveArrayIterator DirectoryIterator RecursiveDirectoryIterator
  \ InvalidArgumentException LengthException OutOfRangeException RuntimeException OutOfBoundsException
  \ OverflowException RangeException UnderflowException UnexpectedValueException
  \ PDO PDOException PDOStatement PDORow
  \ Reflection ReflectionFunction ReflectionParameter ReflectionMethod ReflectionClass
  \ ReflectionObject ReflectionProperty ReflectionExtension ReflectionException
  \ SplFileInfo SplFileObject SplTempFileObject SplObjectStorage
  \ XMLWriter LibXMLError XMLReader SimpleXMLElement SimpleXMLIterator
  \ DOMException DOMStringList DOMNameList DOMDomError DOMErrorHandler
  \ DOMImplementation DOMImplementationList DOMImplementationSource
  \ DOMNode DOMNameSpaceNode DOMDocumentFragment DOMDocument DOMNodeList DOMNamedNodeMap
  \ DOMCharacterData DOMAttr DOMElement DOMText DOMComment DOMTypeinfo DOMUserDataHandler
  \ DOMLocator DOMConfiguration DOMCdataSection DOMDocumentType DOMNotation DOMEntity
  \ DOMEntityReference DOMProcessingInstruction DOMStringExtend DOMXPath
hi def link phpClasses phpFunctions

" Highlighting for PHP5's built-in interfaces
" - built-in classes harvested from get_declared_interfaces() in 5.1.4
syntax keyword phpInterfaces containedin=ALLBUT,phpComment,phpStringDouble,phpStringSingle,phpIdentifier,phpMethodsVar
  \ Iterator IteratorAggregate RecursiveIterator OuterIterator SeekableIterator
  \ Traversable ArrayAccess Serializable Countable SplObserver SplSubject Reflector
hi def link phpInterfaces phpConstant

" option defaults:
if ! exists('php_special_functions')
    let php_special_functions = 1
endif
if ! exists('php_alt_comparisons')
    let php_alt_comparisons = 1
endif
if ! exists('php_alt_assignByReference')
    let php_alt_assignByReference = 1
endif

if php_special_functions
    " Highlighting for PHP built-in functions which exhibit special behaviours
    " - isset()/unset()/empty() are not real functions.
    " - compact()/extract() directly manipulate variables in the local scope where
    "   regular functions would not be able to.
    " - eval() is the token 'make_your_code_twice_as_complex()' function for PHP.
    " - user_error()/trigger_error() can be overloaded by set_error_handler and also
    "   have the capacity to terminate your script when type is E_USER_ERROR.
    syntax keyword phpSpecialFunction containedin=ALLBUT,phpComment,phpStringDouble,phpStringSingle
  \ user_error trigger_error isset unset eval extract compact empty
endif

if php_alt_assignByReference
    " special highlighting for '=&' operator
    syntax match phpAssignByRef /=\s*&/ containedin=ALLBUT,phpComment,phpStringDouble,phpStringSingle
    hi def link phpAssignByRef Type
endif

if php_alt_comparisons
  " highlight comparison operators differently
  syntax match phpComparison "\v[=!]\=\=?" contained containedin=phpRegion
  syntax match phpComparison "\v[=<>-]@<![<>]\=?[<>]@!" contained containedin=phpRegion

  " highlight the 'instanceof' operator as a comparison operator rather than a structure
  syntax case ignore
  syntax keyword phpComparison instanceof contained containedin=phpRegion

  hi def link phpComparison Statement
endif

" ================================================================

" Sync
if php_sync_method==-1
  if exists("php_noShortTags")
    syn sync match phpRegionSync grouphere phpRegion "^\s*<?php\s*$"
  else
    syn sync match phpRegionSync grouphere phpRegion "^\s*<?\(php\)\=\s*$"
  endif
  syn sync match phpRegionSync grouphere phpRegionSc +^\s*<script language="php">\s*$+
  if exists("php_asp_tags")
    syn sync match phpRegionSync grouphere phpRegionAsp "^\s*<%\(=\)\=\s*$"
  endif
  syn sync match phpRegionSync grouphere NONE "^\s*?>\s*$"
  syn sync match phpRegionSync grouphere NONE "^\s*%>\s*$"
  syn sync match phpRegionSync grouphere phpRegion "function\s.*(.*\$"
  "syn sync match phpRegionSync grouphere NONE "/\i*>\s*$"
elseif php_sync_method>0
  exec "syn sync minlines=" . php_sync_method
else
  exec "syn sync fromstart"
endif

syntax match  phpDocCustomTags  "@[a-zA-Z]*\(\s\+\|\n\|\r\)" containedin=phpComment
syntax region phpDocTags  start="{@\(example\|id\|internal\|inheritdoc\|link\|source\|toc\|tutorial\)" end="}" containedin=phpComment
syntax match  phpDocTags  "@\(abstract\|access\|author\|category\|copyright\|deprecated\|example\|final\|global\|ignore\|internal\|license\|link\|method\|name\|package\|param\|property\|return\|see\|since\|static\|staticvar\|subpackage\|tutorial\|uses\|var\|version\|contributor\|modified\|filename\|description\|filesource\|throws\)\(\s\+\)\?" containedin=phpComment
syntax match  phpDocTodo  "@\(todo\|fixme\|xxx\)\(\s\+\)\?" containedin=phpComment

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link phpConstant  Constant
hi def link phpCoreConstant  Constant
hi def link phpComment Comment
hi def link phpDocTags PreProc
hi def link phpDocCustomTags Type
hi def link phpException Exception
hi def link phpBoolean Boolean
hi def link phpStorageClass  StorageClass
hi def link phpSCKeyword StorageClass
hi def link phpFCKeyword Define
hi def link phpStructure Structure
hi def link phpStringSingle  String
hi def link phpStringDouble  String
hi def link phpBacktick  String
hi def link phpNumber  Number
hi def link phpFloat Float
hi def link phpMethods Function
hi def link phpFunctions Function
hi def link phpBaselib Function
hi def link phpRepeat  Repeat
hi def link phpConditional Conditional
hi def link phpLabel Label
hi def link phpStatement Statement
hi def link phpKeyword Statement
hi def link phpType  Type
hi def link phpInclude Include
hi def link phpDefine  Define
hi def link phpBackslashSequences SpecialChar
hi def link phpBackslashDoubleQuote SpecialChar
hi def link phpBackslashSingleQuote SpecialChar
hi def link phpParent  Delimiter
hi def link phpBrackets  Delimiter
hi def link phpIdentifierConst Delimiter
hi def link phpParentError Error
hi def link phpOctalError  Error
hi def link phpInterpSimpleError Error
hi def link phpInterpBogusDollarCurley Error
hi def link phpInterpDollarCurly1 Error
hi def link phpInterpDollarCurly2 Error
hi def link phpInterpSimpleBracketsInner String
hi def link phpInterpSimpleCurly Delimiter
hi def link phpInterpVarname Identifier
hi def link phpTodo  Todo
hi def link phpDocTodo Todo
hi def link phpMemberSelector  Structure
if exists("php_oldStyle")
  hi def phpIntVar guifg=Red ctermfg=DarkRed
  hi def phpEnvVar guifg=Red ctermfg=DarkRed
  hi def phpOperator guifg=SeaGreen ctermfg=DarkGreen
  hi def phpVarSelector guifg=SeaGreen ctermfg=DarkGreen
  hi def phpRelation guifg=SeaGreen ctermfg=DarkGreen
  hi def phpIdentifier guifg=DarkGray ctermfg=Brown
  hi def phpIdentifierSimply guifg=DarkGray ctermfg=Brown
else
  hi def link phpIntVar Identifier
  hi def link phpEnvVar Identifier
  hi def link phpOperator Operator
  hi def link phpVarSelector  Operator
  hi def link phpRelation Operator
  hi def link phpIdentifier Identifier
  hi def link phpIdentifierSimply Identifier
endif


let b:current_syntax = "php"

if main_syntax == 'php'
  unlet main_syntax
endif

" put cpoptions back the way we found it
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8 sts=2 sw=2 expandtab
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             .vim/syntax/css.vim                                                                                 000644  000765  000024  00000100050 13036407710 015461  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:     Cascading Style Sheets
" Previous Contributor List:
"               Claudio Fleiner <claudio@fleiner.com> (Maintainer)
"               Yeti            (Add full CSS2, HTML4 support)
"               Nikolai Weibull (Add CSS2 support)
" Maintainer:   Jules Wang      <w.jq0722@gmail.com>
" URL:          https://github.com/JulesWang/css.vim
" Last Change:  2017 Jan 14
"  		cssClassName updated by Ryuichi Hayashida Jan 2016

" quit when a syntax file was already loaded
if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'css'
elseif exists("b:current_syntax") && b:current_syntax == "css"
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case ignore

" HTML4 tags
syn keyword cssTagName abbr address area a b base
syn keyword cssTagName bdo blockquote body br button
syn keyword cssTagName caption cite code col colgroup dd del
syn keyword cssTagName dfn div dl dt em fieldset form
syn keyword cssTagName h1 h2 h3 h4 h5 h6 head hr html img i
syn keyword cssTagName iframe input ins isindex kbd label legend li
syn keyword cssTagName link map menu meta noscript ol optgroup
syn keyword cssTagName option p param pre q s samp script small
syn keyword cssTagName span strong sub sup tbody td
syn keyword cssTagName textarea tfoot th thead title tr ul u var
syn keyword cssTagName object svg
syn match   cssTagName /\<select\>\|\<style\>\|\<table\>/

" 34 HTML5 tags
syn keyword cssTagName article aside audio bdi canvas command data
syn keyword cssTagName datalist details dialog embed figcaption figure footer
syn keyword cssTagName header hgroup keygen main mark menuitem meter nav
syn keyword cssTagName output progress rt rp ruby section
syn keyword cssTagName source summary time track video wbr

" Tags not supported in HTML5
" acronym applet basefont big center dir
" font frame frameset noframes strike tt

syn match cssTagName "\*"

" selectors
syn match cssSelectorOp "[,>+~]"
syn match cssSelectorOp2 "[~|^$*]\?=" contained
syn region cssAttributeSelector matchgroup=cssSelectorOp start="\[" end="]" contains=cssUnicodeEscape,cssSelectorOp2,cssStringQ,cssStringQQ

" .class and #id
syn match cssClassName "\.-\=[A-Za-z_][A-Za-z0-9_-]*" contains=cssClassNameDot
syn match cssClassNameDot contained '\.'

try
syn match cssIdentifier "#[A-Za-z�-�_@][A-Za-z�-�0-9_@-]*"
catch /^.*/
syn match cssIdentifier "#[A-Za-z_@][A-Za-z0-9_@-]*"
endtry

" digits
syn match cssValueInteger contained "[-+]\=\d\+" contains=cssUnitDecorators
syn match cssValueNumber contained "[-+]\=\d\+\(\.\d*\)\=" contains=cssUnitDecorators
syn match cssValueLength contained "[-+]\=\d\+\(\.\d*\)\=\(%\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\|rem\|dpi\|dppx\|dpcm\)\>" contains=cssUnitDecorators
syn match cssValueAngle contained "[-+]\=\d\+\(\.\d*\)\=\(deg\|grad\|rad\)\>" contains=cssUnitDecorators
syn match cssValueTime contained "+\=\d\+\(\.\d*\)\=\(ms\|s\)\>" contains=cssUnitDecorators
syn match cssValueFrequency contained "+\=\d\+\(\.\d*\)\=\(Hz\|kHz\)\>" contains=cssUnitDecorators


syn match cssIncludeKeyword /@\(-[a-z]\+-\)\=\(media\|keyframes\|import\|charset\|namespace\|page\)/ contained
" @media
syn region cssInclude start=/@media\>/ end=/\ze{/ skipwhite skipnl contains=cssMediaProp,cssValueLength,cssMediaKeyword,cssValueInteger,cssMediaAttr,cssVendor,cssMediaType,cssIncludeKeyword,cssMediaComma,cssComment nextgroup=cssMediaBlock
syn keyword cssMediaType contained screen print aural braille embossed handheld projection tty tv speech all contained skipwhite skipnl
syn keyword cssMediaKeyword only not and contained
syn region cssMediaBlock transparent matchgroup=cssBraces start='{' end='}' contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssTagName,cssClassName,cssIdentifier,cssPseudoClass,cssSelectorOp,cssSelectorOp2,cssAttributeSelector fold
syn match cssMediaComma "," skipwhite skipnl contained

" Reference: http://www.w3.org/TR/css3-mediaqueries/
syn keyword cssMediaProp contained width height orientation scan grid
syn match cssMediaProp contained /\(\(max\|min\)-\)\=\(\(device\)-\)\=aspect-ratio/
syn match cssMediaProp contained /\(\(max\|min\)-\)\=device-pixel-ratio/
syn match cssMediaProp contained /\(\(max\|min\)-\)\=device-\(height\|width\)/
syn match cssMediaProp contained /\(\(max\|min\)-\)\=\(height\|width\|resolution\|monochrome\|color\(-index\)\=\)/
syn keyword cssMediaAttr contained portrait landscape progressive interlace

" @page
" http://www.w3.org/TR/css3-page/
syn match cssPage "@page\>[^{]*{\@=" contains=cssPagePseudo,cssIncludeKeyword nextgroup=cssPageWrap transparent skipwhite skipnl
syn match cssPagePseudo /:\(left\|right\|first\|blank\)/ contained skipwhite skipnl
syn region cssPageWrap contained transparent matchgroup=cssBraces start="{" end="}" contains=cssPageMargin,cssPageProp,cssAttrRegion,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssHacks
syn match cssPageMargin /@\(\(top\|left\|right\|bottom\)-\(left\|center\|right\|middle\|bottom\)\)\(-corner\)\=/ contained nextgroup=cssDefinition skipwhite skipnl
syn keyword cssPageProp contained content size
" http://www.w3.org/TR/CSS2/page.html#break-inside
syn keyword cssPageProp contained orphans widows

" @keyframe
" http://www.w3.org/TR/css3-animations/#keyframes
syn match cssKeyFrame "@\(-[a-z]\+-\)\=keyframes\>[^{]*{\@=" nextgroup=cssKeyFrameWrap contains=cssVendor,cssIncludeKeyword skipwhite skipnl transparent
syn region cssKeyFrameWrap contained transparent matchgroup=cssBraces start="{" end="}" contains=cssKeyFrameSelector
syn match cssKeyFrameSelector /\(\d*%\|from\|to\)\=/  contained skipwhite skipnl nextgroup=cssDefinition

" @import
syn region cssInclude start=/@import\>/    end=/\ze;/ transparent contains=cssStringQ,cssStringQQ,cssUnicodeEscape,cssComment,cssIncludeKeyword,cssURL,cssMediaProp,cssValueLength,cssMediaKeyword,cssValueInteger,cssMediaAttr,cssVendor,cssMediaType
syn region cssInclude start=/@charset\>/   end=/\ze;/ transparent contains=cssStringQ,cssStringQQ,cssUnicodeEscape,cssComment,cssIncludeKeyword
syn region cssInclude start=/@namespace\>/ end=/\ze;/ transparent contains=cssStringQ,cssStringQQ,cssUnicodeEscape,cssComment,cssIncludeKeyword

" @font-face
" http://www.w3.org/TR/css3-fonts/#at-font-face-rule
syn match cssFontDescriptor "@font-face\>" nextgroup=cssFontDescriptorBlock skipwhite skipnl
syn region cssFontDescriptorBlock contained transparent matchgroup=cssBraces start="{" end="}" contains=cssComment,cssError,cssUnicodeEscape,cssCommonAttr,cssFontDescriptorProp,cssValue.*,cssFontDescriptorFunction,cssFontDescriptorAttr,cssNoise

syn match cssFontDescriptorProp contained "\<font-family\>"
syn keyword cssFontDescriptorProp contained src
syn match cssFontDescriptorProp contained "\<font-\(style\|weight\|stretch\)\>"
syn match cssFontDescriptorProp contained "\<unicode-range\>"
syn match cssFontDescriptorProp contained "\<font-\(variant\|feature-settings\)\>"

" src functions
syn region cssFontDescriptorFunction contained matchgroup=cssFunctionName start="\<\(uri\|url\|local\|format\)\s*(" end=")" contains=cssStringQ,cssStringQQ oneline keepend
" font-sytle and font-weight attributes
syn keyword cssFontDescriptorAttr contained normal italic oblique bold
" font-stretch attributes
syn match cssFontDescriptorAttr contained "\<\(\(ultra\|extra\|semi\)-\)\=\(condensed\|expanded\)\>"
" unicode-range attributes
syn match cssFontDescriptorAttr contained "U+[0-9A-Fa-f?]\+"
syn match cssFontDescriptorAttr contained "U+\x\+-\x\+"
" font-feature-settings attributes
syn keyword cssFontDescriptorAttr contained on off



" The 16 basic color names
syn keyword cssColor contained aqua black blue fuchsia gray green lime maroon navy olive purple red silver teal yellow

" 130 more color names
syn keyword cssColor contained aliceblue antiquewhite aquamarine azure
syn keyword cssColor contained beige bisque blanchedalmond blueviolet brown burlywood
syn keyword cssColor contained cadetblue chartreuse chocolate coral cornflowerblue cornsilk crimson cyan
syn match cssColor contained /\<dark\(blue\|cyan\|goldenrod\|gray\|green\|grey\|khaki\)\>/
syn match cssColor contained /\<dark\(magenta\|olivegreen\|orange\|orchid\|red\|salmon\|seagreen\)\>/
syn match cssColor contained /\<darkslate\(blue\|gray\|grey\)\>/
syn match cssColor contained /\<dark\(turquoise\|violet\)\>/
syn keyword cssColor contained deeppink deepskyblue dimgray dimgrey dodgerblue firebrick
syn keyword cssColor contained floralwhite forestgreen gainsboro ghostwhite gold
syn keyword cssColor contained goldenrod greenyellow grey honeydew hotpink
syn keyword cssColor contained indianred indigo ivory khaki lavender lavenderblush lawngreen
syn keyword cssColor contained lemonchiffon limegreen linen magenta
syn match cssColor contained /\<light\(blue\|coral\|cyan\|goldenrodyellow\|gray\|green\)\>/
syn match cssColor contained /\<light\(grey\|pink\|salmon\|seagreen\|skyblue\|yellow\)\>/
syn match cssColor contained /\<light\(slategray\|slategrey\|steelblue\)\>/
syn match cssColor contained /\<medium\(aquamarine\|blue\|orchid\|purple\|seagreen\)\>/
syn match cssColor contained /\<medium\(slateblue\|springgreen\|turquoise\|violetred\)\>/
syn keyword cssColor contained midnightblue mintcream mistyrose moccasin navajowhite
syn keyword cssColor contained oldlace olivedrab orange orangered orchid
syn match cssColor contained /\<pale\(goldenrod\|green\|turquoise\|violetred\)\>/
syn keyword cssColor contained papayawhip peachpuff peru pink plum powderblue
syn keyword cssColor contained rosybrown royalblue saddlebrown salmon sandybrown
syn keyword cssColor contained seagreen seashell sienna skyblue slateblue
syn keyword cssColor contained slategray slategrey snow springgreen steelblue tan
syn keyword cssColor contained thistle tomato turquoise violet wheat
syn keyword cssColor contained whitesmoke yellowgreen

" FIXME: These are actually case-insensitive too, but (a) specs recommend using
" mixed-case (b) it's hard to highlight the word `Background' correctly in
" all situations
syn case match
syn keyword cssColor contained ActiveBorder ActiveCaption AppWorkspace ButtonFace ButtonHighlight ButtonShadow ButtonText CaptionText GrayText Highlight HighlightText InactiveBorder InactiveCaption InactiveCaptionText InfoBackground InfoText Menu MenuText Scrollbar ThreeDDarkShadow ThreeDFace ThreeDHighlight ThreeDLightShadow ThreeDShadow Window WindowFrame WindowText Background
syn case ignore

syn match cssImportant contained "!\s*important\>"

syn match cssColor contained "\<transparent\>"
syn match cssColor contained "\<currentColor\>"
syn match cssColor contained "\<white\>"
syn match cssColor contained "#[0-9A-Fa-f]\{3\}\>" contains=cssUnitDecorators
syn match cssColor contained "#[0-9A-Fa-f]\{6\}\>" contains=cssUnitDecorators

syn region cssURL contained matchgroup=cssFunctionName start="\<url\s*(" end=")" contains=cssStringQ,cssStringQQ oneline
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(rgb\|clip\|attr\|counter\|rect\|cubic-bezier\|steps\)\s*(" end=")" oneline  contains=cssValueInteger,cssValueNumber,cssValueLength,cssFunctionComma
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(rgba\|hsl\|hsla\|color-stop\|from\|to\)\s*(" end=")" oneline  contains=cssColor,cssValueInteger,cssValueNumber,cssValueLength,cssFunctionComma,cssFunction
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(linear-\|radial-\)\=\gradient\s*(" end=")" oneline  contains=cssColor,cssValueInteger,cssValueNumber,cssValueLength,cssFunction,cssGradientAttr,cssFunctionComma
syn region cssFunction contained matchgroup=cssFunctionName start="\<\(matrix\(3d\)\=\|scale\(3d\|X\|Y\|Z\)\=\|translate\(3d\|X\|Y\|Z\)\=\|skew\(X\|Y\)\=\|rotate\(3d\|X\|Y\|Z\)\=\|perspective\)\s*(" end=")" oneline contains=cssValueInteger,cssValueNumber,cssValueLength,cssValueAngle,cssFunctionComma
syn keyword cssGradientAttr contained top bottom left right cover center middle ellipse at
syn match cssFunctionComma contained ","

" Common Prop and Attr
syn keyword cssCommonAttr contained auto none inherit all default normal
syn keyword cssCommonAttr contained top bottom center stretch hidden visible
"------------------------------------------------
" CSS Animations
" http://www.w3.org/TR/css3-animations/
syn match cssAnimationProp contained "\<animation\(-\(delay\|direction\|duration\|fill-mode\|name\|play-state\|timing-function\|iteration-count\)\)\=\>"

" animation-direction attributes
syn keyword cssAnimationAttr contained alternate reverse
syn match cssAnimationAttr contained "\<alternate-reverse\>"

" animation-fill-mode attributes
syn keyword cssAnimationAttr contained forwards backwards both

" animation-play-state attributes
syn keyword cssAnimationAttr contained running paused

" animation-iteration-count attributes
syn keyword cssAnimationAttr contained infinite
"------------------------------------------------
"  CSS Backgrounds and Borders Module Level 3
"  http://www.w3.org/TR/css3-background/
syn match cssBackgroundProp contained "\<background\(-\(attachment\|clip\|color\|image\|origin\|position\|repeat\|size\)\)\=\>"
" background-attachment attributes
syn keyword cssBackgroundAttr contained scroll fixed local

" background-position attributes
syn keyword cssBackgroundAttr contained left center right top bottom

" background-repeat attributes
syn match cssBackgroundAttr contained "\<no-repeat\>"
syn match cssBackgroundAttr contained "\<repeat\(-[xy]\)\=\>"
syn keyword cssBackgroundAttr contained space round

" background-size attributes
syn keyword cssBackgroundAttr contained cover contain

syn match cssBorderProp contained "\<border\(-\(top\|right\|bottom\|left\)\)\=\(-\(width\|color\|style\)\)\=\>"
syn match cssBorderProp contained "\<border\(-\(top\|bottom\)-\(left\|right\)\)\=-radius\>"
syn match cssBorderProp contained "\<border-image\(-\(outset\|repeat\|slice\|source\|width\)\)\=\>"
syn match cssBorderProp contained "\<box-decoration-break\>"
syn match cssBorderProp contained "\<box-shadow\>"

" border-image attributes
syn keyword cssBorderAttr contained stretch round space fill

" border-style attributes
syn keyword cssBorderAttr contained dotted dashed solid double groove ridge inset outset

" border-width attributes
syn keyword cssBorderAttr contained thin thick medium

" box-decoration-break attributes
syn keyword cssBorderAttr contained clone slice
"------------------------------------------------

syn match cssBoxProp contained "\<padding\(-\(top\|right\|bottom\|left\)\)\=\>"
syn match cssBoxProp contained "\<margin\(-\(top\|right\|bottom\|left\)\)\=\>"
syn match cssBoxProp contained "\<overflow\(-\(x\|y\|style\)\)\=\>"
syn match cssBoxProp contained "\<rotation\(-point\)\=\>"
syn keyword cssBoxAttr contained visible hidden scroll auto
syn match cssBoxAttr contained "\<no-\(display\|content\)\>"

syn keyword cssColorProp contained opacity
syn match cssColorProp contained "\<color-profile\>"
syn match cssColorProp contained "\<rendering-intent\>"


syn match cssDimensionProp contained "\<\(min\|max\)-\(width\|height\)\>"
syn keyword cssDimensionProp contained height
syn keyword cssDimensionProp contained width

" shadow and sizing are in other property groups
syn match cssFlexibleBoxProp contained "\<box-\(align\|direction\|flex\|ordinal-group\|orient\|pack\|shadow\|sizing\)\>"
syn keyword cssFlexibleBoxAttr contained start end baseline
syn keyword cssFlexibleBoxAttr contained reverse
syn keyword cssFlexibleBoxAttr contained single multiple
syn keyword cssFlexibleBoxAttr contained horizontal
syn match cssFlexibleBoxAttr contained "\<vertical\(-align\)\@!\>" "escape vertical-align
syn match cssFlexibleBoxAttr contained "\<\(inline\|block\)-axis\>"

" CSS Fonts Module Level 3
" http://www.w3.org/TR/css-fonts-3/
syn match cssFontProp contained "\<font\(-\(family\|\|feature-settings\|kerning\|language-override\|size\(-adjust\)\=\|stretch\|style\|synthesis\|variant\(-\(alternates\|caps\|east-asian\|ligatures\|numeric\|position\)\)\=\|weight\)\)\=\>"

" font attributes
syn keyword cssFontAttr contained icon menu caption
syn match cssFontAttr contained "\<small-\(caps\|caption\)\>"
syn match cssFontAttr contained "\<message-box\>"
syn match cssFontAttr contained "\<status-bar\>"
syn keyword cssFontAttr contained larger smaller
syn match cssFontAttr contained "\<\(x\{1,2\}-\)\=\(large\|small\)\>"
" font-family attributes
syn match cssFontAttr contained "\<\(sans-\)\=serif\>"
syn keyword cssFontAttr contained Antiqua Arial Black Book Charcoal Comic Courier Dingbats Gadget Geneva Georgia Grande Helvetica Impact Linotype Lucida MS Monaco Neue New Palatino Roboto Roman Symbol Tahoma Times Trebuchet Verdana Webdings Wingdings York Zapf
syn keyword cssFontAttr contained cursive fantasy monospace
" font-feature-settings attributes
syn keyword cssFontAttr contained on off
" font-stretch attributes
syn match cssFontAttr contained "\<\(\(ultra\|extra\|semi\)-\)\=\(condensed\|expanded\)\>"
" font-style attributes
syn keyword cssFontAttr contained italic oblique
" font-synthesis attributes
syn keyword cssFontAttr contained weight style
" font-weight attributes
syn keyword cssFontAttr contained bold bolder lighter
" TODO: font-variant-* attributes
"------------------------------------------------

" Webkit specific property/attributes
syn match cssFontProp contained "\<font-smooth\>"
syn match cssFontAttr contained "\<\(subpixel-\)\=\antialiased\>"


" CSS Multi-column Layout Module
" http://www.w3.org/TR/css3-multicol/
syn match cssMultiColumnProp contained "\<break-\(after\|before\|inside\)\>"
syn match cssMultiColumnProp contained "\<column-\(count\|fill\|gap\|rule\(-\(color\|style\|width\)\)\=\|span\|width\)\>"
syn keyword cssMultiColumnProp contained columns
syn keyword cssMultiColumnAttr contained balance medium
syn keyword cssMultiColumnAttr contained always avoid left right page column
syn match cssMultiColumnAttr contained "\<avoid-\(page\|column\)\>"

" http://www.w3.org/TR/css3-break/#page-break
syn match cssMultiColumnProp contained "\<page\(-break-\(before\|after\|inside\)\)\=\>"

" TODO find following items in w3c docs.
syn keyword cssGeneratedContentProp contained quotes crop
syn match cssGeneratedContentProp contained "\<counter-\(reset\|increment\)\>"
syn match cssGeneratedContentProp contained "\<move-to\>"
syn match cssGeneratedContentProp contained "\<page-policy\>"
syn match cssGeneratedContentAttr contained "\<\(no-\)\=\(open\|close\)-quote\>"

syn match cssGridProp contained "\<grid-\(columns\|rows\)\>"

syn match cssHyerlinkProp contained "\<target\(-\(name\|new\|position\)\)\=\>"

syn match cssListProp contained "\<list-style\(-\(type\|position\|image\)\)\=\>"
syn match cssListAttr contained "\<\(lower\|upper\)-\(roman\|alpha\|greek\|latin\)\>"
syn match cssListAttr contained "\<\(hiragana\|katakana\)\(-iroha\)\=\>"
syn match cssListAttr contained "\<\(decimal\(-leading-zero\)\=\|cjk-ideographic\)\>"
syn keyword cssListAttr contained disc circle square hebrew armenian georgian
syn keyword cssListAttr contained inside outside

syn keyword cssPositioningProp contained bottom clear clip display float left
syn keyword cssPositioningProp contained position right top visibility
syn match cssPositioningProp contained "\<z-index\>"
syn keyword cssPositioningAttr contained block compact
syn match cssPositioningAttr contained "\<table\(-\(row-group\|\(header\|footer\)-group\|row\|column\(-group\)\=\|cell\|caption\)\)\=\>"
syn keyword cssPositioningAttr contained left right both
syn match cssPositioningAttr contained "\<list-item\>"
syn match cssPositioningAttr contained "\<inline\(-\(block\|box\|table\)\)\=\>"
syn keyword cssPositioningAttr contained static relative absolute fixed

syn keyword cssPrintAttr contained landscape portrait crop cross always avoid

syn match cssTableProp contained "\<\(caption-side\|table-layout\|border-collapse\|border-spacing\|empty-cells\)\>"
syn keyword cssTableAttr contained fixed collapse separate show hide once always


syn keyword cssTextProp contained color direction
syn match cssTextProp "\<\(\(word\|letter\)-spacing\|text\(-\(decoration\|transform\|align\|index\|shadow\)\)\=\|vertical-align\|unicode-bidi\|line-height\)\>"
syn match cssTextProp contained "\<text-\(justify\|outline\|warp\|align-last\|size-adjust\|rendering\|stroke\|indent\)\>"
syn match cssTextProp contained "\<word-\(break\|\wrap\)\>"
syn match cssTextProp contained "\<white-space\>"
syn match cssTextProp contained "\<hanging-punctuation\>"
syn match cssTextProp contained "\<punctuation-trim\>"
syn match cssTextAttr contained "\<line-through\>"
syn match cssTextAttr contained "\<\(text-\)\=\(top\|bottom\)\>"
syn keyword cssTextAttr contained ltr rtl embed nowrap
syn keyword cssTextAttr contained underline overline blink sub super middle
syn keyword cssTextAttr contained capitalize uppercase lowercase
syn keyword cssTextAttr contained justify baseline sub super
syn keyword cssTextAttr contained optimizeLegibility optimizeSpeed
syn match cssTextAttr contained "\<pre\(-\(line\|wrap\)\)\=\>"
syn match cssTextAttr contained "\<\(allow\|force\)-end\>"
syn keyword cssTextAttr contained start end adjacent
syn match cssTextAttr contained "\<inter-\(word\|ideographic\|cluster\)\>"
syn keyword cssTextAttr contained distribute kashida first last
syn keyword cssTextAttr contained clip ellipsis unrestricted suppress
syn match cssTextAttr contained "\<break-all\>"
syn match cssTextAttr contained "\<break-word\>"
syn keyword cssTextAttr contained hyphenate
syn match cssTextAttr contained "\<bidi-override\>"

syn match cssTransformProp contained "\<transform\(-\(origin\|style\)\)\=\>"
syn match cssTransformProp contained "\<perspective\(-origin\)\=\>"
syn match cssTransformProp contained "\<backface-visibility\>"

" CSS Transitions
" http://www.w3.org/TR/css3-transitions/
syn match cssTransitionProp contained "\<transition\(-\(delay\|duration\|property\|timing-function\)\)\=\>"

" transition-time-function attributes
syn match cssTransitionAttr contained "\<linear\(-gradient\)\@!\>"
syn match cssTransitionAttr contained "\<ease\(-\(in-out\|out\|in\)\)\=\>"
syn match cssTransitionAttr contained "\<step\(-start\|-end\)\=\>"
"------------------------------------------------
" CSS Basic User Interface Module Level 3 (CSS3 UI)
" http://www.w3.org/TR/css3-ui/
syn match cssUIProp contained "\<box-sizing\>"
syn match cssUIAttr contained "\<\(content\|padding\|border\)\(-box\)\=\>"

syn keyword cssUIProp contained cursor
syn match cssUIAttr contained "\<\(\([ns]\=[ew]\=\)\|col\|row\|nesw\|nwse\)-resize\>"
syn keyword cssUIAttr contained crosshair help move pointer alias copy
syn keyword cssUIAttr contained progress wait text cell move
syn match cssUIAttr contained "\<context-menu\>"
syn match cssUIAttr contained "\<no-drop\>"
syn match cssUIAttr contained "\<not-allowed\>"
syn match cssUIAttr contained "\<all-scroll\>"
syn match cssUIAttr contained "\<\(vertical-\)\=text\>"
syn match cssUIAttr contained "\<zoom\(-in\|-out\)\=\>"

syn match cssUIProp contained "\<ime-mode\>"
syn keyword cssUIAttr contained active inactive disabled

syn match cssUIProp contained "\<nav-\(down\|index\|left\|right\|up\)\=\>"
syn match cssUIProp contained "\<outline\(-\(width\|style\|color\|offset\)\)\=\>"
syn keyword cssUIAttr contained invert

syn keyword cssUIProp contained icon resize
syn keyword cssUIAttr contained both horizontal vertical

syn match cssUIProp contained "\<text-overflow\>"
syn keyword cssUIAttr contained clip ellipsis

" Already highlighted Props: font content
"------------------------------------------------
" Webkit/iOS specific attributes
syn match cssUIAttr contained '\(preserve-3d\)'
" IE specific attributes
syn match cssIEUIAttr contained '\(bicubic\)'

" Webkit/iOS specific properties
syn match cssUIProp contained '\(tap-highlight-color\|user-select\|touch-callout\)'
" IE specific properties
syn match cssIEUIProp contained '\(interpolation-mode\|zoom\|filter\)'

" Webkit/Firebox specific properties/attributes
syn keyword cssUIProp contained appearance
syn keyword cssUIAttr contained window button field icon document menu


syn match cssAuralProp contained "\<\(pause\|cue\)\(-\(before\|after\)\)\=\>"
syn match cssAuralProp contained "\<\(play-during\|speech-rate\|voice-family\|pitch\(-range\)\=\|speak\(-\(punctuation\|numeral\|header\)\)\=\)\>"
syn keyword cssAuralProp contained volume during azimuth elevation stress richness
syn match cssAuralAttr contained "\<\(x-\)\=\(soft\|loud\)\>"
syn keyword cssAuralAttr contained silent
syn match cssAuralAttr contained "\<spell-out\>"
syn keyword cssAuralAttr contained non mix
syn match cssAuralAttr contained "\<\(left\|right\)-side\>"
syn match cssAuralAttr contained "\<\(far\|center\)-\(left\|center\|right\)\>"
syn keyword cssAuralAttr contained leftwards rightwards behind
syn keyword cssAuralAttr contained below level above lower higher
syn match cssAuralAttr contained "\<\(x-\)\=\(slow\|fast\|low\|high\)\>"
syn keyword cssAuralAttr contained faster slower
syn keyword cssAuralAttr contained male female child code digits continuous

" mobile text
syn match cssMobileTextProp contained "\<text-size-adjust\>"



syn match cssBraces contained "[{}]"
syn match cssError contained "{@<>"
syn region cssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=cssAttrRegion,css.*Prop,cssComment,cssValue.*,cssColor,cssURL,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssVendor,cssDefinition,cssHacks,cssNoise fold
syn match cssBraceError "}"
syn match cssAttrComma ","

" Pseudo class
" http://www.w3.org/TR/css3-selectors/
syn match cssPseudoClass ":[A-Za-z0-9_-]*" contains=cssNoise,cssPseudoClassId,cssUnicodeEscape,cssVendor,cssPseudoClassFn
syn keyword cssPseudoClassId contained link visited active hover before after left right
syn keyword cssPseudoClassId contained root empty target enable disabled checked invalid
syn match cssPseudoClassId contained "\<first-\(line\|letter\)\>"
syn match cssPseudoClassId contained "\<\(first\|last\|only\)-\(of-type\|child\)\>"
syn region cssPseudoClassFn contained matchgroup=cssFunctionName start="\<\(not\|lang\|\(nth\|nth-last\)-\(of-type\|child\)\)(" end=")"
" ------------------------------------
" Vendor specific properties
syn match cssPseudoClassId contained  "\<selection\>"
syn match cssPseudoClassId contained  "\<focus\(-inner\)\=\>"
syn match cssPseudoClassId contained  "\<\(input-\)\=placeholder\>"

" Misc highlight groups
syntax match cssUnitDecorators /\(#\|-\|%\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\|ch\|rem\|vh\|vw\|vmin\|vmax\|dpi\|dppx\|dpcm\|Hz\|kHz\|s\|ms\|deg\|grad\|rad\)/ contained
syntax match cssNoise contained /\(:\|;\|\/\)/

" Comment
syn region cssComment start="/\*" end="\*/" contains=@Spell fold

syn match cssUnicodeEscape "\\\x\{1,6}\s\?"
syn match cssSpecialCharQQ +\\\\\|\\"+ contained
syn match cssSpecialCharQ +\\\\\|\\'+ contained
syn region cssStringQQ start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=cssUnicodeEscape,cssSpecialCharQQ
syn region cssStringQ start=+'+ skip=+\\\\\|\\'+ end=+'+ contains=cssUnicodeEscape,cssSpecialCharQ

" Vendor Prefix
syn match cssVendor contained "\(-\(webkit\|moz\|o\|ms\)-\)"

" Various CSS Hack characters
" In earlier versions of IE (6 and 7), one can prefix property names
" with a _ or * to isolate those definitions to particular versions of IE
" This is purely decorative and therefore we assign to the same highlight
" group to cssVendor, for more information:
" http://www.paulirish.com/2009/browser-specific-css-hacks/
syn match cssHacks contained /\(_\|*\)/

" Attr Enhance
" Some keywords are both Prop and Attr, so we have to handle them
syn region cssAttrRegion start=/:/ end=/\ze\(;\|)\|}\)/ contained contains=css.*Attr,cssColor,cssImportant,cssValue.*,cssFunction,cssString.*,cssURL,cssComment,cssUnicodeEscape,cssVendor,cssError,cssAttrComma,cssNoise

" Hack for transition
" 'transition' has Props after ':'.
syn region cssAttrRegion start=/transition\s*:/ end=/\ze\(;\|)\|}\)/ contained contains=css.*Prop,css.*Attr,cssColor,cssImportant,cssValue.*,cssFunction,cssString.*,cssURL,cssComment,cssUnicodeEscape,cssVendor,cssError,cssAttrComma,cssNoise


if main_syntax == "css"
  syn sync minlines=10
endif

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link cssComment Comment
hi def link cssVendor Comment
hi def link cssHacks Comment
hi def link cssTagName Statement
hi def link cssDeprecated Error
hi def link cssSelectorOp Special
hi def link cssSelectorOp2 Special
hi def link cssAttrComma Special

hi def link cssAnimationProp cssProp
hi def link cssBackgroundProp cssProp
hi def link cssBorderProp cssProp
hi def link cssBoxProp cssProp
hi def link cssColorProp cssProp
hi def link cssContentForPagedMediaProp cssProp
hi def link cssDimensionProp cssProp
hi def link cssFlexibleBoxProp cssProp
hi def link cssFontProp cssProp
hi def link cssGeneratedContentProp cssProp
hi def link cssGridProp cssProp
hi def link cssHyerlinkProp cssProp
hi def link cssLineboxProp cssProp
hi def link cssListProp cssProp
hi def link cssMarqueeProp cssProp
hi def link cssMultiColumnProp cssProp
hi def link cssPagedMediaProp cssProp
hi def link cssPositioningProp cssProp
hi def link cssPrintProp cssProp
hi def link cssRubyProp cssProp
hi def link cssSpeechProp cssProp
hi def link cssTableProp cssProp
hi def link cssTextProp cssProp
hi def link cssTransformProp cssProp
hi def link cssTransitionProp cssProp
hi def link cssUIProp cssProp
hi def link cssIEUIProp cssProp
hi def link cssAuralProp cssProp
hi def link cssRenderProp cssProp
hi def link cssMobileTextProp cssProp

hi def link cssAnimationAttr cssAttr
hi def link cssBackgroundAttr cssAttr
hi def link cssBorderAttr cssAttr
hi def link cssBoxAttr cssAttr
hi def link cssContentForPagedMediaAttr cssAttr
hi def link cssDimensionAttr cssAttr
hi def link cssFlexibleBoxAttr cssAttr
hi def link cssFontAttr cssAttr
hi def link cssGeneratedContentAttr cssAttr
hi def link cssGridAttr cssAttr
hi def link cssHyerlinkAttr cssAttr
hi def link cssLineboxAttr cssAttr
hi def link cssListAttr cssAttr
hi def link cssMarginAttr cssAttr
hi def link cssMarqueeAttr cssAttr
hi def link cssMultiColumnAttr cssAttr
hi def link cssPaddingAttr cssAttr
hi def link cssPagedMediaAttr cssAttr
hi def link cssPositioningAttr cssAttr
hi def link cssGradientAttr cssAttr
hi def link cssPrintAttr cssAttr
hi def link cssRubyAttr cssAttr
hi def link cssSpeechAttr cssAttr
hi def link cssTableAttr cssAttr
hi def link cssTextAttr cssAttr
hi def link cssTransformAttr cssAttr
hi def link cssTransitionAttr cssAttr
hi def link cssUIAttr cssAttr
hi def link cssIEUIAttr cssAttr
hi def link cssAuralAttr cssAttr
hi def link cssRenderAttr cssAttr
hi def link cssCommonAttr cssAttr

hi def link cssPseudoClassId PreProc
hi def link cssPseudoClassLang Constant
hi def link cssValueLength Number
hi def link cssValueInteger Number
hi def link cssValueNumber Number
hi def link cssValueAngle Number
hi def link cssValueTime Number
hi def link cssValueFrequency Number
hi def link cssFunction Constant
hi def link cssURL String
hi def link cssFunctionName Function
hi def link cssFunctionComma Function
hi def link cssColor Constant
hi def link cssIdentifier Function
hi def link cssInclude Include
hi def link cssIncludeKeyword atKeyword
hi def link cssImportant Special
hi def link cssBraces Function
hi def link cssBraceError Error
hi def link cssError Error
hi def link cssUnicodeEscape Special
hi def link cssStringQQ String
hi def link cssStringQ String
hi def link cssAttributeSelector String
hi def link cssMedia atKeyword
hi def link cssMediaType Special
hi def link cssMediaComma Normal
hi def link cssMediaKeyword Statement
hi def link cssMediaProp cssProp
hi def link cssMediaAttr cssAttr
hi def link cssPage atKeyword
hi def link cssPagePseudo PreProc
hi def link cssPageMargin atKeyword
hi def link cssPageProp cssProp
hi def link cssKeyFrame atKeyword
hi def link cssKeyFrameSelector Constant
hi def link cssFontDescriptor Special
hi def link cssFontDescriptorFunction Constant
hi def link cssFontDescriptorProp cssProp
hi def link cssFontDescriptorAttr cssAttr
hi def link cssUnicodeRange Constant
hi def link cssClassName Function
hi def link cssClassNameDot Function
hi def link cssProp StorageClass
hi def link cssAttr Constant
hi def link cssUnitDecorators Number
hi def link cssNoise Noise
hi def link atKeyword PreProc

let b:current_syntax = "css"

if main_syntax == 'css'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        .vim/syntax/c.vim                                                                                   000644  000765  000024  00000062212 13013665536 015131  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:	C
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2016 Nov 18

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

let s:ft = matchstr(&ft, '^\([^.]\)\+')

" A bunch of useful C keywords
syn keyword	cStatement	goto break return continue asm
syn keyword	cLabel		case default
syn keyword	cConditional	if else switch
syn keyword	cRepeat		while for do

syn keyword	cTodo		contained TODO FIXME XXX

" It's easy to accidentally add a space after a backslash that was intended
" for line continuation.  Some compilers allow it, which makes it
" unpredictable and should be avoided.
syn match	cBadContinuation contained "\\\s\+$"

" cCommentGroup allows adding matches for special things in comments
syn cluster	cCommentGroup	contains=cTodo,cBadContinuation

" String and Character constants
" Highlight special characters (those which have a backslash) differently
syn match	cSpecial	display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
if !exists("c_no_utf")
  syn match	cSpecial	display contained "\\\(u\x\{4}\|U\x\{8}\)"
endif

if !exists("c_no_cformat")
  " Highlight % items in strings.
  if !exists("c_no_c99") " ISO C99
    syn match	cFormat		display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlLjzt]\|ll\|hh\)\=\([aAbdiuoxXDOUfFeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
  else
    syn match	cFormat		display "%\(\d\+\$\)\=[-+' #0*]*\(\d*\|\*\|\*\d\+\$\)\(\.\(\d*\|\*\|\*\d\+\$\)\)\=\([hlL]\|ll\)\=\([bdiuoxXDOUfeEgGcCsSpn]\|\[\^\=.[^]]*\]\)" contained
  endif
  syn match	cFormat		display "%%" contained
endif

" cCppString: same as cString, but ends at end of line
if s:ft ==# "cpp" && !exists("cpp_no_cpp11") && !exists("c_no_cformat")
  " ISO C++11
  syn region	cString		start=+\(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial,cFormat,@Spell extend
  syn region 	cCppString	start=+\(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=cSpecial,cFormat,@Spell
elseif s:ft ==# "c" && !exists("c_no_c11") && !exists("c_no_cformat")
  " ISO C99
  syn region	cString		start=+\%(L\|U\|u8\)\="+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial,cFormat,@Spell extend
  syn region	cCppString	start=+\%(L\|U\|u8\)\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=cSpecial,cFormat,@Spell
else
  " older C or C++
  syn match	cFormat		display "%%" contained
  syn region	cString		start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial,cFormat,@Spell extend
  syn region	cCppString	start=+L\="+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end='$' contains=cSpecial,cFormat,@Spell
endif

syn region	cCppSkip	contained start="^\s*\(%:\|#\)\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" contains=cSpaceError,cCppSkip

syn cluster	cStringGroup	contains=cCppString,cCppSkip

syn match	cCharacter	"L\='[^\\]'"
syn match	cCharacter	"L'[^']*'" contains=cSpecial
if exists("c_gnu")
  syn match	cSpecialError	"L\='\\[^'\"?\\abefnrtv]'"
  syn match	cSpecialCharacter "L\='\\['\"?\\abefnrtv]'"
else
  syn match	cSpecialError	"L\='\\[^'\"?\\abfnrtv]'"
  syn match	cSpecialCharacter "L\='\\['\"?\\abfnrtv]'"
endif
syn match	cSpecialCharacter display "L\='\\\o\{1,3}'"
syn match	cSpecialCharacter display "'\\x\x\{1,2}'"
syn match	cSpecialCharacter display "L'\\x\x\+'"

if (s:ft ==# "c" && !exists("c_no_c11")) || (s:ft ==# "cpp" && !exists("cpp_no_cpp11"))
  " ISO C11 or ISO C++ 11
  if exists("c_no_cformat")
    syn region	cString		start=+\%(U\|u8\=\)"+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial,@Spell extend
  else
    syn region	cString		start=+\%(U\|u8\=\)"+ skip=+\\\\\|\\"+ end=+"+ contains=cSpecial,cFormat,@Spell extend
  endif
  syn match	cCharacter	"[Uu]'[^\\]'"
  syn match	cCharacter	"[Uu]'[^']*'" contains=cSpecial
  if exists("c_gnu")
    syn match	cSpecialError	"[Uu]'\\[^'\"?\\abefnrtv]'"
    syn match	cSpecialCharacter "[Uu]'\\['\"?\\abefnrtv]'"
  else
    syn match	cSpecialError	"[Uu]'\\[^'\"?\\abfnrtv]'"
    syn match	cSpecialCharacter "[Uu]'\\['\"?\\abfnrtv]'"
  endif
  syn match	cSpecialCharacter display "[Uu]'\\\o\{1,3}'"
  syn match	cSpecialCharacter display "[Uu]'\\x\x\+'"
endif

"when wanted, highlight trailing white space
if exists("c_space_errors")
  if !exists("c_no_trail_space_error")
    syn match	cSpaceError	display excludenl "\s\+$"
  endif
  if !exists("c_no_tab_space_error")
    syn match	cSpaceError	display " \+\t"me=e-1
  endif
endif

" This should be before cErrInParen to avoid problems with #define ({ xxx })
if exists("c_curly_error")
  syn match cCurlyError "}"
  syn region	cBlock		start="{" end="}" contains=ALLBUT,cBadBlock,cCurlyError,@cParenGroup,cErrInParen,cCppParen,cErrInBracket,cCppBracket,@cStringGroup,@Spell fold
else
  syn region	cBlock		start="{" end="}" transparent fold
endif

" Catch errors caused by wrong parenthesis and brackets.
" Also accept <% for {, %> for }, <: for [ and :> for ] (C99)
" But avoid matching <::.
syn cluster	cParenGroup	contains=cParenError,cIncluded,cSpecial,cCommentSkip,cCommentString,cComment2String,@cCommentGroup,cCommentStartError,cUserLabel,cBitField,cOctalZero,@cCppOutInGroup,cFormat,cNumber,cFloat,cOctal,cOctalError,cNumbersCom
if exists("c_no_curly_error")
  if s:ft ==# 'cpp' && !exists("cpp_no_cpp11")
    syn region	cParen		transparent start='(' end=')' contains=ALLBUT,@cParenGroup,cCppParen,@cStringGroup,@Spell
    " cCppParen: same as cParen but ends at end-of-line; used in cDefine
    syn region	cCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@cParenGroup,cParen,cString,@Spell
    syn match	cParenError	display ")"
    syn match	cErrInParen	display contained "^^<%\|^%>"
  else
    syn region	cParen		transparent start='(' end=')' end='}'me=s-1 contains=ALLBUT,cBlock,@cParenGroup,cCppParen,@cStringGroup,@Spell
    " cCppParen: same as cParen but ends at end-of-line; used in cDefine
    syn region	cCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@cParenGroup,cParen,cString,@Spell
    syn match	cParenError	display ")"
    syn match	cErrInParen	display contained "^[{}]\|^<%\|^%>"
  endif
elseif exists("c_no_bracket_error")
  if s:ft ==# 'cpp' && !exists("cpp_no_cpp11")
    syn region	cParen		transparent start='(' end=')' contains=ALLBUT,@cParenGroup,cCppParen,@cStringGroup,@Spell
    " cCppParen: same as cParen but ends at end-of-line; used in cDefine
    syn region	cCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@cParenGroup,cParen,cString,@Spell
    syn match	cParenError	display ")"
    syn match	cErrInParen	display contained "<%\|%>"
  else
    syn region	cParen		transparent start='(' end=')' end='}'me=s-1 contains=ALLBUT,cBlock,@cParenGroup,cCppParen,@cStringGroup,@Spell
    " cCppParen: same as cParen but ends at end-of-line; used in cDefine
    syn region	cCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@cParenGroup,cParen,cString,@Spell
    syn match	cParenError	display ")"
    syn match	cErrInParen	display contained "[{}]\|<%\|%>"
  endif
else
  if s:ft ==# 'cpp' && !exists("cpp_no_cpp11")
    syn region	cParen		transparent start='(' end=')' contains=ALLBUT,@cParenGroup,cCppParen,cErrInBracket,cCppBracket,@cStringGroup,@Spell
    " cCppParen: same as cParen but ends at end-of-line; used in cDefine
    syn region	cCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@cParenGroup,cErrInBracket,cParen,cBracket,cString,@Spell
    syn match	cParenError	display "[\])]"
    syn match	cErrInParen	display contained "<%\|%>"
    syn region	cBracket	transparent start='\[\|<::\@!' end=']\|:>' contains=ALLBUT,@cParenGroup,cErrInParen,cCppParen,cCppBracket,@cStringGroup,@Spell
  else
    syn region	cParen		transparent start='(' end=')' end='}'me=s-1 contains=ALLBUT,cBlock,@cParenGroup,cCppParen,cErrInBracket,cCppBracket,@cStringGroup,@Spell
    " cCppParen: same as cParen but ends at end-of-line; used in cDefine
    syn region	cCppParen	transparent start='(' skip='\\$' excludenl end=')' end='$' contained contains=ALLBUT,@cParenGroup,cErrInBracket,cParen,cBracket,cString,@Spell
    syn match	cParenError	display "[\])]"
    syn match	cErrInParen	display contained "[\]{}]\|<%\|%>"
    syn region	cBracket	transparent start='\[\|<::\@!' end=']\|:>' end='}'me=s-1 contains=ALLBUT,cBlock,@cParenGroup,cErrInParen,cCppParen,cCppBracket,@cStringGroup,@Spell
  endif
  " cCppBracket: same as cParen but ends at end-of-line; used in cDefine
  syn region	cCppBracket	transparent start='\[\|<::\@!' skip='\\$' excludenl end=']\|:>' end='$' contained contains=ALLBUT,@cParenGroup,cErrInParen,cParen,cBracket,cString,@Spell
  syn match	cErrInBracket	display contained "[);{}]\|<%\|%>"
endif

if s:ft ==# 'c' || exists("cpp_no_cpp11")
  syn region	cBadBlock	keepend start="{" end="}" contained containedin=cParen,cBracket,cBadBlock transparent fold
endif

"integer number, or floating point number without a dot and with "f".
syn case ignore
syn match	cNumbers	display transparent "\<\d\|\.\d" contains=cNumber,cFloat,cOctalError,cOctal
" Same, but without octal error (for comments)
syn match	cNumbersCom	display contained transparent "\<\d\|\.\d" contains=cNumber,cFloat,cOctal
syn match	cNumber		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
"hex number
syn match	cNumber		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	cOctal		display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=cOctalZero
syn match	cOctalZero	display contained "\<0"
syn match	cFloat		display contained "\d\+f"
"floating point number, with dot, optional exponent
syn match	cFloat		display contained "\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\="
"floating point number, starting with a dot, optional exponent
syn match	cFloat		display contained "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"floating point number, without dot, with exponent
syn match	cFloat		display contained "\d\+e[-+]\=\d\+[fl]\=\>"
if !exists("c_no_c99")
  "hexadecimal floating point number, optional leading digits, with dot, with exponent
  syn match	cFloat		display contained "0x\x*\.\x\+p[-+]\=\d\+[fl]\=\>"
  "hexadecimal floating point number, with leading digits, optional dot, with exponent
  syn match	cFloat		display contained "0x\x\+\.\=p[-+]\=\d\+[fl]\=\>"
endif

" flag an octal number with wrong digits
syn match	cOctalError	display contained "0\o*[89]\d*"
syn case match

if exists("c_comment_strings")
  " A comment can contain cString, cCharacter and cNumber.
  " But a "*/" inside a cString in a cComment DOES end the comment!  So we
  " need to use a special type of cString: cCommentString, which also ends on
  " "*/", and sees a "*" at the start of the line as comment again.
  " Unfortunately this doesn't very well work for // type of comments :-(
  syn match	cCommentSkip	contained "^\s*\*\($\|\s\+\)"
  syn region cCommentString	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=cSpecial,cCommentSkip
  syn region cComment2String	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end="$" contains=cSpecial
  syn region  cCommentL	start="//" skip="\\$" end="$" keepend contains=@cCommentGroup,cComment2String,cCharacter,cNumbersCom,cSpaceError,@Spell
  if exists("c_no_comment_fold")
    " Use "extend" here to have preprocessor lines not terminate halfway a
    " comment.
    syn region cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cCommentString,cCharacter,cNumbersCom,cSpaceError,@Spell extend
  else
    syn region cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cCommentString,cCharacter,cNumbersCom,cSpaceError,@Spell fold extend
  endif
else
  syn region	cCommentL	start="//" skip="\\$" end="$" keepend contains=@cCommentGroup,cSpaceError,@Spell
  if exists("c_no_comment_fold")
    syn region	cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cSpaceError,@Spell extend
  else
    syn region	cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cSpaceError,@Spell fold extend
  endif
endif
" keep a // comment separately, it terminates a preproc. conditional
syn match	cCommentError	display "\*/"
syn match	cCommentStartError display "/\*"me=e-1 contained

syn keyword	cOperator	sizeof
if exists("c_gnu")
  syn keyword	cStatement	__asm__
  syn keyword	cOperator	typeof __real__ __imag__
endif
syn keyword	cType		int long short char void
syn keyword	cType		signed unsigned float double
if !exists("c_no_ansi") || exists("c_ansi_typedefs")
  syn keyword   cType		size_t ssize_t off_t wchar_t ptrdiff_t sig_atomic_t fpos_t
  syn keyword   cType		clock_t time_t va_list jmp_buf FILE DIR div_t ldiv_t
  syn keyword   cType		mbstate_t wctrans_t wint_t wctype_t
endif
if !exists("c_no_c99") " ISO C99
  syn keyword	cType		_Bool bool _Complex complex _Imaginary imaginary
  syn keyword	cType		int8_t int16_t int32_t int64_t
  syn keyword	cType		uint8_t uint16_t uint32_t uint64_t
  if !exists("c_no_bsd")
    " These are BSD specific.
    syn keyword	cType		u_int8_t u_int16_t u_int32_t u_int64_t
  endif
  syn keyword	cType		int_least8_t int_least16_t int_least32_t int_least64_t
  syn keyword	cType		uint_least8_t uint_least16_t uint_least32_t uint_least64_t
  syn keyword	cType		int_fast8_t int_fast16_t int_fast32_t int_fast64_t
  syn keyword	cType		uint_fast8_t uint_fast16_t uint_fast32_t uint_fast64_t
  syn keyword	cType		intptr_t uintptr_t
  syn keyword	cType		intmax_t uintmax_t
endif
if exists("c_gnu")
  syn keyword	cType		__label__ __complex__ __volatile__
endif

syn keyword	cStructure	struct union enum typedef
syn keyword	cStorageClass	static register auto volatile extern const
if exists("c_gnu")
  syn keyword	cStorageClass	inline __attribute__
endif
if !exists("c_no_c99") && s:ft !=# 'cpp'
  syn keyword	cStorageClass	inline restrict
endif
if !exists("c_no_c11")
  syn keyword	cStorageClass	_Alignas alignas
  syn keyword	cOperator	_Alignof alignof
  syn keyword	cStorageClass	_Atomic
  syn keyword	cOperator	_Generic
  syn keyword	cStorageClass	_Noreturn noreturn
  syn keyword	cOperator	_Static_assert static_assert
  syn keyword	cStorageClass	_Thread_local thread_local
  syn keyword   cType		char16_t char32_t
endif

if !exists("c_no_ansi") || exists("c_ansi_constants") || exists("c_gnu")
  if exists("c_gnu")
    syn keyword cConstant __GNUC__ __FUNCTION__ __PRETTY_FUNCTION__ __func__
  endif
  syn keyword cConstant __LINE__ __FILE__ __DATE__ __TIME__ __STDC__
  syn keyword cConstant __STDC_VERSION__
  syn keyword cConstant CHAR_BIT MB_LEN_MAX MB_CUR_MAX
  syn keyword cConstant UCHAR_MAX UINT_MAX ULONG_MAX USHRT_MAX
  syn keyword cConstant CHAR_MIN INT_MIN LONG_MIN SHRT_MIN
  syn keyword cConstant CHAR_MAX INT_MAX LONG_MAX SHRT_MAX
  syn keyword cConstant SCHAR_MIN SINT_MIN SLONG_MIN SSHRT_MIN
  syn keyword cConstant SCHAR_MAX SINT_MAX SLONG_MAX SSHRT_MAX
  if !exists("c_no_c99")
    syn keyword cConstant __func__ __VA_ARGS__
    syn keyword cConstant LLONG_MIN LLONG_MAX ULLONG_MAX
    syn keyword cConstant INT8_MIN INT16_MIN INT32_MIN INT64_MIN
    syn keyword cConstant INT8_MAX INT16_MAX INT32_MAX INT64_MAX
    syn keyword cConstant UINT8_MAX UINT16_MAX UINT32_MAX UINT64_MAX
    syn keyword cConstant INT_LEAST8_MIN INT_LEAST16_MIN INT_LEAST32_MIN INT_LEAST64_MIN
    syn keyword cConstant INT_LEAST8_MAX INT_LEAST16_MAX INT_LEAST32_MAX INT_LEAST64_MAX
    syn keyword cConstant UINT_LEAST8_MAX UINT_LEAST16_MAX UINT_LEAST32_MAX UINT_LEAST64_MAX
    syn keyword cConstant INT_FAST8_MIN INT_FAST16_MIN INT_FAST32_MIN INT_FAST64_MIN
    syn keyword cConstant INT_FAST8_MAX INT_FAST16_MAX INT_FAST32_MAX INT_FAST64_MAX
    syn keyword cConstant UINT_FAST8_MAX UINT_FAST16_MAX UINT_FAST32_MAX UINT_FAST64_MAX
    syn keyword cConstant INTPTR_MIN INTPTR_MAX UINTPTR_MAX
    syn keyword cConstant INTMAX_MIN INTMAX_MAX UINTMAX_MAX
    syn keyword cConstant PTRDIFF_MIN PTRDIFF_MAX SIG_ATOMIC_MIN SIG_ATOMIC_MAX
    syn keyword cConstant SIZE_MAX WCHAR_MIN WCHAR_MAX WINT_MIN WINT_MAX
  endif
  syn keyword cConstant FLT_RADIX FLT_ROUNDS
  syn keyword cConstant FLT_DIG FLT_MANT_DIG FLT_EPSILON
  syn keyword cConstant DBL_DIG DBL_MANT_DIG DBL_EPSILON
  syn keyword cConstant LDBL_DIG LDBL_MANT_DIG LDBL_EPSILON
  syn keyword cConstant FLT_MIN FLT_MAX FLT_MIN_EXP FLT_MAX_EXP
  syn keyword cConstant FLT_MIN_10_EXP FLT_MAX_10_EXP
  syn keyword cConstant DBL_MIN DBL_MAX DBL_MIN_EXP DBL_MAX_EXP
  syn keyword cConstant DBL_MIN_10_EXP DBL_MAX_10_EXP
  syn keyword cConstant LDBL_MIN LDBL_MAX LDBL_MIN_EXP LDBL_MAX_EXP
  syn keyword cConstant LDBL_MIN_10_EXP LDBL_MAX_10_EXP
  syn keyword cConstant HUGE_VAL CLOCKS_PER_SEC NULL
  syn keyword cConstant LC_ALL LC_COLLATE LC_CTYPE LC_MONETARY
  syn keyword cConstant LC_NUMERIC LC_TIME
  syn keyword cConstant SIG_DFL SIG_ERR SIG_IGN
  syn keyword cConstant SIGABRT SIGFPE SIGILL SIGHUP SIGINT SIGSEGV SIGTERM
  " Add POSIX signals as well...
  syn keyword cConstant SIGABRT SIGALRM SIGCHLD SIGCONT SIGFPE SIGHUP
  syn keyword cConstant SIGILL SIGINT SIGKILL SIGPIPE SIGQUIT SIGSEGV
  syn keyword cConstant SIGSTOP SIGTERM SIGTRAP SIGTSTP SIGTTIN SIGTTOU
  syn keyword cConstant SIGUSR1 SIGUSR2
  syn keyword cConstant _IOFBF _IOLBF _IONBF BUFSIZ EOF WEOF
  syn keyword cConstant FOPEN_MAX FILENAME_MAX L_tmpnam
  syn keyword cConstant SEEK_CUR SEEK_END SEEK_SET
  syn keyword cConstant TMP_MAX stderr stdin stdout
  syn keyword cConstant EXIT_FAILURE EXIT_SUCCESS RAND_MAX
  " POSIX 2001
  syn keyword cConstant SIGBUS SIGPOLL SIGPROF SIGSYS SIGURG
  syn keyword cConstant SIGVTALRM SIGXCPU SIGXFSZ
  " non-POSIX signals
  syn keyword cConstant SIGWINCH SIGINFO
  " Add POSIX errors as well
  syn keyword cConstant E2BIG EACCES EAGAIN EBADF EBADMSG EBUSY
  syn keyword cConstant ECANCELED ECHILD EDEADLK EDOM EEXIST EFAULT
  syn keyword cConstant EFBIG EILSEQ EINPROGRESS EINTR EINVAL EIO EISDIR
  syn keyword cConstant EMFILE EMLINK EMSGSIZE ENAMETOOLONG ENFILE ENODEV
  syn keyword cConstant ENOENT ENOEXEC ENOLCK ENOMEM ENOSPC ENOSYS
  syn keyword cConstant ENOTDIR ENOTEMPTY ENOTSUP ENOTTY ENXIO EPERM
  syn keyword cConstant EPIPE ERANGE EROFS ESPIPE ESRCH ETIMEDOUT EXDEV
  " math.h
  syn keyword cConstant M_E M_LOG2E M_LOG10E M_LN2 M_LN10 M_PI M_PI_2 M_PI_4
  syn keyword cConstant M_1_PI M_2_PI M_2_SQRTPI M_SQRT2 M_SQRT1_2
endif
if !exists("c_no_c99") " ISO C99
  syn keyword cConstant true false
endif

" Accept %: for # (C99)
syn region	cPreCondit	start="^\s*\zs\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" keepend contains=cComment,cCommentL,cCppString,cCharacter,cCppParen,cParenError,cNumbers,cCommentError,cSpaceError
syn match	cPreConditMatch	display "^\s*\zs\(%:\|#\)\s*\(else\|endif\)\>"
if !exists("c_no_if0")
  syn cluster	cCppOutInGroup	contains=cCppInIf,cCppInElse,cCppInElse2,cCppOutIf,cCppOutIf2,cCppOutElse,cCppInSkip,cCppOutSkip
  syn region	cCppOutWrapper	start="^\s*\zs\(%:\|#\)\s*if\s\+0\+\s*\($\|//\|/\*\|&\)" end=".\@=\|$" contains=cCppOutIf,cCppOutElse,@NoSpell fold
  syn region	cCppOutIf	contained start="0\+" matchgroup=cCppOutWrapper end="^\s*\(%:\|#\)\s*endif\>" contains=cCppOutIf2,cCppOutElse
  if !exists("c_no_if0_fold")
    syn region	cCppOutIf2	contained matchgroup=cCppOutWrapper start="0\+" end="^\s*\(%:\|#\)\s*\(else\>\|elif\s\+\(0\+\s*\($\|//\|/\*\|&\)\)\@!\|endif\>\)"me=s-1 contains=cSpaceError,cCppOutSkip,@Spell fold
  else
    syn region	cCppOutIf2	contained matchgroup=cCppOutWrapper start="0\+" end="^\s*\(%:\|#\)\s*\(else\>\|elif\s\+\(0\+\s*\($\|//\|/\*\|&\)\)\@!\|endif\>\)"me=s-1 contains=cSpaceError,cCppOutSkip,@Spell
  endif
  syn region	cCppOutElse	contained matchgroup=cCppOutWrapper start="^\s*\(%:\|#\)\s*\(else\|elif\)" end="^\s*\(%:\|#\)\s*endif\>"me=s-1 contains=TOP,cPreCondit
  syn region	cCppInWrapper	start="^\s*\zs\(%:\|#\)\s*if\s\+0*[1-9]\d*\s*\($\|//\|/\*\||\)" end=".\@=\|$" contains=cCppInIf,cCppInElse fold
  syn region	cCppInIf	contained matchgroup=cCppInWrapper start="\d\+" end="^\s*\(%:\|#\)\s*endif\>" contains=TOP,cPreCondit
  if !exists("c_no_if0_fold")
    syn region	cCppInElse	contained start="^\s*\(%:\|#\)\s*\(else\>\|elif\s\+\(0*[1-9]\d*\s*\($\|//\|/\*\||\)\)\@!\)" end=".\@=\|$" containedin=cCppInIf contains=cCppInElse2 fold
  else
    syn region	cCppInElse	contained start="^\s*\(%:\|#\)\s*\(else\>\|elif\s\+\(0*[1-9]\d*\s*\($\|//\|/\*\||\)\)\@!\)" end=".\@=\|$" containedin=cCppInIf contains=cCppInElse2
  endif
  syn region	cCppInElse2	contained matchgroup=cCppInWrapper start="^\s*\(%:\|#\)\s*\(else\|elif\)\([^/]\|/[^/*]\)*" end="^\s*\(%:\|#\)\s*endif\>"me=s-1 contains=cSpaceError,cCppOutSkip,@Spell
  syn region	cCppOutSkip	contained start="^\s*\(%:\|#\)\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" contains=cSpaceError,cCppOutSkip
  syn region	cCppInSkip	contained matchgroup=cCppInWrapper start="^\s*\(%:\|#\)\s*\(if\s\+\(\d\+\s*\($\|//\|/\*\||\|&\)\)\@!\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" containedin=cCppOutElse,cCppInIf,cCppInSkip contains=TOP,cPreProc
endif
syn region	cIncluded	display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	cIncluded	display contained "<[^>]*>"
syn match	cInclude	display "^\s*\zs\(%:\|#\)\s*include\>\s*["<]" contains=cIncluded
"syn match cLineSkip	"\\$"
syn cluster	cPreProcGroup	contains=cPreCondit,cIncluded,cInclude,cDefine,cErrInParen,cErrInBracket,cUserLabel,cSpecial,cOctalZero,cCppOutWrapper,cCppInWrapper,@cCppOutInGroup,cFormat,cNumber,cFloat,cOctal,cOctalError,cNumbersCom,cString,cCommentSkip,cCommentString,cComment2String,@cCommentGroup,cCommentStartError,cParen,cBracket,cMulti,cBadBlock
syn region	cDefine		start="^\s*\zs\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" keepend contains=ALLBUT,@cPreProcGroup,@Spell
syn region	cPreProc	start="^\s*\zs\(%:\|#\)\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" keepend contains=ALLBUT,@cPreProcGroup,@Spell

" Highlight User Labels
syn cluster	cMultiGroup	contains=cIncluded,cSpecial,cCommentSkip,cCommentString,cComment2String,@cCommentGroup,cCommentStartError,cUserCont,cUserLabel,cBitField,cOctalZero,cCppOutWrapper,cCppInWrapper,@cCppOutInGroup,cFormat,cNumber,cFloat,cOctal,cOctalError,cNumbersCom,cCppParen,cCppBracket,cCppString
if s:ft ==# 'c' || exists("cpp_no_cpp11")
  syn region	cMulti		transparent start='?' skip='::' end=':' contains=ALLBUT,@cMultiGroup,@Spell,@cStringGroup
endif
" Avoid matching foo::bar() in C++ by requiring that the next char is not ':'
syn cluster	cLabelGroup	contains=cUserLabel
syn match	cUserCont	display "^\s*\zs\I\i*\s*:$" contains=@cLabelGroup
syn match	cUserCont	display ";\s*\zs\I\i*\s*:$" contains=@cLabelGroup
if s:ft ==# 'cpp'
  syn match	cUserCont	display "^\s*\zs\%(class\|struct\|enum\)\@!\I\i*\s*:[^:]"me=e-1 contains=@cLabelGroup
  syn match	cUserCont	display ";\s*\zs\%(class\|struct\|enum\)\@!\I\i*\s*:[^:]"me=e-1 contains=@cLabelGroup
else
  syn match	cUserCont	display "^\s*\zs\I\i*\s*:[^:]"me=e-1 contains=@cLabelGroup
  syn match	cUserCont	display ";\s*\zs\I\i*\s*:[^:]"me=e-1 contains=@cLabelGroup
endif

syn match	cUserLabel	display "\I\i*" contained

" Avoid recognizing most bitfields as labels
syn match	cBitField	display "^\s*\zs\I\i*\s*:\s*[1-9]"me=e-1 contains=cType
syn match	cBitField	display ";\s*\zs\I\i*\s*:\s*[1-9]"me=e-1 contains=cType

if exists("c_minlines")
  let b:c_minlines = c_minlines
else
  if !exists("c_no_if0")
    let b:c_minlines = 50	" #if 0 constructs can be long
  else
    let b:c_minlines = 15	" mostly for () constructs
  endif
endif
if exists("c_curly_error")
  syn sync fromstart
else
  exec "syn sync ccomment cComment minlines=" . b:c_minlines
endif

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link cFormat		cSpecial
hi def link cCppString		cString
hi def link cCommentL		cComment
hi def link cCommentStart	cComment
hi def link cLabel		Label
hi def link cUserLabel		Label
hi def link cConditional	Conditional
hi def link cRepeat		Repeat
hi def link cCharacter		Character
hi def link cSpecialCharacter	cSpecial
hi def link cNumber		Number
hi def link cOctal		Number
hi def link cOctalZero		PreProc	 " link this to Error if you want
hi def link cFloat		Float
hi def link cOctalError		cError
hi def link cParenError		cError
hi def link cErrInParen		cError
hi def link cErrInBracket	cError
hi def link cCommentError	cError
hi def link cCommentStartError	cError
hi def link cSpaceError		cError
hi def link cSpecialError	cError
hi def link cCurlyError		cError
hi def link cOperator		Operator
hi def link cStructure		Structure
hi def link cStorageClass	StorageClass
hi def link cInclude		Include
hi def link cPreProc		PreProc
hi def link cDefine		Macro
hi def link cIncluded		cString
hi def link cError		Error
hi def link cStatement		Statement
hi def link cCppInWrapper	cCppOutWrapper
hi def link cCppOutWrapper	cPreCondit
hi def link cPreConditMatch	cPreCondit
hi def link cPreCondit		PreCondit
hi def link cType		Type
hi def link cConstant		Constant
hi def link cCommentString	cString
hi def link cComment2String	cString
hi def link cCommentSkip	cComment
hi def link cString		String
hi def link cComment		Comment
hi def link cSpecial		SpecialChar
hi def link cTodo		Todo
hi def link cBadContinuation	Error
hi def link cCppOutSkip		cCppOutIf2
hi def link cCppInElse2		cCppOutIf2
hi def link cCppOutIf2		cCppOut
hi def link cCppOut		Comment

let b:current_syntax = "c"

unlet s:ft

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
                                                                                                                                                                                                                                                                                                                                                                                      .vim/syntax/b.vim                                                                                   000644  000765  000024  00000011446 12761633006 015127  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:	B (A Formal Method with refinement and mathematical proof)
" Maintainer:	Mathieu Clabaut <mathieu.clabaut@gmail.com>
" Contributor:  Csaba Hoch
" LastChange:	8 Dec 2007


" quit when a syntax file was already loaded
if exists("b:current_syntax")
   finish
endif


" A bunch of useful B keywords
syn keyword bStatement	        MACHINE MODEL SEES OPERATIONS INCLUDES DEFINITIONS CONSTRAINTS CONSTANTS VARIABLES CONCRETE_CONSTANTS CONCRETE_VARIABLES ABSTRACT_CONSTANTS ABSTRACT_VARIABLES HIDDEN_CONSTANTS HIDDEN_VARIABLES ASSERT ASSERTIONS  EXTENDS IMPLEMENTATION REFINEMENT IMPORTS USES INITIALISATION INVARIANT PROMOTES PROPERTIES REFINES SETS VALUES VARIANT VISIBLE_CONSTANTS VISIBLE_VARIABLES THEORY XLS THEOREMS LOCAL_OPERATIONS
syn keyword bLabel		CASE IN EITHER OR CHOICE DO OF
syn keyword bConditional	IF ELSE SELECT ELSIF THEN WHEN
syn keyword bRepeat		WHILE FOR
syn keyword bOps		bool card conc closure closure1 dom first fnc front not or id inter iseq iseq1 iterate last max min mod perm pred prj1 prj2 ran rel rev seq seq1 size skip succ tail union
syn keyword bKeywords		LET VAR BE IN BEGIN END  POW POW1 FIN FIN1  PRE  SIGMA STRING UNION IS ANY WHERE

syn keyword bBoolean	TRUE FALSE bfalse btrue
syn keyword bConstant	PI MAXINT MININT User_Pass PatchProver PatchProverH0 PatchProverB0 FLAT ARI DED SUB RES
syn keyword bGuard binhyp band bnot bguard bsearch bflat bfresh bguardi bget bgethyp barith bgetresult bresult bgoal bmatch bmodr bnewv  bnum btest bpattern bprintf bwritef bsubfrm  bvrb blvar bcall bappend bclose

syn keyword bLogic	or not
syn match bLogic	"\(!\|#\|%\|&\|+->>\|+->\|-->>\|->>\|-->\|->\|/:\|/<:\|/<<:\|/=\|/\\\|/|\\\|::\|:\|;:\|<+\|<->\|<--\|<-\|<:\|<<:\|<<|\|<=>\|<|\|==\|=>\|>+>>\|>->\|>+>\|||\||->\)"
syn match bNothing      /:=/

syn keyword cTodo contained	TODO FIXME XXX

" String and Character constants
" Highlight special characters (those which have a backslash) differently
syn match bSpecial contained	"\\[0-7][0-7][0-7]\=\|\\."
syn region bString		start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=bSpecial
syn match bCharacter		"'[^\\]'"
syn match bSpecialCharacter	"'\\.'"
syn match bSpecialCharacter	"'\\[0-7][0-7]'"
syn match bSpecialCharacter	"'\\[0-7][0-7][0-7]'"

"catch errors caused by wrong parenthesis
syn region bParen		transparent start='(' end=')' contains=ALLBUT,bParenError,bIncluded,bSpecial,bTodo,bUserLabel,bBitField
syn match bParenError		")"
syn match bInParen contained	"[{}]"

"integer number, or floating point number without a dot and with "f".
syn case ignore
syn match bNumber		"\<[0-9]\+\>"
"syn match bIdentifier	"\<[a-z_][a-z0-9_]*\>"
syn case match

  syn region bComment		start="/\*" end="\*/" contains=bTodo
  syn match bComment		"//.*" contains=bTodo
syntax match bCommentError	"\*/"

syn keyword bType		INT INTEGER BOOL NAT NATURAL NAT1 NATURAL1

syn region bPreCondit	start="^\s*#\s*\(if\>\|ifdef\>\|ifndef\>\|elif\>\|else\>\|endif\>\)" skip="\\$" end="$" contains=bComment,bString,bCharacter,bNumber,bCommentError
syn region bIncluded contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match bIncluded contained "<[^>]*>"
syn match bInclude		"^\s*#\s*include\>\s*["<]" contains=bIncluded

syn region bDefine		start="^\s*#\s*\(define\>\|undef\>\)" skip="\\$" end="$" contains=ALLBUT,bPreCondit,bIncluded,bInclude,bDefine,bInParen
syn region bPreProc		start="^\s*#\s*\(pragma\>\|line\>\|warning\>\|warn\>\|error\>\)" skip="\\$" end="$" contains=ALLBUT,bPreCondit,bIncluded,bInclude,bDefine,bInParen

syn sync ccomment bComment minlines=10

" Define the default highlighting.
" Only when an item doesn't have highlighting yet


" The default methods for highlighting.  Can be overridden later
hi def link bLabel	Label
hi def link bUserLabel	Label
hi def link bConditional	Conditional
hi def link bRepeat	Repeat
hi def link bLogic	Special
hi def link bCharacter	Character
hi def link bSpecialCharacter bSpecial
hi def link bNumber	Number
hi def link bFloat	Float
hi def link bOctalError	bError
hi def link bParenError	bError
" hi def link bInParen	bError
hi def link bCommentError	bError
hi def link bBoolean	Identifier
hi def link bConstant	Identifier
hi def link bGuard	Identifier
hi def link bOperator	Operator
hi def link bKeywords	Operator
hi def link bOps		Identifier
hi def link bStructure	Structure
hi def link bStorageClass	StorageClass
hi def link bInclude	Include
hi def link bPreProc	PreProc
hi def link bDefine	Macro
hi def link bIncluded	bString
hi def link bError	Error
hi def link bStatement	Statement
hi def link bPreCondit	PreCondit
hi def link bType		Type
hi def link bCommentError	bError
hi def link bCommentString bString
hi def link bComment2String bString
hi def link bCommentSkip	bComment
hi def link bString	String
hi def link bComment	Comment
hi def link bSpecial	SpecialChar
hi def link bTodo		Todo
"hi link bIdentifier	Identifier

let b:current_syntax = "b"

" vim: ts=8
                                                                                                                                                                                                                          .vim/syntax/html.vim                                                                                000644  000765  000024  00000040661 13040661104 015642  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Language:             HTML
" Maintainer:           Jorge Maldonado Ventura <jorgesumle@freakspot.net>
" Previous Maintainer:  Claudio Fleiner <claudio@fleiner.com>
" Repository:           https://notabug.org/jorgesumle/vim-html-syntax
" Last Change:          2017 Jan 21
"                       included patch from Jorge Maldonado Ventura

" Please check :help html.vim for some comments and a description of the options

" quit when a syntax file was already loaded
if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'html'
endif

let s:cpo_save = &cpo
set cpo&vim

syntax spell toplevel

syn case ignore

" mark illegal characters
syn match htmlError "[<>&]"


" tags
syn region  htmlString   contained start=+"+ end=+"+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc
syn region  htmlString   contained start=+'+ end=+'+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc
syn match   htmlValue    contained "=[\t ]*[^'" \t>][^ \t>]*"hs=s+1   contains=javaScriptExpression,@htmlPreproc
syn region  htmlEndTag             start=+</+      end=+>+ contains=htmlTagN,htmlTagError
syn region  htmlTag                start=+<[^/]+   end=+>+ fold contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent,htmlCssDefinition,@htmlPreproc,@htmlArgCluster
syn match   htmlTagN     contained +<\s*[-a-zA-Z0-9]\++hs=s+1 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster
syn match   htmlTagN     contained +</\s*[-a-zA-Z0-9]\++hs=s+2 contains=htmlTagName,htmlSpecialTagName,@htmlTagNameCluster
syn match   htmlTagError contained "[^>]<"ms=s+1


" tag names
syn keyword htmlTagName contained address applet area a base basefont
syn keyword htmlTagName contained big blockquote br caption center
syn keyword htmlTagName contained cite code dd dfn dir div dl dt font
syn keyword htmlTagName contained form hr html img
syn keyword htmlTagName contained input isindex kbd li link map menu
syn keyword htmlTagName contained meta ol option param pre p samp span
syn keyword htmlTagName contained select small strike sub sup
syn keyword htmlTagName contained table td textarea th tr tt ul var xmp
syn match htmlTagName contained "\<\(b\|i\|u\|h[1-6]\|em\|strong\|head\|body\|title\)\>"

" new html 4.0 tags
syn keyword htmlTagName contained abbr acronym bdo button col label
syn keyword htmlTagName contained colgroup del fieldset iframe ins legend
syn keyword htmlTagName contained object optgroup q s tbody tfoot thead

" new html 5 tags
syn keyword htmlTagName contained article aside audio bdi canvas data
syn keyword htmlTagName contained datalist details embed figcaption figure
syn keyword htmlTagName contained footer header hgroup keygen main mark
syn keyword htmlTagName contained menuitem meter nav output picture
syn keyword htmlTagName contained progress rb rp rt rtc ruby section
syn keyword htmlTagName contained slot source template time track video wbr

" legal arg names
syn keyword htmlArg contained action
syn keyword htmlArg contained align alink alt archive background bgcolor
syn keyword htmlArg contained border bordercolor cellpadding
syn keyword htmlArg contained cellspacing checked class clear code codebase color
syn keyword htmlArg contained cols colspan content coords enctype face
syn keyword htmlArg contained gutter height hspace id
syn keyword htmlArg contained link lowsrc marginheight
syn keyword htmlArg contained marginwidth maxlength method name prompt
syn keyword htmlArg contained rel rev rows rowspan scrolling selected shape
syn keyword htmlArg contained size src start target text type url
syn keyword htmlArg contained usemap ismap valign value vlink vspace width wrap
syn match   htmlArg contained "\<\(http-equiv\|href\|title\)="me=e-1

" Netscape extensions
syn keyword htmlTagName contained frame noframes frameset nobr blink
syn keyword htmlTagName contained layer ilayer nolayer spacer
syn keyword htmlArg     contained frameborder noresize pagex pagey above below
syn keyword htmlArg     contained left top visibility clip id noshade
syn match   htmlArg     contained "\<z-index\>"

" Microsoft extensions
syn keyword htmlTagName contained marquee

" html 4.0 arg names
syn match   htmlArg contained "\<\(accept-charset\|label\)\>"
syn keyword htmlArg contained abbr accept accesskey axis char charoff charset
syn keyword htmlArg contained cite classid codetype compact data datetime
syn keyword htmlArg contained declare defer dir disabled for frame
syn keyword htmlArg contained headers hreflang lang language longdesc
syn keyword htmlArg contained multiple nohref nowrap object profile readonly
syn keyword htmlArg contained rules scheme scope span standby style
syn keyword htmlArg contained summary tabindex valuetype version

" html 5 arg names
syn keyword htmlArg contained allowfullscreen async autocomplete autofocus
syn keyword htmlArg contained autoplay challenge contenteditable contextmenu
syn keyword htmlArg contained controls crossorigin default dirname download
syn keyword htmlArg contained draggable dropzone form formaction formenctype
syn keyword htmlArg contained formmethod formnovalidate formtarget hidden
syn keyword htmlArg contained high icon inputmode keytype kind list loop low
syn keyword htmlArg contained max min minlength muted nonce novalidate open
syn keyword htmlArg contained optimum pattern placeholder poster preload
syn keyword htmlArg contained radiogroup required reversed sandbox spellcheck
syn keyword htmlArg contained sizes srcset srcdoc srclang step title translate
syn keyword htmlArg contained typemustmatch

" special characters
syn match htmlSpecialChar "&#\=[0-9A-Za-z]\{1,8};"

" Comments (the real ones or the old netscape ones)
if exists("html_wrong_comments")
  syn region htmlComment                start=+<!--+    end=+--\s*>+ contains=@Spell
else
  syn region htmlComment                start=+<!+      end=+>+   contains=htmlCommentPart,htmlCommentError,@Spell
  syn match  htmlCommentError contained "[^><!]"
  syn region htmlCommentPart  contained start=+--+      end=+--\s*+  contains=@htmlPreProc,@Spell
endif
syn region htmlComment                  start=+<!DOCTYPE+ keepend end=+>+

" server-parsed commands
syn region htmlPreProc start=+<!--#+ end=+-->+ contains=htmlPreStmt,htmlPreError,htmlPreAttr
syn match htmlPreStmt contained "<!--#\(config\|echo\|exec\|fsize\|flastmod\|include\|printenv\|set\|if\|elif\|else\|endif\|geoguide\)\>"
syn match htmlPreError contained "<!--#\S*"ms=s+4
syn match htmlPreAttr contained "\w\+=[^"]\S\+" contains=htmlPreProcAttrError,htmlPreProcAttrName
syn region htmlPreAttr contained start=+\w\+="+ skip=+\\\\\|\\"+ end=+"+ contains=htmlPreProcAttrName keepend
syn match htmlPreProcAttrError contained "\w\+="he=e-1
syn match htmlPreProcAttrName contained "\(expr\|errmsg\|sizefmt\|timefmt\|var\|cgi\|cmd\|file\|virtual\|value\)="he=e-1

if !exists("html_no_rendering")
  " rendering
  syn cluster htmlTop contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLink,javaScript,@htmlPreproc

  syn region htmlBold start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlBoldUnderline,htmlBoldItalic
  syn region htmlBold start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlBoldUnderline,htmlBoldItalic
  syn region htmlBoldUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlBoldUnderlineItalic
  syn region htmlBoldItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlBoldItalicUnderline
  syn region htmlBoldItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop,htmlBoldItalicUnderline
  syn region htmlBoldUnderlineItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop
  syn region htmlBoldUnderlineItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop
  syn region htmlBoldItalicUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlBoldUnderlineItalic

  syn region htmlUnderline start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlUnderlineBold,htmlUnderlineItalic
  syn region htmlUnderlineBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlUnderlineBoldItalic
  syn region htmlUnderlineBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlUnderlineBoldItalic
  syn region htmlUnderlineItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlUnderlineItalicBold
  syn region htmlUnderlineItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop,htmlUnderlineItalicBold
  syn region htmlUnderlineItalicBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop
  syn region htmlUnderlineItalicBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop
  syn region htmlUnderlineBoldItalic contained start="<i\>" end="</i>"me=e-4 contains=@htmlTop
  syn region htmlUnderlineBoldItalic contained start="<em\>" end="</em>"me=e-5 contains=@htmlTop

  syn region htmlItalic start="<i\>" end="</i>"me=e-4 contains=@htmlTop,htmlItalicBold,htmlItalicUnderline
  syn region htmlItalic start="<em\>" end="</em>"me=e-5 contains=@htmlTop
  syn region htmlItalicBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop,htmlItalicBoldUnderline
  syn region htmlItalicBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop,htmlItalicBoldUnderline
  syn region htmlItalicBoldUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop
  syn region htmlItalicUnderline contained start="<u\>" end="</u>"me=e-4 contains=@htmlTop,htmlItalicUnderlineBold
  syn region htmlItalicUnderlineBold contained start="<b\>" end="</b>"me=e-4 contains=@htmlTop
  syn region htmlItalicUnderlineBold contained start="<strong\>" end="</strong>"me=e-9 contains=@htmlTop

  syn match htmlLeadingSpace "^\s\+" contained
  syn region htmlLink start="<a\>\_[^>]*\<href\>" end="</a>"me=e-4 contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLeadingSpace,javaScript,@htmlPreproc
  syn region htmlH1 start="<h1\>" end="</h1>"me=e-5 contains=@htmlTop
  syn region htmlH2 start="<h2\>" end="</h2>"me=e-5 contains=@htmlTop
  syn region htmlH3 start="<h3\>" end="</h3>"me=e-5 contains=@htmlTop
  syn region htmlH4 start="<h4\>" end="</h4>"me=e-5 contains=@htmlTop
  syn region htmlH5 start="<h5\>" end="</h5>"me=e-5 contains=@htmlTop
  syn region htmlH6 start="<h6\>" end="</h6>"me=e-5 contains=@htmlTop
  syn region htmlHead start="<head\>" end="</head>"me=e-7 end="<body\>"me=e-5 end="<h[1-6]\>"me=e-3 contains=htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLink,htmlTitle,javaScript,cssStyle,@htmlPreproc
  syn region htmlTitle start="<title\>" end="</title>"me=e-8 contains=htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,javaScript,@htmlPreproc
endif

syn keyword htmlTagName         contained noscript
syn keyword htmlSpecialTagName  contained script style
if main_syntax != 'java' || exists("java_javascript")
  " JAVA SCRIPT
  syn include @htmlJavaScript syntax/javascript.vim
  unlet b:current_syntax
  syn region  javaScript start=+<script\_[^>]*>+ keepend end=+</script\_[^>]*>+me=s-1 contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
  syn region  htmlScriptTag     contained start=+<script+ end=+>+ fold contains=htmlTagN,htmlString,htmlArg,htmlValue,htmlTagError,htmlEvent
  hi def link htmlScriptTag htmlTag

  " html events (i.e. arguments that include javascript commands)
  if exists("html_extended_events")
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*'+ end=+'+ contains=htmlEventSQ
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*"+ end=+"+ contains=htmlEventDQ
  else
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*'+ end=+'+ keepend contains=htmlEventSQ
    syn region htmlEvent        contained start=+\<on\a\+\s*=[\t ]*"+ end=+"+ keepend contains=htmlEventDQ
  endif
  syn region htmlEventSQ        contained start=+'+ms=s+1 end=+'+me=s-1 contains=@htmlJavaScript
  syn region htmlEventDQ        contained start=+"+ms=s+1 end=+"+me=s-1 contains=@htmlJavaScript
  hi def link htmlEventSQ htmlEvent
  hi def link htmlEventDQ htmlEvent

  " a javascript expression is used as an arg value
  syn region  javaScriptExpression contained start=+&{+ keepend end=+};+ contains=@htmlJavaScript,@htmlPreproc
endif

if main_syntax != 'java' || exists("java_vb")
  " VB SCRIPT
  syn include @htmlVbScript syntax/vb.vim
  unlet b:current_syntax
  syn region  javaScript start=+<script \_[^>]*language *=\_[^>]*vbscript\_[^>]*>+ keepend end=+</script\_[^>]*>+me=s-1 contains=@htmlVbScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc
endif

syn cluster htmlJavaScript      add=@htmlPreproc

if main_syntax != 'java' || exists("java_css")
  " embedded style sheets
  syn keyword htmlArg           contained media
  syn include @htmlCss syntax/css.vim
  unlet b:current_syntax
  syn region cssStyle start=+<style+ keepend end=+</style>+ contains=@htmlCss,htmlTag,htmlEndTag,htmlCssStyleComment,@htmlPreproc
  syn match htmlCssStyleComment contained "\(<!--\|-->\)"
  syn region htmlCssDefinition matchgroup=htmlArg start='style="' keepend matchgroup=htmlString end='"' contains=css.*Attr,css.*Prop,cssComment,cssLength,cssColor,cssURL,cssImportant,cssError,cssString,@htmlPreproc
  hi def link htmlStyleArg htmlString
endif

if main_syntax == "html"
  " synchronizing (does not always work if a comment includes legal
  " html tags, but doing it right would mean to always start
  " at the first line, which is too slow)
  syn sync match htmlHighlight groupthere NONE "<[/a-zA-Z]"
  syn sync match htmlHighlight groupthere javaScript "<script"
  syn sync match htmlHighlightSkip "^.*['\"].*$"
  syn sync minlines=10
endif

" The default highlighting.
hi def link htmlTag                     Function
hi def link htmlEndTag                  Identifier
hi def link htmlArg                     Type
hi def link htmlTagName                 htmlStatement
hi def link htmlSpecialTagName          Exception
hi def link htmlValue                     String
hi def link htmlSpecialChar             Special

if !exists("html_no_rendering")
  hi def link htmlH1                      Title
  hi def link htmlH2                      htmlH1
  hi def link htmlH3                      htmlH2
  hi def link htmlH4                      htmlH3
  hi def link htmlH5                      htmlH4
  hi def link htmlH6                      htmlH5
  hi def link htmlHead                    PreProc
  hi def link htmlTitle                   Title
  hi def link htmlBoldItalicUnderline     htmlBoldUnderlineItalic
  hi def link htmlUnderlineBold           htmlBoldUnderline
  hi def link htmlUnderlineItalicBold     htmlBoldUnderlineItalic
  hi def link htmlUnderlineBoldItalic     htmlBoldUnderlineItalic
  hi def link htmlItalicUnderline         htmlUnderlineItalic
  hi def link htmlItalicBold              htmlBoldItalic
  hi def link htmlItalicBoldUnderline     htmlBoldUnderlineItalic
  hi def link htmlItalicUnderlineBold     htmlBoldUnderlineItalic
  hi def link htmlLink                    Underlined
  hi def link htmlLeadingSpace            None
  if !exists("html_my_rendering")
    hi def htmlBold                term=bold cterm=bold gui=bold
    hi def htmlBoldUnderline       term=bold,underline cterm=bold,underline gui=bold,underline
    hi def htmlBoldItalic          term=bold,italic cterm=bold,italic gui=bold,italic
    hi def htmlBoldUnderlineItalic term=bold,italic,underline cterm=bold,italic,underline gui=bold,italic,underline
    hi def htmlUnderline           term=underline cterm=underline gui=underline
    hi def htmlUnderlineItalic     term=italic,underline cterm=italic,underline gui=italic,underline
    hi def htmlItalic              term=italic cterm=italic gui=italic
  endif
endif

hi def link htmlPreStmt            PreProc
hi def link htmlPreError           Error
hi def link htmlPreProc            PreProc
hi def link htmlPreAttr            String
hi def link htmlPreProcAttrName    PreProc
hi def link htmlPreProcAttrError   Error
hi def link htmlSpecial            Special
hi def link htmlSpecialChar        Special
hi def link htmlString             String
hi def link htmlStatement          Statement
hi def link htmlComment            Comment
hi def link htmlCommentPart        Comment
hi def link htmlValue              String
hi def link htmlCommentError       htmlError
hi def link htmlTagError           htmlError
hi def link htmlEvent              javaScript
hi def link htmlError              Error

hi def link javaScript             Special
hi def link javaScriptExpression   javaScript
hi def link htmlCssStyleComment    Comment
hi def link htmlCssDefinition      Special

let b:current_syntax = "html"

if main_syntax == 'html'
  unlet main_syntax
endif

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: ts=8
                                                                               .vim/syntax/cmake.vim                                                                               000644  000765  000024  00000010001 12761632222 015747  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Vim syntax file
" Program:      CMake - Cross-Platform Makefile Generator
" Module:       $RCSfile: cmake-syntax.vim,v $
" Language:     CMake
" Maintainer:	Dimitri Merejkowsky <d.merej@gmail.com>
" Former Maintainer:   Karthik Krishnan <karthik.krishnan@kitware.com>
" Author:       Andy Cedilnik <andy.cedilnik@kitware.com>
" Last Change:  2015 Dec 17
" Version:      $Revision: 1.10 $
"
" Licence:      The CMake license applies to this file. See
"               http://www.cmake.org/HTML/Copyright.html
"               This implies that distribution with Vim is allowed

" quit when a syntax file was already loaded
if exists("b:current_syntax")
  finish
endif
let s:keepcpo= &cpo
set cpo&vim

syn case ignore
syn match cmakeEscaped /\(\\\\\|\\"\|\\n\|\\t\)/ contained
syn region cmakeComment start="#" end="$" contains=@Spell,cmakeTodo
syn region cmakeRegistry start=/\[/ end=/]/
            \ contained oneline contains=CONTAINED,cmakeTodo,cmakeEscaped
syn region cmakeVariableValue start=/\${/ end=/}/
            \ contained oneline contains=CONTAINED,cmakeTodo
syn region cmakeEnvironment start=/\$ENV{/ end=/}/
            \ contained oneline contains=CONTAINED,cmakeTodo
syn region cmakeString start=/"/ end=/"/
            \ contains=CONTAINED,cmakeTodo,cmakeOperators
syn region cmakeArguments start=/(/ end=/)/
            \ contains=ALLBUT,cmakeArguments,cmakeTodo
syn keyword cmakeSystemVariables
            \ WIN32 UNIX APPLE CYGWIN BORLAND MINGW MSVC MSVC_IDE MSVC60 MSVC70 MSVC71 MSVC80 MSVC90
syn keyword cmakeOperators
            \ ABSOLUTE AND BOOL CACHE COMMAND DEFINED DOC EQUAL EXISTS EXT FALSE GREATER INTERNAL LESS MATCHES NAME NAMES NAME_WE NOT OFF ON OR PATH PATHS PROGRAM STREQUAL STRGREATER STRING STRLESS TRUE
            \ contained
syn keyword cmakeDeprecated ABSTRACT_FILES BUILD_NAME SOURCE_FILES SOURCE_FILES_REMOVE VTK_MAKE_INSTANTIATOR VTK_WRAP_JAVA VTK_WRAP_PYTHON VTK_WRAP_TCL WRAP_EXCLUDE_FILES
           \ nextgroup=cmakeArguments

" The keywords are generated as:  cmake --help-command-list | tr "\n" " "
syn keyword cmakeStatement
      \ ADD_CUSTOM_COMMAND ADD_CUSTOM_TARGET ADD_DEFINITIONS ADD_DEPENDENCIES ADD_EXECUTABLE ADD_LIBRARY ADD_SUBDIRECTORY ADD_TEST AUX_SOURCE_DIRECTORY BUILD_COMMAND BUILD_NAME CMAKE_MINIMUM_REQUIRED CONFIGURE_FILE CREATE_TEST_SOURCELIST ELSE ELSEIF ENABLE_LANGUAGE ENABLE_TESTING ENDFOREACH ENDFUNCTION ENDIF ENDMACRO ENDWHILE EXEC_PROGRAM EXECUTE_PROCESS EXPORT_LIBRARY_DEPENDENCIES FILE FIND_FILE FIND_LIBRARY FIND_PACKAGE FIND_PATH FIND_PROGRAM FLTK_WRAP_UI FOREACH FUNCTION GET_CMAKE_PROPERTY GET_DIRECTORY_PROPERTY GET_FILENAME_COMPONENT GET_SOURCE_FILE_PROPERTY GET_TARGET_PROPERTY GET_TEST_PROPERTY IF INCLUDE INCLUDE_DIRECTORIES INCLUDE_EXTERNAL_MSPROJECT INCLUDE_REGULAR_EXPRESSION INSTALL INSTALL_FILES INSTALL_PROGRAMS INSTALL_TARGETS LINK_DIRECTORIES LINK_LIBRARIES LIST LOAD_CACHE LOAD_COMMAND MACRO MAKE_DIRECTORY MARK_AS_ADVANCED MATH MESSAGE OPTION OUTPUT_REQUIRED_FILES PROJECT QT_WRAP_CPP QT_WRAP_UI REMOVE REMOVE_DEFINITIONS SEPARATE_ARGUMENTS SET SET_DIRECTORY_PROPERTIES SET_SOURCE_FILES_PROPERTIES SET_TARGET_PROPERTIES SET_TESTS_PROPERTIES SITE_NAME SOURCE_GROUP STRING SUBDIR_DEPENDS SUBDIRS TARGET_LINK_LIBRARIES TRY_COMPILE TRY_RUN UNSET USE_MANGLED_MESA UTILITY_SOURCE VARIABLE_REQUIRES VTK_MAKE_INSTANTIATOR VTK_WRAP_JAVA VTK_WRAP_PYTHON VTK_WRAP_TCL WHILE WRITE_FILE
            \ nextgroup=cmakeArguments
syn keyword cmakeTodo
            \ TODO FIXME XXX
            \ contained

" Define the default highlighting.
" Only when an item doesn't have highlighting yet

hi def link cmakeStatement Statement
hi def link cmakeComment Comment
hi def link cmakeString String
hi def link cmakeVariableValue Type
hi def link cmakeRegistry Underlined
hi def link cmakeArguments Identifier
hi def link cmakeArgument Constant
hi def link cmakeEnvironment Special
hi def link cmakeOperators Operator
hi def link cmakeMacro PreProc
hi def link cmakeError Error
hi def link cmakeTodo TODO
hi def link cmakeEscaped Special


let b:current_syntax = "cmake"

let &cpo = s:keepcpo
unlet s:keepcpo

"EOF"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               .vim/autoload/ctrlp/                                                                                000755  000765  000024  00000000000 13147505627 015577  5                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         .vim/autoload/ctrlp.vim                                                                             000644  000765  000024  00000173160 12626714374 016326  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp.vim
" Description:   Fuzzy file, buffer, mru, tag, etc finder.
" Author:        Kien Nguyen <github.com/kien>
" Version:       1.79
" =============================================================================

" ** Static variables {{{1
" s:ignore() {{{2
fu! s:ignore()
	let igdirs = [
		\ '\.git',
		\ '\.hg',
		\ '\.svn',
		\ '_darcs',
		\ '\.bzr',
		\ '\.cdv',
		\ '\~\.dep',
		\ '\~\.dot',
		\ '\~\.nib',
		\ '\~\.plst',
		\ '\.pc',
		\ '_MTN',
		\ 'blib',
		\ 'CVS',
		\ 'RCS',
		\ 'SCCS',
		\ '_sgbak',
		\ 'autom4te\.cache',
		\ 'cover_db',
		\ '_build',
		\ ]
	let igfiles = [
		\ '\~$',
		\ '#.+#$',
		\ '[._].*\.swp$',
		\ 'core\.\d+$',
		\ '\.exe$',
		\ '\.so$',
		\ '\.bak$',
		\ '\.png$',
		\ '\.jpg$',
		\ '\.gif$',
		\ '\.zip$',
		\ '\.rar$',
		\ '\.tar\.gz$',
		\ ]
	retu {
		\ 'dir': '\v[\/]('.join(igdirs, '|').')$',
		\ 'file': '\v'.join(igfiles, '|'),
		\ }
endf
" Script local vars {{{2
let [s:pref, s:bpref, s:opts, s:new_opts, s:lc_opts] =
	\ ['g:ctrlp_', 'b:ctrlp_', {
	\ 'abbrev':                ['s:abbrev', {}],
	\ 'arg_map':               ['s:argmap', 0],
	\ 'buffer_func':           ['s:buffunc', {}],
	\ 'by_filename':           ['s:byfname', 0],
	\ 'custom_ignore':         ['s:usrign', s:ignore()],
	\ 'default_input':         ['s:deftxt', 0],
	\ 'dont_split':            ['s:nosplit', 'netrw'],
	\ 'dotfiles':              ['s:showhidden', 0],
	\ 'extensions':            ['s:extensions', []],
	\ 'follow_symlinks':       ['s:folsym', 0],
	\ 'highlight_match':       ['s:mathi', [1, 'CtrlPMatch']],
	\ 'jump_to_buffer':        ['s:jmptobuf', 'Et'],
	\ 'key_loop':              ['s:keyloop', 0],
	\ 'lazy_update':           ['s:lazy', 0],
	\ 'match_func':            ['s:matcher', {}],
	\ 'match_window':          ['s:mw', ''],
	\ 'match_window_bottom':   ['s:mwbottom', 1],
	\ 'match_window_reversed': ['s:mwreverse', 1],
	\ 'max_depth':             ['s:maxdepth', 40],
	\ 'max_files':             ['s:maxfiles', 10000],
	\ 'max_height':            ['s:mxheight', 10],
	\ 'max_history':           ['s:maxhst', exists('+hi') ? &hi : 20],
	\ 'mruf_default_order':    ['s:mrudef', 0],
	\ 'open_func':             ['s:openfunc', {}],
	\ 'open_multi':            ['s:opmul', '1v'],
	\ 'open_new_file':         ['s:newfop', 'v'],
	\ 'prompt_mappings':       ['s:urprtmaps', 0],
	\ 'regexp_search':         ['s:regexp', 0],
	\ 'root_markers':          ['s:rmarkers', []],
	\ 'split_window':          ['s:splitwin', 0],
	\ 'status_func':           ['s:status', {}],
	\ 'tabpage_position':      ['s:tabpage', 'ac'],
	\ 'use_caching':           ['s:caching', 1],
	\ 'use_migemo':            ['s:migemo', 0],
	\ 'user_command':          ['s:usrcmd', ''],
	\ 'working_path_mode':     ['s:pathmode', 'ra'],
	\ }, {
	\ 'open_multiple_files':   's:opmul',
	\ 'regexp':                's:regexp',
	\ 'reuse_window':          's:nosplit',
	\ 'show_hidden':           's:showhidden',
	\ 'switch_buffer':         's:jmptobuf',
	\ }, {
	\ 'root_markers':          's:rmarkers',
	\ 'user_command':          's:usrcmd',
	\ 'working_path_mode':     's:pathmode',
	\ }]

" Global options
let s:glbs = { 'magic': 1, 'to': 1, 'tm': 0, 'sb': 1, 'hls': 0, 'im': 0,
	\ 'report': 9999, 'sc': 0, 'ss': 0, 'siso': 0, 'mfd': 200, 'ttimeout': 0,
	\ 'gcr': 'a:blinkon0', 'ic': 1, 'lmap': '', 'mousef': 0, 'imd': 1 }

" Keymaps
let [s:lcmap, s:prtmaps] = ['nn <buffer> <silent>', {
	\ 'PrtBS()':              ['<bs>', '<c-]>'],
	\ 'PrtDelete()':          ['<del>'],
	\ 'PrtDeleteWord()':      ['<c-w>'],
	\ 'PrtClear()':           ['<c-u>'],
	\ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
	\ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
	\ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
	\ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
	\ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
	\ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
	\ 'PrtHistory(-1)':       ['<c-n>'],
	\ 'PrtHistory(1)':        ['<c-p>'],
	\ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
	\ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
	\ 'AcceptSelection("t")': ['<c-t>'],
	\ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
	\ 'ToggleFocus()':        ['<s-tab>'],
	\ 'ToggleRegex()':        ['<c-r>'],
	\ 'ToggleByFname()':      ['<c-d>'],
	\ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
	\ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
	\ 'PrtExpandDir()':       ['<tab>'],
	\ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
	\ 'PrtInsert()':          ['<c-\>'],
	\ 'PrtCurStart()':        ['<c-a>'],
	\ 'PrtCurEnd()':          ['<c-e>'],
	\ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
	\ 'PrtCurRight()':        ['<c-l>', '<right>'],
	\ 'PrtClearCache()':      ['<F5>'],
	\ 'PrtDeleteEnt()':       ['<F7>'],
	\ 'CreateNewFile()':      ['<c-y>'],
	\ 'MarkToOpen()':         ['<c-z>'],
	\ 'OpenMulti()':          ['<c-o>'],
	\ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
	\ }]

if !has('gui_running')
	cal add(s:prtmaps['PrtBS()'], remove(s:prtmaps['PrtCurLeft()'], 0))
en

let s:compare_lim = 3000

let s:ficounts = {}

let s:ccex = s:pref.'clear_cache_on_exit'

" Regexp
let s:fpats = {
	\ '^\(\\|\)\|\(\\|\)$': '\\|',
	\ '^\\\(zs\|ze\|<\|>\)': '^\\\(zs\|ze\|<\|>\)',
	\ '^\S\*$': '\*',
	\ '^\S\\?$': '\\?',
	\ }

" Keypad
let s:kprange = {
	\ 'Plus': '+',
	\ 'Minus': '-',
	\ 'Divide': '/',
	\ 'Multiply': '*',
	\ 'Point': '.',
	\ }

" Highlight groups
let s:hlgrps = {
	\ 'NoEntries': 'Error',
	\ 'Mode1': 'Character',
	\ 'Mode2': 'LineNr',
	\ 'Stats': 'Function',
	\ 'Match': 'Identifier',
	\ 'PrtBase': 'Comment',
	\ 'PrtText': 'Normal',
	\ 'PrtCursor': 'Constant',
	\ }
" Get the options {{{2
fu! s:opts(...)
	unl! s:usrign s:usrcmd s:urprtmaps
	for each in ['byfname', 'regexp', 'extensions'] | if exists('s:'.each)
		let {each} = s:{each}
	en | endfo
	for [ke, va] in items(s:opts)
		let {va[0]} = exists(s:pref.ke) ? {s:pref.ke} : va[1]
	endfo
	unl va
	for [ke, va] in items(s:new_opts)
		let {va} = {exists(s:pref.ke) ? s:pref.ke : va}
	endfo
	unl va
	for [ke, va] in items(s:lc_opts)
		if exists(s:bpref.ke)
			unl {va}
			let {va} = {s:bpref.ke}
		en
	endfo
	" Match window options
	cal s:match_window_opts()
	" One-time values
	if a:0 && a:1 != {}
		unl va
		for [ke, va] in items(a:1)
			let opke = substitute(ke, '\(\w:\)\?ctrlp_', '', '')
			if has_key(s:lc_opts, opke)
				let sva = s:lc_opts[opke]
				unl {sva}
				let {sva} = va
			en
		endfo
	en
	for each in ['byfname', 'regexp'] | if exists(each)
		let s:{each} = {each}
	en | endfo
	if !exists('g:ctrlp_newcache') | let g:ctrlp_newcache = 0 | en
	let s:maxdepth = min([s:maxdepth, 100])
	let s:glob = s:showhidden ? '.*\|*' : '*'
	let s:igntype = empty(s:usrign) ? -1 : type(s:usrign)
	let s:lash = ctrlp#utils#lash()
	if s:keyloop
		let [s:lazy, s:glbs['imd']] = [0, 0]
	en
	if s:lazy
		cal extend(s:glbs, { 'ut': ( s:lazy > 1 ? s:lazy : 250 ) })
	en
	" Extensions
	if !( exists('extensions') && extensions == s:extensions )
		for each in s:extensions
			exe 'ru autoload/ctrlp/'.each.'.vim'
		endfo
	en
	" Keymaps
	if type(s:urprtmaps) == 4
		cal extend(s:prtmaps, s:urprtmaps)
	en
endf

fu! s:match_window_opts()
	let s:mw_pos =
		\ s:mw =~ 'top\|bottom' ? matchstr(s:mw, 'top\|bottom') :
		\ exists('g:ctrlp_match_window_bottom') ? ( s:mwbottom ? 'bottom' : 'top' )
		\ : 'bottom'
	let s:mw_order =
		\ s:mw =~ 'order:[^,]\+' ? matchstr(s:mw, 'order:\zs[^,]\+') :
		\ exists('g:ctrlp_match_window_reversed') ? ( s:mwreverse ? 'btt' : 'ttb' )
		\ : 'btt'
	let s:mw_max =
		\ s:mw =~ 'max:[^,]\+' ? str2nr(matchstr(s:mw, 'max:\zs\d\+')) :
		\ exists('g:ctrlp_max_height') ? s:mxheight
		\ : 10
	let s:mw_min =
		\ s:mw =~ 'min:[^,]\+' ? str2nr(matchstr(s:mw, 'min:\zs\d\+')) : 1
	let [s:mw_max, s:mw_min] = [max([s:mw_max, 1]), max([s:mw_min, 1])]
	let s:mw_min = min([s:mw_min, s:mw_max])
	let s:mw_res =
		\ s:mw =~ 'results:[^,]\+' ? str2nr(matchstr(s:mw, 'results:\zs\d\+'))
		\ : min([s:mw_max, &lines])
	let s:mw_res = max([s:mw_res, 1])
endf
"}}}1
" * Open & Close {{{1
fu! s:Open()
	cal s:log(1)
	cal s:getenv()
	cal s:execextvar('enter')
	sil! exe 'keepa' ( s:mw_pos == 'top' ? 'to' : 'bo' ) '1new ControlP'
	cal s:buffunc(1)
	let [s:bufnr, s:winw] = [bufnr('%'), winwidth(0)]
	let [s:focus, s:prompt] = [1, ['', '', '']]
	abc <buffer>
	if !exists('s:hstry')
		let hst = filereadable(s:gethistloc()[1]) ? s:gethistdata() : ['']
		let s:hstry = empty(hst) || !s:maxhst ? [''] : hst
	en
	for [ke, va] in items(s:glbs) | if exists('+'.ke)
		sil! exe 'let s:glb_'.ke.' = &'.ke.' | let &'.ke.' = '.string(va)
	en | endfo
	if s:opmul != '0' && has('signs')
		sign define ctrlpmark text=+> texthl=Search
	en
	cal s:setupblank()
endf

fu! s:Close()
	cal s:buffunc(0)
	if winnr('$') == 1
		bw!
	el
		try | bun!
		cat | clo! | endt
		cal s:unmarksigns()
	en
	for key in keys(s:glbs) | if exists('+'.key)
		sil! exe 'let &'.key.' = s:glb_'.key
	en | endfo
	if exists('s:glb_acd') | let &acd = s:glb_acd | en
	let g:ctrlp_lines = []
	if s:winres[1] >= &lines && s:winres[2] == winnr('$')
		exe s:winres[0].s:winres[0]
	en
	unl! s:focus s:hisidx s:hstgot s:marked s:statypes s:cline s:init s:savestr
		\ s:mrbs s:did_exp
	cal ctrlp#recordhist()
	cal s:execextvar('exit')
	cal s:log(0)
	let v:errmsg = s:ermsg
	ec
endf
" * Clear caches {{{1
fu! ctrlp#clr(...)
	let [s:matches, g:ctrlp_new{ a:0 ? a:1 : 'cache' }] = [1, 1]
endf

fu! ctrlp#clra()
	let cadir = ctrlp#utils#cachedir()
	if isdirectory(cadir)
		let cafiles = split(s:glbpath(s:fnesc(cadir, 'g', ','), '**', 1), "\n")
		let eval = '!isdirectory(v:val) && v:val !~ ''\v[\/]cache[.a-z]+$|\.log$'''
		sil! cal map(s:ifilter(cafiles, eval), 'delete(v:val)')
	en
	cal ctrlp#clr()
endf

fu! s:Reset(args)
	let opts = has_key(a:args, 'opts') ? [a:args['opts']] : []
	cal call('s:opts', opts)
	cal s:autocmds()
	cal ctrlp#utils#opts()
	cal s:execextvar('opts')
endf
" * Files {{{1
fu! ctrlp#files()
	let cafile = ctrlp#utils#cachefile()
	if g:ctrlp_newcache || !filereadable(cafile) || s:nocache(cafile)
		let [lscmd, s:initcwd, g:ctrlp_allfiles] = [s:lsCmd(), s:dyncwd, []]
		" Get the list of files
		if empty(lscmd)
			if !ctrlp#igncwd(s:dyncwd)
				cal s:GlobPath(s:fnesc(s:dyncwd, 'g', ','), 0)
			en
		el
			sil! cal ctrlp#progress('Indexing...')
			try | cal s:UserCmd(lscmd)
			cat | retu [] | endt
		en
		" Remove base directory
		cal ctrlp#rmbasedir(g:ctrlp_allfiles)
		if len(g:ctrlp_allfiles) <= s:compare_lim
			cal sort(g:ctrlp_allfiles, 'ctrlp#complen')
		en
		cal s:writecache(cafile)
		let catime = getftime(cafile)
	el
		let catime = getftime(cafile)
		if !( exists('s:initcwd') && s:initcwd == s:dyncwd )
			\ || get(s:ficounts, s:dyncwd, [0, catime])[1] != catime
			let s:initcwd = s:dyncwd
			let g:ctrlp_allfiles = ctrlp#utils#readfile(cafile)
		en
	en
	cal extend(s:ficounts, { s:dyncwd : [len(g:ctrlp_allfiles), catime] })
	retu g:ctrlp_allfiles
endf

fu! s:GlobPath(dirs, depth)
	let entries = split(globpath(a:dirs, s:glob), "\n")
	let [dnf, depth] = [ctrlp#dirnfile(entries), a:depth + 1]
	cal extend(g:ctrlp_allfiles, dnf[1])
	if !empty(dnf[0]) && !s:maxf(len(g:ctrlp_allfiles)) && depth <= s:maxdepth
		sil! cal ctrlp#progress(len(g:ctrlp_allfiles), 1)
		cal s:GlobPath(join(map(dnf[0], 's:fnesc(v:val, "g", ",")'), ','), depth)
	en
endf

fu! s:UserCmd(lscmd)
	let [path, lscmd] = [s:dyncwd, a:lscmd]
	let do_ign =
		\ type(s:usrcmd) == 4 && has_key(s:usrcmd, 'ignore') && s:usrcmd['ignore']
	if do_ign && ctrlp#igncwd(s:cwd) | retu | en
	if exists('+ssl') && &ssl
		let [ssl, &ssl, path] = [&ssl, 0, tr(path, '/', '\')]
	en
	if has('win32') || has('win64')
		let lscmd = substitute(lscmd, '\v(^|\&\&\s*)\zscd (/d)@!', 'cd /d ', '')
	en
	let path = exists('*shellescape') ? shellescape(path) : path
	let g:ctrlp_allfiles = split(system(printf(lscmd, path)), "\n")
	if exists('+ssl') && exists('ssl')
		let &ssl = ssl
		cal map(g:ctrlp_allfiles, 'tr(v:val, "\\", "/")')
	en
	if exists('s:vcscmd') && s:vcscmd
		cal map(g:ctrlp_allfiles, 'tr(v:val, "/", "\\")')
	en
	if do_ign
		if !empty(s:usrign)
			let g:ctrlp_allfiles = ctrlp#dirnfile(g:ctrlp_allfiles)[1]
		en
		if &wig != ''
			cal filter(g:ctrlp_allfiles, 'glob(v:val) != ""')
		en
	en
endf

fu! s:lsCmd()
	let cmd = s:usrcmd
	if type(cmd) == 1
		retu cmd
	elsei type(cmd) == 3 && len(cmd) >= 2 && cmd[:1] != ['', '']
		if s:findroot(s:dyncwd, cmd[0], 0, 1) == []
			retu len(cmd) == 3 ? cmd[2] : ''
		en
		let s:vcscmd = s:lash == '\'
		retu cmd[1]
	elsei type(cmd) == 4 && ( has_key(cmd, 'types') || has_key(cmd, 'fallback') )
		let fndroot = []
		if has_key(cmd, 'types') && cmd['types'] != {}
			let [markrs, cmdtypes] = [[], values(cmd['types'])]
			for pair in cmdtypes
				cal add(markrs, pair[0])
			endfo
			let fndroot = s:findroot(s:dyncwd, markrs, 0, 1)
		en
		if fndroot == []
			retu has_key(cmd, 'fallback') ? cmd['fallback'] : ''
		en
		for pair in cmdtypes
			if pair[0] == fndroot[0] | brea | en
		endfo
		let s:vcscmd = s:lash == '\'
		retu pair[1]
	en
endf
" - Buffers {{{1
fu! ctrlp#buffers(...)
	let ids = sort(filter(range(1, bufnr('$')), 'empty(getbufvar(v:val, "&bt"))'
		\ .' && getbufvar(v:val, "&bl")'), 's:compmreb')
	if a:0 && a:1 == 'id'
		retu ids
	el
		let bufs = [[], []]
		for id in ids
			let bname = bufname(id)
			let ebname = bname == ''
			let fname = fnamemodify(ebname ? '['.id.'*No Name]' : bname, ':.')
			cal add(bufs[ebname], fname)
		endfo
		retu bufs[0] + bufs[1]
	en
endf
" * MatchedItems() {{{1
fu! s:MatchIt(items, pat, limit, exc)
	let [lines, id] = [[], 0]
	let pat =
		\ s:byfname() ? map(split(a:pat, '^[^;]\+\\\@<!\zs;', 1), 's:martcs.v:val')
		\ : s:martcs.a:pat
	for item in a:items
		let id += 1
		try | if !( s:ispath && item == a:exc ) && call(s:mfunc, [item, pat]) >= 0
			cal add(lines, item)
		en | cat | brea | endt
		if a:limit > 0 && len(lines) >= a:limit | brea | en
	endfo
	let s:mdata = [s:dyncwd, s:itemtype, s:regexp, s:sublist(a:items, id, -1)]
	retu lines
endf

fu! s:MatchedItems(items, pat, limit)
	let exc = exists('s:crfilerel') ? s:crfilerel : ''
	let items = s:narrowable() ? s:matched + s:mdata[3] : a:items
	if s:matcher != {}
		let argms =
			\ has_key(s:matcher, 'arg_type') && s:matcher['arg_type'] == 'dict' ? [{
			\ 'items':  items,
			\ 'str':    a:pat,
			\ 'limit':  a:limit,
			\ 'mmode':  s:mmode(),
			\ 'ispath': s:ispath,
			\ 'crfile': exc,
			\ 'regex':  s:regexp,
			\ }] : [items, a:pat, a:limit, s:mmode(), s:ispath, exc, s:regexp]
		let lines = call(s:matcher['match'], argms, s:matcher)
	el
		let lines = s:MatchIt(items, a:pat, a:limit, exc)
	en
	let s:matches = len(lines)
	unl! s:did_exp
	retu lines
endf

fu! s:SplitPattern(str)
	let str = a:str
	if s:migemo && s:regexp && len(str) > 0 && executable('cmigemo')
		let str = s:migemo(str)
	en
	let s:savestr = str
	if s:regexp
		let pat = s:regexfilter(str)
	el
		let lst = split(str, '\zs')
		if exists('+ssl') && !&ssl
			cal map(lst, 'escape(v:val, ''\'')')
		en
		for each in ['^', '$', '.']
			cal map(lst, 'escape(v:val, each)')
		endfo
	en
	if exists('lst')
		let pat = ''
		if !empty(lst)
			if s:byfname() && index(lst, ';') > 0
				let fbar = index(lst, ';')
				let lst_1 = s:sublist(lst, 0, fbar - 1)
				let lst_2 = len(lst) - 1 > fbar ? s:sublist(lst, fbar + 1, -1) : ['']
				let pat = s:buildpat(lst_1).';'.s:buildpat(lst_2)
			el
				let pat = s:buildpat(lst)
			en
		en
	en
	retu escape(pat, '~')
endf
" * BuildPrompt() {{{1
fu! s:Render(lines, pat)
	let [&ma, lines, s:res_count] = [1, a:lines, len(a:lines)]
	let height = min([max([s:mw_min, s:res_count]), s:winmaxh])
	let pat = s:byfname() ? split(a:pat, '^[^;]\+\\\@<!\zs;', 1)[0] : a:pat
	let cur_cmd = 'keepj norm! '.( s:mw_order == 'btt' ? 'G' : 'gg' ).'1|'
	" Setup the match window
	sil! exe '%d _ | res' height
	" Print the new items
	if empty(lines)
		let [s:matched, s:lines] = [[], []]
		let lines = [' == NO ENTRIES ==']
		cal setline(1, s:offset(lines, height - 1))
		setl noma nocul
		exe cur_cmd
		cal s:unmarksigns()
		if s:dohighlight() | cal clearmatches() | en
		retu
	en
	let s:matched = copy(lines)
	" Sorting
	if !s:nosort()
		let s:compat = s:martcs.pat
		cal sort(lines, 's:mixedsort')
		unl s:compat
	en
	if s:mw_order == 'btt' | cal reverse(lines) | en
	let s:lines = copy(lines)
	cal map(lines, 's:formatline(v:val)')
	cal setline(1, s:offset(lines, height))
	setl noma cul
	exe cur_cmd
	cal s:unmarksigns()
	cal s:remarksigns()
	if exists('s:cline') && s:nolim != 1
		cal cursor(s:cline, 1)
	en
	" Highlighting
	if s:dohighlight()
		cal s:highlight(pat, s:mathi[1])
	en
endf

fu! s:Update(str)
	" Get the previous string if existed
	let oldstr = exists('s:savestr') ? s:savestr : ''
	" Get the new string sans tail
	let str = s:sanstail(a:str)
	" Stop if the string's unchanged
	if str == oldstr && !empty(str) && !exists('s:force') | retu | en
	let s:martcs = &scs && str =~ '\u' ? '\C' : ''
	let pat = s:matcher == {} ? s:SplitPattern(str) : str
	let lines = s:nolim == 1 && empty(str) ? copy(g:ctrlp_lines)
		\ : s:MatchedItems(g:ctrlp_lines, pat, s:mw_res)
	cal s:Render(lines, pat)
endf

fu! s:ForceUpdate()
	sil! cal s:Update(escape(s:getinput(), '\'))
endf

fu! s:BuildPrompt(upd)
	let base = ( s:regexp ? 'r' : '>' ).( s:byfname() ? 'd' : '>' ).'> '
	let str = escape(s:getinput(), '\')
	let lazy = str == '' || exists('s:force') || !has('autocmd') ? 0 : s:lazy
	if a:upd && !lazy && ( s:matches || s:regexp || exists('s:did_exp')
		\ || str =~ '\(\\\(<\|>\)\|[*|]\)\|\(\\\:\([^:]\|\\:\)*$\)' )
		sil! cal s:Update(str)
	en
	sil! cal ctrlp#statusline()
	" Toggling
	let [hiactive, hicursor, base] = s:focus
		\ ? ['CtrlPPrtText', 'CtrlPPrtCursor', base]
		\ : ['CtrlPPrtBase', 'CtrlPPrtBase', tr(base, '>', '-')]
	let hibase = 'CtrlPPrtBase'
	" Build it
	redr
	let prt = copy(s:prompt)
	cal map(prt, 'escape(v:val, ''"\'')')
	exe 'echoh' hibase '| echon "'.base.'"
		\ | echoh' hiactive '| echon "'.prt[0].'"
		\ | echoh' hicursor '| echon "'.prt[1].'"
		\ | echoh' hiactive '| echon "'.prt[2].'" | echoh None'
	" Append the cursor at the end
	if empty(prt[1]) && s:focus
		exe 'echoh' hibase '| echon "_" | echoh None'
	en
endf
" - SetDefTxt() {{{1
fu! s:SetDefTxt()
	if s:deftxt == '0' || ( s:deftxt == 1 && !s:ispath ) | retu | en
	let txt = s:deftxt
	if !type(txt)
		let path = s:crfpath.s:lash(s:crfpath)
		let txt = txt && !stridx(path, s:dyncwd) ? ctrlp#rmbasedir([path])[0] : ''
	en
	let s:prompt[0] = txt
endf
" ** Prt Actions {{{1
" Editing {{{2
fu! s:PrtClear()
	if !s:focus | retu | en
	unl! s:hstgot
	let [s:prompt, s:matches] = [['', '', ''], 1]
	cal s:BuildPrompt(1)
endf

fu! s:PrtAdd(char)
	unl! s:hstgot
	let s:act_add = 1
	let s:prompt[0] .= a:char
	cal s:BuildPrompt(1)
	unl s:act_add
endf

fu! s:PrtBS()
	if !s:focus | retu | en
	unl! s:hstgot
	let [s:prompt[0], s:matches] = [substitute(s:prompt[0], '.$', '', ''), 1]
	cal s:BuildPrompt(1)
endf

fu! s:PrtDelete()
	if !s:focus | retu | en
	unl! s:hstgot
	let [prt, s:matches] = [s:prompt, 1]
	let prt[1] = matchstr(prt[2], '^.')
	let prt[2] = substitute(prt[2], '^.', '', '')
	cal s:BuildPrompt(1)
endf

fu! s:PrtDeleteWord()
	if !s:focus | retu | en
	unl! s:hstgot
	let [str, s:matches] = [s:prompt[0], 1]
	let str = str =~ '\W\w\+$' ? matchstr(str, '^.\+\W\ze\w\+$')
		\ : str =~ '\w\W\+$' ? matchstr(str, '^.\+\w\ze\W\+$')
		\ : str =~ '\s\+$' ? matchstr(str, '^.*\S\ze\s\+$')
		\ : str =~ '\v^(\S+|\s+)$' ? '' : str
	let s:prompt[0] = str
	cal s:BuildPrompt(1)
endf

fu! s:PrtInsert(...)
	if !s:focus | retu | en
	let type = !a:0 ? '' : a:1
	if !a:0
		let type = s:insertstr()
		if type == 'cancel' | retu | en
	en
	if type ==# 'r'
		let regcont = s:getregs()
		if regcont < 0 | retu | en
	en
	unl! s:hstgot
	let s:act_add = 1
	let s:prompt[0] .= type ==# 'w' ? s:crword
		\ : type ==# 'f' ? s:crgfile
		\ : type ==# 's' ? s:regisfilter('/')
		\ : type ==# 'v' ? s:crvisual
		\ : type ==# 'c' ? s:regisfilter('+')
		\ : type ==# 'r' ? regcont : ''
	cal s:BuildPrompt(1)
	unl s:act_add
endf

fu! s:PrtExpandDir()
	if !s:focus | retu | en
	let str = s:getinput('c')
	if str =~ '\v^\@(cd|lc[hd]?|chd)\s.+' && s:spi
		let hasat = split(str, '\v^\@(cd|lc[hd]?|chd)\s*\zs')
		let str = get(hasat, 1, '')
		if str =~# '\v^[~$]\i{-}[\/]?|^#(\<?\d+)?:(p|h|8|\~|\.|g?s+)'
			let str = expand(s:fnesc(str, 'g'))
		elsei str =~# '\v^(\%|\<c\h{4}\>):(p|h|8|\~|\.|g?s+)'
			let spc = str =~# '^%' ? s:crfile
				\ : str =~# '^<cfile>' ? s:crgfile
				\ : str =~# '^<cword>' ? s:crword
				\ : str =~# '^<cWORD>' ? s:crnbword : ''
			let pat = '(:(p|h|8|\~|\.|g?s(.)[^\3]*\3[^\3]*\3))+'
			let mdr = matchstr(str, '\v^[^:]+\zs'.pat)
			let nmd = matchstr(str, '\v^[^:]+'.pat.'\zs.{-}$')
			let str = fnamemodify(s:fnesc(spc, 'g'), mdr).nmd
		en
	en
	if str == '' | retu | en
	unl! s:hstgot
	let s:act_add = 1
	let [base, seed] = s:headntail(str)
	if str =~# '^[\/]'
		let base = expand('/').base
	en
	let dirs = s:dircompl(base, seed)
	if len(dirs) == 1
		let str = dirs[0]
	elsei len(dirs) > 1
		let str .= s:findcommon(dirs, str)
	en
	let s:prompt[0] = exists('hasat') ? hasat[0].str : str
	cal s:BuildPrompt(1)
	unl s:act_add
endf
" Movement {{{2
fu! s:PrtCurLeft()
	if !s:focus | retu | en
	let prt = s:prompt
	if !empty(prt[0])
		let s:prompt = [substitute(prt[0], '.$', '', ''), matchstr(prt[0], '.$'),
			\ prt[1] . prt[2]]
	en
	cal s:BuildPrompt(0)
endf

fu! s:PrtCurRight()
	if !s:focus | retu | en
	let prt = s:prompt
	let s:prompt = [prt[0] . prt[1], matchstr(prt[2], '^.'),
		\ substitute(prt[2], '^.', '', '')]
	cal s:BuildPrompt(0)
endf

fu! s:PrtCurStart()
	if !s:focus | retu | en
	let str = join(s:prompt, '')
	let s:prompt = ['', matchstr(str, '^.'), substitute(str, '^.', '', '')]
	cal s:BuildPrompt(0)
endf

fu! s:PrtCurEnd()
	if !s:focus | retu | en
	let s:prompt = [join(s:prompt, ''), '', '']
	cal s:BuildPrompt(0)
endf

fu! s:PrtSelectMove(dir)
	let wht = winheight(0)
	let dirs = {'t': 'gg','b': 'G','j': 'j','k': 'k','u': wht.'k','d': wht.'j'}
	exe 'keepj norm!' dirs[a:dir]
	if s:nolim != 1 | let s:cline = line('.') | en
	if line('$') > winheight(0) | cal s:BuildPrompt(0) | en
endf

fu! s:PrtSelectJump(char)
	let lines = copy(s:lines)
	if s:byfname()
		cal map(lines, 'split(v:val, ''[\/]\ze[^\/]\+$'')[-1]')
	en
	" Cycle through matches, use s:jmpchr to store last jump
	let chr = escape(matchstr(a:char, '^.'), '.~')
	let smartcs = &scs && chr =~ '\u' ? '\C' : ''
	if match(lines, smartcs.'^'.chr) >= 0
		" If not exists or does but not for the same char
		let pos = match(lines, smartcs.'^'.chr)
		if !exists('s:jmpchr') || ( exists('s:jmpchr') && s:jmpchr[0] != chr )
			let [jmpln, s:jmpchr] = [pos, [chr, pos]]
		elsei exists('s:jmpchr') && s:jmpchr[0] == chr
			" Start of lines
			if s:jmpchr[1] == -1 | let s:jmpchr[1] = pos | en
			let npos = match(lines, smartcs.'^'.chr, s:jmpchr[1] + 1)
			let [jmpln, s:jmpchr] = [npos == -1 ? pos : npos, [chr, npos]]
		en
		exe 'keepj norm!' ( jmpln + 1 ).'G'
		if s:nolim != 1 | let s:cline = line('.') | en
		if line('$') > winheight(0) | cal s:BuildPrompt(0) | en
	en
endf
" Misc {{{2
fu! s:PrtFocusMap(char)
	cal call(( s:focus ? 's:PrtAdd' : 's:PrtSelectJump' ), [a:char])
endf

fu! s:PrtClearCache()
	if s:itemtype == 0
		cal ctrlp#clr()
	elsei s:itemtype > 2
		cal ctrlp#clr(s:statypes[s:itemtype][1])
	en
	if s:itemtype == 2
		let g:ctrlp_lines = ctrlp#mrufiles#refresh()
	el
		cal ctrlp#setlines()
	en
	let s:force = 1
	cal s:BuildPrompt(1)
	unl s:force
endf

fu! s:PrtDeleteEnt()
	if s:itemtype == 2
		cal s:PrtDeleteMRU()
	elsei type(s:getextvar('wipe')) == 1
		cal s:delent(s:getextvar('wipe'))
	en
endf

fu! s:PrtDeleteMRU()
	if s:itemtype == 2
		cal s:delent('ctrlp#mrufiles#remove')
	en
endf

fu! s:PrtExit()
	if bufnr('%') == s:bufnr && bufname('%') == 'ControlP'
		noa cal s:Close()
		noa winc p
	en
endf

fu! s:PrtHistory(...)
	if !s:focus || !s:maxhst | retu | en
	let [str, hst, s:matches] = [join(s:prompt, ''), s:hstry, 1]
	" Save to history if not saved before
	let [hst[0], hslen] = [exists('s:hstgot') ? hst[0] : str, len(hst)]
	let idx = exists('s:hisidx') ? s:hisidx + a:1 : a:1
	" Limit idx within 0 and hslen
	let idx = idx < 0 ? 0 : idx >= hslen ? hslen > 1 ? hslen - 1 : 0 : idx
	let s:prompt = [hst[idx], '', '']
	let [s:hisidx, s:hstgot, s:force] = [idx, 1, 1]
	cal s:BuildPrompt(1)
	unl s:force
endf
"}}}1
" * Mappings {{{1
fu! s:MapNorms()
	if exists('s:nmapped') && s:nmapped == s:bufnr | retu | en
	let pcmd = "nn \<buffer> \<silent> \<k%s> :\<c-u>cal \<SID>%s(\"%s\")\<cr>"
	let cmd = substitute(pcmd, 'k%s', 'char-%d', '')
	let pfunc = 'PrtFocusMap'
	let ranges = [32, 33, 125, 126] + range(35, 91) + range(93, 123)
	for each in [34, 92, 124]
		exe printf(cmd, each, pfunc, escape(nr2char(each), '"|\'))
	endfo
	for each in ranges
		exe printf(cmd, each, pfunc, nr2char(each))
	endfo
	for each in range(0, 9)
		exe printf(pcmd, each, pfunc, each)
	endfo
	for [ke, va] in items(s:kprange)
		exe printf(pcmd, ke, pfunc, va)
	endfo
	let s:nmapped = s:bufnr
endf

fu! s:MapSpecs()
	if !( exists('s:smapped') && s:smapped == s:bufnr )
		" Correct arrow keys in terminal
		if ( has('termresponse') && v:termresponse =~ "\<ESC>" )
			\ || &term =~? '\vxterm|<k?vt|gnome|screen|linux|ansi'
			for each in ['\A <up>','\B <down>','\C <right>','\D <left>']
				exe s:lcmap.' <esc>['.each
			endfo
		en
	en
	for [ke, va] in items(s:prtmaps) | for kp in va
		exe s:lcmap kp ':<c-u>cal <SID>'.ke.'<cr>'
	endfo | endfo
	let s:smapped = s:bufnr
endf

fu! s:KeyLoop()
	wh exists('s:init') && s:keyloop
		redr
		let nr = getchar()
		let chr = !type(nr) ? nr2char(nr) : nr
		if nr >=# 0x20
			cal s:PrtFocusMap(chr)
		el
			let cmd = matchstr(maparg(chr), ':<C-U>\zs.\+\ze<CR>$')
			exe ( cmd != '' ? cmd : 'norm '.chr )
		en
	endw
endf
" * Toggling {{{1
fu! s:ToggleFocus()
	let s:focus = !s:focus
	cal s:BuildPrompt(0)
endf

fu! s:ToggleRegex()
	let s:regexp = !s:regexp
	cal s:PrtSwitcher()
endf

fu! s:ToggleByFname()
	if s:ispath
		let s:byfname = !s:byfname
		let s:mfunc = s:mfunc()
		cal s:PrtSwitcher()
	en
endf

fu! s:ToggleType(dir)
	let max = len(g:ctrlp_ext_vars) + 2
	let next = s:walker(max, s:itemtype, a:dir)
	cal ctrlp#syntax()
	cal ctrlp#setlines(next)
	cal s:PrtSwitcher()
endf

fu! s:ToggleKeyLoop()
	let s:keyloop = !s:keyloop
	if exists('+imd')
		let &imd = !s:keyloop
	en
	if s:keyloop
		let [&ut, s:lazy] = [0, 0]
		cal s:KeyLoop()
	elsei has_key(s:glbs, 'ut')
		let [&ut, s:lazy] = [s:glbs['ut'], 1]
	en
endf

fu! s:ToggleMRURelative()
	cal ctrlp#mrufiles#tgrel()
	cal s:PrtClearCache()
endf

fu! s:PrtSwitcher()
	let [s:force, s:matches] = [1, 1]
	cal s:BuildPrompt(1)
	unl s:force
endf
" - SetWD() {{{1
fu! s:SetWD(args)
	if has_key(a:args, 'args') && stridx(a:args['args'], '--dir') >= 0
		\ && exists('s:dyncwd')
		cal ctrlp#setdir(s:dyncwd) | retu
	en
	if has_key(a:args, 'dir') && a:args['dir'] != ''
		cal ctrlp#setdir(a:args['dir']) | retu
	en
	let pmode = has_key(a:args, 'mode') ? a:args['mode'] : s:pathmode
	let [s:crfilerel, s:dyncwd] = [fnamemodify(s:crfile, ':.'), getcwd()]
	if s:crfile =~ '^.\+://' | retu | en
	if pmode =~ 'c' || ( pmode =~ 'a' && stridx(s:crfpath, s:cwd) < 0 )
		\ || ( !type(pmode) && pmode )
		if exists('+acd') | let [s:glb_acd, &acd] = [&acd, 0] | en
		cal ctrlp#setdir(s:crfpath)
	en
	if pmode =~ 'r' || pmode == 2
		let markers = ['.git', '.hg', '.svn', '.bzr', '_darcs']
		let spath = pmode =~ 'd' ? s:dyncwd : pmode =~ 'w' ? s:cwd : s:crfpath
		if type(s:rmarkers) == 3 && !empty(s:rmarkers)
			if s:findroot(spath, s:rmarkers, 0, 0) != [] | retu | en
			cal filter(markers, 'index(s:rmarkers, v:val) < 0')
		en
		cal s:findroot(spath, markers, 0, 0)
	en
endf
" * AcceptSelection() {{{1
fu! ctrlp#acceptfile(...)
	let useb = 0
	if a:0 == 1 && type(a:1) == 4
		let [md, line] = [a:1['action'], a:1['line']]
		let atl = has_key(a:1, 'tail') ? a:1['tail'] : ''
	el
		let [md, line] = [a:1, a:2]
		let atl = a:0 > 2 ? a:3 : ''
	en
	if !type(line)
		let [filpath, bufnr, useb] = [line, line, 1]
	el
		let filpath = fnamemodify(line, ':p')
		if s:nonamecond(line, filpath)
			let bufnr = str2nr(matchstr(line, '[\/]\?\[\zs\d\+\ze\*No Name\]$'))
			let [filpath, useb] = [bufnr, 1]
		el
			let bufnr = bufnr('^'.filpath.'$')
		en
	en
	cal s:PrtExit()
	let tail = s:tail()
	let j2l = atl != '' ? atl : matchstr(tail, '^ +\zs\d\+$')
	if ( s:jmptobuf =~ md || ( s:jmptobuf && md =~ '[et]' ) ) && bufnr > 0
		\ && !( md == 'e' && bufnr == bufnr('%') )
		let [jmpb, bufwinnr] = [1, bufwinnr(bufnr)]
		let buftab = ( s:jmptobuf =~# '[tTVH]' || s:jmptobuf > 1 )
			\ ? s:buftab(bufnr, md) : [0, 0]
	en
	" Switch to existing buffer or open new one
	if exists('jmpb') && bufwinnr > 0
		\ && !( md == 't' && ( s:jmptobuf !~# toupper(md) || buftab[0] ) )
		exe bufwinnr.'winc w'
		if j2l | cal ctrlp#j2l(j2l) | en
	elsei exists('jmpb') && buftab[0]
		\ && !( md =~ '[evh]' && s:jmptobuf !~# toupper(md) )
		exe 'tabn' buftab[0]
		exe buftab[1].'winc w'
		if j2l | cal ctrlp#j2l(j2l) | en
	el
		" Determine the command to use
		let useb = bufnr > 0 && buflisted(bufnr) && ( empty(tail) || useb )
		let cmd =
			\ md == 't' || s:splitwin == 1 ? ( useb ? 'tab sb' : 'tabe' ) :
			\ md == 'h' || s:splitwin == 2 ? ( useb ? 'sb' : 'new' ) :
			\ md == 'v' || s:splitwin == 3 ? ( useb ? 'vert sb' : 'vne' ) :
			\ call('ctrlp#normcmd', useb ? ['b', 'bo vert sb'] : ['e'])
		" Reset &switchbuf option
		let [swb, &swb] = [&swb, '']
		" Open new window/buffer
		let [fid, tail] = [( useb ? bufnr : filpath ), ( atl != '' ? ' +'.atl : tail )]
		let args = [cmd, fid, tail, 1, [useb, j2l]]
		cal call('s:openfile', args)
		let &swb = swb
	en
endf

fu! s:SpecInputs(str)
	if a:str =~ '\v^(\.\.([\/]\.\.)*[\/]?[.\/]*)$' && s:spi
		let cwd = s:dyncwd
		cal ctrlp#setdir(a:str =~ '^\.\.\.*$' ?
			\ '../'.repeat('../', strlen(a:str) - 2) : a:str)
		if cwd != s:dyncwd | cal ctrlp#setlines() | en
		cal s:PrtClear()
		retu 1
	elsei a:str == s:lash && s:spi
		cal s:SetWD({ 'mode': 'rd' })
		cal ctrlp#setlines()
		cal s:PrtClear()
		retu 1
	elsei a:str =~ '^@.\+' && s:spi
		retu s:at(a:str)
	elsei a:str == '?'
		cal s:PrtExit()
		let hlpwin = &columns > 159 ? '| vert res 80' : ''
		sil! exe 'bo vert h ctrlp-mappings' hlpwin '| norm! 0'
		retu 1
	en
	retu 0
endf

fu! s:AcceptSelection(action)
	let [md, icr] = [a:action[0], match(a:action, 'r') >= 0]
	let subm = icr || ( !icr && md == 'e' )
	if !subm && s:OpenMulti(md) != -1 | retu | en
	let str = s:getinput()
	if subm | if s:SpecInputs(str) | retu | en | en
	" Get the selected line
	let line = ctrlp#getcline()
	if !subm && !s:itemtype && line == '' && line('.') > s:offset
		\ && str !~ '\v^(\.\.([\/]\.\.)*[\/]?[.\/]*|/|\\|\?|\@.+)$'
		cal s:CreateNewFile(md) | retu
	en
	if empty(line) | retu | en
	" Do something with it
	if s:openfunc != {} && has_key(s:openfunc, s:ctype)
		let actfunc = s:openfunc[s:ctype]
		let type = has_key(s:openfunc, 'arg_type') ? s:openfunc['arg_type'] : 'list'
	el
		if s:itemtype < 3
			let [actfunc, type] = ['ctrlp#acceptfile', 'dict']
		el
			let [actfunc, exttype] = [s:getextvar('accept'), s:getextvar('act_farg')]
			let type = exttype == 'dict' ? exttype : 'list'
		en
	en
	let actargs = type == 'dict' ? [{ 'action': md, 'line': line, 'icr': icr }]
		\ : [md, line]
	cal call(actfunc, actargs)
endf
" - CreateNewFile() {{{1
fu! s:CreateNewFile(...)
	let [md, str] = ['', s:getinput('n')]
	if empty(str) | retu | en
	if s:argmap && !a:0
		" Get the extra argument
		let md = s:argmaps(md, 1)
		if md == 'cancel' | retu | en
	en
	let str = s:sanstail(str)
	let [base, fname] = s:headntail(str)
	if fname =~ '^[\/]$' | retu | en
	if exists('s:marked') && len(s:marked)
		" Use the first marked file's path
		let path = fnamemodify(values(s:marked)[0], ':p:h')
		let base = path.s:lash(path).base
		let str = fnamemodify(base.s:lash.fname, ':.')
	en
	if base != '' | if isdirectory(ctrlp#utils#mkdir(base))
		let optyp = str | en | el | let optyp = fname
	en
	if !exists('optyp') | retu | en
	let [filpath, tail] = [fnamemodify(optyp, ':p'), s:tail()]
	if !stridx(filpath, s:dyncwd) | cal s:insertcache(str) | en
	cal s:PrtExit()
	let cmd = md == 'r' ? ctrlp#normcmd('e') :
		\ s:newfop =~ '1\|t' || ( a:0 && a:1 == 't' ) || md == 't' ? 'tabe' :
		\ s:newfop =~ '2\|h' || ( a:0 && a:1 == 'h' ) || md == 'h' ? 'new' :
		\ s:newfop =~ '3\|v' || ( a:0 && a:1 == 'v' ) || md == 'v' ? 'vne' :
		\ ctrlp#normcmd('e')
	cal s:openfile(cmd, filpath, tail, 1)
endf
" * OpenMulti() {{{1
fu! s:MarkToOpen()
	if s:bufnr <= 0 || s:opmul == '0'
		\ || ( s:itemtype > 2 && s:getextvar('opmul') != 1 )
		retu
	en
	let line = ctrlp#getcline()
	if empty(line) | retu | en
	let filpath = s:ispath ? fnamemodify(line, ':p') : line
	if exists('s:marked') && s:dictindex(s:marked, filpath) > 0
		" Unmark and remove the file from s:marked
		let key = s:dictindex(s:marked, filpath)
		cal remove(s:marked, key)
		if empty(s:marked) | unl s:marked | en
		if has('signs')
			exe 'sign unplace' key 'buffer='.s:bufnr
		en
	el
		" Add to s:marked and place a new sign
		if exists('s:marked')
			let vac = s:vacantdict(s:marked)
			let key = empty(vac) ? len(s:marked) + 1 : vac[0]
			let s:marked = extend(s:marked, { key : filpath })
		el
			let [key, s:marked] = [1, { 1 : filpath }]
		en
		if has('signs')
			exe 'sign place' key 'line='.line('.').' name=ctrlpmark buffer='.s:bufnr
		en
	en
	sil! cal ctrlp#statusline()
endf

fu! s:OpenMulti(...)
	let has_marked = exists('s:marked')
	if ( !has_marked && a:0 ) || s:opmul == '0' || !s:ispath
		\ || ( s:itemtype > 2 && s:getextvar('opmul') != 1 )
		retu -1
	en
	" Get the options
	let [nr, md] = [matchstr(s:opmul, '\d\+'), matchstr(s:opmul, '[thvi]')]
	let [ur, jf] = [s:opmul =~ 'r', s:opmul =~ 'j']
	let md = a:0 ? a:1 : ( md == '' ? 'v' : md )
	let nopt = exists('g:ctrlp_open_multiple_files')
	if !has_marked
		let line = ctrlp#getcline()
		if line == '' | retu | en
		let marked = { 1 : fnamemodify(line, ':p') }
		let [nr, ur, jf, nopt] = ['1', 0, 0, 1]
	en
	if ( s:argmap || !has_marked ) && !a:0
		let md = s:argmaps(md, !has_marked ? 2 : 0)
		if md == 'c'
			cal s:unmarksigns()
			unl! s:marked
			cal s:BuildPrompt(0)
		elsei !has_marked && md =~ '[axd]'
			retu s:OpenNoMarks(md, line)
		en
		if md =~ '\v^c(ancel)?$' | retu | en
		let nr = nr == '0' ? ( nopt ? '' : '1' ) : nr
		let ur = !has_marked && md == 'r' ? 1 : ur
	en
	let mkd = values(has_marked ? s:marked : marked)
	cal s:sanstail(join(s:prompt, ''))
	cal s:PrtExit()
	if nr == '0' || md == 'i'
		retu map(mkd, "s:openfile('bad', v:val, '', 0)")
	en
	let tail = s:tail()
	let [emptytail, bufnr] = [empty(tail), bufnr('^'.mkd[0].'$')]
	let useb = bufnr > 0 && buflisted(bufnr) && emptytail
	" Move to a replaceable window
	let ncmd = ( useb ? ['b', 'bo vert sb'] : ['e', 'bo vne'] )
		\ + ( ur ? [] : ['ignruw'] )
	let fst = call('ctrlp#normcmd', ncmd)
	" Check if the current window has a replaceable buffer
	let repabl = !( md == 't' && !ur ) && empty(bufname('%')) && empty(&l:ft)
	" Commands for the rest of the files
	let [ic, cmds] = [1, { 'v': ['vert sb', 'vne'], 'h': ['sb', 'new'],
		\ 't': ['tab sb', 'tabe'] }]
	let [swb, &swb] = [&swb, '']
	if md == 't' && ctrlp#tabcount() < tabpagenr()
		let s:tabct = ctrlp#tabcount()
	en
	" Open the files
	for va in mkd
		let bufnr = bufnr('^'.va.'$')
		if bufnr < 0 && getftype(va) == '' | con | en
		let useb = bufnr > 0 && buflisted(bufnr) && emptytail
		let snd = md != '' && has_key(cmds, md) ?
			\ ( useb ? cmds[md][0] : cmds[md][1] ) : ( useb ? 'vert sb' : 'vne' )
		let cmd = ic == 1 && ( !( !ur && fst =~ '^[eb]$' ) || repabl ) ? fst : snd
		let conds = [( nr != '' && nr > 1 && nr < ic ) || ( nr == '' && ic > 1 ),
			\ nr != '' && nr < ic]
		if conds[nopt]
			if !buflisted(bufnr) | cal s:openfile('bad', va, '', 0) | en
		el
			cal s:openfile(cmd, useb ? bufnr : va, tail, ic == 1)
			if jf | if ic == 1
				let crpos = [tabpagenr(), winnr()]
			el
				let crpos[0] += tabpagenr() <= crpos[0]
				let crpos[1] += winnr() <= crpos[1]
			en | en
			let ic += 1
		en
	endfo
	if jf && exists('crpos') && ic > 2
		exe ( md == 't' ? 'tabn '.crpos[0] : crpos[1].'winc w' )
	en
	let &swb = swb
	unl! s:tabct
endf

fu! s:OpenNoMarks(md, line)
	if a:md == 'a'
		let [s:marked, key] = [{}, 1]
		for line in s:lines
			let s:marked = extend(s:marked, { key : fnamemodify(line, ':p') })
			let key += 1
		endfo
		cal s:remarksigns()
		cal s:BuildPrompt(0)
	elsei a:md == 'x'
		let type = has_key(s:openfunc, 'arg_type') ? s:openfunc['arg_type'] : 'dict'
		let argms = type == 'dict' ? [{ 'action': a:md, 'line': a:line }]
			\ : [a:md, a:line]
		cal call(s:openfunc[s:ctype], argms, s:openfunc)
	elsei a:md == 'd'
		let dir = fnamemodify(a:line, ':h')
		if isdirectory(dir)
			cal ctrlp#setdir(dir)
			cal ctrlp#switchtype(0)
			cal ctrlp#recordhist()
			cal s:PrtClear()
		en
	en
endf
" ** Helper functions {{{1
" Sorting {{{2
fu! ctrlp#complen(...)
	" By length
	let [len1, len2] = [strlen(a:1), strlen(a:2)]
	retu len1 == len2 ? 0 : len1 > len2 ? 1 : -1
endf

fu! s:compmatlen(...)
	" By match length
	let mln1 = s:shortest(s:matchlens(a:1, s:compat))
	let mln2 = s:shortest(s:matchlens(a:2, s:compat))
	retu mln1 == mln2 ? 0 : mln1 > mln2 ? 1 : -1
endf

fu! s:comptime(...)
	" By last modified time
	let [time1, time2] = [getftime(a:1), getftime(a:2)]
	retu time1 == time2 ? 0 : time1 < time2 ? 1 : -1
endf

fu! s:compmreb(...)
	" By last entered time (bufnr)
	let [id1, id2] = [index(s:mrbs, a:1), index(s:mrbs, a:2)]
	retu id1 == id2 ? 0 : id1 > id2 ? 1 : -1
endf

fu! s:compmref(...)
	" By last entered time (MRU)
	let [id1, id2] = [index(g:ctrlp_lines, a:1), index(g:ctrlp_lines, a:2)]
	retu id1 == id2 ? 0 : id1 > id2 ? 1 : -1
endf

fu! s:comparent(...)
	" By same parent dir
	if !stridx(s:crfpath, s:dyncwd)
		let [as1, as2] = [s:dyncwd.s:lash().a:1, s:dyncwd.s:lash().a:2]
		let [loc1, loc2] = [s:getparent(as1), s:getparent(as2)]
		if loc1 == s:crfpath && loc2 != s:crfpath | retu -1 | en
		if loc2 == s:crfpath && loc1 != s:crfpath | retu 1  | en
		retu 0
	en
	retu 0
endf

fu! s:compfnlen(...)
	" By filename length
	let len1 = strlen(split(a:1, s:lash)[-1])
	let len2 = strlen(split(a:2, s:lash)[-1])
	retu len1 == len2 ? 0 : len1 > len2 ? 1 : -1
endf

fu! s:matchlens(str, pat, ...)
	if empty(a:pat) || index(['^', '$'], a:pat) >= 0 | retu {} | en
	let st   = a:0 ? a:1 : 0
	let lens = a:0 >= 2 ? a:2 : {}
	let nr   = a:0 >= 3 ? a:3 : 0
	if nr > 20 | retu {} | en
	if match(a:str, a:pat, st) >= 0
		let [mst, mnd] = [matchstr(a:str, a:pat, st), matchend(a:str, a:pat, st)]
		let lens = extend(lens, { nr : [strlen(mst), mst] })
		let lens = s:matchlens(a:str, a:pat, mnd, lens, nr + 1)
	en
	retu lens
endf

fu! s:shortest(lens)
	retu min(map(values(a:lens), 'v:val[0]'))
endf

fu! s:mixedsort(...)
	if s:itemtype == 1
		let pat = '[\/]\?\[\d\+\*No Name\]$'
		if a:1 =~# pat && a:2 =~# pat | retu 0
		elsei a:1 =~# pat | retu 1
		elsei a:2 =~# pat | retu -1 | en
	en
	let [cln, cml] = [ctrlp#complen(a:1, a:2), s:compmatlen(a:1, a:2)]
	if s:ispath
		let ms = []
		if s:res_count < 21
			let ms += [s:compfnlen(a:1, a:2)]
			if s:itemtype !~ '^[12]$' | let ms += [s:comptime(a:1, a:2)] | en
			if !s:itemtype | let ms += [s:comparent(a:1, a:2)] | en
		en
		if s:itemtype =~ '^[12]$'
			let ms += [s:compmref(a:1, a:2)]
			let cln = cml ? cln : 0
		en
		let ms += [cml, 0, 0, 0]
		let mp = call('s:multipliers', ms[:3])
		retu cln + ms[0] * mp[0] + ms[1] * mp[1] + ms[2] * mp[2] + ms[3] * mp[3]
	en
	retu cln + cml * 2
endf

fu! s:multipliers(...)
	let mp0 = !a:1 ? 0 : 2
	let mp1 = !a:2 ? 0 : 1 + ( !mp0 ? 1 : mp0 )
	let mp2 = !a:3 ? 0 : 1 + ( !( mp0 + mp1 ) ? 1 : ( mp0 + mp1 ) )
	let mp3 = !a:4 ? 0 : 1 + ( !( mp0 + mp1 + mp2 ) ? 1 : ( mp0 + mp1 + mp2 ) )
	retu [mp0, mp1, mp2, mp3]
endf

fu! s:compval(...)
	retu a:1 - a:2
endf
" Statusline {{{2
fu! ctrlp#statusline()
	if !exists('s:statypes')
		let s:statypes = [
			\ ['files', 'fil'],
			\ ['buffers', 'buf'],
			\ ['mru files', 'mru'],
			\ ]
		if !empty(g:ctrlp_ext_vars)
			cal map(copy(g:ctrlp_ext_vars),
				\ 'add(s:statypes, [ v:val["lname"], v:val["sname"] ])')
		en
	en
	let tps = s:statypes
	let max = len(tps) - 1
	let nxt = tps[s:walker(max, s:itemtype,  1)][1]
	let prv = tps[s:walker(max, s:itemtype, -1)][1]
	let s:ctype = tps[s:itemtype][0]
	let focus   = s:focus ? 'prt'  : 'win'
	let byfname = s:ispath ? s:byfname ? 'file' : 'path' : 'line'
	let marked  = s:opmul != '0' ?
		\ exists('s:marked') ? ' <'.s:dismrk().'>' : ' <->' : ''
	if s:status != {}
		let argms =
			\ has_key(s:status, 'arg_type') && s:status['arg_type'] == 'dict' ? [{
			\ 'focus':   focus,
			\ 'byfname': byfname,
			\ 'regex':   s:regexp,
			\ 'prev':    prv,
			\ 'item':    s:ctype,
			\ 'next':    nxt,
			\ 'marked':  marked,
			\ }] : [focus, byfname, s:regexp, prv, s:ctype, nxt, marked]
		let &l:stl = call(s:status['main'], argms, s:status)
	el
		let item    = '%#CtrlPMode1# '.s:ctype.' %*'
		let focus   = '%#CtrlPMode2# '.focus.' %*'
		let byfname = '%#CtrlPMode1# '.byfname.' %*'
		let regex   = s:regexp  ? '%#CtrlPMode2# regex %*' : ''
		let slider  = ' <'.prv.'>={'.item.'}=<'.nxt.'>'
		let dir     = ' %=%<%#CtrlPMode2# %{getcwd()} %*'
		let &l:stl  = focus.byfname.regex.slider.marked.dir
	en
endf

fu! s:dismrk()
	retu has('signs') ? len(s:marked) :
		\ '%<'.join(values(map(copy(s:marked), 'split(v:val, "[\\/]")[-1]')), ', ')
endf

fu! ctrlp#progress(enum, ...)
	if has('macunix') || has('mac') | sl 1m | en
	let txt = a:0 ? '(press ctrl-c to abort)' : ''
	if s:status != {}
		let argms = has_key(s:status, 'arg_type') && s:status['arg_type'] == 'dict'
			\ ? [{ 'str': a:enum }] : [a:enum]
		let &l:stl = call(s:status['prog'], argms, s:status)
	el
		let &l:stl = '%#CtrlPStats# '.a:enum.' %* '.txt.'%=%<%#CtrlPMode2# %{getcwd()} %*'
	en
	redraws
endf
" *** Paths {{{2
" Line formatting {{{3
fu! s:formatline(str)
	let str = a:str
	if s:itemtype == 1
		let filpath = fnamemodify(str, ':p')
		let bufnr = s:nonamecond(str, filpath)
			\ ? str2nr(matchstr(str, '[\/]\?\[\zs\d\+\ze\*No Name\]$'))
			\ : bufnr('^'.filpath.'$')
		let idc = ( bufnr == bufnr('#') ? '#' : '' )
			\ . ( getbufvar(bufnr, '&ma') ? '' : '-' )
			\ . ( getbufvar(bufnr, '&ro') ? '=' : '' )
			\ . ( getbufvar(bufnr, '&mod') ? '+' : '' )
		let str .= idc != '' ? ' '.idc : ''
	en
	let cond = s:ispath && ( s:winw - 4 ) < s:strwidth(str)
	retu '> '.( cond ? s:pathshorten(str) : str )
endf

fu! s:pathshorten(str)
	retu matchstr(a:str, '^.\{9}').'...'
		\ .matchstr(a:str, '.\{'.( s:winw - 16 ).'}$')
endf

fu! s:offset(lines, height)
	let s:offset = s:mw_order == 'btt' ? ( a:height - s:res_count ) : 0
	retu s:offset > 0 ? ( repeat([''], s:offset) + a:lines ) : a:lines
endf
" Directory completion {{{3
fu! s:dircompl(be, sd)
	if a:sd == '' | retu [] | en
	if a:be == ''
		let [be, sd] = [s:dyncwd, a:sd]
	el
		let be = a:be.s:lash(a:be)
		let sd = be.a:sd
	en
	let dirs = split(globpath(s:fnesc(be, 'g', ','), a:sd.'*/'), "\n")
	if a:be == ''
		let dirs = ctrlp#rmbasedir(dirs)
	en
	cal filter(dirs, '!match(v:val, escape(sd, ''~$.\''))'
		\ . ' && v:val !~ ''\v(^|[\/])\.{1,2}[\/]$''')
	retu dirs
endf

fu! s:findcommon(items, seed)
	let [items, id, cmn, ic] = [copy(a:items), strlen(a:seed), '', 0]
	cal map(items, 'strpart(v:val, id)')
	for char in split(items[0], '\zs')
		for item in items[1:]
			if item[ic] != char | let brk = 1 | brea | en
		endfo
		if exists('brk') | brea | en
		let cmn .= char
		let ic += 1
	endfo
	retu cmn
endf
" Misc {{{3
fu! s:headntail(str)
	let parts = split(a:str, '[\/]\ze[^\/]\+[\/:]\?$')
	retu len(parts) == 1 ? ['', parts[0]] : len(parts) == 2 ? parts : []
endf

fu! s:lash(...)
	retu ( a:0 ? a:1 : s:dyncwd ) !~ '[\/]$' ? s:lash : ''
endf

fu! s:ispathitem()
	retu s:itemtype < 3 || ( s:itemtype > 2 && s:getextvar('type') == 'path' )
endf

fu! ctrlp#igncwd(cwd)
	retu ctrlp#utils#glob(a:cwd, 0) == '' ||
		\ ( s:igntype >= 0 && s:usrign(a:cwd, getftype(a:cwd)) )
endf

fu! ctrlp#dirnfile(entries)
	let [items, cwd] = [[[], []], s:dyncwd.s:lash()]
	for each in a:entries
		let etype = getftype(each)
		if s:igntype >= 0 && s:usrign(each, etype) | con | en
		if etype == 'dir'
			if s:showhidden | if each !~ '[\/]\.\{1,2}$'
				cal add(items[0], each)
			en | el
				cal add(items[0], each)
			en
		elsei etype == 'link'
			if s:folsym
				let isfile = !isdirectory(each)
				if s:folsym == 2 || !s:samerootsyml(each, isfile, cwd)
					cal add(items[isfile], each)
				en
			en
		elsei etype == 'file'
			cal add(items[1], each)
		en
	endfo
	retu items
endf

fu! s:usrign(item, type)
	retu s:igntype == 1 ? a:item =~ s:usrign
		\ : s:igntype == 4 && has_key(s:usrign, a:type) && s:usrign[a:type] != ''
		\ ? a:item =~ s:usrign[a:type] : 0
endf

fu! s:samerootsyml(each, isfile, cwd)
	let resolve = fnamemodify(resolve(a:each), ':p:h')
	let resolve .= s:lash(resolve)
	retu !( stridx(resolve, a:cwd) && ( stridx(a:cwd, resolve) || a:isfile ) )
endf

fu! ctrlp#rmbasedir(items)
	let cwd = s:dyncwd.s:lash()
	if a:items != [] && !stridx(a:items[0], cwd)
		let idx = strlen(cwd)
		retu map(a:items, 'strpart(v:val, idx)')
	en
	retu a:items
endf
" Working directory {{{3
fu! s:getparent(item)
	let parent = substitute(a:item, '[\/][^\/]\+[\/:]\?$', '', '')
	if parent == '' || parent !~ '[\/]'
		let parent .= s:lash
	en
	retu parent
endf

fu! s:findroot(curr, mark, depth, type)
	let [depth, fnd] = [a:depth + 1, 0]
	if type(a:mark) == 1
		let fnd = s:glbpath(s:fnesc(a:curr, 'g', ','), a:mark, 1) != ''
	elsei type(a:mark) == 3
		for markr in a:mark
			if s:glbpath(s:fnesc(a:curr, 'g', ','), markr, 1) != ''
				let fnd = 1
				brea
			en
		endfo
	en
	if fnd
		if !a:type | cal ctrlp#setdir(a:curr) | en
		retu [exists('markr') ? markr : a:mark, a:curr]
	elsei depth > s:maxdepth
		cal ctrlp#setdir(s:cwd)
	el
		let parent = s:getparent(a:curr)
		if parent != a:curr
			retu s:findroot(parent, a:mark, depth, a:type)
		en
	en
	retu []
endf

fu! ctrlp#setdir(path, ...)
	let cmd = a:0 ? a:1 : 'lc!'
	sil! exe cmd s:fnesc(a:path, 'c')
	let [s:crfilerel, s:dyncwd] = [fnamemodify(s:crfile, ':.'), getcwd()]
endf
" Fallbacks {{{3
fu! s:glbpath(...)
	retu call('ctrlp#utils#globpath', a:000)
endf

fu! s:fnesc(...)
	retu call('ctrlp#utils#fnesc', a:000)
endf

fu! ctrlp#setlcdir()
	if exists('*haslocaldir')
		cal ctrlp#setdir(getcwd(), haslocaldir() ? 'lc!' : 'cd!')
	en
endf
" Highlighting {{{2
fu! ctrlp#syntax()
	if ctrlp#nosy() | retu | en
	for [ke, va] in items(s:hlgrps) | cal ctrlp#hicheck('CtrlP'.ke, va) | endfo
	if synIDattr(synIDtrans(hlID('Normal')), 'bg') !~ '^-1$\|^$'
		sil! exe 'hi CtrlPLinePre '.( has("gui_running") ? 'gui' : 'cterm' ).'fg=bg'
	en
	sy match CtrlPNoEntries '^ == NO ENTRIES ==$'
	if hlexists('CtrlPLinePre')
		sy match CtrlPLinePre '^>'
	en
endf

fu! s:highlight(pat, grp)
	if s:matcher != {} | retu | en
	cal clearmatches()
	if !empty(a:pat) && s:ispath
		let pat = s:regexp ? substitute(a:pat, '\\\@<!\^', '^> \\zs', 'g') : a:pat
		if s:byfname
			let pat = substitute(pat, '\[\^\(.\{-}\)\]\\{-}', '[^\\/\1]\\{-}', 'g')
			let pat = substitute(pat, '\$\@<!$', '\\ze[^\\/]*$', 'g')
		en
		cal matchadd(a:grp, ( s:martcs == '' ? '\c' : '\C' ).pat)
		cal matchadd('CtrlPLinePre', '^>')
	en
endf

fu! s:dohighlight()
	retu s:mathi[0] && exists('*clearmatches') && !ctrlp#nosy()
endf
" Prompt history {{{2
fu! s:gethistloc()
	let utilcadir = ctrlp#utils#cachedir()
	let cache_dir = utilcadir.s:lash(utilcadir).'hist'
	retu [cache_dir, cache_dir.s:lash(cache_dir).'cache.txt']
endf

fu! s:gethistdata()
	retu ctrlp#utils#readfile(s:gethistloc()[1])
endf

fu! ctrlp#recordhist()
	let str = join(s:prompt, '')
	if empty(str) || !s:maxhst | retu | en
	let hst = s:hstry
	if len(hst) > 1 && hst[1] == str | retu | en
	cal extend(hst, [str], 1)
	if len(hst) > s:maxhst | cal remove(hst, s:maxhst, -1) | en
	cal ctrlp#utils#writecache(hst, s:gethistloc()[0], s:gethistloc()[1])
endf
" Signs {{{2
fu! s:unmarksigns()
	if !s:dosigns() | retu | en
	for key in keys(s:marked)
		exe 'sign unplace' key 'buffer='.s:bufnr
	endfo
endf

fu! s:remarksigns()
	if !s:dosigns() | retu | en
	for ic in range(1, len(s:lines))
		let line = s:ispath ? fnamemodify(s:lines[ic - 1], ':p') : s:lines[ic - 1]
		let key = s:dictindex(s:marked, line)
		if key > 0
			exe 'sign place' key 'line='.ic.' name=ctrlpmark buffer='.s:bufnr
		en
	endfo
endf

fu! s:dosigns()
	retu exists('s:marked') && s:bufnr > 0 && s:opmul != '0' && has('signs')
endf
" Lists & Dictionaries {{{2
fu! s:ifilter(list, str)
	let [rlist, estr] = [[], substitute(a:str, 'v:val', 'each', 'g')]
	for each in a:list
		try
			if eval(estr)
				cal add(rlist, each)
			en
		cat | con | endt
	endfo
	retu rlist
endf

fu! s:dictindex(dict, expr)
	for key in keys(a:dict)
		if a:dict[key] == a:expr | retu key | en
	endfo
	retu -1
endf

fu! s:vacantdict(dict)
	retu filter(range(1, max(keys(a:dict))), '!has_key(a:dict, v:val)')
endf

fu! s:sublist(l, s, e)
	retu v:version > 701 ? a:l[(a:s):(a:e)] : s:sublist7071(a:l, a:s, a:e)
endf

fu! s:sublist7071(l, s, e)
	let [newlist, id, ae] = [[], a:s, a:e == -1 ? len(a:l) - 1 : a:e]
	wh id <= ae
		cal add(newlist, get(a:l, id))
		let id += 1
	endw
	retu newlist
endf
" Buffers {{{2
fu! s:buftab(bufnr, md)
	for tabnr in range(1, tabpagenr('$'))
		if tabpagenr() == tabnr && a:md == 't' | con | en
		let buflist = tabpagebuflist(tabnr)
		if index(buflist, a:bufnr) >= 0
			for winnr in range(1, tabpagewinnr(tabnr, '$'))
				if buflist[winnr - 1] == a:bufnr | retu [tabnr, winnr] | en
			endfo
		en
	endfo
	retu [0, 0]
endf

fu! s:bufwins(bufnr)
	let winns = 0
	for tabnr in range(1, tabpagenr('$'))
		let winns += count(tabpagebuflist(tabnr), a:bufnr)
	endfo
	retu winns
endf

fu! s:nonamecond(str, filpath)
	retu a:str =~ '[\/]\?\[\d\+\*No Name\]$' && !filereadable(a:filpath)
		\ && bufnr('^'.a:filpath.'$') < 1
endf

fu! ctrlp#normcmd(cmd, ...)
	if a:0 < 2 && s:nosplit() | retu a:cmd | en
	let norwins = filter(range(1, winnr('$')),
		\ 'empty(getbufvar(winbufnr(v:val), "&bt"))')
	for each in norwins
		let bufnr = winbufnr(each)
		if empty(bufname(bufnr)) && empty(getbufvar(bufnr, '&ft'))
			let fstemp = each | brea
		en
	endfo
	let norwin = empty(norwins) ? 0 : norwins[0]
	if norwin
		if index(norwins, winnr()) < 0
			exe ( exists('fstemp') ? fstemp : norwin ).'winc w'
		en
		retu a:cmd
	en
	retu a:0 ? a:1 : 'bo vne'
endf

fu! ctrlp#modfilecond(w)
	retu &mod && !&hid && &bh != 'hide' && s:bufwins(bufnr('%')) == 1 && !&cf &&
		\ ( ( !&awa && a:w ) || filewritable(fnamemodify(bufname('%'), ':p')) != 1 )
endf

fu! s:nosplit()
	retu !empty(s:nosplit) && match([bufname('%'), &l:ft, &l:bt], s:nosplit) >= 0
endf

fu! s:setupblank()
	setl noswf nonu nobl nowrap nolist nospell nocuc wfh
	setl fdc=0 fdl=99 tw=0 bt=nofile bh=unload
	if v:version > 702
		setl nornu noudf cc=0
	en
endf

fu! s:leavepre()
	if exists('s:bufnr') && s:bufnr == bufnr('%') | bw! | en
	if !( exists(s:ccex) && !{s:ccex} )
		\ && !( has('clientserver') && len(split(serverlist(), "\n")) > 1 )
		cal ctrlp#clra()
	en
endf

fu! s:checkbuf()
	if !exists('s:init') && exists('s:bufnr') && s:bufnr > 0
		exe s:bufnr.'bw!'
	en
endf

fu! s:iscmdwin()
	let ermsg = v:errmsg
	sil! noa winc p
	sil! noa winc p
	let [v:errmsg, ermsg] = [ermsg, v:errmsg]
	retu ermsg =~ '^E11:'
endf
" Arguments {{{2
fu! s:at(str)
	if a:str =~ '\v^\@(cd|lc[hd]?|chd).*'
		let str = substitute(a:str, '\v^\@(cd|lc[hd]?|chd)\s*', '', '')
		if str == '' | retu 1 | en
		let str = str =~ '^%:.\+' ? fnamemodify(s:crfile, str[1:]) : str
		let path = fnamemodify(expand(str, 1), ':p')
		if isdirectory(path)
			if path != s:dyncwd
				cal ctrlp#setdir(path)
				cal ctrlp#setlines()
			en
			cal ctrlp#recordhist()
			cal s:PrtClear()
		en
		retu 1
	en
	retu 0
endf

fu! s:tail()
	if exists('s:optail') && !empty('s:optail')
		let tailpref = s:optail !~ '^\s*+' ? ' +' : ' '
		retu tailpref.s:optail
	en
	retu ''
endf

fu! s:sanstail(str)
	let str = s:spi ?
		\ substitute(a:str, '^\(@.*$\|\\\\\ze@\|\.\.\zs[.\/]\+$\)', '', 'g') : a:str
	let [str, pat] = [substitute(str, '\\\\', '\', 'g'), '\([^:]\|\\:\)*$']
	unl! s:optail
	if str =~ '\\\@<!:'.pat
		let s:optail = matchstr(str, '\\\@<!:\zs'.pat)
		let str = substitute(str, '\\\@<!:'.pat, '', '')
	en
	retu substitute(str, '\\\ze:', '', 'g')
endf

fu! s:argmaps(md, i)
	let roh = [
		\ ['Open Multiple Files', '/h[i]dden/[c]lear', ['i', 'c']],
		\ ['Create a New File', '/[r]eplace', ['r']],
		\ ['Open Selected', '/[r]eplace', ['r', 'd', 'a']],
		\ ]
	if a:i == 2
		if !buflisted(bufnr('^'.fnamemodify(ctrlp#getcline(), ':p').'$'))
			let roh[2][1] .= '/h[i]dden'
			let roh[2][2] += ['i']
		en
		if s:openfunc != {} && has_key(s:openfunc, s:ctype)
			let roh[2][1] .= '/e[x]ternal'
			let roh[2][2] += ['x']
		en
	en
	let str = roh[a:i][0].': [t]ab/[v]ertical/[h]orizontal'.roh[a:i][1].'? '
	retu s:choices(str, ['t', 'v', 'h'] + roh[a:i][2], 's:argmaps', [a:md, a:i])
endf

fu! s:insertstr()
	let str = 'Insert: c[w]ord/c[f]ile/[s]earch/[v]isual/[c]lipboard/[r]egister? '
	retu s:choices(str, ['w', 'f', 's', 'v', 'c', 'r'], 's:insertstr', [])
endf

fu! s:textdialog(str)
	redr | echoh MoreMsg | echon a:str | echoh None
	retu nr2char(getchar())
endf

fu! s:choices(str, choices, func, args)
	let char = s:textdialog(a:str)
	if index(a:choices, char) >= 0
		retu char
	elsei char =~# "\\v\<Esc>|\<C-c>|\<C-g>|\<C-u>|\<C-w>|\<C-[>"
		cal s:BuildPrompt(0)
		retu 'cancel'
	elsei char =~# "\<CR>" && a:args != []
		retu a:args[0]
	en
	retu call(a:func, a:args)
endf

fu! s:getregs()
	let char = s:textdialog('Insert from register: ')
	if char =~# "\\v\<Esc>|\<C-c>|\<C-g>|\<C-u>|\<C-w>|\<C-[>"
		cal s:BuildPrompt(0)
		retu -1
	elsei char =~# "\<CR>"
		retu s:getregs()
	en
	retu s:regisfilter(char)
endf

fu! s:regisfilter(reg)
	retu substitute(getreg(a:reg), "[\t\n]", ' ', 'g')
endf
" Misc {{{2
fu! s:modevar()
	let s:matchtype = s:mtype()
	let s:ispath = s:ispathitem()
	let s:mfunc = s:mfunc()
	let s:nolim = s:getextvar('nolim')
	let s:dosort = s:getextvar('sort')
	let s:spi = !s:itemtype || s:getextvar('specinput') > 0
endf

fu! s:nosort()
	retu s:matcher != {} || s:nolim == 1 || ( s:itemtype == 2 && s:mrudef )
		\ || ( s:itemtype =~ '\v^(1|2)$' && s:prompt == ['', '', ''] ) || !s:dosort
endf

fu! s:byfname()
	retu s:ispath && s:byfname
endf

fu! s:narrowable()
	retu exists('s:act_add') && exists('s:matched') && s:matched != []
		\ && exists('s:mdata') && s:mdata[:2] == [s:dyncwd, s:itemtype, s:regexp]
		\ && s:matcher == {} && !exists('s:did_exp')
endf

fu! s:getinput(...)
	let [prt, spi] = [s:prompt, ( a:0 ? a:1 : '' )]
	if s:abbrev != {}
		let gmd = has_key(s:abbrev, 'gmode') ? s:abbrev['gmode'] : ''
		let str = ( gmd =~ 't' && !a:0 ) || spi == 'c' ? prt[0] : join(prt, '')
		if gmd =~ 't' && gmd =~ 'k' && !a:0 && matchstr(str, '.$') =~ '\k'
			retu join(prt, '')
		en
		let [pf, rz] = [( s:byfname() ? 'f' : 'p' ), ( s:regexp ? 'r' : 'z' )]
		for dict in s:abbrev['abbrevs']
			let dmd = has_key(dict, 'mode') ? dict['mode'] : ''
			let pat = escape(dict['pattern'], '~')
			if ( dmd == '' || ( dmd =~ pf && dmd =~ rz && !a:0 )
				\ || dmd =~ '['.spi.']' ) && str =~ pat
				let [str, s:did_exp] = [join(split(str, pat, 1), dict['expanded']), 1]
			en
		endfo
		if gmd =~ 't' && !a:0
			let prt[0] = str
		el
			retu str
		en
	en
	retu spi == 'c' ? prt[0] : join(prt, '')
endf

fu! s:migemo(str)
	let [str, rtp] = [a:str, s:fnesc(&rtp, 'g')]
	let dict = s:glbpath(rtp, printf("dict/%s/migemo-dict", &enc), 1)
	if !len(dict)
		let dict = s:glbpath(rtp, "dict/migemo-dict", 1)
	en
	if len(dict)
		let [tokens, str, cmd] = [split(str, '\s'), '', 'cmigemo -v -w %s -d %s']
		for token in tokens
			let rtn = system(printf(cmd, shellescape(token), shellescape(dict)))
			let str .= !v:shell_error && strlen(rtn) > 0 ? '.*'.rtn : token
		endfo
	en
	retu str
endf

fu! s:strwidth(str)
	retu exists('*strdisplaywidth') ? strdisplaywidth(a:str) : strlen(a:str)
endf

fu! ctrlp#j2l(nr)
	exe 'norm!' a:nr.'G'
	sil! norm! zvzz
endf

fu! s:maxf(len)
	retu s:maxfiles && a:len > s:maxfiles
endf

fu! s:regexfilter(str)
	let str = a:str
	for key in keys(s:fpats) | if str =~ key
		let str = substitute(str, s:fpats[key], '', 'g')
	en | endfo
	retu str
endf

fu! s:walker(m, p, d)
	retu a:d >= 0 ? a:p < a:m ? a:p + a:d : 0 : a:p > 0 ? a:p + a:d : a:m
endf

fu! s:delent(rfunc)
	if a:rfunc == '' | retu | en
	let [s:force, tbrem] = [1, []]
	if exists('s:marked')
		let tbrem = values(s:marked)
		cal s:unmarksigns()
		unl s:marked
	en
	if tbrem == [] && ( has('dialog_gui') || has('dialog_con') ) &&
		\ confirm("Wipe all entries?", "&OK\n&Cancel") != 1
		unl s:force
		cal s:BuildPrompt(0)
		retu
	en
	let g:ctrlp_lines = call(a:rfunc, [tbrem])
	cal s:BuildPrompt(1)
	unl s:force
endf
" Entering & Exiting {{{2
fu! s:getenv()
	let [s:cwd, s:winres] = [getcwd(), [winrestcmd(), &lines, winnr('$')]]
	let [s:crword, s:crnbword] = [expand('<cword>', 1), expand('<cWORD>', 1)]
	let [s:crgfile, s:crline] = [expand('<cfile>', 1), getline('.')]
	let [s:winmaxh, s:crcursor] = [min([s:mw_max, &lines]), getpos('.')]
	let [s:crbufnr, s:crvisual] = [bufnr('%'), s:lastvisual()]
	let s:crfile = bufname('%') == ''
		\ ? '['.s:crbufnr.'*No Name]' : expand('%:p', 1)
	let s:crfpath = expand('%:p:h', 1)
	let s:mrbs = ctrlp#mrufiles#bufs()
endf

fu! s:lastvisual()
	let cview = winsaveview()
	let [ovreg, ovtype] = [getreg('v'), getregtype('v')]
	let [oureg, outype] = [getreg('"'), getregtype('"')]
	sil! norm! gv"vy
	let selected = s:regisfilter('v')
	cal setreg('v', ovreg, ovtype)
	cal setreg('"', oureg, outype)
	cal winrestview(cview)
	retu selected
endf

fu! s:log(m)
	if exists('g:ctrlp_log') && g:ctrlp_log | if a:m
		let cadir = ctrlp#utils#cachedir()
		let apd = g:ctrlp_log > 1 ? '>' : ''
		sil! exe 'redi! >'.apd cadir.s:lash(cadir).'ctrlp.log'
	el
		sil! redi END
	en | en
endf

fu! s:buffunc(e)
	if a:e && has_key(s:buffunc, 'enter')
		cal call(s:buffunc['enter'], [], s:buffunc)
	elsei !a:e && has_key(s:buffunc, 'exit')
		cal call(s:buffunc['exit'], [], s:buffunc)
	en
endf

fu! s:openfile(cmd, fid, tail, chkmod, ...)
	let cmd = a:cmd
	if a:chkmod && cmd =~ '^[eb]$' && ctrlp#modfilecond(!( cmd == 'b' && &aw ))
		let cmd = cmd == 'b' ? 'sb' : 'sp'
	en
	let cmd = cmd =~ '^tab' ? ctrlp#tabcount().cmd : cmd
	let j2l = a:0 && a:1[0] ? a:1[1] : 0
	exe cmd.( a:0 && a:1[0] ? '' : a:tail ) s:fnesc(a:fid, 'f')
	if j2l
		cal ctrlp#j2l(j2l)
	en
	if !empty(a:tail)
		sil! norm! zvzz
	en
	if cmd != 'bad'
		cal ctrlp#setlcdir()
	en
endf

fu! ctrlp#tabcount()
	if exists('s:tabct')
		let tabct = s:tabct
		let s:tabct += 1
	elsei !type(s:tabpage)
		let tabct = s:tabpage
	elsei type(s:tabpage) == 1
		let tabpos =
			\ s:tabpage =~ 'c' ? tabpagenr() :
			\ s:tabpage =~ 'f' ? 1 :
			\ s:tabpage =~ 'l' ? tabpagenr('$') :
			\ tabpagenr()
		let tabct =
			\ s:tabpage =~ 'a' ? tabpos :
			\ s:tabpage =~ 'b' ? tabpos - 1 :
			\ tabpos
	en
	retu tabct < 0 ? 0 : tabct
endf

fu! s:settype(type)
	retu a:type < 0 ? exists('s:itemtype') ? s:itemtype : 0 : a:type
endf
" Matching {{{2
fu! s:matchfname(item, pat)
	let parts = split(a:item, '[\/]\ze[^\/]\+$')
	let mfn = match(parts[-1], a:pat[0])
	retu len(a:pat) == 1 ? mfn : len(a:pat) == 2 ?
		\ ( mfn >= 0 && ( len(parts) == 2 ? match(parts[0], a:pat[1]) : -1 ) >= 0
		\ ? 0 : -1 ) : -1
	en
endf

fu! s:matchtabs(item, pat)
	retu match(split(a:item, '\t\+')[0], a:pat)
endf

fu! s:matchtabe(item, pat)
	retu match(split(a:item, '\t\+[^\t]\+$')[0], a:pat)
endf

fu! s:buildpat(lst)
	let pat = a:lst[0]
	for item in range(1, len(a:lst) - 1)
		let pat .= '[^'.a:lst[item - 1].']\{-}'.a:lst[item]
	endfo
	retu pat
endf

fu! s:mfunc()
	let mfunc = 'match'
	if s:byfname()
		let mfunc = 's:matchfname'
	elsei s:itemtype > 2
		let matchtypes = { 'tabs': 's:matchtabs', 'tabe': 's:matchtabe' }
		if has_key(matchtypes, s:matchtype)
			let mfunc = matchtypes[s:matchtype]
		en
	en
	retu mfunc
endf

fu! s:mmode()
	let matchmodes = {
		\ 'match': 'full-line',
		\ 's:matchfname': 'filename-only',
		\ 's:matchtabs': 'first-non-tab',
		\ 's:matchtabe': 'until-last-tab',
		\ }
	retu matchmodes[s:mfunc]
endf
" Cache {{{2
fu! s:writecache(cafile)
	if ( g:ctrlp_newcache || !filereadable(a:cafile) ) && !s:nocache()
		cal ctrlp#utils#writecache(g:ctrlp_allfiles)
		let g:ctrlp_newcache = 0
	en
endf

fu! s:nocache(...)
	if !s:caching
		retu 1
	elsei s:caching > 1
		if !( exists(s:ccex) && !{s:ccex} ) || has_key(s:ficounts, s:dyncwd)
			retu get(s:ficounts, s:dyncwd, [0, 0])[0] < s:caching
		elsei a:0 && filereadable(a:1)
			retu len(ctrlp#utils#readfile(a:1)) < s:caching
		en
		retu 1
	en
	retu 0
endf

fu! s:insertcache(str)
	let [data, g:ctrlp_newcache, str] = [g:ctrlp_allfiles, 1, a:str]
	if data == [] || strlen(str) <= strlen(data[0])
		let pos = 0
	elsei strlen(str) >= strlen(data[-1])
		let pos = len(data) - 1
	el
		let pos = 0
		for each in data
			if strlen(each) > strlen(str) | brea | en
			let pos += 1
		endfo
	en
	cal insert(data, str, pos)
	cal s:writecache(ctrlp#utils#cachefile())
endf
" Extensions {{{2
fu! s:mtype()
	retu s:itemtype > 2 ? s:getextvar('type') : 'path'
endf

fu! s:execextvar(key)
	if !empty(g:ctrlp_ext_vars)
		cal map(filter(copy(g:ctrlp_ext_vars),
			\ 'has_key(v:val, a:key)'), 'eval(v:val[a:key])')
	en
endf

fu! s:getextvar(key)
	if s:itemtype > 2
		let vars = g:ctrlp_ext_vars[s:itemtype - 3]
		retu has_key(vars, a:key) ? vars[a:key] : -1
	en
	retu -1
endf

fu! ctrlp#getcline()
	let [linenr, offset] = [line('.'), ( s:offset > 0 ? s:offset : 0 )]
	retu !empty(s:lines) && !( offset && linenr <= offset )
		\ ? s:lines[linenr - 1 - offset] : ''
endf

fu! ctrlp#getmarkedlist()
	retu exists('s:marked') ? values(s:marked) : []
endf

fu! ctrlp#exit()
	cal s:PrtExit()
endf

fu! ctrlp#prtclear()
	cal s:PrtClear()
endf

fu! ctrlp#switchtype(id)
	cal s:ToggleType(a:id - s:itemtype)
endf

fu! ctrlp#nosy()
	retu !( has('syntax') && exists('g:syntax_on') )
endf

fu! ctrlp#hicheck(grp, defgrp)
	if !hlexists(a:grp)
		exe 'hi link' a:grp a:defgrp
	en
endf

fu! ctrlp#call(func, ...)
	retu call(a:func, a:000)
endf

fu! ctrlp#getvar(var)
	retu {a:var}
endf
"}}}1
" * Initialization {{{1
fu! ctrlp#setlines(...)
	if a:0 | let s:itemtype = a:1 | en
	cal s:modevar()
	let types = ['ctrlp#files()', 'ctrlp#buffers()', 'ctrlp#mrufiles#list()']
	if !empty(g:ctrlp_ext_vars)
		cal map(copy(g:ctrlp_ext_vars), 'add(types, v:val["init"])')
	en
	let g:ctrlp_lines = eval(types[s:itemtype])
endf

fu! ctrlp#init(type, ...)
	if exists('s:init') || s:iscmdwin() | retu | en
	let [s:ermsg, v:errmsg] = [v:errmsg, '']
	let [s:matches, s:init] = [1, 1]
	cal s:Reset(a:0 ? a:1 : {})
	noa cal s:Open()
	cal s:SetWD(a:0 ? a:1 : {})
	cal s:MapNorms()
	cal s:MapSpecs()
	cal ctrlp#syntax()
	cal ctrlp#setlines(s:settype(a:type))
	cal s:SetDefTxt()
	cal s:BuildPrompt(1)
	if s:keyloop | cal s:KeyLoop() | en
endf
" - Autocmds {{{1
if has('autocmd')
	aug CtrlPAug
		au!
		au BufEnter ControlP cal s:checkbuf()
		au BufLeave ControlP noa cal s:Close()
		au VimLeavePre * cal s:leavepre()
	aug END
en

fu! s:autocmds()
	if !has('autocmd') | retu | en
	if exists('#CtrlPLazy')
		au! CtrlPLazy
	en
	if s:lazy
		aug CtrlPLazy
			au!
			au CursorHold ControlP cal s:ForceUpdate()
		aug END
	en
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                                                                                                                                                                                                                                                                                                                                                                                                .vim/autoload/ctrlp/tag.vim                                                                         000644  000765  000024  00000006606 12626714374 017101  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/tag.vim
" Description:   Tag file extension
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Init {{{1
if exists('g:loaded_ctrlp_tag') && g:loaded_ctrlp_tag
	fini
en
let g:loaded_ctrlp_tag = 1

cal add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#tag#init()',
	\ 'accept': 'ctrlp#tag#accept',
	\ 'lname': 'tags',
	\ 'sname': 'tag',
	\ 'enter': 'ctrlp#tag#enter()',
	\ 'type': 'tabs',
	\ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
" Utilities {{{1
fu! s:findcount(str)
	let [tg, ofname] = split(a:str, '\t\+\ze[^\t]\+$')
	let tgs = taglist('^'.tg.'$')
	if len(tgs) < 2
		retu [0, 0, 0, 0]
	en
	let bname = fnamemodify(bufname('%'), ':p')
	let fname = expand(fnamemodify(simplify(ofname), ':s?^[.\/]\+??:p:.'), 1)
	let [fnd, cnt, pos, ctgs, otgs] = [0, 0, 0, [], []]
	for tgi in tgs
		let lst = bname == fnamemodify(tgi["filename"], ':p') ? 'ctgs' : 'otgs'
		cal call('add', [{lst}, tgi])
	endfo
	let ntgs = ctgs + otgs
	for tgi in ntgs
		let cnt += 1
		let fulname = fnamemodify(tgi["filename"], ':p')
		if stridx(fulname, fname) >= 0
			\ && strlen(fname) + stridx(fulname, fname) == strlen(fulname)
			let fnd += 1
			let pos = cnt
		en
	endfo
	let cnt = 0
	for tgi in ntgs
		let cnt += 1
		if tgi["filename"] == ofname
			let [fnd, pos] = [0, cnt]
		en
	endfo
	retu [1, fnd, pos, len(ctgs)]
endf

fu! s:filter(tags)
	let nr = 0
	wh 0 < 1
		if a:tags == [] | brea | en
		if a:tags[nr] =~ '^!' && a:tags[nr] !~# '^!_TAG_'
			let nr += 1
			con
		en
		if a:tags[nr] =~# '^!_TAG_' && len(a:tags) > nr
			cal remove(a:tags, nr)
		el
			brea
		en
	endw
	retu a:tags
endf

fu! s:syntax()
	if !ctrlp#nosy()
		cal ctrlp#hicheck('CtrlPTabExtra', 'Comment')
		sy match CtrlPTabExtra '\zs\t.*\ze$'
	en
endf
" Public {{{1
fu! ctrlp#tag#init()
	if empty(s:tagfiles) | retu [] | en
	let g:ctrlp_alltags = []
	let tagfiles = sort(filter(s:tagfiles, 'count(s:tagfiles, v:val) == 1'))
	for each in tagfiles
		let alltags = s:filter(ctrlp#utils#readfile(each))
		cal extend(g:ctrlp_alltags, alltags)
	endfo
	cal s:syntax()
	retu g:ctrlp_alltags
endf

fu! ctrlp#tag#accept(mode, str)
	cal ctrlp#exit()
	let str = matchstr(a:str, '^[^\t]\+\t\+[^\t]\+\ze\t')
	let [tg, fdcnt] = [split(str, '^[^\t]\+\zs\t')[0], s:findcount(str)]
	let cmds = {
		\ 't': ['tab sp', 'tab stj'],
		\ 'h': ['sp', 'stj'],
		\ 'v': ['vs', 'vert stj'],
		\ 'e': ['', 'tj'],
		\ }
	let utg = fdcnt[3] < 2 && fdcnt[0] == 1 && fdcnt[1] == 1
	let cmd = !fdcnt[0] || utg ? cmds[a:mode][0] : cmds[a:mode][1]
	let cmd = a:mode == 'e' && ctrlp#modfilecond(!&aw)
		\ ? ( cmd == 'tj' ? 'stj' : 'sp' ) : cmd
	let cmd = a:mode == 't' ? ctrlp#tabcount().cmd : cmd
	if !fdcnt[0] || utg
		if cmd != ''
			exe cmd
		en
		let save_cst = &cst
		set cst&
		cal feedkeys(":".( utg ? fdcnt[2] : "" )."ta ".tg."\r", 'nt')
		let &cst = save_cst
	el
		let ext = ""
		if fdcnt[1] < 2 && fdcnt[2]
			let [sav_more, &more] = [&more, 0]
			let ext = fdcnt[2]."\r".":let &more = ".sav_more."\r"
		en
		cal feedkeys(":".cmd." ".tg."\r".ext, 'nt')
	en
	cal ctrlp#setlcdir()
endf

fu! ctrlp#tag#id()
	retu s:id
endf

fu! ctrlp#tag#enter()
	let tfs = tagfiles()
	let s:tagfiles = tfs != [] ? filter(map(tfs, 'fnamemodify(v:val, ":p")'),
		\ 'filereadable(v:val)') : []
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                                                                                                          .vim/autoload/ctrlp/dir.vim                                                                         000644  000765  000024  00000005221 12626714374 017074  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/dir.vim
" Description:   Directory extension
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Init {{{1
if exists('g:loaded_ctrlp_dir') && g:loaded_ctrlp_dir
	fini
en
let [g:loaded_ctrlp_dir, g:ctrlp_newdir] = [1, 0]

let s:ars = ['s:maxdepth', 's:maxfiles', 's:compare_lim', 's:glob', 's:caching']

cal add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#dir#init('.join(s:ars, ', ').')',
	\ 'accept': 'ctrlp#dir#accept',
	\ 'lname': 'dirs',
	\ 'sname': 'dir',
	\ 'type': 'path',
	\ 'specinput': 1,
	\ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

let s:dircounts = {}
" Utilities {{{1
fu! s:globdirs(dirs, depth)
	let entries = split(globpath(a:dirs, s:glob), "\n")
	let [dirs, depth] = [ctrlp#dirnfile(entries)[0], a:depth + 1]
	cal extend(g:ctrlp_alldirs, dirs)
	let nr = len(g:ctrlp_alldirs)
	if !empty(dirs) && !s:max(nr, s:maxfiles) && depth <= s:maxdepth
		sil! cal ctrlp#progress(nr)
		cal map(dirs, 'ctrlp#utils#fnesc(v:val, "g", ",")')
		cal s:globdirs(join(dirs, ','), depth)
	en
endf

fu! s:max(len, max)
	retu a:max && a:len > a:max
endf

fu! s:nocache()
	retu !s:caching || ( s:caching > 1 && get(s:dircounts, s:cwd) < s:caching )
endf
" Public {{{1
fu! ctrlp#dir#init(...)
	let s:cwd = getcwd()
	for each in range(len(s:ars))
		let {s:ars[each]} = a:{each + 1}
	endfo
	let cadir = ctrlp#utils#cachedir().ctrlp#utils#lash().'dir'
	let cafile = cadir.ctrlp#utils#lash().ctrlp#utils#cachefile('dir')
	if g:ctrlp_newdir || s:nocache() || !filereadable(cafile)
		let [s:initcwd, g:ctrlp_alldirs] = [s:cwd, []]
		if !ctrlp#igncwd(s:cwd)
			cal s:globdirs(ctrlp#utils#fnesc(s:cwd, 'g', ','), 0)
		en
		cal ctrlp#rmbasedir(g:ctrlp_alldirs)
		if len(g:ctrlp_alldirs) <= s:compare_lim
			cal sort(g:ctrlp_alldirs, 'ctrlp#complen')
		en
		cal ctrlp#utils#writecache(g:ctrlp_alldirs, cadir, cafile)
		let g:ctrlp_newdir = 0
	el
		if !( exists('s:initcwd') && s:initcwd == s:cwd )
			let s:initcwd = s:cwd
			let g:ctrlp_alldirs = ctrlp#utils#readfile(cafile)
		en
	en
	cal extend(s:dircounts, { s:cwd : len(g:ctrlp_alldirs) })
	retu g:ctrlp_alldirs
endf

fu! ctrlp#dir#accept(mode, str)
	let path = a:mode == 'h' ? getcwd() : s:cwd.ctrlp#call('s:lash', s:cwd).a:str
	if a:mode =~ 't\|v\|h'
		cal ctrlp#exit()
	en
	cal ctrlp#setdir(path, a:mode =~ 't\|h' ? 'chd!' : 'lc!')
	if a:mode == 'e'
		sil! cal ctrlp#statusline()
		cal ctrlp#setlines(s:id)
		cal ctrlp#recordhist()
		cal ctrlp#prtclear()
	en
endf

fu! ctrlp#dir#id()
	retu s:id
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                                                                                                                                                                                                                                                                                                                                                               .vim/autoload/ctrlp/buffertag.vim                                                                   000644  000765  000024  00000016156 12626714374 020274  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/buffertag.vim
" Description:   Buffer Tag extension
" Maintainer:    Kien Nguyen <github.com/kien>
" Credits:       Much of the code was taken from tagbar.vim by Jan Larres, plus
"                a few lines from taglist.vim by Yegappan Lakshmanan and from
"                buffertag.vim by Takeshi Nishida.
" =============================================================================

" Init {{{1
if exists('g:loaded_ctrlp_buftag') && g:loaded_ctrlp_buftag
	fini
en
let g:loaded_ctrlp_buftag = 1

cal add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#buffertag#init(s:crfile)',
	\ 'accept': 'ctrlp#buffertag#accept',
	\ 'lname': 'buffer tags',
	\ 'sname': 'bft',
	\ 'exit': 'ctrlp#buffertag#exit()',
	\ 'type': 'tabs',
	\ 'opts': 'ctrlp#buffertag#opts()',
	\ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

let [s:pref, s:opts] = ['g:ctrlp_buftag_', {
	\ 'systemenc': ['s:enc', &enc],
	\ 'ctags_bin': ['s:bin', ''],
	\ 'types': ['s:usr_types', {}],
	\ }]

let s:bins = [
	\ 'ctags-exuberant',
	\ 'exuberant-ctags',
	\ 'exctags',
	\ '/usr/local/bin/ctags',
	\ '/opt/local/bin/ctags',
	\ 'ctags',
	\ 'ctags.exe',
	\ 'tags',
	\ ]

let s:types = {
	\ 'asm'    : '%sasm%sasm%sdlmt',
	\ 'aspperl': '%sasp%sasp%sfsv',
	\ 'aspvbs' : '%sasp%sasp%sfsv',
	\ 'awk'    : '%sawk%sawk%sf',
	\ 'beta'   : '%sbeta%sbeta%sfsv',
	\ 'c'      : '%sc%sc%sdgsutvf',
	\ 'cpp'    : '%sc++%sc++%snvdtcgsuf',
	\ 'cs'     : '%sc#%sc#%sdtncEgsipm',
	\ 'cobol'  : '%scobol%scobol%sdfgpPs',
	\ 'eiffel' : '%seiffel%seiffel%scf',
	\ 'erlang' : '%serlang%serlang%sdrmf',
	\ 'expect' : '%stcl%stcl%scfp',
	\ 'fortran': '%sfortran%sfortran%spbceiklmntvfs',
	\ 'html'   : '%shtml%shtml%saf',
	\ 'java'   : '%sjava%sjava%spcifm',
	\ 'javascript': '%sjavascript%sjavascript%sf',
	\ 'lisp'   : '%slisp%slisp%sf',
	\ 'lua'    : '%slua%slua%sf',
	\ 'make'   : '%smake%smake%sm',
	\ 'ocaml'  : '%socaml%socaml%scmMvtfCre',
	\ 'pascal' : '%spascal%spascal%sfp',
	\ 'perl'   : '%sperl%sperl%sclps',
	\ 'php'    : '%sphp%sphp%scdvf',
	\ 'python' : '%spython%spython%scmf',
	\ 'rexx'   : '%srexx%srexx%ss',
	\ 'ruby'   : '%sruby%sruby%scfFm',
	\ 'scheme' : '%sscheme%sscheme%ssf',
	\ 'sh'     : '%ssh%ssh%sf',
	\ 'csh'    : '%ssh%ssh%sf',
	\ 'zsh'    : '%ssh%ssh%sf',
	\ 'slang'  : '%sslang%sslang%snf',
	\ 'sml'    : '%ssml%ssml%secsrtvf',
	\ 'sql'    : '%ssql%ssql%scFPrstTvfp',
	\ 'tcl'    : '%stcl%stcl%scfmp',
	\ 'vera'   : '%svera%svera%scdefgmpPtTvx',
	\ 'verilog': '%sverilog%sverilog%smcPertwpvf',
	\ 'vim'    : '%svim%svim%savf',
	\ 'yacc'   : '%syacc%syacc%sl',
	\ }

cal map(s:types, 'printf(v:val, "--language-force=", " --", "-types=")')

if executable('jsctags')
	cal extend(s:types, { 'javascript': { 'args': '-f -', 'bin': 'jsctags' } })
en

fu! ctrlp#buffertag#opts()
	for [ke, va] in items(s:opts)
		let {va[0]} = exists(s:pref.ke) ? {s:pref.ke} : va[1]
	endfo
	" Ctags bin
	if empty(s:bin)
		for bin in s:bins | if executable(bin)
			let s:bin = bin
			brea
		en | endfo
	el
		let s:bin = expand(s:bin, 1)
	en
	" Types
	cal extend(s:types, s:usr_types)
endf
" Utilities {{{1
fu! s:validfile(fname, ftype)
	if ( !empty(a:fname) || !empty(a:ftype) ) && filereadable(a:fname)
		\ && index(keys(s:types), a:ftype) >= 0 | retu 1 | en
	retu 0
endf

fu! s:exectags(cmd)
	if exists('+ssl')
		let [ssl, &ssl] = [&ssl, 0]
	en
	if &sh =~ 'cmd\.exe'
		let [sxq, &sxq, shcf, &shcf] = [&sxq, '"', &shcf, '/s /c']
	en
	let output = system(a:cmd)
	if &sh =~ 'cmd\.exe'
		let [&sxq, &shcf] = [sxq, shcf]
	en
	if exists('+ssl')
		let &ssl = ssl
	en
	retu output
endf

fu! s:exectagsonfile(fname, ftype)
	let [ags, ft] = ['-f - --sort=no --excmd=pattern --fields=nKs ', a:ftype]
	if type(s:types[ft]) == 1
		let ags .= s:types[ft]
		let bin = s:bin
	elsei type(s:types[ft]) == 4
		let ags = s:types[ft]['args']
		let bin = expand(s:types[ft]['bin'], 1)
	en
	if empty(bin) | retu '' | en
	let cmd = s:esctagscmd(bin, ags, a:fname)
	if empty(cmd) | retu '' | en
	let output = s:exectags(cmd)
	if v:shell_error || output =~ 'Warning: cannot open' | retu '' | en
	retu output
endf

fu! s:esctagscmd(bin, args, ...)
	if exists('+ssl')
		let [ssl, &ssl] = [&ssl, 0]
	en
	let fname = a:0 ? shellescape(a:1) : ''
	let cmd = shellescape(a:bin).' '.a:args.' '.fname
	if &sh =~ 'cmd\.exe'
		let cmd = substitute(cmd, '[&()@^<>|]', '^\0', 'g')
	en
	if exists('+ssl')
		let &ssl = ssl
	en
	if has('iconv')
		let last = s:enc != &enc ? s:enc : !empty( $LANG ) ? $LANG : &enc
		let cmd = iconv(cmd, &enc, last)
	en
	retu cmd
endf

fu! s:process(fname, ftype)
	if !s:validfile(a:fname, a:ftype) | retu [] | endif
	let ftime = getftime(a:fname)
	if has_key(g:ctrlp_buftags, a:fname)
		\ && g:ctrlp_buftags[a:fname]['time'] >= ftime
		let lines = g:ctrlp_buftags[a:fname]['lines']
	el
		let data = s:exectagsonfile(a:fname, a:ftype)
		let [raw, lines] = [split(data, '\n\+'), []]
		for line in raw
			if line !~# '^!_TAG_' && len(split(line, ';"')) == 2
				let parsed_line = s:parseline(line)
				if parsed_line != ''
					cal add(lines, parsed_line)
				en
			en
		endfo
		let cache = { a:fname : { 'time': ftime, 'lines': lines } }
		cal extend(g:ctrlp_buftags, cache)
	en
	retu lines
endf

fu! s:parseline(line)
	let vals = matchlist(a:line,
		\ '\v^([^\t]+)\t(.+)\t[?/]\^?(.{-1,})\$?[?/]\;\"\t(.+)\tline(no)?\:(\d+)')
	if vals == [] | retu '' | en
	let [bufnr, bufname] = [bufnr('^'.vals[2].'$'), fnamemodify(vals[2], ':p:t')]
	retu vals[1].'	'.vals[4].'|'.bufnr.':'.bufname.'|'.vals[6].'| '.vals[3]
endf

fu! s:syntax()
	if !ctrlp#nosy()
		cal ctrlp#hicheck('CtrlPTagKind', 'Title')
		cal ctrlp#hicheck('CtrlPBufName', 'Directory')
		cal ctrlp#hicheck('CtrlPTabExtra', 'Comment')
		sy match CtrlPTagKind '\zs[^\t|]\+\ze|\d\+:[^|]\+|\d\+|'
		sy match CtrlPBufName '|\d\+:\zs[^|]\+\ze|\d\+|'
		sy match CtrlPTabExtra '\zs\t.*\ze$' contains=CtrlPBufName,CtrlPTagKind
	en
endf

fu! s:chknearby(pat)
	if match(getline('.'), a:pat) < 0
		let [int, forw, maxl] = [1, 1, line('$')]
		wh !search(a:pat, 'W'.( forw ? '' : 'b' ))
			if !forw
				if int > maxl | brea | en
				let int += int
			en
			let forw = !forw
		endw
	en
endf
" Public {{{1
fu! ctrlp#buffertag#init(fname)
	let bufs = exists('s:btmode') && s:btmode
		\ ? filter(ctrlp#buffers(), 'filereadable(v:val)')
		\ : [exists('s:bufname') ? s:bufname : a:fname]
	let lines = []
	for each in bufs
		let bname = fnamemodify(each, ':p')
		let tftype = get(split(getbufvar('^'.bname.'$', '&ft'), '\.'), 0, '')
		cal extend(lines, s:process(bname, tftype))
	endfo
	cal s:syntax()
	retu lines
endf

fu! ctrlp#buffertag#accept(mode, str)
	let vals = matchlist(a:str,
		\ '\v^[^\t]+\t+[^\t|]+\|(\d+)\:[^\t|]+\|(\d+)\|\s(.+)$')
	let bufnr = str2nr(get(vals, 1))
	if bufnr
		cal ctrlp#acceptfile(a:mode, bufnr)
		exe 'norm!' str2nr(get(vals, 2, line('.'))).'G'
		cal s:chknearby('\V\C'.get(vals, 3, ''))
		sil! norm! zvzz
	en
endf

fu! ctrlp#buffertag#cmd(mode, ...)
	let s:btmode = a:mode
	if a:0 && !empty(a:1)
		let s:btmode = 0
		let bname = a:1 =~# '^%$\|^#\d*$' ? expand(a:1) : a:1
		let s:bufname = fnamemodify(bname, ':p')
	en
	retu s:id
endf

fu! ctrlp#buffertag#exit()
	unl! s:btmode s:bufname
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                                                                                                                                                                                                                                                                                                                                                                                                  .vim/autoload/ctrlp/rtscript.vim                                                                    000644  000765  000024  00000003421 12626714374 020170  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/rtscript.vim
" Description:   Runtime scripts extension
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Init {{{1
if exists('g:loaded_ctrlp_rtscript') && g:loaded_ctrlp_rtscript
	fini
en
let [g:loaded_ctrlp_rtscript, g:ctrlp_newrts] = [1, 0]

cal add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#rtscript#init(s:caching)',
	\ 'accept': 'ctrlp#acceptfile',
	\ 'lname': 'runtime scripts',
	\ 'sname': 'rts',
	\ 'type': 'path',
	\ 'opmul': 1,
	\ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

let s:filecounts = {}
" Utilities {{{1
fu! s:nocache()
	retu g:ctrlp_newrts ||
		\ !s:caching || ( s:caching > 1 && get(s:filecounts, s:cwd) < s:caching )
endf
" Public {{{1
fu! ctrlp#rtscript#init(caching)
	let [s:caching, s:cwd] = [a:caching, getcwd()]
	if s:nocache() ||
		\ !( exists('g:ctrlp_rtscache') && g:ctrlp_rtscache[0] == &rtp )
		sil! cal ctrlp#progress('Indexing...')
		let entries = split(globpath(ctrlp#utils#fnesc(&rtp, 'g'), '**/*.*'), "\n")
		cal filter(entries, 'count(entries, v:val) == 1')
		let [entries, echoed] = [ctrlp#dirnfile(entries)[1], 1]
	el
		let [entries, results] = g:ctrlp_rtscache[2:3]
	en
	if s:nocache() ||
		\ !( exists('g:ctrlp_rtscache') && g:ctrlp_rtscache[:1] == [&rtp, s:cwd] )
		if !exists('echoed')
			sil! cal ctrlp#progress('Processing...')
		en
		let results = map(copy(entries), 'fnamemodify(v:val, '':.'')')
	en
	let [g:ctrlp_rtscache, g:ctrlp_newrts] = [[&rtp, s:cwd, entries, results], 0]
	cal extend(s:filecounts, { s:cwd : len(results) })
	retu results
endf

fu! ctrlp#rtscript#id()
	retu s:id
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                                                                                                                                                                                                                               .vim/autoload/ctrlp/bookmarkdir.vim                                                                 000644  000765  000024  00000007067 12626714374 020634  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/bookmarkdir.vim
" Description:   Bookmarked directories extension
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Init {{{1
if exists('g:loaded_ctrlp_bookmarkdir') && g:loaded_ctrlp_bookmarkdir
	fini
en
let g:loaded_ctrlp_bookmarkdir = 1

cal add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#bookmarkdir#init()',
	\ 'accept': 'ctrlp#bookmarkdir#accept',
	\ 'lname': 'bookmarked dirs',
	\ 'sname': 'bkd',
	\ 'type': 'tabs',
	\ 'opmul': 1,
	\ 'nolim': 1,
	\ 'wipe': 'ctrlp#bookmarkdir#remove',
	\ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
" Utilities {{{1
fu! s:getinput(str, ...)
	echoh Identifier
	cal inputsave()
	let input = call('input', a:0 ? [a:str] + a:000 : [a:str])
	cal inputrestore()
	echoh None
	retu input
endf

fu! s:cachefile()
	if !exists('s:cadir') || !exists('s:cafile')
		let s:cadir = ctrlp#utils#cachedir().ctrlp#utils#lash().'bkd'
		let s:cafile = s:cadir.ctrlp#utils#lash().'cache.txt'
	en
	retu s:cafile
endf

fu! s:writecache(lines)
	cal ctrlp#utils#writecache(a:lines, s:cadir, s:cafile)
endf

fu! s:getbookmarks()
	retu ctrlp#utils#readfile(s:cachefile())
endf

fu! s:savebookmark(name, cwd)
	let cwds = exists('+ssl') ? [tr(a:cwd, '\', '/'), tr(a:cwd, '/', '\')] : [a:cwd]
	let entries = filter(s:getbookmarks(), 'index(cwds, s:parts(v:val)[1]) < 0')
	cal s:writecache(insert(entries, a:name.'	'.a:cwd))
endf

fu! s:setentries()
	let time = getftime(s:cachefile())
	if !( exists('s:bookmarks') && time == s:bookmarks[0] )
		let s:bookmarks = [time, s:getbookmarks()]
	en
endf

fu! s:parts(str)
	let mlist = matchlist(a:str, '\v([^\t]+)\t(.*)$')
	retu mlist != [] ? mlist[1:2] : ['', '']
endf

fu! s:process(entries, type)
	retu map(a:entries, 's:modify(v:val, a:type)')
endf

fu! s:modify(entry, type)
	let [name, dir] = s:parts(a:entry)
	let dir = fnamemodify(dir, a:type)
	retu name.'	'.( dir == '' ? '.' : dir )
endf

fu! s:msg(name, cwd)
	redr
	echoh Identifier | echon 'Bookmarked ' | echoh Constant
	echon a:name.' ' | echoh Directory | echon a:cwd
	echoh None
endf

fu! s:syntax()
	if !ctrlp#nosy()
		cal ctrlp#hicheck('CtrlPBookmark', 'Identifier')
		cal ctrlp#hicheck('CtrlPTabExtra', 'Comment')
		sy match CtrlPBookmark '^> [^\t]\+' contains=CtrlPLinePre
		sy match CtrlPTabExtra '\zs\t.*\ze$'
	en
endf
" Public {{{1
fu! ctrlp#bookmarkdir#init()
	cal s:setentries()
	cal s:syntax()
	retu s:process(copy(s:bookmarks[1]), ':.')
endf

fu! ctrlp#bookmarkdir#accept(mode, str)
	let parts = s:parts(s:modify(a:str, ':p'))
	cal call('s:savebookmark', parts)
	if a:mode =~ 't\|v\|h'
		cal ctrlp#exit()
	en
	cal ctrlp#setdir(parts[1], a:mode =~ 't\|h' ? 'chd!' : 'lc!')
	if a:mode == 'e'
		cal ctrlp#switchtype(0)
		cal ctrlp#recordhist()
		cal ctrlp#prtclear()
	en
endf

fu! ctrlp#bookmarkdir#add(dir, ...)
	let str = 'Directory to bookmark: '
	let cwd = a:dir != '' ? a:dir : s:getinput(str, getcwd(), 'dir')
	if cwd == '' | retu | en
	let cwd = fnamemodify(cwd, ':p')
	let name = a:0 && a:1 != '' ? a:1 : s:getinput('Bookmark as: ', cwd)
	if name == '' | retu | en
	let name = tr(name, '	', ' ')
	cal s:savebookmark(name, cwd)
	cal s:msg(name, cwd)
endf

fu! ctrlp#bookmarkdir#remove(entries)
	cal s:process(a:entries, ':p')
	cal s:writecache(a:entries == [] ? [] :
		\ filter(s:getbookmarks(), 'index(a:entries, v:val) < 0'))
	cal s:setentries()
	retu s:process(copy(s:bookmarks[1]), ':.')
endf

fu! ctrlp#bookmarkdir#id()
	retu s:id
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                                                                                                                                                                                                                                                                                                                                                                                                                                                         .vim/autoload/ctrlp/mrufiles.vim                                                                    000644  000765  000024  00000007740 12626714374 020154  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/mrufiles.vim
" Description:   Most Recently Used Files extension
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Static variables {{{1
let [s:mrbs, s:mrufs] = [[], []]

fu! ctrlp#mrufiles#opts()
	let [pref, opts] = ['g:ctrlp_mruf_', {
		\ 'max': ['s:max', 250],
		\ 'include': ['s:in', ''],
		\ 'exclude': ['s:ex', ''],
		\ 'case_sensitive': ['s:cseno', 1],
		\ 'relative': ['s:re', 0],
		\ 'save_on_update': ['s:soup', 1],
		\ }]
	for [ke, va] in items(opts)
		let [{va[0]}, {pref.ke}] = [pref.ke, exists(pref.ke) ? {pref.ke} : va[1]]
	endfo
endf
cal ctrlp#mrufiles#opts()
" Utilities {{{1
fu! s:excl(fn)
	retu !empty({s:ex}) && a:fn =~# {s:ex}
endf

fu! s:mergelists()
	let diskmrufs = ctrlp#utils#readfile(ctrlp#mrufiles#cachefile())
	cal filter(diskmrufs, 'index(s:mrufs, v:val) < 0')
	let mrufs = s:mrufs + diskmrufs
	retu s:chop(mrufs)
endf

fu! s:chop(mrufs)
	if len(a:mrufs) > {s:max} | cal remove(a:mrufs, {s:max}, -1) | en
	retu a:mrufs
endf

fu! s:reformat(mrufs, ...)
	let cwd = getcwd()
	let cwd .= cwd !~ '[\/]$' ? ctrlp#utils#lash() : ''
	if {s:re}
		let cwd = exists('+ssl') ? tr(cwd, '/', '\') : cwd
		cal filter(a:mrufs, '!stridx(v:val, cwd)')
	en
	if a:0 && a:1 == 'raw' | retu a:mrufs | en
	let idx = strlen(cwd)
	if exists('+ssl') && &ssl
		let cwd = tr(cwd, '\', '/')
		cal map(a:mrufs, 'tr(v:val, "\\", "/")')
	en
	retu map(a:mrufs, '!stridx(v:val, cwd) ? strpart(v:val, idx) : v:val')
endf

fu! s:record(bufnr)
	if s:locked | retu | en
	let bufnr = a:bufnr + 0
	let bufname = bufname(bufnr)
	if bufnr > 0 && !empty(bufname)
		cal filter(s:mrbs, 'v:val != bufnr')
		cal insert(s:mrbs, bufnr)
		cal s:addtomrufs(bufname)
	en
endf

fu! s:addtomrufs(fname)
	let fn = fnamemodify(a:fname, ':p')
	let fn = exists('+ssl') ? tr(fn, '/', '\') : fn
	if ( !empty({s:in}) && fn !~# {s:in} ) || ( !empty({s:ex}) && fn =~# {s:ex} )
		\ || !empty(getbufvar('^'.fn.'$', '&bt')) || !filereadable(fn) | retu
	en
	let idx = index(s:mrufs, fn, 0, !{s:cseno})
	if idx
		cal filter(s:mrufs, 'v:val !='.( {s:cseno} ? '#' : '?' ).' fn')
		cal insert(s:mrufs, fn)
		if {s:soup} && idx < 0
			cal s:savetofile(s:mergelists())
		en
	en
endf

fu! s:savetofile(mrufs)
	cal ctrlp#utils#writecache(a:mrufs, s:cadir, s:cafile)
endf
" Public {{{1
fu! ctrlp#mrufiles#refresh(...)
	let mrufs = s:mergelists()
	cal filter(mrufs, '!empty(ctrlp#utils#glob(v:val, 1)) && !s:excl(v:val)')
	if exists('+ssl')
		cal map(mrufs, 'tr(v:val, "/", "\\")')
		cal map(s:mrufs, 'tr(v:val, "/", "\\")')
		let cond = 'count(mrufs, v:val, !{s:cseno}) == 1'
		cal filter(mrufs, cond)
		cal filter(s:mrufs, cond)
	en
	cal s:savetofile(mrufs)
	retu a:0 && a:1 == 'raw' ? [] : s:reformat(mrufs)
endf

fu! ctrlp#mrufiles#remove(files)
	let mrufs = []
	if a:files != []
		let mrufs = s:mergelists()
		let cond = 'index(a:files, v:val, 0, !{s:cseno}) < 0'
		cal filter(mrufs, cond)
		cal filter(s:mrufs, cond)
	en
	cal s:savetofile(mrufs)
	retu s:reformat(mrufs)
endf

fu! ctrlp#mrufiles#add(fn)
	if !empty(a:fn)
		cal s:addtomrufs(a:fn)
	en
endf

fu! ctrlp#mrufiles#list(...)
	retu a:0 ? a:1 == 'raw' ? s:reformat(s:mergelists(), a:1) : 0
		\ : s:reformat(s:mergelists())
endf

fu! ctrlp#mrufiles#bufs()
	retu s:mrbs
endf

fu! ctrlp#mrufiles#tgrel()
	let {s:re} = !{s:re}
endf

fu! ctrlp#mrufiles#cachefile()
	if !exists('s:cadir') || !exists('s:cafile')
		let s:cadir = ctrlp#utils#cachedir().ctrlp#utils#lash().'mru'
		let s:cafile = s:cadir.ctrlp#utils#lash().'cache.txt'
	en
	retu s:cafile
endf

fu! ctrlp#mrufiles#init()
	if !has('autocmd') | retu | en
	let s:locked = 0
	aug CtrlPMRUF
		au!
		au BufAdd,BufEnter,BufLeave,BufWritePost * cal s:record(expand('<abuf>', 1))
		au QuickFixCmdPre  *vimgrep* let s:locked = 1
		au QuickFixCmdPost *vimgrep* let s:locked = 0
		au VimLeavePre * cal s:savetofile(s:mergelists())
	aug END
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                .vim/autoload/ctrlp/line.vim                                                                        000644  000765  000024  00000004070 12626714374 017246  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/line.vim
" Description:   Line extension
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Init {{{1
if exists('g:loaded_ctrlp_line') && g:loaded_ctrlp_line
	fini
en
let g:loaded_ctrlp_line = 1

cal add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#line#init(s:crbufnr)',
	\ 'accept': 'ctrlp#line#accept',
	\ 'lname': 'lines',
	\ 'sname': 'lns',
	\ 'type': 'tabe',
	\ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
" Utilities {{{1
fu! s:syntax()
	if !ctrlp#nosy()
		cal ctrlp#hicheck('CtrlPBufName', 'Directory')
		cal ctrlp#hicheck('CtrlPTabExtra', 'Comment')
		sy match CtrlPBufName '\t|\zs[^|]\+\ze|\d\+:\d\+|$'
		sy match CtrlPTabExtra '\zs\t.*\ze$' contains=CtrlPBufName
	en
endf
" Public {{{1
fu! ctrlp#line#init(bufnr)
	let [lines, bufnr] = [[], exists('s:bufnr') ? s:bufnr : a:bufnr]
	let bufs = exists('s:lnmode') && s:lnmode ? ctrlp#buffers('id') : [bufnr]
	for bufnr in bufs
		let [lfb, bufn] = [getbufline(bufnr, 1, '$'), bufname(bufnr)]
		if lfb == [] && bufn != ''
			let lfb = ctrlp#utils#readfile(fnamemodify(bufn, ':p'))
		en
		cal map(lfb, 'tr(v:val, ''	'', '' '')')
		let [linenr, len_lfb] = [1, len(lfb)]
		let buft = bufn == '' ? '[No Name]' : fnamemodify(bufn, ':t')
		wh linenr <= len_lfb
			let lfb[linenr - 1] .= '	|'.buft.'|'.bufnr.':'.linenr.'|'
			let linenr += 1
		endw
		cal extend(lines, filter(lfb, 'v:val !~ ''^\s*\t|[^|]\+|\d\+:\d\+|$'''))
	endfo
	cal s:syntax()
	retu lines
endf

fu! ctrlp#line#accept(mode, str)
	let info = matchlist(a:str, '\t|[^|]\+|\(\d\+\):\(\d\+\)|$')
	let bufnr = str2nr(get(info, 1))
	if bufnr
		cal ctrlp#acceptfile(a:mode, bufnr, get(info, 2))
	en
endf

fu! ctrlp#line#cmd(mode, ...)
	let s:lnmode = a:mode
	if a:0 && !empty(a:1)
		let s:lnmode = 0
		let bname = a:1 =~# '^%$\|^#\d*$' ? expand(a:1) : a:1
		let s:bufnr = bufnr('^'.fnamemodify(bname, ':p').'$')
	en
	retu s:id
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                                                                                                                                                                                                                                                                                                                                                                                                                                                        .vim/autoload/ctrlp/utils.vim                                                                       000644  000765  000024  00000005506 12626714374 017464  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/utils.vim
" Description:   Utilities
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Static variables {{{1
fu! ctrlp#utils#lash()
	retu &ssl || !exists('+ssl') ? '/' : '\'
endf

fu! s:lash(...)
	retu ( a:0 ? a:1 : getcwd() ) !~ '[\/]$' ? s:lash : ''
endf

fu! ctrlp#utils#opts()
	let s:lash = ctrlp#utils#lash()
	let usrhome = $HOME . s:lash( $HOME )
	let cahome = exists('$XDG_CACHE_HOME') ? $XDG_CACHE_HOME : usrhome.'.cache'
	let cadir = isdirectory(usrhome.'.ctrlp_cache')
		\ ? usrhome.'.ctrlp_cache' : cahome.s:lash(cahome).'ctrlp'
	if exists('g:ctrlp_cache_dir')
		let cadir = expand(g:ctrlp_cache_dir, 1)
		if isdirectory(cadir.s:lash(cadir).'.ctrlp_cache')
			let cadir = cadir.s:lash(cadir).'.ctrlp_cache'
		en
	en
	let s:cache_dir = cadir
endf
cal ctrlp#utils#opts()

let s:wig_cond = v:version > 702 || ( v:version == 702 && has('patch051') )
" Files and Directories {{{1
fu! ctrlp#utils#cachedir()
	retu s:cache_dir
endf

fu! ctrlp#utils#cachefile(...)
	let [tail, dir] = [a:0 == 1 ? '.'.a:1 : '', a:0 == 2 ? a:1 : getcwd()]
	let cache_file = substitute(dir, '\([\/]\|^\a\zs:\)', '%', 'g').tail.'.txt'
	retu a:0 == 1 ? cache_file : s:cache_dir.s:lash(s:cache_dir).cache_file
endf

fu! ctrlp#utils#readfile(file)
	if filereadable(a:file)
		let data = readfile(a:file)
		if empty(data) || type(data) != 3
			unl data
			let data = []
		en
		retu data
	en
	retu []
endf

fu! ctrlp#utils#mkdir(dir)
	if exists('*mkdir') && !isdirectory(a:dir)
		sil! cal mkdir(a:dir, 'p')
	en
	retu a:dir
endf

fu! ctrlp#utils#writecache(lines, ...)
	if isdirectory(ctrlp#utils#mkdir(a:0 ? a:1 : s:cache_dir))
		sil! cal writefile(a:lines, a:0 >= 2 ? a:2 : ctrlp#utils#cachefile())
	en
endf

fu! ctrlp#utils#glob(...)
	let path = ctrlp#utils#fnesc(a:1, 'g')
	retu s:wig_cond ? glob(path, a:2) : glob(path)
endf

fu! ctrlp#utils#globpath(...)
	retu call('globpath', s:wig_cond ? a:000 : a:000[:1])
endf

fu! ctrlp#utils#fnesc(path, type, ...)
	if exists('*fnameescape')
		if exists('+ssl')
			if a:type == 'c'
				let path = escape(a:path, '%#')
			elsei a:type == 'f'
				let path = fnameescape(a:path)
			elsei a:type == 'g'
				let path = escape(a:path, '?*')
			en
			let path = substitute(path, '[', '[[]', 'g')
		el
			let path = fnameescape(a:path)
		en
	el
		if exists('+ssl')
			if a:type == 'c'
				let path = escape(a:path, '%#')
			elsei a:type == 'f'
				let path = escape(a:path, " \t\n%#*?|<\"")
			elsei a:type == 'g'
				let path = escape(a:path, '?*')
			en
			let path = substitute(path, '[', '[[]', 'g')
		el
			let path = escape(a:path, " \t\n*?[{`$\\%#'\"|!<")
		en
	en
	retu a:0 ? escape(path, a:1) : path
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                                                                                                                                                                          .vim/autoload/ctrlp/changes.vim                                                                     000644  000765  000024  00000005163 12626714374 017733  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/changes.vim
" Description:   Change list extension
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Init {{{1
if exists('g:loaded_ctrlp_changes') && g:loaded_ctrlp_changes
	fini
en
let g:loaded_ctrlp_changes = 1

cal add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#changes#init(s:bufnr, s:crbufnr)',
	\ 'accept': 'ctrlp#changes#accept',
	\ 'lname': 'changes',
	\ 'sname': 'chs',
	\ 'exit': 'ctrlp#changes#exit()',
	\ 'type': 'tabe',
	\ 'sort': 0,
	\ 'nolim': 1,
	\ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
" Utilities {{{1
fu! s:changelist(bufnr)
	sil! exe 'noa hid b' a:bufnr
	redi => result
	sil! changes
	redi END
	retu map(split(result, "\n")[1:], 'tr(v:val, "	", " ")')
endf

fu! s:process(clines, ...)
	let [clines, evas] = [[], []]
	for each in a:clines
		let parts = matchlist(each, '\v^.\s*\d+\s+(\d+)\s+(\d+)\s(.*)$')
		if !empty(parts)
			if parts[3] == '' | let parts[3] = ' ' | en
			cal add(clines, parts[3].'	|'.a:1.':'.a:2.'|'.parts[1].':'.parts[2].'|')
		en
	endfo
	retu reverse(filter(clines, 'count(clines, v:val) == 1'))
endf

fu! s:syntax()
	if !ctrlp#nosy()
		cal ctrlp#hicheck('CtrlPBufName', 'Directory')
		cal ctrlp#hicheck('CtrlPTabExtra', 'Comment')
		sy match CtrlPBufName '\t|\d\+:\zs[^|]\+\ze|\d\+:\d\+|$'
		sy match CtrlPTabExtra '\zs\t.*\ze$' contains=CtrlPBufName
	en
endf
" Public {{{1
fu! ctrlp#changes#init(original_bufnr, bufnr)
	let bufnr = exists('s:bufnr') ? s:bufnr : a:bufnr
	let bufs = exists('s:clmode') && s:clmode ? ctrlp#buffers('id') : [bufnr]
	cal filter(bufs, 'v:val > 0')
	let [swb, &swb] = [&swb, '']
	let lines = []
	for each in bufs
		let bname = bufname(each)
		let fnamet = fnamemodify(bname == '' ? '[No Name]' : bname, ':t')
		cal extend(lines, s:process(s:changelist(each), each, fnamet))
	endfo
	sil! exe 'noa hid b' a:original_bufnr
	let &swb = swb
	cal ctrlp#syntax()
	cal s:syntax()
	retu lines
endf

fu! ctrlp#changes#accept(mode, str)
	let info = matchlist(a:str, '\t|\(\d\+\):[^|]\+|\(\d\+\):\(\d\+\)|$')
	let bufnr = str2nr(get(info, 1))
	if bufnr
		cal ctrlp#acceptfile(a:mode, bufnr)
		cal cursor(get(info, 2), get(info, 3))
		sil! norm! zvzz
	en
endf

fu! ctrlp#changes#cmd(mode, ...)
	let s:clmode = a:mode
	if a:0 && !empty(a:1)
		let s:clmode = 0
		let bname = a:1 =~# '^%$\|^#\d*$' ? expand(a:1) : a:1
		let s:bufnr = bufnr('^'.fnamemodify(bname, ':p').'$')
	en
	retu s:id
endf

fu! ctrlp#changes#exit()
	unl! s:clmode s:bufnr
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                                                                                                                                                                                                                                                                                                                                                                                             .vim/autoload/ctrlp/undo.vim                                                                        000644  000765  000024  00000007174 12626714374 017274  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/undo.vim
" Description:   Undo extension
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Init {{{1
if ( exists('g:loaded_ctrlp_undo') && g:loaded_ctrlp_undo )
	fini
en
let g:loaded_ctrlp_undo = 1

cal add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#undo#init()',
	\ 'accept': 'ctrlp#undo#accept',
	\ 'lname': 'undo',
	\ 'sname': 'udo',
	\ 'enter': 'ctrlp#undo#enter()',
	\ 'exit': 'ctrlp#undo#exit()',
	\ 'type': 'line',
	\ 'sort': 0,
	\ 'nolim': 1,
	\ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

let s:text = map(['second', 'seconds', 'minutes', 'hours', 'days', 'weeks',
	\ 'months', 'years'], '" ".v:val." ago"')
" Utilities {{{1
fu! s:getundo()
	if exists('*undotree')
		\ && ( v:version > 703 || ( v:version == 703 && has('patch005') ) )
		retu [1, undotree()]
	el
		redi => result
		sil! undol
		redi END
		retu [0, split(result, "\n")[1:]]
	en
endf

fu! s:flatten(tree, cur)
	let flatdict = {}
	for each in a:tree
		let saved = has_key(each, 'save') ? 'saved' : ''
		let current = each['seq'] == a:cur ? 'current' : ''
		cal extend(flatdict, { each['seq'] : [each['time'], saved, current] })
		if has_key(each, 'alt')
			cal extend(flatdict, s:flatten(each['alt'], a:cur))
		en
	endfo
	retu flatdict
endf

fu! s:elapsed(nr)
	let [text, time] = [s:text, localtime() - a:nr]
	let mins = time / 60
	let hrs  = time / 3600
	let days = time / 86400
	let wks  = time / 604800
	let mons = time / 2592000
	let yrs  = time / 31536000
	if yrs > 1
		retu yrs.text[7]
	elsei mons > 1
		retu mons.text[6]
	elsei wks > 1
		retu wks.text[5]
	elsei days > 1
		retu days.text[4]
	elsei hrs > 1
		retu hrs.text[3]
	elsei mins > 1
		retu mins.text[2]
	elsei time == 1
		retu time.text[0]
	elsei time < 120
		retu time.text[1]
	en
endf

fu! s:syntax()
	if ctrlp#nosy() | retu | en
	for [ke, va] in items({'T': 'Directory', 'Br': 'Comment', 'Nr': 'String',
		\ 'Sv': 'Comment', 'Po': 'Title'})
		cal ctrlp#hicheck('CtrlPUndo'.ke, va)
	endfo
	sy match CtrlPUndoT '\v\d+ \zs[^ ]+\ze|\d+:\d+:\d+'
	sy match CtrlPUndoBr '\[\|\]'
	sy match CtrlPUndoNr '\[\d\+\]' contains=CtrlPUndoBr
	sy match CtrlPUndoSv 'saved'
	sy match CtrlPUndoPo 'current'
endf

fu! s:dict2list(dict)
	for ke in keys(a:dict)
		let a:dict[ke][0] = s:elapsed(a:dict[ke][0])
	endfo
	retu map(keys(a:dict), 'eval(''[v:val, a:dict[v:val]]'')')
endf

fu! s:compval(...)
	retu a:2[0] - a:1[0]
endf

fu! s:format(...)
	let saved = !empty(a:1[1][1]) ? ' '.a:1[1][1] : ''
	let current = !empty(a:1[1][2]) ? ' '.a:1[1][2] : ''
	retu a:1[1][0].' ['.a:1[0].']'.saved.current
endf

fu! s:formatul(...)
	let parts = matchlist(a:1,
		\ '\v^\s+(\d+)\s+\d+\s+([^ ]+\s?[^ ]+|\d+\s\w+\s\w+)(\s*\d*)$')
	retu parts == [] ? '----'
		\ : parts[2].' ['.parts[1].']'.( parts[3] != '' ? ' saved' : '' )
endf
" Public {{{1
fu! ctrlp#undo#init()
	let entries = s:undos[0] ? s:undos[1]['entries'] : s:undos[1]
	if empty(entries) | retu [] | en
	if !exists('s:lines')
		if s:undos[0]
			let entries = s:dict2list(s:flatten(entries, s:undos[1]['seq_cur']))
			let s:lines = map(sort(entries, 's:compval'), 's:format(v:val)')
		el
			let s:lines = map(reverse(entries), 's:formatul(v:val)')
		en
	en
	cal s:syntax()
	retu s:lines
endf

fu! ctrlp#undo#accept(mode, str)
	let undon = matchstr(a:str, '\[\zs\d\+\ze\]')
	if empty(undon) | retu | en
	cal ctrlp#exit()
	exe 'u' undon
endf

fu! ctrlp#undo#id()
	retu s:id
endf

fu! ctrlp#undo#enter()
	let s:undos = s:getundo()
endf

fu! ctrlp#undo#exit()
	unl! s:lines
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                                                                                                                                                                                                                                                                                                                                                                                    .vim/autoload/ctrlp/quickfix.vim                                                                    000644  000765  000024  00000002774 12626714374 020153  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/quickfix.vim
" Description:   Quickfix extension
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Init {{{1
if exists('g:loaded_ctrlp_quickfix') && g:loaded_ctrlp_quickfix
	fini
en
let g:loaded_ctrlp_quickfix = 1

cal add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#quickfix#init()',
	\ 'accept': 'ctrlp#quickfix#accept',
	\ 'lname': 'quickfix',
	\ 'sname': 'qfx',
	\ 'type': 'line',
	\ 'sort': 0,
	\ 'nolim': 1,
	\ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

fu! s:lineout(dict)
	retu printf('%s|%d:%d| %s', bufname(a:dict['bufnr']), a:dict['lnum'],
		\ a:dict['col'], matchstr(a:dict['text'], '\s*\zs.*\S'))
endf
" Utilities {{{1
fu! s:syntax()
	if !ctrlp#nosy()
		cal ctrlp#hicheck('CtrlPqfLineCol', 'Search')
		sy match CtrlPqfLineCol '|\zs\d\+:\d\+\ze|'
	en
endf
" Public {{{1
fu! ctrlp#quickfix#init()
	cal s:syntax()
	retu map(getqflist(), 's:lineout(v:val)')
endf

fu! ctrlp#quickfix#accept(mode, str)
	let vals = matchlist(a:str, '^\([^|]\+\ze\)|\(\d\+\):\(\d\+\)|')
	if vals == [] || vals[1] == '' | retu | en
	cal ctrlp#acceptfile(a:mode, vals[1])
	let cur_pos = getpos('.')[1:2]
	if cur_pos != [1, 1] && cur_pos != map(vals[2:3], 'str2nr(v:val)')
		mark '
	en
	cal cursor(vals[2], vals[3])
	sil! norm! zvzz
endf

fu! ctrlp#quickfix#id()
	retu s:id
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
    .vim/autoload/ctrlp/mixed.vim                                                                       000644  000765  000024  00000005202 12626714374 017423  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          autoload/ctrlp/mixed.vim
" Description:   Mixing Files + MRU + Buffers
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================

" Init {{{1
if exists('g:loaded_ctrlp_mixed') && g:loaded_ctrlp_mixed
	fini
en
let [g:loaded_ctrlp_mixed, g:ctrlp_newmix] = [1, 0]

cal add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#mixed#init(s:compare_lim)',
	\ 'accept': 'ctrlp#acceptfile',
	\ 'lname': 'fil + mru + buf',
	\ 'sname': 'mix',
	\ 'type': 'path',
	\ 'opmul': 1,
	\ 'specinput': 1,
	\ })

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
" Utilities {{{1
fu! s:newcache(cwd)
	if g:ctrlp_newmix || !has_key(g:ctrlp_allmixes, 'data') | retu 1 | en
	retu g:ctrlp_allmixes['cwd'] != a:cwd
		\ || g:ctrlp_allmixes['filtime'] < getftime(ctrlp#utils#cachefile())
		\ || g:ctrlp_allmixes['mrutime'] < getftime(ctrlp#mrufiles#cachefile())
		\ || g:ctrlp_allmixes['bufs'] < len(ctrlp#mrufiles#bufs())
endf

fu! s:getnewmix(cwd, clim)
	if g:ctrlp_newmix
		cal ctrlp#mrufiles#refresh('raw')
		let g:ctrlp_newcache = 1
	en
	let g:ctrlp_lines = copy(ctrlp#files())
	cal ctrlp#progress('Mixing...')
	let mrufs = copy(ctrlp#mrufiles#list('raw'))
	if exists('+ssl') && &ssl
		cal map(mrufs, 'tr(v:val, "\\", "/")')
	en
	let allbufs = map(ctrlp#buffers(), 'fnamemodify(v:val, ":p")')
	let [bufs, ubufs] = [[], []]
	for each in allbufs
		cal add(filereadable(each) ? bufs : ubufs, each)
	endfo
	let mrufs = bufs + filter(mrufs, 'index(bufs, v:val) < 0')
	if len(mrufs) > len(g:ctrlp_lines)
		cal filter(mrufs, 'stridx(v:val, a:cwd)')
	el
		let cwd_mrufs = filter(copy(mrufs), '!stridx(v:val, a:cwd)')
		let cwd_mrufs = ctrlp#rmbasedir(cwd_mrufs)
		for each in cwd_mrufs
			let id = index(g:ctrlp_lines, each)
			if id >= 0 | cal remove(g:ctrlp_lines, id) | en
		endfo
	en
	let mrufs += ubufs
	cal map(mrufs, 'fnamemodify(v:val, ":.")')
	let g:ctrlp_lines = len(mrufs) > len(g:ctrlp_lines)
		\ ? g:ctrlp_lines + mrufs : mrufs + g:ctrlp_lines
	if len(g:ctrlp_lines) <= a:clim
		cal sort(g:ctrlp_lines, 'ctrlp#complen')
	en
	let g:ctrlp_allmixes = { 'filtime': getftime(ctrlp#utils#cachefile()),
		\ 'mrutime': getftime(ctrlp#mrufiles#cachefile()), 'cwd': a:cwd,
		\ 'bufs': len(ctrlp#mrufiles#bufs()), 'data': g:ctrlp_lines }
endf
" Public {{{1
fu! ctrlp#mixed#init(clim)
	let cwd = getcwd()
	if s:newcache(cwd)
		cal s:getnewmix(cwd, a:clim)
	el
		let g:ctrlp_lines = g:ctrlp_allmixes['data']
	en
	let g:ctrlp_newmix = 0
	retu g:ctrlp_lines
endf

fu! ctrlp#mixed#id()
	retu s:id
endf
"}}}

" vim:fen:fdm=marker:fmr={{{,}}}:fdl=0:fdc=1:ts=2:sw=2:sts=2
                                                                                                                                                                                                                                                                                                                                                                                              .vim/doc/taglist.txt                                                                                000644  000765  000024  00000210533 13147475202 015617  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         *taglist.txt*	Plugin for browsing source code

Author: Yegappan Lakshmanan  (yegappan AT yahoo DOT com)
For Vim version 6.0 and above
Last change: 2013 Feburary 26

1. Overview 					|taglist-intro|
2. Taglist on the internet			|taglist-internet|
3. Requirements					|taglist-requirements|
4. Installation 				|taglist-install|
5. Usage 					|taglist-using|
6. Options 					|taglist-options|
7. Commands 					|taglist-commands|
8. Global functions 				|taglist-functions|
9. Extending 					|taglist-extend|
10. FAQ 					|taglist-faq|
11. License 					|taglist-license|
12. Todo					|taglist-todo|

==============================================================================
						*taglist-intro*
1. Overview~

The "Tag List" plugin is a source code browser plugin for Vim. This plugin
allows you to efficiently browse through source code files for different
programming languages. The "Tag List" plugin provides the following features:

    * Displays the tags (functions, classes, structures, variables, etc.) 
      defined in a file in a vertically or horizontally split Vim window.
    * In GUI Vim, optionally displays the tags in the Tags drop-down menu and
      in the popup menu.
    * Automatically updates the taglist window as you switch between
      files/buffers. As you open new files, the tags defined in the new files
      are added to the existing file list and the tags defined in all the
      files are displayed grouped by the filename.
    * When a tag name is selected from the taglist window, positions the
      cursor at the definition of the tag in the source file.
    * Automatically highlights the current tag name.
    * Groups the tags by their type and displays them in a foldable tree.
    * Can display the prototype and scope of a tag.
    * Can optionally display the tag prototype instead of the tag name in the
      taglist window.
    * The tag list can be sorted either by name or by chronological order.
    * Supports the following language files: Assembly, ASP, Awk, Beta, C,
      C++, C#, Cobol, Eiffel, Erlang, Fortran, HTML, Java, Javascript, Lisp,
      Lua, Make, Pascal, Perl, PHP, Python, Rexx, Ruby, Scheme, Shell, Slang,
      SML, Sql, TCL, Verilog, Vim and Yacc.
    * Can be easily extended to support new languages. Support for
      existing languages can be modified easily.
    * Provides functions to display the current tag name in the Vim status
      line or the window title bar.
    * The list of tags and files in the taglist can be saved and
      restored across Vim sessions.
    * Provides commands to get the name and prototype of the current tag.
    * Runs in both console/terminal and GUI versions of Vim.
    * Works with the winmanager plugin. Using the winmanager plugin, you
      can use Vim plugins like the file explorer, buffer explorer and the
      taglist plugin at the same time like an IDE.
    * Can be used in both Unix and MS-Windows systems.

==============================================================================
						*taglist-internet*
2. Taglist on the internet~

The home page of the taglist plugin is at:
>
	http://vim-taglist.sourceforge.net/
<
You can subscribe to the taglist mailing list to post your questions or
suggestions for improvement or to send bug reports. Visit the following page
for subscribing to the mailing list:
>
	http://groups.yahoo.com/group/taglist
<
==============================================================================
						*taglist-requirements*
3. Requirements~

The taglist plugin requires the following:

    * Vim version 6.0 and above
    * Exuberant ctags 5.0 and above

The taglist plugin will work on all the platforms where the exuberant ctags
utility and Vim are supported (this includes MS-Windows and Unix based
systems).

The taglist plugin relies on the exuberant ctags utility to dynamically
generate the tag listing.  The exuberant ctags utility must be installed in
your system to use this plugin.  The exuberant ctags utility is shipped with
most of the Linux distributions.  You can download the exuberant ctags utility
from
>
	http://ctags.sourceforge.net
<
The taglist plugin doesn't use or create a tags file and there is no need to
create a tags file to use this plugin. The taglist plugin will not work with
the GNU ctags or the Unix ctags utility.

This plugin relies on the Vim "filetype" detection mechanism to determine the
type of the current file. You have to turn on the Vim filetype detection by
adding the following line to your .vimrc file:
>
	filetype on
<
The taglist plugin will not work if you run Vim in the restricted mode (using
the -Z command-line argument).

The taglist plugin uses the Vim system() function to invoke the exuberant
ctags utility. If Vim is compiled without the system() function then you
cannot use the taglist plugin. Some of the Linux distributions (Suse) compile
Vim without the system() function for security reasons.

==============================================================================
						*taglist-install*
4. Installation~

1. Download the taglist.zip file and unzip the files to the $HOME/.vim or the
   $HOME/vimfiles or the $VIM/vimfiles directory. After this step, you should
   have the following two files (the directory structure should be preserved):

	plugin/taglist.vim - main taglist plugin file
	doc/taglist.txt    - documentation (help) file

   Refer to the |add-plugin|and |'runtimepath'| Vim help pages for more
   details about installing Vim plugins.
2. Change to the $HOME/.vim/doc or $HOME/vimfiles/doc or $VIM/vimfiles/doc
   directory, start Vim and run the ":helptags ." command to process the
   taglist help file. Without this step, you cannot jump to the taglist help
   topics.
3. If the exuberant ctags utility is not present in one of the directories in
   the PATH environment variable, then set the 'Tlist_Ctags_Cmd' variable to
   point to the location of the exuberant ctags utility (not to the directory)
   in the .vimrc file.
4. If you are running a terminal/console version of Vim and the terminal
   doesn't support changing the window width then set the
   'Tlist_Inc_Winwidth' variable to 0 in the .vimrc file.
5. Restart Vim.
6. You can now use the ":TlistToggle" command to open/close the taglist
   window. You can use the ":help taglist" command to get more information
   about using the taglist plugin.

To uninstall the taglist plugin, remove the plugin/taglist.vim and
doc/taglist.txt files from the $HOME/.vim or $HOME/vimfiles directory.

==============================================================================
						*taglist-using*
5. Usage~

The taglist plugin can be used in several different ways.

1. You can keep the taglist window open during the entire editing session. On
   opening the taglist window, the tags defined in all the files in the Vim
   buffer list will be displayed in the taglist window. As you edit files, the
   tags defined in them will be added to the taglist window. You can select a
   tag from the taglist window and jump to it. The current tag will be
   highlighted in the taglist window. You can close the taglist window when
   you no longer need the window.
2. You can configure the taglist plugin to process the tags defined in all the
   edited files always. In this configuration, even if the taglist window is
   closed and the taglist menu is not displayed, the taglist plugin will
   processes the tags defined in newly edited files. You can then open the
   taglist window only when you need to select a tag and then automatically
   close the taglist window after selecting the tag.
3. You can configure the taglist plugin to display only the tags defined in
   the current file in the taglist window. By default, the taglist plugin
   displays the tags defined in all the files in the Vim buffer list. As you
   switch between files, the taglist window will be refreshed to display only
   the tags defined in the current file.
4. In GUI Vim, you can use the Tags pull-down and popup menu created by the
   taglist plugin to display the tags defined in the current file and select a
   tag to jump to it. You can use the menu without opening the taglist window.
   By default, the Tags menu is disabled.
5. You can configure the taglist plugin to display the name of the current tag
   in the Vim window status line or in the Vim window title bar. For this to
   work without the taglist window or menu, you need to configure the taglist
   plugin to process the tags defined in a file always.
6. You can save the tags defined in multiple files to a taglist session file
   and load it when needed. You can also configure the taglist plugin to not
   update the taglist window when editing new files. You can then manually add
   files to the taglist window.

Opening the taglist window~
You can open the taglist window using the ":TlistOpen" or the ":TlistToggle"
commands. The ":TlistOpen" command opens the taglist window and jumps to it.
The ":TlistToggle" command opens or closes (toggle) the taglist window and the
cursor remains in the current window. If the 'Tlist_GainFocus_On_ToggleOpen'
variable is set to 1, then the ":TlistToggle" command opens the taglist window
and moves the cursor to the taglist window.

You can map a key to invoke these commands. For example, the following command
creates a normal mode mapping for the <F8> key to toggle the taglist window.
>
	nnoremap <silent> <F8> :TlistToggle<CR>
<
Add the above mapping to your ~/.vimrc or $HOME/_vimrc file.

To automatically open the taglist window on Vim startup, set the
'Tlist_Auto_Open' variable to 1.

You can also open the taglist window on startup using the following command
line:
>
	$ vim +TlistOpen
<
Closing the taglist window~
You can close the taglist window from the taglist window by pressing 'q' or
using the Vim ":q" command. You can also use any of the Vim window commands to
close the taglist window. Invoking the ":TlistToggle" command when the taglist
window is opened, closes the taglist window. You can also use the
":TlistClose" command to close the taglist window.

To automatically close the taglist window when a tag or file is selected, you
can set the 'Tlist_Close_On_Select' variable to 1.  To exit Vim when only the
taglist window is present, set the 'Tlist_Exit_OnlyWindow' variable to 1.

Jumping to a tag or a file~
You can select a tag in the taglist window either by pressing the <Enter> key
or by double clicking the tag name using the mouse. To jump to a tag on a
single mouse click set the 'Tlist_Use_SingleClick' variable to 1.

If the selected file is already opened in a window, then the cursor is moved
to that window. If the file is not currently opened in a window then the file
is opened in the window used by the taglist plugin to show the previously
selected file. If there are no usable windows, then the file is opened in a
new window.  The file is not opened in special windows like the quickfix
window, preview window and windows containing buffer with the 'buftype' option
set.

To jump to the tag in a new window, press the 'o' key. To open the file in the
previous window (Ctrl-W_p) use the 'P' key. You can press the 'p' key to jump
to the tag but still keep the cursor in the taglist window (preview).

To open the selected file in a tab, use the 't' key.  If the file is already
present in a tab then the cursor is moved to that tab otherwise the file is
opened in a new tab. To jump to a tag in a new tab press Ctrl-t.  The taglist
window is automatically opened in the newly created tab.

Instead of jumping to a tag, you can open a file by pressing the <Enter> key
or by double clicking the file name using the mouse.

In the taglist window, you can use the [[ or <Backspace> key to jump to the
beginning of the previous file. You can use the ]] or <Tab> key to jump to the
beginning of the next file. When you reach the first or last file, the search
wraps around and the jumps to the next/previous file.

Highlighting the current tag~
The taglist plugin automatically highlights the name of the current tag in the
taglist window. The Vim |CursorHold| autocmd event is used for this. If the
current tag name is not visible in the taglist window, then the taglist window
contents are scrolled to make that tag name visible. You can also use the
":TlistHighlightTag" command to force the highlighting of the current tag.

The tag name is highlighted if no activity is performed for |'updatetime'|
milliseconds. The default value for this Vim option is 4 seconds. To avoid
unexpected problems, you should not set the |'updatetime'| option to a very
low value.

To disable the automatic highlighting of the current tag name in the taglist
window, set the 'Tlist_Auto_Highlight_Tag' variable to zero.

When entering a Vim buffer/window, the taglist plugin automatically highlights
the current tag in that buffer/window.  If you like to disable the automatic
highlighting of the current tag when entering a buffer, set the
'Tlist_Highlight_Tag_On_BufEnter' variable to zero.

Adding files to the taglist~
When the taglist window is opened, all the files in the Vim buffer list are
processed and the supported files are added to the taglist.  When you edit a
file in Vim, the taglist plugin automatically processes this file and adds it
to the taglist. If you close the taglist window, the tag information in the
taglist is retained.

To process files even when the taglist window is not open, set the
'Tlist_Process_File_Always' variable to 1.

You can manually add multiple files to the taglist without opening them using
the ":TlistAddFiles" and the ":TlistAddFilesRecursive" commands.

For example, to add all the C files in the /my/project/dir directory to the
taglist, you can use the following command:
>
	:TlistAddFiles /my/project/dir/*.c
<
Note that when adding several files with a large number of tags or a large
number of files, it will take several seconds to several minutes for the
taglist plugin to process all the files. You should not interrupt the taglist
plugin by pressing <CTRL-C>.

You can recursively add multiple files from a directory tree using the
":TlistAddFilesRecursive" command:
>
	:TlistAddFilesRecursive /my/project/dir *.c
<
This command takes two arguments. The first argument specifies the directory
from which to recursively add the files. The second optional argument
specifies the wildcard matching pattern for selecting the files to add. The
default pattern is * and all the files are added.

Displaying tags for only one file~
The taglist window displays the tags for all the files in the Vim buffer list
and all the manually added files. To display the tags for only the current
active buffer, set the 'Tlist_Show_One_File' variable to 1.

Removing files from the taglist~
You can remove a file from the taglist window, by pressing the 'd' key when the
cursor is on one of the tags listed for the file in the taglist window. The
removed file will no longer be displayed in the taglist window in the current
Vim session. To again display the tags for the file, open the file in a Vim
window and then use the ":TlistUpdate" command or use ":TlistAddFiles" command
to add the file to the taglist.

When a buffer is removed from the Vim buffer list using the ":bdelete" or the
":bwipeout" command, the taglist is updated to remove the stored information
for this buffer.

Updating the tags displayed for a file~
The taglist plugin keeps track of the modification time of a file. When the
modification time changes (the file is modified), the taglist plugin
automatically updates the tags listed for that file. The modification time of
a file is checked when you enter a window containing that file or when you
load that file.

You can also update or refresh the tags displayed for a file by pressing the
"u" key in the taglist window. If an existing file is modified, after the file
is saved, the taglist plugin automatically updates the tags displayed for the
file.

You can also use the ":TlistUpdate" command to update the tags for the current
buffer after you made some changes to it. You should save the modified buffer
before you update the taglist window. Otherwise the listed tags will not
include the new tags created in the buffer. 

If you have deleted the tags displayed for a file in the taglist window using
the 'd' key, you can again display the tags for that file using the
":TlistUpdate" command.

Controlling the taglist updates~
To disable the automatic processing of new files or modified files, you can
set the 'Tlist_Auto_Update' variable to zero. When this variable is set to
zero, the taglist is updated only when you use the ":TlistUpdate" command or
the ":TlistAddFiles" or the ":TlistAddFilesRecursive" commands. You can use
this option to control which files are added to the taglist.

You can use the ":TlistLock" command to lock the taglist contents. After this
command is executed, new files are not automatically added to the taglist.
When the taglist is locked, you can use the ":TlistUpdate" command to add the
current file or the ":TlistAddFiles" or ":TlistAddFilesRecursive" commands to
add new files to the taglist.  To unlock the taglist, use the ":TlistUnlock"
command.

Displaying the tag prototype~
To display the prototype of the tag under the cursor in the taglist window,
press the space bar. If you place the cursor on a tag name in the taglist
window, then the tag prototype is displayed at the Vim status line after
|'updatetime'| milliseconds. The default value for the |'updatetime'| Vim
option is 4 seconds.

You can get the name and prototype of a tag without opening the taglist window
and the taglist menu using the ":TlistShowTag" and the ":TlistShowPrototype"
commands. These commands will work only if the current file is already present
in the taglist. To use these commands without opening the taglist window, set
the 'Tlist_Process_File_Always' variable to 1.

You can use the ":TlistShowTag" command to display the name of the tag at or
before the specified line number in the specified file.  If the file name and
line number are not supplied, then this command will display the name of the
current tag. For example,
>
	:TlistShowTag
	:TlistShowTag myfile.java 100
<
You can use the ":TlistShowPrototype" command to display the prototype of the
tag at or before the specified line number in the specified file.  If the file
name and the line number are not supplied, then this command will display the
prototype of the current tag.  For example,
>
	:TlistShowPrototype
	:TlistShowPrototype myfile.c 50
<
In the taglist window, when the mouse is moved over a tag name, the tag
prototype is displayed in a balloon. This works only in GUI versions where
balloon evaluation is supported.

Taglist window contents~
The taglist window contains the tags defined in various files in the taglist
grouped by the filename and by the tag type (variable, function, class, etc.).
For tags with scope information (like class members, structures inside
structures, etc.), the scope information is displayed in square brackets "[]"
after the tag name.

The contents of the taglist buffer/window are managed by the taglist plugin.
The |'filetype'| for the taglist buffer is set to 'taglist'.  The Vim
|'modifiable'| option is turned off for the taglist buffer. You should not
manually edit the taglist buffer, by setting the |'modifiable'| flag. If you
manually edit the taglist buffer contents, then the taglist plugin will be out
of sync with the taglist buffer contents and the plugin will no longer work
correctly. To redisplay the taglist buffer contents again, close the taglist
window and reopen it.

Opening and closing the tag and file tree~
In the taglist window, the tag names are displayed as a foldable tree using
the Vim folding support. You can collapse the tree using the '-' key or using
the Vim |zc| fold command. You can open the tree using the '+' key or using
the Vim |zo| fold command. You can open all the folds using the '*' key or
using the Vim |zR| fold command. You can also use the mouse to open/close the
folds. You can close all the folds using the '=' key. You should not manually
create or delete the folds in the taglist window.

To automatically close the fold for the inactive files/buffers and open only
the fold for the current buffer in the taglist window, set the
'Tlist_File_Fold_Auto_Close' variable to 1.

Sorting the tags for a file~
The tags displayed in the taglist window can be sorted either by their name or
by their chronological order. The default sorting method is by the order in
which the tags appear in a file. You can change the default sort method by
setting the 'Tlist_Sort_Type' variable to either "name" or "order". You can
sort the tags by their name by pressing the "s" key in the taglist window. You
can again sort the tags by their chronological order using the "s" key. Each
file in the taglist window can be sorted using different order.

Zooming in and out of the taglist window~
You can press the 'x' key in the taglist window to maximize the taglist
window width/height. The window will be maximized to the maximum possible
width/height without closing the other existing windows. You can again press
'x' to restore the taglist window to the default width/height.

						*taglist-session*
Taglist Session~
A taglist session refers to the group of files and their tags stored in the
taglist in a Vim session.

You can save and restore a taglist session (and all the displayed tags) using
the ":TlistSessionSave" and ":TlistSessionLoad" commands.

To save the information about the tags and files in the taglist to a file, use
the ":TlistSessionSave" command and specify the filename:
>
	:TlistSessionSave <file name>
<
To load a saved taglist session, use the ":TlistSessionLoad" command: >

	:TlistSessionLoad <file name>
<
When you load a taglist session file, the tags stored in the file will be
added to the tags already stored in the taglist.

The taglist session feature can be used to save the tags for large files or a
group of frequently used files (like a project). By using the taglist session
file, you can minimize the amount to time it takes to load/refresh the taglist
for multiple files.

You can create more than one taglist session file for multiple groups of
files.

Displaying the tag name in the Vim status line or the window title bar~
You can use the Tlist_Get_Tagname_By_Line() function provided by the taglist
plugin to display the current tag name in the Vim status line or the window
title bar. Similarly, you can use the Tlist_Get_Tag_Prototype_By_Line()
function to display the current tag prototype in the Vim status line or the
window title bar.

For example, the following command can be used to display the current tag name
in the status line:
>
	:set statusline=%<%f%=%([%{Tlist_Get_Tagname_By_Line()}]%)
<
The following command can be used to display the current tag name in the
window title bar:
>
	:set title titlestring=%<%f\ %([%{Tlist_Get_Tagname_By_Line()}]%)
<
Note that the current tag name can be displayed only after the file is
processed by the taglist plugin. For this, you have to either set the
'Tlist_Process_File_Always' variable to 1 or open the taglist window or use
the taglist menu. For more information about configuring the Vim status line,
refer to the documentation for the Vim |'statusline'| option.

Changing the taglist window highlighting~
The following Vim highlight groups are defined and used to highlight the
various entities in the taglist window:

    TagListTagName  - Used for tag names
    TagListTagScope - Used for tag scope
    TagListTitle    - Used for tag titles
    TagListComment  - Used for comments
    TagListFileName - Used for filenames

By default, these highlight groups are linked to the standard Vim highlight
groups. If you want to change the colors used for these highlight groups,
prefix the highlight group name with 'My' and define it in your .vimrc or
.gvimrc file: MyTagListTagName, MyTagListTagScope, MyTagListTitle,
MyTagListComment and MyTagListFileName.  For example, to change the colors
used for tag names, you can use the following command:
>
    :highlight MyTagListTagName guifg=blue ctermfg=blue
<
Controlling the taglist window~
To use a horizontally split taglist window, instead of a vertically split
window, set the 'Tlist_Use_Horiz_Window' variable to 1.

To use a vertically split taglist window on the rightmost side of the Vim
window, set the 'Tlist_Use_Right_Window' variable to 1.

You can specify the width of the vertically split taglist window, by setting
the 'Tlist_WinWidth' variable.  You can specify the height of the horizontally
split taglist window, by setting the 'Tlist_WinHeight' variable.

When opening a vertically split taglist window, the Vim window width is
increased to accommodate the new taglist window. When the taglist window is
closed, the Vim window is reduced. To disable this, set the
'Tlist_Inc_Winwidth' variable to zero.

To reduce the number of empty lines in the taglist window, set the
'Tlist_Compact_Format' variable to 1.

To not display the Vim fold column in the taglist window, set the
'Tlist_Enable_Fold_Column' variable to zero.

To display the tag prototypes instead of the tag names in the taglist window,
set the 'Tlist_Display_Prototype' variable to 1.

To not display the scope of the tags next to the tag names, set the
'Tlist_Display_Tag_Scope' variable to zero.

						*taglist-keys*
Taglist window key list~
The following table lists the description of the keys that can be used
in the taglist window.

  Key           Description~

  <CR>          Jump to the location where the tag under cursor is
                defined.
  o             Jump to the location where the tag under cursor is
                defined in a new window.
  P             Jump to the tag in the previous (Ctrl-W_p) window.
  p             Display the tag definition in the file window and
                keep the cursor in the taglist window itself.
  t             Jump to the tag in a new tab. If the file is already
                opened in a tab, move to that tab.
  Ctrl-t	Jump to the tag in a new tab.
  <Space>       Display the prototype of the tag under the cursor.
  		For file names, display the full path to the file,
		file type and the number of tags. For tag types, display the
		tag type and the number of tags.
  u             Update the tags listed in the taglist window
  s             Change the sort order of the tags (by name or by order)
  d             Remove the tags for the file under the cursor
  x             Zoom-in or Zoom-out the taglist window
  +             Open a fold
  -             Close a fold
  *             Open all folds
  =             Close all folds
  [[		Jump to the beginning of the previous file
  <Backspace>	Jump to the beginning of the previous file
  ]]		Jump to the beginning of the next file
  <Tab>		Jump to the beginning of the next file
  q             Close the taglist window
  <F1>          Display help

The above keys will work in both the normal mode and the insert mode.

						*taglist-menu*
Taglist menu~
When using GUI Vim, the taglist plugin can display the tags defined in the
current file in the drop-down menu and the popup menu. By default, this
feature is turned off. To turn on this feature, set the 'Tlist_Show_Menu'
variable to 1.

You can jump to a tag by selecting the tag name from the menu. You can use the
taglist menu independent of the taglist window i.e. you don't need to open the
taglist window to get the taglist menu.

When you switch between files/buffers, the taglist menu is automatically
updated to display the tags defined in the current file/buffer.

The tags are grouped by their type (variables, functions, classes, methods,
etc.) and displayed as a separate sub-menu for each type. If all the tags
defined in a file are of the same type (e.g. functions), then the sub-menu is
not used.

If the number of items in a tag type submenu exceeds the value specified by
the 'Tlist_Max_Submenu_Items' variable, then the submenu will be split into
multiple submenus. The default setting for 'Tlist_Max_Submenu_Items' is 25.
The first and last tag names in the submenu are used to form the submenu name.
The menu items are prefixed by alpha-numeric characters for easy selection by
keyboard.

If the popup menu support is enabled (the |'mousemodel'| option contains
"popup"), then the tags menu is added to the popup menu. You can access
the popup menu by right clicking on the GUI window.

You can regenerate the tags menu by selecting the 'Tags->Refresh menu' entry.
You can sort the tags listed in the menu either by name or by order by
selecting the 'Tags->Sort menu by->Name/Order' menu entry.

You can tear-off the Tags menu and keep it on the side of the Vim window
for quickly locating the tags.

Using the taglist plugin with the winmanager plugin~
You can use the taglist plugin with the winmanager plugin. This will allow you
to use the file explorer, buffer explorer and the taglist plugin at the same
time in different windows. To use the taglist plugin with the winmanager
plugin, set 'TagList' in the 'winManagerWindowLayout' variable. For example,
to use the file explorer plugin and the taglist plugin at the same time, use
the following setting: >

	let winManagerWindowLayout = 'FileExplorer|TagList'
<
Getting help~
If you have installed the taglist help file (this file), then you can use the
Vim ":help taglist-<keyword>" command to get help on the various taglist
topics.

You can press the <F1> key in the taglist window to display the help
information about using the taglist window. If you again press the <F1> key,
the help information is removed from the taglist window.

						*taglist-debug*
Debugging the taglist plugin~
You can use the ":TlistDebug" command to enable logging of the debug messages
from the taglist plugin. To display the logged debug messages, you can use the
":TlistMessages" command. To disable the logging of the debug messages, use
the ":TlistUndebug" command.

You can specify a file name to the ":TlistDebug" command to log the debug
messages to a file. Otherwise, the debug messages are stored in a script-local
variable. In the later case, to minimize memory usage, only the last 3000
characters from the debug messages are stored.

==============================================================================
						*taglist-options*
6. Options~

A number of Vim variables control the behavior of the taglist plugin. These
variables are initialized to a default value. By changing these variables you
can change the behavior of the taglist plugin. You need to change these
settings only if you want to change the behavior of the taglist plugin. You
should use the |:let| command in your .vimrc file to change the setting of any
of these variables. 

The configurable taglist variables are listed below. For a detailed
description of these variables refer to the text below this table.

|'Tlist_Auto_Highlight_Tag'|	Automatically highlight the current tag in the
				taglist.
|'Tlist_Auto_Open'|		Open the taglist window when Vim starts.
|'Tlist_Auto_Update'|		Automatically update the taglist to include
				newly edited files.
|'Tlist_Close_On_Select'|	Close the taglist window when a file or tag is
				selected.
|'Tlist_Compact_Format'|	Remove extra information and blank lines from
       				the taglist window.
|'Tlist_Ctags_Cmd'|		Specifies the path to the ctags utility.
|'Tlist_Display_Prototype'|	Show prototypes and not tags in the taglist
				window.
|'Tlist_Display_Tag_Scope'|	Show tag scope next to the tag name.
|'Tlist_Enable_Fold_Column'|	Show the fold indicator column in the taglist
				window.
|'Tlist_Exit_OnlyWindow'|	Close Vim if the taglist is the only window.
|'Tlist_File_Fold_Auto_Close'|	Close tag folds for inactive buffers.
|'Tlist_GainFocus_On_ToggleOpen'|
				Jump to taglist window on open.
|'Tlist_Highlight_Tag_On_BufEnter'|
				On entering a buffer, automatically highlight
				the current tag.
|'Tlist_Inc_Winwidth'|		Increase the Vim window width to accommodate
				the taglist window.
|'Tlist_Max_Submenu_Items'|	Maximum number of items in a tags sub-menu.
|'Tlist_Max_Tag_Length'|	Maximum tag length used in a tag menu entry.
|'Tlist_Process_File_Always'|	Process files even when the taglist window is
				closed.
|'Tlist_Show_Menu'|		Display the tags menu.
|'Tlist_Show_One_File'|		Show tags for the current buffer only.
|'Tlist_Sort_Type'|		Sort method used for arranging the tags.
|'Tlist_Use_Horiz_Window'|	Use a horizontally split window for the
				taglist window.
|'Tlist_Use_Right_Window'|	Place the taglist window on the right side.
|'Tlist_Use_SingleClick'|	Single click on a tag jumps to it.
|'Tlist_WinHeight'|		Horizontally split taglist window height.
|'Tlist_WinWidth'|		Vertically split taglist window width.

						*'Tlist_Auto_Highlight_Tag'*
Tlist_Auto_Highlight_Tag~
The taglist plugin will automatically highlight the current tag in the taglist
window. If you want to disable this, then you can set the
'Tlist_Auto_Highlight_Tag' variable to zero. Note that even though the current
tag highlighting is disabled, the tags for a new file will still be added to
the taglist window.
>
	let Tlist_Auto_Highlight_Tag = 0
<
With the above variable set to 1, you can use the ":TlistHighlightTag" command
to highlight the current tag.

						*'Tlist_Auto_Open'*
Tlist_Auto_Open~
To automatically open the taglist window, when you start Vim, you can set the
'Tlist_Auto_Open' variable to 1. By default, this variable is set to zero and
the taglist window will not be opened automatically on Vim startup.
>
	let Tlist_Auto_Open = 1
<
The taglist window is opened only when a supported type of file is opened on
Vim startup. For example, if you open text files, then the taglist window will
not be opened.

						*'Tlist_Auto_Update'*
Tlist_Auto_Update~
When a new file is edited, the tags defined in the file are automatically
processed and added to the taglist. To stop adding new files to the taglist,
set the 'Tlist_Auto_Update' variable to zero. By default, this variable is set
to 1.
>
	let Tlist_Auto_Update = 0
<
With the above variable set to 1, you can use the ":TlistUpdate" command to
add the tags defined in the current file to the taglist.

						*'Tlist_Close_On_Select'*
Tlist_Close_On_Select~
If you want to close the taglist window when a file or tag is selected, then
set the 'Tlist_Close_On_Select' variable to 1. By default, this variable is
set zero and when you select a tag or file from the taglist window, the window
is not closed.
>
	let Tlist_Close_On_Select = 1
<
						*'Tlist_Compact_Format'*
Tlist_Compact_Format~
By default, empty lines are used to separate different tag types displayed for
a file and the tags displayed for different files in the taglist window. If
you want to display as many tags as possible in the taglist window, you can
set the 'Tlist_Compact_Format' variable to 1 to get a compact display.
>
	let Tlist_Compact_Format = 1
<
						*'Tlist_Ctags_Cmd'*
Tlist_Ctags_Cmd~
The 'Tlist_Ctags_Cmd' variable specifies the location (path) of the exuberant
ctags utility. If exuberant ctags is present in any one of the directories in
the PATH environment variable, then there is no need to set this variable.

The exuberant ctags tool can be installed under different names.  When the
taglist plugin starts up, if the 'Tlist_Ctags_Cmd' variable is not set, it
checks for the names exuberant-ctags, exctags, ctags, ctags.exe and tags in
the PATH environment variable.  If any one of the named executable is found,
then the Tlist_Ctags_Cmd variable is set to that name.

If exuberant ctags is not present in one of the directories specified in the
PATH environment variable, then set this variable to point to the location of
the ctags utility in your system. Note that this variable should point to the
fully qualified exuberant ctags location and NOT to the directory in which
exuberant ctags is installed. If the exuberant ctags tool is not found in
either PATH or in the specified location, then the taglist plugin will not be
loaded. Examples:
>
	let Tlist_Ctags_Cmd = 'd:\tools\ctags.exe'
	let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
<
On Microsoft Windows, if ctags.exe is installed in a directory with space
characters in the name (e.g. C:\Program Files\ctags\ctags.exe), then you need
to set the Tlist_Ctags_Cmd variable like this:
>
	let Tlist_Ctags_Cmd = '"C:\Program Files\ctags\ctags.exe"'
<
						*'Tlist_Display_Prototype'*
Tlist_Display_Prototype~
By default, only the tag name will be displayed in the taglist window. If you
like to see tag prototypes instead of names, set the 'Tlist_Display_Prototype'
variable to 1. By default, this variable is set to zero and only tag names
will be displayed.
>
	let Tlist_Display_Prototype = 1
<
						*'Tlist_Display_Tag_Scope'*
Tlist_Display_Tag_Scope~
By default, the scope of a tag (like a C++ class) will be displayed in
square brackets next to the tag name. If you don't want the tag scopes
to be displayed, then set the 'Tlist_Display_Tag_Scope' to zero. By default,
this variable is set to 1 and the tag scopes will be displayed.
>
	let Tlist_Display_Tag_Scope = 0
<
						*'Tlist_Enable_Fold_Column'*
Tlist_Enable_Fold_Column~
By default, the Vim fold column is enabled and displayed in the taglist
window. If you wish to disable this (for example, when you are working with a
narrow Vim window or terminal), you can set the 'Tlist_Enable_Fold_Column'
variable to zero.
>
	let Tlist_Enable_Fold_Column = 1
<
						*'Tlist_Exit_OnlyWindow'*
Tlist_Exit_OnlyWindow~
If you want to exit Vim if only the taglist window is currently opened, then
set the 'Tlist_Exit_OnlyWindow' variable to 1. By default, this variable is
set to zero and the Vim instance will not be closed if only the taglist window
is present.
>
	let Tlist_Exit_OnlyWindow = 1
<
						*'Tlist_File_Fold_Auto_Close'*
Tlist_File_Fold_Auto_Close~
By default, the tags tree displayed in the taglist window for all the files is
opened. You can close/fold the tags tree for the files manually. To
automatically close the tags tree for inactive files, you can set the
'Tlist_File_Fold_Auto_Close' variable to 1. When this variable is set to 1,
the tags tree for the current buffer is automatically opened and for all the
other buffers is closed.
>
	let Tlist_File_Fold_Auto_Close = 1
<
					    *'Tlist_GainFocus_On_ToggleOpen'*
Tlist_GainFocus_On_ToggleOpen~
When the taglist window is opened using the ':TlistToggle' command, this
option controls whether the cursor is moved to the taglist window or remains
in the current window. By default, this option is set to 0 and the cursor
remains in the current window. When this variable is set to 1, the cursor
moves to the taglist window after opening the taglist window.
>
	let Tlist_GainFocus_On_ToggleOpen = 1
<
					    *'Tlist_Highlight_Tag_On_BufEnter'*
Tlist_Highlight_Tag_On_BufEnter~
When you enter a Vim buffer/window, the current tag in that buffer/window is
automatically highlighted in the taglist window. If the current tag name is
not visible in the taglist window, then the taglist window contents are
scrolled to make that tag name visible. If you like to disable the automatic
highlighting of the current tag when entering a buffer, you can set the
'Tlist_Highlight_Tag_On_BufEnter' variable to zero. The default setting for
this variable is 1.
>
	let Tlist_Highlight_Tag_On_BufEnter = 0
<
						*'Tlist_Inc_Winwidth'*
Tlist_Inc_Winwidth~
By default, when the width of the window is less than 100 and a new taglist
window is opened vertically, then the window width is increased by the value
set in the 'Tlist_WinWidth' variable to accommodate the new window. The value
of this variable is used only if you are using a vertically split taglist
window.

If your terminal doesn't support changing the window width from Vim (older
version of xterm running in a Unix system) or if you see any weird problems in
the screen due to the change in the window width or if you prefer not to
adjust the window width then set the 'Tlist_Inc_Winwidth' variable to zero.
If you are using GNU Screen, you may want to set this variable to zero.
CAUTION: If you are using the MS-Windows version of Vim in a MS-DOS command
window then you must set this variable to zero, otherwise the system may hang
due to a Vim limitation (explained in :help win32-problems)
>
	let Tlist_Inc_Winwidth = 0
<
						*'Tlist_Max_Submenu_Items'*
Tlist_Max_Submenu_Items~
If a file contains too many tags of a particular type (function, variable,
class, etc.), greater than that specified by the 'Tlist_Max_Submenu_Items'
variable, then the menu for that tag type will be split into multiple
sub-menus. The default setting for the 'Tlist_Max_Submenu_Items' variable is
25.  This can be changed by setting the 'Tlist_Max_Submenu_Items' variable:
>
	let Tlist_Max_Submenu_Items = 20
<
The name of the submenu is formed using the names of the first and the last
tag entries in that submenu.

						*'Tlist_Max_Tag_Length'*
Tlist_Max_Tag_Length~
Only the first 'Tlist_Max_Tag_Length' characters from the tag names will be
used to form the tag type submenu name. The default value for this variable is
10.  Change the 'Tlist_Max_Tag_Length' setting if you want to include more or
less characters:
>
	let Tlist_Max_Tag_Length = 10
<
						*'Tlist_Process_File_Always'*
Tlist_Process_File_Always~
By default, the taglist plugin will generate and process the tags defined in
the newly opened files only when the taglist window is opened or when the
taglist menu is enabled. When the taglist window is closed, the taglist plugin
will stop processing the tags for newly opened files.

You can set the 'Tlist_Process_File_Always' variable to 1 to generate the list
of tags for new files even when the taglist window is closed and the taglist
menu is disabled.
>
	let Tlist_Process_File_Always = 1
<
To use the ":TlistShowTag" and the ":TlistShowPrototype" commands without the
taglist window and the taglist menu, you should set this variable to 1.

						*'Tlist_Show_Menu'*
Tlist_Show_Menu~
When using GUI Vim, you can display the tags defined in the current file in a
menu named "Tags". By default, this feature is turned off. To turn on this
feature, set the 'Tlist_Show_Menu' variable to 1:
>
	let Tlist_Show_Menu = 1
<
						*'Tlist_Show_One_File'*
Tlist_Show_One_File~
By default, the taglist plugin will display the tags defined in all the loaded
buffers in the taglist window. If you prefer to display the tags defined only
in the current buffer, then you can set the 'Tlist_Show_One_File' to 1. When
this variable is set to 1, as you switch between buffers, the taglist window
will be refreshed to display the tags for the current buffer and the tags for
the previous buffer will be removed.
>
	let Tlist_Show_One_File = 1
<
						*'Tlist_Sort_Type'*
Tlist_Sort_Type~
The 'Tlist_Sort_Type' variable specifies the sort order for the tags in the
taglist window. The tags can be sorted either alphabetically by their name or
by the order of their appearance in the file (chronological order). By
default, the tag names will be listed by the order in which they are defined
in the file. You can change the sort type (from name to order or from order to
name) by pressing the "s" key in the taglist window. You can also change the
default sort order by setting 'Tlist_Sort_Type' to "name" or "order":
>
	let Tlist_Sort_Type = "name"
<
						*'Tlist_Use_Horiz_Window'*
Tlist_Use_Horiz_Window~
Be default, the tag names are displayed in a vertically split window. If you
prefer a horizontally split window, then set the 'Tlist_Use_Horiz_Window'
variable to 1. If you are running MS-Windows version of Vim in a MS-DOS
command window, then you should use a horizontally split window instead of a
vertically split window. Also, if you are using an older version of xterm in a
Unix system that doesn't support changing the xterm window width, you should
use a horizontally split window.
>
	let Tlist_Use_Horiz_Window = 1
<
						*'Tlist_Use_Right_Window'*
Tlist_Use_Right_Window~
By default, the vertically split taglist window will appear on the left hand
side. If you prefer to open the window on the right hand side, you can set the
'Tlist_Use_Right_Window' variable to 1:
>
	let Tlist_Use_Right_Window = 1
<
						*'Tlist_Use_SingleClick'*
Tlist_Use_SingleClick~
By default, when you double click on the tag name using the left mouse 
button, the cursor will be positioned at the definition of the tag. You 
can set the 'Tlist_Use_SingleClick' variable to 1 to jump to a tag when
you single click on the tag name using the mouse. By default this variable
is set to zero.
>
	let Tlist_Use_SingleClick = 1
<
Due to a bug in Vim, if you set 'Tlist_Use_SingleClick' to 1 and try to resize
the taglist window using the mouse, then Vim will crash. This problem is fixed
in Vim 6.3 and above. In the meantime, instead of resizing the taglist window
using the mouse, you can use normal Vim window resizing commands to resize the
taglist window.

						*'Tlist_WinHeight'*
Tlist_WinHeight~
The default height of the horizontally split taglist window is 10. This can be
changed by modifying the 'Tlist_WinHeight' variable:
>
	let Tlist_WinHeight = 20
<
The |'winfixheight'| option is set for the taglist window, to maintain the
height of the taglist window, when new Vim windows are opened and existing
windows are closed.

						*'Tlist_WinWidth'*
Tlist_WinWidth~
The default width of the vertically split taglist window is 30. This can be
changed by modifying the 'Tlist_WinWidth' variable:
>
	let Tlist_WinWidth = 20
<
Note that the value of the |'winwidth'| option setting determines the minimum
width of the current window. If you set the 'Tlist_WinWidth' variable to a
value less than that of the |'winwidth'| option setting, then Vim will use the
value of the |'winwidth'| option.

When new Vim windows are opened and existing windows are closed, the taglist
plugin will try to maintain the width of the taglist window to the size
specified by the 'Tlist_WinWidth' variable.

==============================================================================
						*taglist-commands*
7. Commands~

The taglist plugin provides the following ex-mode commands:

|:TlistAddFiles|	Add multiple files to the taglist.
|:TlistAddFilesRecursive|
			Add files recursively to the taglist.
|:TlistClose|		Close the taglist window.
|:TlistDebug|		Start logging of taglist debug messages.
|:TlistLock|		Stop adding new files to the taglist.
|:TlistMessages|	Display the logged taglist plugin debug messages.
|:TlistOpen|		Open and jump to the taglist window.
|:TlistSessionSave|	Save the information about files and tags in the
			taglist to a session file.
|:TlistSessionLoad|	Load the information about files and tags stored
			in a session file to taglist.
|:TlistShowPrototype|	Display the prototype of the tag at or before the
		    	specified line number.
|:TlistShowTag|		Display the name of the tag defined at or before the
			specified line number.
|:TlistHighlightTag|	Highlight the current tag in the taglist window.
|:TlistToggle|		Open or close (toggle) the taglist window.
|:TlistUndebug|		Stop logging of taglist debug messages.
|:TlistUnlock|		Start adding new files to the taglist.
|:TlistUpdate|		Update the tags for the current buffer.

						*:TlistAddFiles*
:TlistAddFiles {file(s)} [file(s) ...]
		Add one or more specified files to the taglist. You can
		specify multiple filenames using wildcards. To specify a
		file name with space character, you should escape the space
		character with a backslash.
		Examples:
>
		    :TlistAddFiles *.c *.cpp
		    :TlistAddFiles file1.html file2.html
<
		If you specify a large number of files, then it will take some
		time for the taglist plugin to process all of them. The
		specified files will not be edited in a Vim window and will
		not be added to the Vim buffer list.

						*:TlistAddFilesRecursive*
:TlistAddFilesRecursive {directory} [ {pattern} ]
		Add files matching {pattern} recursively from the specified
		{directory} to the taglist. If {pattern} is not specified,
		then '*' is assumed. To specify the current directory, use "."
		for {directory}. To specify a directory name with space
		character, you should escape the space character with a
		backslash.
		Examples:
>
		    :TlistAddFilesRecursive myproject *.java
		    :TlistAddFilesRecursive smallproject
<
		If large number of files are present in the specified
		directory tree, then it will take some time for the taglist
		plugin to process all of them.

						*:TlistClose*
:TlistClose	Close the taglist window. This command can be used from any
		one of the Vim windows.

						*:TlistDebug*
:TlistDebug [filename]
		Start logging of debug messages from the taglist plugin.
		If {filename} is specified, then the debug messages are stored
		in the specified file. Otherwise, the debug messages are
		stored in a script local variable. If the file {filename} is
		already present, then it is overwritten.

						*:TlistLock*
:TlistLock
		Lock the taglist and don't process new files. After this
		command is executed, newly edited files will not be added to
		the taglist.

						*:TlistMessages*
:TlistMessages
		Display the logged debug messages from the taglist plugin
		in a window.  This command works only when logging to a
		script-local variable.

						*:TlistOpen*
:TlistOpen	Open and jump to the taglist window. Creates the taglist
		window, if the window is not opened currently. After executing
		this command, the cursor is moved to the taglist window.  When
		the taglist window is opened for the first time, all the files
		in the buffer list are processed and the tags defined in them
		are displayed in the taglist window.

						*:TlistSessionSave*
:TlistSessionSave {filename}
		Saves the information about files and tags in the taglist to
		the specified file. This command can be used to save and
		restore the taglist contents across Vim sessions.

						*:TlistSessionLoad*
:TlistSessionLoad {filename}
		Load the information about files and tags stored in the
		specified session file to the taglist.

						*:TlistShowPrototype*
:TlistShowPrototype [filename] [linenumber]
		Display the prototype of the tag at or before the specified
		line number. If the file name and the line number are not
		specified, then the current file name and line number are
		used. A tag spans multiple lines starting from the line where
		it is defined to the line before the next tag. This command
		displays the prototype for the tag for any line number in this
		range. 

						*:TlistShowTag*
:TlistShowTag [filename] [linenumber]
		Display the name of the tag defined at or before the specified
		line number. If the file name and the line number are not
		specified, then the current file name and line number are
		used. A tag spans multiple lines starting from the line where
		it is defined to the line before the next tag. This command
		displays the tag name for any line number in this range. 

						*:TlistHighlightTag*
:TlistHighlightTag
		Highlight the current tag in the taglist window. By default,
		the taglist plugin periodically updates the taglist window to
		highlight the current tag. This command can be used to force
		the taglist plugin to highlight the current tag.

						*:TlistToggle*
:TlistToggle	Open or close (toggle) the taglist window. Opens the taglist
		window, if the window is not opened currently. Closes the
		taglist window, if the taglist window is already opened. When
		the taglist window is opened for the first time, all the files
		in the buffer list are processed and the tags are displayed in
		the taglist window. After executing this command, the cursor
		is not moved from the current window to the taglist window.

						*:TlistUndebug*
:TlistUndebug
		Stop logging of debug messages from the taglist plugin.

						*:TlistUnlock*
:TlistUnlock
		Unlock the taglist and start processing newly edited files.

						*:TlistUpdate*
:TlistUpdate	Update the tags information for the current buffer. This
		command can be used to re-process the current file/buffer and
		get the tags information. As the taglist plugin uses the file
		saved in the disk (instead of the file displayed in a Vim
		buffer), you should save a modified buffer before you update
		the taglist. Otherwise the listed tags will not include the
		new tags created in the buffer. You can use this command even
		when the taglist window is not opened.

==============================================================================
						*taglist-functions*
8. Global functions~

The taglist plugin provides several global functions that can be used from
other Vim plugins to interact with the taglist plugin. These functions are
described below.

|Tlist_Get_Filenames()|			Return filenames in the taglist
|Tlist_Update_File_Tags()|		Update the tags for the specified file
|Tlist_Get_Tag_Prototype_By_Line()|	Return the prototype of the tag at or
				    	before the specified line number in the
				    	specified file.
|Tlist_Get_Tagname_By_Line()|		Return the name of the tag at or
					before the specified line number in
					the specified file.
|Tlist_Set_App()|			Set the name of the application
					controlling the taglist window.

					    *Tlist_Get_Filenames()*
Tlist_Get_Filenames()
		Returns a list of filenames in the taglist. Each filename is
		separated by a newline (\n) character. If the taglist is empty
		an empty string is returned.

					    *Tlist_Update_File_Tags()*
Tlist_Update_File_Tags({filename}, {filetype})
		Update the tags for the file {filename}. The second argument
		specifies the Vim filetype for the file. If the taglist plugin
		has not processed the file previously, then the exuberant
		ctags tool is invoked to generate the tags for the file.

					    *Tlist_Get_Tag_Prototype_By_Line()*
Tlist_Get_Tag_Prototype_By_Line([{filename}, {linenumber}])
		Return the prototype of the tag at or before the specified
		line number in the specified file. If the filename and line
		number are not specified, then the current buffer name and the
		current line number are used.

					    *Tlist_Get_Tagname_By_Line()*
Tlist_Get_Tagname_By_Line([{filename}, {linenumber}])
		Return the name of the tag at or before the specified line
		number in the specified file. If the filename and line number
		are not specified, then the current buffer name and the
		current line number are used.

					    *Tlist_Set_App()*
Tlist_Set_App({appname})
		Set the name of the plugin that controls the taglist plugin
		window and buffer. This can be used to integrate the taglist
		plugin with other Vim plugins.
		
		For example, the winmanager plugin and the Cream package use
		this function and specify the appname as "winmanager" and
		"cream" respectively.
		
		By default, the taglist plugin is a stand-alone plugin and
		controls the taglist window and buffer. If the taglist window
		is controlled by an external plugin, then the appname should
		be set appropriately.

==============================================================================
						*taglist-extend*
9. Extending~

The taglist plugin supports all the languages supported by the exuberant ctags
tool, which includes the following languages: Assembly, ASP, Awk, Beta, C,
C++, C#, Cobol, Eiffel, Erlang, Fortran, HTML, Java, Javascript, Lisp, Lua,
Make, Pascal, Perl, PHP, Python, Rexx, Ruby, Scheme, Shell, Slang, SML, Sql,
TCL, Verilog, Vim and Yacc.

You can extend the taglist plugin to add support for new languages and also
modify the support for the above listed languages.

You should NOT make modifications to the taglist plugin script file to add
support for new languages. You will lose these changes when you upgrade to the
next version of the taglist plugin. Instead you should follow the below
described instructions to extend the taglist plugin.

You can extend the taglist plugin by setting variables in the .vimrc or _vimrc
file. The name of these variables depends on the language name and is
described below.

Modifying support for an existing language~
To modify the support for an already supported language, you have to set the
tlist_xxx_settings variable in the ~/.vimrc or $HOME/_vimrc file. Replace xxx
with the Vim filetype name for the language file.  For example, to modify the
support for the perl language files, you have to set the tlist_perl_settings
variable. To modify the support for java files, you have to set the
tlist_java_settings variable.

To determine the filetype name used by Vim for a file, use the following
command in the buffer containing the file:

	:set filetype

The above command will display the Vim filetype for the current buffer.

The format of the value set in the tlist_xxx_settings variable is

    <language_name>;flag1:name1;flag2:name2;flag3:name3

The different fields in the value are separated by the ';' character.

The first field 'language_name' is the name used by exuberant ctags to refer
to this language file. This name can be different from the file type name used
by Vim. For example, for C++, the language name used by ctags is 'c++' but the
filetype name used by Vim is 'cpp'. To get the list of language names
supported by exuberant ctags, use the following command:

	$ ctags --list-maps=all

The remaining fields follow the format "flag:name". The sub-field 'flag' is
the language specific flag used by exuberant ctags to generate the
corresponding tags. For example, for the C language, to list only the
functions, the 'f' flag is used. To get the list of flags supported by
exuberant ctags for the various languages use the following command:

	$ ctags --list-kinds=all

The sub-field 'name' specifies the title text to use for displaying the tags
of a particular type. For example, 'name' can be set to 'functions'. This
field can be set to any text string name.

For example, to list only the classes and functions defined in a C++ language
file, add the following line to your .vimrc file:

	let tlist_cpp_settings = 'c++;c:class;f:function'

In the above setting, 'cpp' is the Vim filetype name and 'c++' is the name
used by the exuberant ctags tool. 'c' and 'f' are the flags passed to
exuberant ctags to list C++ classes and functions and 'class' is the title
used for the class tags and 'function' is the title used for the function tags
in the taglist window.

For example, to display only functions defined in a C file and to use "My
Functions" as the title for the function tags, use

	let tlist_c_settings = 'c;f:My Functions'

When you set the tlist_xxx_settings variable, you will override the default
setting used by the taglist plugin for the 'xxx' language. You cannot add to
the default options used by the taglist plugin for a particular file type. To
add to the options used by the taglist plugin for a language, copy the option
values from the taglist plugin file to your .vimrc file and modify it.

Adding support for a new language~
If you want to add support for a new language to the taglist plugin, you need
to first extend the exuberant ctags tool. For more information about extending
exuberant ctags, visit the following page:

    http://ctags.sourceforge.net/EXTENDING.html

To add support for a new language, set the tlist_xxx_settings variable in the
~/.vimrc file appropriately as described above. Replace 'xxx' in the variable
name with the Vim filetype name for the new language.

For example, to extend the taglist plugin to support the latex language, you
can use the following line (assuming, you have already extended exuberant
ctags to support the latex language):

	let tlist_tex_settings='latex;b:bibitem;c:command;l:label'

With the above line, when you edit files of filetype "tex" in Vim, the taglist
plugin will invoke the exuberant ctags tool passing the "latex" filetype and
the flags b, c and l to generate the tags. The text heading 'bibitem',
'command' and 'label' will be used in the taglist window for the tags which
are generated for the flags b, c and l respectively.

==============================================================================
						*taglist-faq*
10. Frequently Asked Questions~

Q. The taglist plugin doesn't work. The taglist window is empty and the tags
   defined in a file are not displayed. 
A. Are you using Vim version 6.0 and above? The taglist plugin relies on the
   features supported by Vim version 6.0 and above. You can use the following
   command to get the Vim version:
>
	$ vim --version
<
   Are you using exuberant ctags version 5.0 and above? The taglist plugin
   relies on the features supported by exuberant ctags and will not work with
   GNU ctags or the Unix ctags utility. You can use the following command to
   determine whether the ctags installed in your system is exuberant ctags:
>
	$ ctags --version
<
   Is exuberant ctags present in one of the directories in your PATH? If not,
   you need to set the Tlist_Ctags_Cmd variable to point to the location of
   exuberant ctags. Use the following Vim command to verify that this is setup
   correctly:
>
	:echo system(Tlist_Ctags_Cmd . ' --version')
<
   The above command should display the version information for exuberant
   ctags.

   Did you turn on the Vim filetype detection? The taglist plugin relies on
   the filetype detected by Vim and passes the filetype to the exuberant ctags
   utility to parse the tags. Check the output of the following Vim command:
>
	:filetype
<
   The output of the above command should contain "filetype detection:ON".
   To turn on the filetype detection, add the following line to the .vimrc or
   _vimrc file:
>
	filetype on
<
   Is your version of Vim compiled with the support for the system() function?
   The following Vim command should display 1:
>
	:echo exists('*system')
<
   In some Linux distributions (particularly Suse Linux), the default Vim
   installation is built without the support for the system() function. The
   taglist plugin uses the system() function to invoke the exuberant ctags
   utility. You need to rebuild Vim after enabling the support for the
   system() function. If you use the default build options, the system()
   function will be supported. 

   Do you have the |'shellslash'| option set? You can try disabling the
   |'shellslash'| option. When the taglist plugin invokes the exuberant ctags
   utility with the path to the file, if the incorrect slashes are used, then
   you will see errors.
   
   Check the shell related Vim options values using the following command:
>
	:set shell? shellcmdflag? shellpipe?
	:set shellquote? shellredir? shellxquote?
<
   If these options are set in your .vimrc or _vimrc file, try removing those
   lines.

   Are you using a Unix shell in a MS-Windows environment? For example,
   the Unix shell from the MKS-toolkit. Do you have the SHELL environment
   set to point to this shell? You can try resetting the SHELL environment
   variable.

   If you are using a Unix shell on MS-Windows, you should try to use
   exuberant ctags that is compiled for Unix-like environments so that
   exuberant ctags will understand path names with forward slash characters.

   Is your filetype supported by the exuberant ctags utility? The file types
   supported by the exuberant ctags utility are listed in the ctags help. If a
   file type is not supported, you have to extend exuberant ctags. You can use
   the following command to list the filetypes supported by exuberant ctags:
>
	ctags --list-languages
<
   Run the following command from the shell prompt and check whether the tags
   defined in your file are listed in the output from exuberant ctags:
>
	ctags -f - --format=2 --excmd=pattern --fields=nks <filename>
<
   If you see your tags in the output from the above command, then the
   exuberant ctags utility is properly parsing your file.

   Do you have the .ctags or _ctags or the ctags.cnf file in your home
   directory for specifying default options or for extending exuberant ctags?
   If you do have this file, check the options in this file and make sure
   these options are not interfering with the operation of the taglist plugin.

   If you are using MS-Windows, check the value of the TEMP and TMP
   environment variables. If these environment variables are set to a path
   with space characters in the name, then try using the DOS 8.3 short name
   for the path or set them to a path without the space characters in the
   name. For example, if the temporary directory name is "C:\Documents and
   Settings\xyz\Local Settings\Temp", then try setting the TEMP variable to
   the following:
>
	set TEMP=C:\DOCUMEN~1\xyz\LOCALS~1\Temp
<
   If exuberant ctags is installed in a directory with space characters in the
   name, then try adding the directory to the PATH environment variable or try
   setting the 'Tlist_Ctags_Cmd' variable to the shortest path name to ctags
   or try copying the exuberant ctags to a path without space characters in
   the name. For example, if exuberant ctags is installed in the directory
   "C:\Program Files\Ctags", then try setting the 'Tlist_Ctags_Cmd' variable
   as below:
>
	let Tlist_Ctags_Cmd='C:\Progra~1\Ctags\ctags.exe'
<
   If you are using a cygwin compiled version of exuberant ctags on MS-Windows,
   make sure that either you have the cygwin compiled sort utility installed
   and available in your PATH or compile exuberant ctags with internal sort
   support. Otherwise, when exuberant ctags sorts the tags output by invoking
   the sort utility, it may end up invoking the MS-Windows version of
   sort.exe, thereby resulting in failure.

Q. When I try to open the taglist window, I am seeing the following error
   message. How do I fix this problem?

   Taglist: Failed to generate tags for /my/path/to/file
   ctags: illegal option -- -^@usage: ctags [-BFadtuwvx] [-f tagsfile] file ...

A. The taglist plugin will work only with the exuberant ctags tool. You
   cannot use the GNU ctags or the Unix ctags program with the taglist plugin.
   You will see an error message similar to the one shown above, if you try
   use a non-exuberant ctags program with Vim. To fix this problem, either add
   the exuberant ctags tool location to the PATH environment variable or set
   the 'Tlist_Ctags_Cmd' variable.

Q. A file has more than one tag with the same name. When I select a tag name
   from the taglist window, the cursor is positioned at the incorrect tag
   location. 
A. The taglist plugin uses the search pattern generated by the exuberant ctags
   utility to position the cursor at the location of a tag definition. If a
   file has more than one tag with the same name and same prototype, then the
   search pattern will be the same. In this case, when searching for the tag
   pattern, the cursor may be positioned at the incorrect location. 

Q. I have made some modifications to my file and introduced new
   functions/classes/variables. I have not yet saved my file. The taglist
   plugin is not displaying the new tags when I update the taglist window.
A. The exuberant ctags utility will process only files that are present in the
   disk. To list the tags defined in a file, you have to save the file and
   then update the taglist window. 

Q. I have created a ctags file using the exuberant ctags utility for my source
   tree. How do I configure the taglist plugin to use this tags file? 
A. The taglist plugin doesn't use a tags file stored in disk. For every opened
   file, the taglist plugin invokes the exuberant ctags utility to get the
   list of tags dynamically. The Vim system() function is used to invoke
   exuberant ctags and get the ctags output. This function internally uses a
   temporary file to store the output. This file is deleted after the output
   from the command is read. So you will never see the file that contains the
   output of exuberant ctags.

Q. When I set the |'updatetime'| option to a low value (less than 1000) and if
   I keep pressing a key with the taglist window open, the current buffer
   contents are changed. Why is this?
A. The taglist plugin uses the |CursorHold| autocmd to highlight the current
   tag. The CursorHold autocmd triggers for every |'updatetime'| milliseconds.
   If the |'updatetime'| option is set to a low value, then the CursorHold
   autocmd will be triggered frequently. As the taglist plugin changes
   the focus to the taglist window to highlight the current tag, this could
   interfere with the key movement resulting in changing the contents of
   the current buffer. The workaround for this problem is to not set the
   |'updatetime'| option to a low value.

==============================================================================
						*taglist-license*
11. License~
Permission is hereby granted to use and distribute the taglist plugin, with or
without modifications, provided that this copyright notice is copied with it.
Like anything else that's free, taglist.vim is provided *as is* and comes with
no warranty of any kind, either expressed or implied. In no event will the
copyright holder be liable for any damamges resulting from the use of this
software.

==============================================================================
						*taglist-todo*
12. Todo~

1. Group tags according to the scope and display them. For example,
   group all the tags belonging to a C++/Java class 
2. Support for displaying tags in a modified (not-yet-saved) file. 
3. Automatically open the taglist window only for selected filetypes.
   For other filetypes, close the taglist window. 
4. When using the shell from the MKS toolkit, the taglist plugin 
   doesn't work.
5. The taglist plugin doesn't work with files edited remotely using the
   netrw plugin. The exuberant ctags utility cannot process files over
   scp/rcp/ftp, etc.

==============================================================================

vim:tw=78:ts=8:noet:ft=help:
                                                                                                                                                                     .vim/doc/winmanager.txt                                                                             000644  000765  000024  00000065220 07452005015 016272  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         *winmanager*       Plugin for a classical Windows style IDE for Vim 6.0
                         For Vim version 6.0.
              Last Change: Sun Mar 31 11:00 PM 2002 PST

                            By Srinath Avadhanula
                            (srinath@fastmail.fm)

                                                         *winmanager-plugin*

winmanager.vim is a plugin which implements a classical windows type IDE in
Vim-6.0, where the directory and buffer browsers are displayed in 2 windows on
the left and the current editing is done on the right. When you open up a new
vim window, simply type in :WMToggle. This will start up winmanager.

Note This plugin is available only if 'compatible' is not set
     You can avoid loading this plugin by setting the "loaded_winmanager"
     variable >
        :let loaded_winmanager = 1

{Vi does not have any of this}
===========================================================================
OVERVIEW                                              *winmanager-overview*

|winmanager-installing|  Please follow these instructions for installing
                         winmanager. 

|winmanager-customizing| Describes ways of customizing the window layout, i.e
                         how to club various explorers into groups, how to
                         change their relative position, etc.

|winmanager-details|     details of using winmanager. keyboard shortcuts
                         and other usage details.

|winmanager-commands|    commands provided to the user. its useful to
                         set keyboard shortcuts to these commands.

|winmanager-settings|    settings (typically made in ~/.vimrc) which
                         affect the behavior of winmanager.

|winmanager-adding|      one of the most important new features of this
                         version is the creation of a framework whereby adding
                         other plugins like explorer.vim or bufexplorer.vim to
                         winmanager. This section describes briefly the
                         implementation of winmanager and then describes how
                         to add a new plugin to winmanager

|add-local-help|         how to use this text file as a vim help file.
|winmanager-bug|         bug reports are welcome.
|winmanager-thanks|      thanks to the many people who helped!

===========================================================================
UPDATES                                                *winmanager-updates*

The official releases can be found at: >
    http://vim.sourceforge.net/scripts/script.php?script_id=95
However, I will only update the vim.sf.net version of winmanager.zip in case
of a major bug or new feature. For small (and not so bothersome) bug-fixes, I
will put the latest version at: >
    http://robotics.eecs.berkeley.edu/~srinath/vim/winmanager-2.0.htm
and also announce it in vim@vim.org when an update occurs.
Therefore if you want to keep to be kept abreast of updates, you could
check occassionally at vim@vim.org. (you can also use your mail server's
filtering capability to effectively subscribe to the announcement).

============================================================================
INSTALLING                                          *winmanager-installing*

winmanager.vim should start working as soon as you restart vim after unzipping
the .zip file you got this from into ~/.vim (unix) or ~\vimfiles (dos)

winmanager only recognizes plugins whose name appears in the global variable >
    g:winManagerWindowLayout
<  
By default this global variable has the value >
    g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer'
<
(which is the value which winmanager uses if its not set in the user's .vimrc)

This global variable is responsible for making winmanager recognize the
existence of the explorers and simultaneously custome the window layout.  See
the next section for how to set this variable for various custom layouts of
winmanager.

============================================================================
CUSTOMIZING                                         *winmanager-customizing*

The layout of winmanager is controlled by changing the value of the
"g:winManagerWindowLayout" variable. The general form of this variable is
>
   g:winManagerWindowLayout =
   'Group1_Member1,Group1_Member2|Group2_Member_1,Group2_Member_2'
<
i.e, explorer "groups" are seperated by the '|' character. Within each group,
individual explorer plugin names are seperated by the comma (',') character.
What winmanager does is display only 1 member from each group in a window. The
user can go to a window and press <C-n> to display the next explorer belonging
to that group. This ability to "group" windows is valuable to preserve screen
real-estate by using them only as needed.

Thus for the default value of 'g:winManagerWindowLayout', winmanager will
split the vim window as follows:
        +-----------+-------------------+
        |           |                   |
        | File      |                   |
        | explorer  |    File being     |
        |           |     edited        |
        |           |                   |
        +-----------+                   |
        | Buffer    |                   |
        | explorer  |                   |
        |           |                   |
        +-----------+-------------------+

The user can go the [File List] window and press <C-n> to goto the
'TagsExplorer' view. 

Removing a plugin name from the 'g:winManagerWindowLayout' variable means
winmanager no longer sees that variable.

============================================================================
COMMANDS                                               *winmanager-commands*

:WMToggle                 :toggles the visibility of winmanager. This can
                           also be used to start winmanager for the first
                           time. A handy mapping is: >
            :map <c-w><c-t> :WMToggle<cr> 
<                          mnemonic: window-toggle : <c-W><c-T>

:FirstExplorerWindow      :directly takes you to the first explorer window
                           from the top left corner which is visible. >
            :map <c-w><c-f> :FirstExplorerWindow<cr>
<                          mnemonic: window-first  : <c-W><c-F>

:BottomExplorerWindow     :directly takes you to the last explorere window
                           from the top-left which is visible. >
            :map <c-w><c-b> :BottomExplorerWindow<cr>
<                          mnemonic: window-last   : <c-W><c-B>

NOTE: winmanager does not provide any mappings by default. These have to set
in the user's .vimrc if you want to use mappings.

============================================================================
SETTINGS                                               *winmanager-settings*

The values of the following global variables should be set in your .vimrc
file if you want a different value than the default:

g:persistentBehaviour: if set to 0, then as soon as you quit all the files
    and only the explorer windows are the ones left, vim will quit. the
    default is 1, which means that the explorer windows persist even if
    they are the only ones visible.

g:winManagerWidth: the width of the explorer areas. 
    (default 25)

g:defaultExplorer:  If you want winmanager to assume the functioning of the
    default explorer.vim which ships with vim, set this variable to 0.
    (default 1). If this variable is set to 1, then winmanager will behave as
    follows:
    . if the user starts off vim with a command such as
      ":vim some/dir/" then winmanager starts off the window layout with
      FileExplorer at the top left window. as of now it changes the
      g:windowLayout variable so that file explorer appears in the top left
      window.
    . if on the other hand the user does ":e some/dir/" while _inside_ vim,
      then the behavior is consistent with the original behavior of the
      explorer.vim plugin which ships with vim, i.e, the directory is opened
      in a buffer and the user can use that to open a file in that window.
    Note that the commands ":Explore" and ":Sexplore" are still available if
    you set this variable to 1.
    winfileexplorer.vim, the modification of explorer.vim which ships with
    this version is different from the standard explorer.vim in that it has
    display caching. i.e, the directory is read and sorted only the first
    time. From the second time on, the directory list is cached in a script
    variable so display is faster.

                                            *winmanager-fileexplorer-settings*
See |explorer| for details. 
NOTE: Some of the settings used in explorer.vim are not utlized in
winmanager.
                                            *winmanager-bufexplorer-settings*
g:bufExplorerMaxHeight: the buffer list window dynamicall rescales itself to
    occupy only the minimum space required to display all the windows. you
    can set a maximum number of lines for this window. (defualt 15)
See |bufexplorer| for details on additional options. 
NOTE: Some of the settings used in bufexplorer.vim are not utlized in
winmanager.

=============================================================================
DETAILED HELP                                            *winmanager-details*

When winmanager starts up, it divides up the whole vim window into 2
"regions". The region on the left is the "explorer area" where the various
explorer plugins are displayed. The region on the right is the "file editing
area", where the user works on his current editing session. 

        +--------+-------------------+
        |        |                   |
        |        |      2(i)         |
        | 1(i)   |                   |
        |        +-------------------+
        |        |                   |
        +--------+      2(ii)        |
        | 1(ii)  |                   |
        +--------+-------------------+

The explorer area (area 1) might contain multiple windows each of which might
contain multiple explorers. In the default configuration (for
g:winManagerWindowLayout = 'FileExplorer,TagsExplorer|BufExplorer'), the first
window can be thought of as containing 2 explorers, the file explorer plugin
and the tags explorer plugin, while the bottom window contains bufexplorer by
itself.

When a window contains multiple explorers, then the user can cycle between
them by pressing <c-n> (mnemonic: next) or <c-p> (mnemonic: previous). 

This section describes the various keyboard shortcuts for the 3 plugins which
are used with winmanager by default.
NOTE: Other plugins might be distributed as add-ins to winmanager. In that
case, please refer to the help which ships with that plugin.
 
1. File Explorer plugin
This plugin displays the current directory. Its a modification of the standard
explorer.vim which ships with vim6.0. The following keyboard shortcuts are
available with this plugin:
<enter>          if on a directory, enters it and displays it in the same
                 area. If on a file, then opens it in the File Editing Area.
                 Attempts to open in the same window as the one visited
                 before, otherwise split open a new window horizontally. if
                 this sounds a bit confusing, it isnt. its the most intuitive
                 behaviour that one expects.
<2-leftmouse>   (doubleclick) the same as <enter>
<tab>            open the file or directory in a new window in the FileEditing
                 area. 
c                change the pwd to the directory currently displayed 
C                change the currently displayed directory to pwd (converse of
                 c) this helps in changing to different drives in windows.
                 i.e, if you are currently on the c: drive and you want to
                 change to the d: drive, you will have to do 
                 cd d:\
                 and then press 'C' in the file explorer area.
s                select sort field (size, date, name) 
r                reverse direction of sort 
f                add current directory to list of favorites.
R                rename file 
D                delete file (or range of files in visual mode)
-                move up one level
<F5>             refresh the file list

2. Buffer Explorer plugin
See |bufexplorer-usage| for details.
NOTE: In addition to those shortcuts, winmanager adds the following:
<tab>             Opens the buffer under the cursor in a split window even if
                  the current buffer is not modified.

This window is dynamically rescaled and re-displayed. i.e, when a new window
opens somehwere, the buffer list is automatically updated. also, it tries to
occupy the minimum possible space required to display the files. 

3. File Editing Area
The area where normal editing takes place. The commands in the File Explorer
and Buffer Explorer shouldnt affect the layout of the windows here. Some
mappings which I find useful (which should be placed in your .vimrc if you
plan on using WManager often) is 
>
    map <c-w><c-b> :BottomExplorerWindow<cr>
    map <c-w><c-f> :FirstExplorerWindow<cr>
    map <c-w><c-t> :WMToggle<cr>

Pressing CTRL-W-B should then take you directly to the last explorer window
Similarly pressing CTRL-W-F should take you to the first explorer window.
CTRL-W-T will toggle between the winmanager visible and invisible.

=============================================================================
ADDING NEW PLUGINS                                        *winmanager-adding*

This section is of interest only to people who might want to extend winmanager
by adding other plugins to it. The casual user can skip it.

One of the most important new features of winmanager2.x is the ability to let
other users add IDE type plugins to winmanager.vim with a minimum of effort.
The way winmanager ships, it usually contains the following plugins:
>
    (FileExplorer, TagsExplorer)
    (BufExplorer)

i.e, FileExplorer and TagsExplorer occupy one window as a single group, while
BufExplorer occupies another window. "Adding" a plugin means that you will be
able to add a seperate IDE plugin, (call it "YourPlugin" henceforth) either to
one of these groups or seperately by itself. This section describes how to
accomplish this. Although the section is somewhat lengthy, please rest assured
that its really quite simple to do. Have a look at |wintagexplorer|.vim for a
small plugin which accomplishes this.

To better understand the process, its helpful to give a short description of
the workings of winmanager. When a user wants to use your plugin, he
"registers" it with winmanager, i.e he adds the "name" of the plugin to the
variable g:winManagerWindowLayout in his .vimrc as:

    " this line goes in the user's .vimrc
    let g:winManagerWindowLayout = "FileExplorer,TagsExplorer|YourPlugin"

When winmanager starts up, it remembers the string "YourPlugin" internally as
the plugins "name". (The reason for making this a part of the user's .vimrc
is that that way, he can customize the window layout according to his
preferences).

In addition to registering, the plugin itself initializes a variable called
the "title" which starts with the name, such as: >

    " this line goes in your script file.
    let g:YourPlugin_title = "[My Plugin Title]"

<
NOTE: Just like the rest of the hooks provided by your plugin, this global
variable name is formed according the rule: g:<YourPluginName>_title.

When winmanager starts up, it performs the following 2 actions:
    1. It opens a new file with the "title" provided by the plugin. This
       automatically ensures that the same buffer is opened for multiple
       invokations of the plugin.
       NOTE: It is very important for this reason that the plugin's name be
       distinct so that there is a low (ideally zero) probability of a file
       with the same name existing on a user's system.
    2. It modifies the "name" string (in this case "YourPlugin") to form 
       "call YourPlugin_Start()" and then |exec|s this string. Thus winmanager
       communicates with your plugin by using a number of such "hooks" or
       global functions which all start with the string "YourPlugin" which are
       defined in the script file you create.

In order to enable the dynamic nature of winmanager, where you can have your
plugin change its display every time a |BufEnter| or |BufDelete| event occurs,
it is necessary to provide a few other hooks. Every time a BufEnter or
BufDelete event occurs, winmanager makes a loop over all the visible buffers.
Then it "refreshes" the display of that plugin if it is "invalid". The
following paragraphs describe the hooks that have to be provided to enable
this.

                                                           *winmanager-hooks*

The following is a list of hooks which should be provided. A few of them are
optional. Consider the case where you want to add a plugin which you have
named "YourPlugin". In the following discussion, a "hook" simply refers to a
globally visible function which is formed according to the rule that it start
with the string "YourPlugin_", where "YourPlugin" is the name of your plugin.

                                                       *winmanager-hook-start* 
YourPlugin_Start()       This function is called during initialization.  It
{Mandatory}              can be assumed (and _should_ be) that the focus is
                         already in the buffer where stuff needs to be
                         displayed. i.e, the plugin shouldnt open some other
                         buffer during this function. (i.e, commands such as
                         ":e", ":vsplit", ":wincmd h" etc in this stage are
                         bad. If however, you absolutely need to switch
                         buffers or something which will cause |BufEnter| or
                         |BufDelete| events, then you need to temporarily
                         switch winmanager off by using
                         |WinManagerSuspendAUs|)

                                                    *winmanager-hook-isvalid*
YourPlugin_IsValid()     winmanager is dynamic in the sense that it allows the
{Mandatory}              plugins to change their displays when a BufEnter event
                         occurs. At each BufEnter event, winmanager will cycle
                         through all the visible explorers asking them if
                         their display is "valid". If it isn't, then they will
                         be redrawn by calling the next function.

                         For plugins such as bufexplorer which change with
                         every BufEnter, it is sufficient to make this always
                         return 1. For plugins such as fileexplorer, the
                         display never changes with the BufEnter even. hence
                         in its case, it will always return 0.

                                                     *winmanager-hook-refresh*
YourPlugin_Refresh()      If the YourPlugin_IsValid() function returns 0, then
{Optional}                this function is called to update the display. if the
                          first function always returns 1, then this function
                          need not be defined.
                          NOTE: It is not clear at this time whether this
                          function is really necessary. It might be obsoleted
                          in the future. Future versions might call the
                          _Start() function instead.
                          NOTE: It has been obsoleted as of version 2.1

                                                      *winmanager-hook-resize*
YourPlugin_ReSize()       The plugins can also be dynamically resizable.  (the
{Optional}                current bufexplorer which ships with the winmanager
                          exhibits this behavior).  If a plugin creates such a
                          function, then it will be called after its Refresh()
                          function. The reason for not letting the plugin make
                          this a part of its Refresh() function is that
                          sometimes resizing is not allowed, such as in
                          instances where there is no window above or below the
                          plugin to take the slack of a resize.


In addition, the plugin should also initialize the following global variable

                                                       *winmanager-hook-title*
g:YourPlugin_title        This is the name of the buffer associated with
                          this plugin. The reason for a title in addition to a
                          name is that the name should be such that a global
                          function of that name can be defined.  However, the
                          title can be more descriptive and contain spaces
                          etc. For example, the present distribution of
                          FileExplorer has the title "[File List]". Also,
                          winmanager opens a file with this name (using an
                          equivalent of ":e g:YourPlugin_title"), which
                          automatically ensures that new buffers are not eaten
                          up in multiple invokations of winmanager, toggling
                          visibility of buffers, etc. 
                          NOTE: It is very important for this reason that the
                          plugin's name be distinct so that there is a low
                          (ideally zero) probability of a file with the same
                          name existing on a user's system. 

In addition to YourPlugin providing winmanager with hooks, winmanager also
provides the following hooks for use by YourPlugin:

                                                        *WinManagerFileEdit*
WinManagerFileEdit({filename}, {split})
                          This function _must_ be used when the plugin wants
                          to open a new file in the file editing area for
                          editing. Its not sufficient to do something like
                          ":wincmd p" and then ":e filename", because first of
                          all the ":wincmd p" command gets screwed
                          (unfortunately) in the presence of winmanager
                          because of the (sometimes) large movement winmanager
                          does over all visible windows to maintain the
                          dynamic nature. Secondly, doing a simple ":e
                          filename" will not preserve the @# and the @%
                          registers properly, causing handy commands such as
                          |CTRL-^| to totally mis-behave.

                          The first argument should be (preferably) the
                          (complete) name of the file to be opened (including
                          the full path to it if possible).  The second
                          argument decides whether winmanager should attempt
                          to open the file in the same window as the last
                          window or to split a new window to open the file.

                                                     *WinManagerSuspendAUs*
WinManagerSuspendAUs()    This makes winmanager stop responding to the
                          |BufEnter| or |BufDelete| autocommands like it
                          normally does. Please use this function with care.
                          You will need to use this when you are performing
                          some action which causes these events but you dont
                          want to have winmanager go through the whole
                          isvalid/refresh cycle. NOTE: Take care to definitely
                          reset the behavior by using the next function.

                                                     *WinManagerResumeAUs*
WinManagerResumeAUs()     This is the converse of |WinManagerSuspendAUs()|. It
                          makes winmanager start responding to events with the
                          usual isvalid/refresh cycle.

                                                   *WinManagerForceReSize* 
WinManagerForceReSize()   Normally, winmanager calls the YourPlugin_ReSize()
                          function after the YourPlugin_Refresh(). However,
                          this happens only every |BufEnter| event. When the
                          plugin performs some function which requires it to
                          resize even when there was no |BufEnter| or
                          |BufDelete| event, use this function. Please avoid
                          making a call to YourPlugin_ReSize() because a
                          number of safety checks have to be performed before
                          a resizing is "legal".
                          
Finally, if you do plan on making an addin to winmanager, feel free to contact
me for help/comments/suggestions. You might also want to take a look at: >
    http://robotics.eecs.berkeley.edu/~srinath/vim/explorerSample.vim
for a simple template of an add-in plugin.

=============================================================================
BUGS                                                         *winmanager-bug*

Please send any comments for improvements or bug-reports to >
    srinath@fastmail.fm
If the bug is repeatable, then it will be of great help if a short description
of the events leading to the bug are also given.

Note "I dont like winmanager" is not a bug report, only an opinion ;-)

=============================================================================
THANKS                                                    *winmanager-thanks*

I am really grateful to all those who emailed me with bug-reports and comments
for improvement. Most of all, a huge thanks to Xiangjiang Ma for his enormous
support and extremeley helpful QA. 

Other people who helped greatly:
   Madoka Machitani: fixed a couple of typos and gave some ideas for making
      things more robust.
   Colin Dearing: gave many useful suggestions for improvement which lead to
      the fast redraw capability of winmanager
   Jeff Lanzarotta: for agreeing to make changes to bufexplorer.vim so that
      bufexplorer.vim would be compatible with the latest version of
      winmanager.vim

   and finally all the great support I got from vim@vim.org and comp.editors
   helped a lot.


vim:tw=78:et:ts=4:ft=help:norl:
                                                                                                                                                                                                                                                                                                                                                                                .vim/doc/ctrlp.txt                                                                                  000644  000765  000024  00000153327 12626714374 015312  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         *ctrlp.txt*       Fuzzy file, buffer, mru, tag, ... finder. v1.79
*CtrlP* *ControlP* *'ctrlp'* *'ctrl-p'*
===============================================================================
#                                                                             #
#          :::::::: ::::::::::: :::::::::  :::             :::::::::          #
#         :+:    :+:    :+:     :+:    :+: :+:             :+:    :+:         #
#         +:+           +:+     +:+    +:+ +:+             +:+    +:+         #
#         +#+           +#+     +#++:++#:  +#+             +#++:++#+          #
#         +#+           +#+     +#+    +#+ +#+             +#+                #
#         #+#    #+#    #+#     #+#    #+# #+#             #+#                #
#          ########     ###     ###    ### ##########      ###                #
#                                                                             #
===============================================================================
CONTENTS                                                       *ctrlp-contents*

    1. Intro........................................|ctrlp-intro|
    2. Options......................................|ctrlp-options|
    3. Commands.....................................|ctrlp-commands|
    4. Mappings.....................................|ctrlp-mappings|
    5. Input Formats................................|ctrlp-input-formats|
    6. Extensions...................................|ctrlp-extensions|

===============================================================================
INTRO                                                             *ctrlp-intro*

Full path fuzzy file, buffer, mru, tag, ... finder with an intuitive interface.
Written in pure Vimscript for MacVim, gVim and Vim version 7.0+. Has full
support for Vim's |regexp| as search pattern, built-in MRU files monitoring,
project's root finder, and more.

To enable optional extensions (tag, dir, rtscript...), see |ctrlp-extensions|.

===============================================================================
OPTIONS                                                         *ctrlp-options*

Overview:~

  |loaded_ctrlp|................Disable the plugin.
  |ctrlp_map|...................Default mapping.
  |ctrlp_cmd|...................Default command used for the default mapping.
  |ctrlp_by_filename|...........Default to filename mode or not.
  |ctrlp_regexp|................Default to regexp mode or not.
  |ctrlp_match_window|..........Order, height and position of the match window.
  |ctrlp_switch_buffer|.........Jump to an open buffer if already opened.
  |ctrlp_reuse_window|..........Reuse special windows (help, quickfix, etc).
  |ctrlp_tabpage_position|......Where to put the new tab page.
  |ctrlp_working_path_mode|.....How to set CtrlP's local working directory.
  |ctrlp_root_markers|..........Additional, high priority root markers.
  |ctrlp_use_caching|...........Use per-session caching or not.
  |ctrlp_clear_cache_on_exit|...Keep cache after exiting Vim or not.
  |ctrlp_cache_dir|.............Location of the cache directory.
  |ctrlp_show_hidden|...........Ignore dotfiles and dotdirs or not.
  |ctrlp_custom_ignore|.........Hide stuff when using |globpath()|.
  |ctrlp_max_files|.............Number of files to scan initially.
  |ctrlp_max_depth|.............Directory depth to recurse into when scanning.
  |ctrlp_user_command|..........Use an external scanner.
  |ctrlp_max_history|...........Number of entries saved in the prompt history.
  |ctrlp_open_new_file|.........How to open a file created by <c-y>.
  |ctrlp_open_multiple_files|...How to open files selected by <c-z>.
  |ctrlp_arg_map|...............Intercept <c-y> and <c-o> or not.
  |ctrlp_follow_symlinks|.......Follow symbolic links or not.
  |ctrlp_lazy_update|...........Only update when typing has stopped.
  |ctrlp_default_input|.........Seed the prompt with an initial string.
  |ctrlp_abbrev|................Input abbreviations.
  |ctrlp_key_loop|..............Use input looping for multi-byte input.
  |ctrlp_use_migemo|............Use Migemo patterns for Japanese filenames.
  |ctrlp_prompt_mappings|.......Change the mappings inside the prompt.

  MRU mode:
  |ctrlp_mruf_max|..............Max MRU entries to remember.
  |ctrlp_mruf_exclude|..........Files that shouldn't be remembered.
  |ctrlp_mruf_include|..........Files to be remembered.
  |ctrlp_mruf_relative|.........Show only MRU files in the working directory.
  |ctrlp_mruf_default_order|....Disable sorting.
  |ctrlp_mruf_case_sensitive|...MRU files are case sensitive or not.
  |ctrlp_mruf_save_on_update|...Save to disk whenever a new entry is added.

  BufferTag mode: (to enable, see |ctrlp-extensions|)
  |g:ctrlp_buftag_ctags_bin|....The location of the ctags-compatible binary.
  |g:ctrlp_buftag_systemenc|....The encoding used for the ctags command.
  |g:ctrlp_buftag_types|........Add new filetypes and set the cmd arguments.

  Advanced options:
  |ctrlp_open_func|.............Use custom file opening functions.
  |ctrlp_status_func|...........Change CtrlP's two statuslines.
  |ctrlp_buffer_func|...........Call custom functions in the CtrlP buffer.
  |ctrlp_match_func|............Replace the built-in matching algorithm.

-------------------------------------------------------------------------------
Detailed descriptions and default values:~

                                                                *'g:ctrlp_map'*
Use this option to change the mapping to invoke CtrlP in |Normal| mode: >
  let g:ctrlp_map = '<c-p>'
<

                                                                *'g:ctrlp_cmd'*
Set the default opening command to use when pressing the above mapping: >
  let g:ctrlp_cmd = 'CtrlP'
<

                                                             *'g:loaded_ctrlp'*
Use this to disable the plugin completely: >
  let g:loaded_ctrlp = 1
<

                                                        *'g:ctrlp_by_filename'*
Set this to 1 to set searching by filename (as opposed to full path) as the
default: >
  let g:ctrlp_by_filename = 0
<
Can be toggled on/off by pressing <c-d> inside the prompt.

                                                             *'g:ctrlp_regexp'*
Set this to 1 to set regexp search as the default: >
  let g:ctrlp_regexp = 0
<
Can be toggled on/off by pressing <c-r> inside the prompt.

                                                       *'g:ctrlp_match_window'*
Change the postion, the listing order of results, the minimum and the maximum
heights of the match window: >
  let g:ctrlp_match_window = ''
<
Example: >
  let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'
<
The position: (default: bottom)
  top - show the match window at the top of the screen.
  bottom - show the match window at the bottom of the screen.

The listing order of results: (default: btt)
  order:ttb - from top to bottom.
  order:btt - from bottom to top.

The minimum and maximum heights:
  min:{n} - show minimum {n} lines (default: 1).
  max:{n} - show maximum {n} lines (default: 10).

The maximum number of results:
  results:{n} - list maximum {n} results (default: sync with max height).

Note: When a setting isn't set, its default value will be used.

                                                      *'g:ctrlp_switch_buffer'*
When opening a file, if it's already open in a window somewhere, CtrlP will try
to jump to it instead of opening a new instance: >
  let g:ctrlp_switch_buffer = 'Et'
<
  e - jump when <cr> is pressed, but only to windows in the current tab.
  t - jump when <c-t> is pressed, but only to windows in another tab.
  v - like "e", but jump when <c-v> is pressed.
  h - like "e", but jump when <c-x> is pressed.
  E, T, V, H - like "e", "t", "v", and "h", but jump to windows anywhere.
  0 or <empty> - disable this feature.

                                                       *'g:ctrlp_reuse_window'*
When opening a file with <cr>, CtrlP avoids opening it in windows created by
plugins, help and quickfix. Use this to setup some exceptions: >
  let g:ctrlp_reuse_window = 'netrw'
<
Acceptable values are partial name, filetype or buftype of the special buffers.
Use regexp to specify the pattern.
Example: >
  let g:ctrlp_reuse_window = 'netrw\|help\|quickfix'
<

                                                   *'g:ctrlp_tabpage_position'*
Where to put the new tab page when opening one: >
  let g:ctrlp_tabpage_position = 'ac'
<
  a - after.
  b - before.
  c - the current tab page.
  l - the last tab page.
  f - the first tab page.

                                                  *'g:ctrlp_working_path_mode'*
When starting up, CtrlP sets its local working directory according to this
variable: >
  let g:ctrlp_working_path_mode = 'ra'
<
  c - the directory of the current file.
  a - like "c", but only applies when the current working directory outside of
      CtrlP isn't a direct ancestor of the directory of the current file.
  r - the nearest ancestor that contains one of these directories or files:
      .git .hg .svn .bzr _darcs
  w - begin finding a root from the current working directory outside of CtrlP
      instead of from the directory of the current file (default). Only applies
      when "r" is also present.
  0 or <empty> - disable this feature.

Note #1: if "a" or "c" is included with "r", use the behavior of "a" or "c" (as
a fallback) when a root can't be found.

Note #2: you can use a |b:var| to set this option on a per buffer basis.

                                                       *'g:ctrlp_root_markers'*
Use this to set your own root markers in addition to the default ones (.git,
.hg, .svn, .bzr, and _darcs). Your markers will take precedence: >
  let g:ctrlp_root_markers = ['']
<
Note: you can use a |b:var| to set this option on a per buffer basis.

                                                        *'g:ctrlp_use_caching'*
Enable/Disable per-session caching: >
  let g:ctrlp_use_caching = 1
<
  0 - Disable caching.
  1 - Enable caching.
  n - When bigger than 1, disable caching and use the number as the limit to
      enable caching again.

Note: you can quickly purge the cache by pressing <F5> while inside CtrlP.

                                                *'g:ctrlp_clear_cache_on_exit'*
Set this to 0 to enable cross-session caching by not deleting the cache files
upon exiting Vim: >
  let g:ctrlp_clear_cache_on_exit = 1
<

                                                          *'g:ctrlp_cache_dir'*
Set the directory to store the cache files: >
  let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
<

                                                        *'g:ctrlp_show_hidden'*
Set this to 1 if you want CtrlP to scan for dotfiles and dotdirs: >
  let g:ctrlp_show_hidden = 0
<
Note: does not apply when a command defined with |g:ctrlp_user_command| is
being used.

                                                           *'ctrlp-wildignore'*
You can use Vim's |'wildignore'| to exclude files and directories from the
results.
Examples: >
  " Excluding version control directories
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
  set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*  " Windows ('noshellslash')
<
Note #1: the `*/` in front of each directory glob is required.

Note #2: |wildignore| influences the result of |expand()|, |globpath()| and
|glob()| which many plugins use to find stuff on the system (e.g. VCS related
plugins look for .git/, .hg/,... some other plugins look for external *.exe
tools on Windows). So be a little mindful of what you put in your |wildignore|.

                                                      *'g:ctrlp_custom_ignore'*
In addition to |'wildignore'|, use this for files and directories you want only
CtrlP to not show. Use regexp to specify the patterns: >
  let g:ctrlp_custom_ignore = ''
<
Examples: >
  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
  let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
  let g:ctrlp_custom_ignore = {
    \ 'file': '\v(\.cpp|\.h|\.hh|\.cxx)@<!$'
    \ }
<
Note #1: by default, |wildignore| and |g:ctrlp_custom_ignore| only apply when
|globpath()| is used to scan for files, thus these options do not apply when a
command defined with |g:ctrlp_user_command| is being used.

Note #2: when changing the option's variable type, remember to |:unlet| it
first or restart Vim to avoid the "E706: Variable type mismatch" error.

                                                          *'g:ctrlp_max_files'*
The maximum number of files to scan, set to 0 for no limit: >
  let g:ctrlp_max_files = 10000
<
Note: does not apply when a command defined with |g:ctrlp_user_command| is
being used.

                                                          *'g:ctrlp_max_depth'*
The maximum depth of a directory tree to recurse into: >
  let g:ctrlp_max_depth = 40
<
Note: does not apply when a command defined with |g:ctrlp_user_command| is
being used.

                                                       *'g:ctrlp_user_command'*
Specify an external tool to use for listing files instead of using Vim's
|globpath()|. Use %s in place of the target directory: >
  let g:ctrlp_user_command = ''
<
Examples: >
  let g:ctrlp_user_command = 'find %s -type f'       " MacOSX/Linux
  let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d' " Windows
<
You can also use 'grep', 'findstr' or something else to filter the results.
Examples: >
  let g:ctrlp_user_command =
    \ 'find %s -type f | grep -v -P "\.jpg$|/tmp/"'          " MacOSX/Linux
  let g:ctrlp_user_command =
    \ 'dir %s /-n /b /s /a-d | findstr /v /l ".jpg \\tmp\\"' " Windows
<
Use a version control listing command when inside a repository, this is faster
when scanning large projects: >
  let g:ctrlp_user_command = [root_marker, listing_command, fallback_command]
  let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: [root_marker_1, listing_command_1],
      \ n: [root_marker_n, listing_command_n],
      \ },
    \ 'fallback': fallback_command,
    \ 'ignore': 0 or 1
    \ }
<
Some examples: >
  " Single VCS, listing command does not list untracked files:
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
  let g:ctrlp_user_command = ['.hg', 'hg --cwd %s locate -I .']

  " Multiple VCS's:
  let g:ctrlp_user_command = {
    \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
    \ 'fallback': 'find %s -type f'
    \ }

  " Single VCS, listing command lists untracked files (slower):
  let g:ctrlp_user_command =
    \ ['.git', 'cd %s && git ls-files . -co --exclude-standard']

  let g:ctrlp_user_command =
    \ ['.hg', 'hg --cwd %s status -numac -I . $(hg root)'] " MacOSX/Linux

  let g:ctrlp_user_command = ['.hg', 'for /f "tokens=1" %%a in (''hg root'') '
    \ . 'do hg --cwd %s status -numac -I . %%a']           " Windows
<
Note #1: in the |Dictionary| format, 'fallback' and 'ignore' are optional. In
the |List| format, fallback_command is optional.

Note #2: if the fallback_command is empty or the 'fallback' key is not defined,
|globpath()| will then be used when scanning outside of a repository.

Note #3: unless the |Dictionary| format is used and 'ignore' is defined and set
to 1, the |wildignore| and |g:ctrlp_custom_ignore| options do not apply when
these custom commands are being used. When not present, 'ignore' is set to 0 by
default to retain the performance advantage of using external commands.

Note #4: when changing the option's variable type, remember to |:unlet| it
first or restart Vim to avoid the "E706: Variable type mismatch" error.

Note #5: you can use a |b:var| to set this option on a per buffer basis.

                                                        *'g:ctrlp_max_history'*
The maximum number of input strings you want CtrlP to remember. The default
value mirrors Vim's global |'history'| option: >
  let g:ctrlp_max_history = &history
<
Set to 0 to disable prompt's history. Browse the history with <c-n> and <c-p>.

                                                      *'g:ctrlp_open_new_file'*
Use this option to specify how the newly created file is to be opened when
pressing <c-y>: >
  let g:ctrlp_open_new_file = 'v'
<
  t - in a new tab.
  h - in a new horizontal split.
  v - in a new vertical split.
  r - in the current window.

                                                *'g:ctrlp_open_multiple_files'*
If non-zero, this will enable opening multiple files with <c-z> and <c-o>: >
  let g:ctrlp_open_multiple_files = 'v'
<
Example: >
  let g:ctrlp_open_multiple_files = '2vjr'
<
For the number:
  - If given, it'll be used as the maximum number of windows or tabs to create
    when opening the files (the rest will be opened as hidden buffers).
  - If not given, <c-o> will open all files, each in a new window or new tab.

For the letters:
  t - each file in a new tab.
  h - each file in a new horizontal split.
  v - each file in a new vertical split.
  i - all files as hidden buffers.
  j - after opening, jump to the first opened tab or window.
  r - open the first file in the current window, then the remaining files in
      new splits or new tabs depending on which of "h", "v" and "t" is also
      present.

                                                            *'g:ctrlp_arg_map'*
When this is set to 1, the <c-o> and <c-y> mappings will accept one extra key
as an argument to override their default behavior: >
  let g:ctrlp_arg_map = 0
<
Pressing <c-o> or <c-y> will then prompt for a keypress. The key can be:
  t - open in tab(s)
  h - open in horizontal split(s)
  v - open in vertical split(s)
  i - open as hidden buffers (for <c-o> only)
  c - clear the marked files (for <c-o> only)
  r - open in the current window (for <c-y> only)
  <esc>, <c-c>, <c-u> - cancel and go back to the prompt.
  <cr> - use the default behavior specified with |g:ctrlp_open_new_file| and
  |g:ctrlp_open_multiple_files|.

                                                    *'g:ctrlp_follow_symlinks'*
If non-zero, CtrlP will follow symbolic links when listing files: >
  let g:ctrlp_follow_symlinks = 0
<
  0 - don't follow symbolic links.
  1 - follow but ignore looped internal symlinks to avoid duplicates.
  2 - follow all symlinks indiscriminately.

Note: does not apply when a command defined with |g:ctrlp_user_command| is
being used.

                                                        *'g:ctrlp_lazy_update'*
Set this to 1 to enable the lazy-update feature: only update the match window
after typing's been stopped for a certain amount of time: >
  let g:ctrlp_lazy_update = 0
<
If is 1, update after 250ms. If bigger than 1, the number will be used as the
delay time in milliseconds.

                                                      *'g:ctrlp_default_input'*
Set this to 1 to enable seeding the prompt with the current file's relative
path: >
  let g:ctrlp_default_input = 0
<
Instead of 1 or 0, if the value of the option is a string, it'll be used as-is
as the default input: >
  let g:ctrlp_default_input = 'anystring'
<

                                                             *'g:ctrlp_abbrev'*
Define input abbreviations that can be expanded (either internally or visibly)
in the prompt: >
  let g:ctrlp_abbrev = {}
<
Examples: >
  let g:ctrlp_abbrev = {
    \ 'gmode': 'i',
    \ 'abbrevs': [
      \ {
        \ 'pattern': '^cd b',
        \ 'expanded': '@cd ~/.vim/bundle',
        \ 'mode': 'pfrz',
      \ },
      \ {
        \ 'pattern': '\(^@.\+\|\\\@<!:.\+\)\@<! ',
        \ 'expanded': '.\{-}',
        \ 'mode': 'pfr',
      \ },
      \ {
        \ 'pattern': '\\\@<!:.\+\zs\\\@<! ',
        \ 'expanded': '\ ',
        \ 'mode': 'pfz',
      \ },
      \ ]
    \ }
<
The 'pattern' string is regexp matched against the entered input. The expansion
is as if the 'expanded' string was typed into the prompt.

For 'gmode' (optional):
  i - expand internally (default).
  t - insert the expanded results into the prompt as you type.
  k - insert the expanded results when a non-keyword character is typed. Only
      applies when "t" is also present.

For 'mode' (of each entry; optional):
  f - only in filename mode.
  p - only in full path mode.
  r - only in regexp mode.
  z - only in fuzzy mode.
  n - only when creating a new file with <c-y> (use the expanded string in the
      new filename).
  c - only when auto-completing directory names with <tab> (expand the pattern
      immediately before doing the auto-completion).
  <empty> or not defined - always enable.

Note: the abbrev entries are evaluated in sequence, so a later entry can be
evaluated against the expanded result of a previous entry; this includes itself
when 'gmode' is "t".

                                                           *'g:ctrlp_key_loop'*
An experimental feature. Set this to 1 to enable input looping for the typing
of multi-byte characters: >
  let g:ctrlp_key_loop = 0
<
Note #1: when set, this option resets the |g:ctrlp_lazy_update| option.

Note #2: you can toggle this feature inside the prompt with a custom mapping: >
  let g:ctrlp_prompt_mappings = { 'ToggleKeyLoop()': ['<F3>'] }
<

                                                         *'g:ctrlp_use_migemo'*
Set this to 1 to use Migemo Pattern for Japanese filenames. Migemo Search only
works in regexp mode. To split the pattern, separate words with space: >
  let g:ctrlp_use_migemo = 0
<

                                                    *'g:ctrlp_prompt_mappings'*
Use this to customize the mappings inside CtrlP's prompt to your liking. You
only need to keep the lines that you've changed the values (inside []): >
  let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-p>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'ToggleRegex()':        ['<c-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    \ 'PrtExpandDir()':       ['<tab>'],
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    \ 'PrtInsert()':          ['<c-\>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>', '<right>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-y>'],
    \ 'MarkToOpen()':         ['<c-z>'],
    \ 'OpenMulti()':          ['<c-o>'],
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
    \ }
<
Note: if pressing <bs> moves the cursor one character to the left instead of
deleting a character for you, add this to your |.vimrc| to disable the plugin's
default <c-h> mapping: >
  let g:ctrlp_prompt_mappings = { 'PrtCurLeft()': ['<left>', '<c-^>'] }
<

----------------------------------------
MRU mode options:~

                                                           *'g:ctrlp_mruf_max'*
Specify the number of recently opened files you want CtrlP to remember: >
  let g:ctrlp_mruf_max = 250
<

                                                       *'g:ctrlp_mruf_exclude'*
Files you don't want CtrlP to remember. Use regexp to specify the patterns: >
  let g:ctrlp_mruf_exclude = ''
<
Examples: >
  let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*' " MacOSX/Linux
  let g:ctrlp_mruf_exclude = '^C:\\dev\\tmp\\.*' " Windows
<

                                                       *'g:ctrlp_mruf_include'*
And if you want CtrlP to only remember some files, specify them here: >
  let g:ctrlp_mruf_include = ''
<
Example: >
  let g:ctrlp_mruf_include = '\.py$\|\.rb$'
<

                                                      *'g:ctrlp_mruf_relative'*
Set this to 1 to show only MRU files in the current working directory: >
  let g:ctrlp_mruf_relative = 0
<
Note: you can use a custom mapping to toggle this option inside the prompt: >
  let g:ctrlp_prompt_mappings = { 'ToggleMRURelative()': ['<F2>'] }
<

                                                 *'g:ctrlp_mruf_default_order'*
Set this to 1 to disable sorting when searching in MRU mode: >
  let g:ctrlp_mruf_default_order = 0
<

                                                *'g:ctrlp_mruf_case_sensitive'*
Match this with your file system case-sensitivity setting to avoid duplicate
MRU entries: >
  let g:ctrlp_mruf_case_sensitive = 1
<

                                                *'g:ctrlp_mruf_save_on_update'*
Set this to 0 to disable saving of the MRU list to hard drive whenever a new
entry is added, saving will then only occur when exiting Vim: >
  let g:ctrlp_mruf_save_on_update = 1
<

----------------------------------------
Advanced options:~

                                                          *'g:ctrlp_open_func'*
Define a custom function to open the selected file: >
  let g:ctrlp_open_func = {}
<
Example: >
  let g:ctrlp_open_func = {
    \ 'files'     : 'Function_Name_1',
    \ 'buffers'   : 'Function_Name_2',
    \ 'mru files' : 'Function_Name_3',
    \ }
<
Structure of the functions: >
  function! Function_Name(action, line)
    " Arguments:
    " |
    " +- a:action : The opening action:
    " |             + 'e' : user pressed <cr>  (default)
    " |             + 'h' : user pressed <c-x> (default)
    " |             + 'v' : user pressed <c-v> (default)
    " |             + 't' : user pressed <c-t> (default)
    " |             + 'x' : user used the <c-o> console dialog (default) and
    " |                     chose "e[x]ternal".
    " |
    " +- a:line   : The selected line.

  endfunction
<
Note: does not apply when opening multiple files with <c-z> and <c-o>.

Example: open HTML files in the default web browser when <c-t> is pressed and
in Vim otherwise >
  function! HTMLOpenFunc(action, line)
    if a:action =~ '^[tx]$' && fnamemodify(a:line, ':e') =~? '^html\?$'

      " Get the filename
      let filename = fnameescape(fnamemodify(a:line, ':p'))

      " Close CtrlP
      call ctrlp#exit()

      " Open the file
      silent! execute '!xdg-open' filename

    elseif a:action == 'x' && fnamemodify(a:line, ':e') !~? '^html\?$'

      " Not a HTML file, simulate pressing <c-o> again and wait for new input
      call feedkeys("\<c-o>")

    else

      " Use CtrlP's default file opening function
      call call('ctrlp#acceptfile', [a:action, a:line])

    endif
  endfunction

  let g:ctrlp_open_func = { 'files': 'HTMLOpenFunc' }
<

                                                        *'g:ctrlp_status_func'*
Use this to customize the statuslines for the CtrlP window: >
  let g:ctrlp_status_func = {}
<
Example: >
  let g:ctrlp_status_func = {
    \ 'main': 'Function_Name_1',
    \ 'prog': 'Function_Name_2',
    \ }
<
Structure of the functions: >
  " Main statusline
  function! Function_Name_1(focus, byfname, regex, prev, item, next, marked)
    " Arguments:
    " |
    " +- a:focus   : The focus of the prompt: "prt" or "win".
    " |
    " +- a:byfname : In filename mode or in full path mode: "file" or "path".
    " |
    " +- a:regex   : In regex mode: 1 or 0.
    " |
    " +- a:prev    : The previous search mode.
    " |
    " +- a:item    : The current search mode.
    " |
    " +- a:next    : The next search mode.
    " |
    " +- a:marked  : The number of marked files, or a comma separated list of
    "                the marked filenames.

    return full_statusline
  endfunction

  " Progress statusline
  function! Function_Name_2(str)
    " a:str : Either the number of files scanned so far, or a string indicating
    "         the current directory is being scanned with a user_command.

    return full_statusline
  endfunction
<
See https://gist.github.com/1610859 for a working example.

                                                        *'g:ctrlp_buffer_func'*
Specify the functions that will be called after entering and before exiting the
CtrlP buffer: >
  let g:ctrlp_buffer_func = {}
<
Example: >
  let g:ctrlp_buffer_func = {
    \ 'enter': 'Function_Name_1',
    \ 'exit':  'Function_Name_2',
    \ }
<

                                                         *'g:ctrlp_match_func'*
Set an external fuzzy matching function for CtrlP to use: >
  let g:ctrlp_match_func = {}
<
Example: >
  let g:ctrlp_match_func = { 'match': 'Function_Name' }
<
Structure of the function: >
  function! Function_Name(items, str, limit, mmode, ispath, crfile, regex)
    " Arguments:
    " |
    " +- a:items  : The full list of items to search in.
    " |
    " +- a:str    : The string entered by the user.
    " |
    " +- a:limit  : The max height of the match window. Can be used to limit
    " |             the number of items to return.
    " |
    " +- a:mmode  : The match mode. Can be one of these strings:
    " |             + "full-line": match the entire line.
    " |             + "filename-only": match only the filename.
    " |             + "first-non-tab": match until the first tab char.
    " |             + "until-last-tab": match until the last tab char.
    " |
    " +- a:ispath : Is 1 when searching in file, buffer, mru, mixed, dir, and
    " |             rtscript modes. Is 0 otherwise.
    " |
    " +- a:crfile : The file in the current window. Should be excluded from the
    " |             results when a:ispath == 1.
    " |
    " +- a:regex  : In regex mode: 1 or 0.

    return list_of_matched_items
  endfunction
<

Note: you can extend any of the above options with { 'arg_type': 'dict' } to
enable passing all the function arguments in a single Dictionary argument. Use
the existing argument names as keys in this Dictionary.

Example: >
  let g:ctrlp_status_func = {
    \ 'arg_type' : 'dict',
    \ 'enter': 'Function_Name_1',
    \ 'exit':  'Function_Name_2',
    \ }

  function! Function_Name_1(dict)
    " where dict == {
    " \ 'focus':   value,
    " \ 'byfname': value,
    " \ 'regex':   value,
    " \ ...
    " }
  endfunction
<

===============================================================================
COMMANDS                                                       *ctrlp-commands*

                                                                       *:CtrlP*
:CtrlP [starting-directory]
   Open CtrlP in find file mode.

   If no argument is given, the value of |g:ctrlp_working_path_mode| will be
   used to determine the starting directory.

   You can use <tab> to auto-complete the [starting-directory] when typing it.

                                                                 *:CtrlPBuffer*
:CtrlPBuffer
   Open CtrlP in find buffer mode.

                                                                    *:CtrlPMRU*
:CtrlPMRU
   Open CtrlP in find Most-Recently-Used file mode.

                                                               *:CtrlPLastMode*
:CtrlPLastMode [--dir]
   Open CtrlP in the last mode used. When having the "--dir" argument, also
   reuse the last working directory.

                                                                   *:CtrlPRoot*
:CtrlPRoot
    This acts like |:CtrlP| with |g:ctrlp_working_path_mode| = 'r' and ignores
    the variable's current value.

                                                             *:CtrlPClearCache*
:CtrlPClearCache
   Flush the cache for the current working directory. The same as pressing <F5>
   inside CtrlP.
   To enable or disable caching, use the |g:ctrlp_use_caching| option.

                                                         *:CtrlPClearAllCaches*
:CtrlPClearAllCaches
   Delete all the cache files saved in |g:ctrlp_cache_dir| location.

-------------------------------------------------------------------------------
For commands provided by bundled extensions, see |ctrlp-extensions|.

===============================================================================
MAPPINGS                                                       *ctrlp-mappings*

                                                                *'ctrlp-<c-p>'*
<c-p>
   Default |Normal| mode mapping to open the CtrlP prompt in find file mode.

----------------------------------------
Once inside the prompt:~

  <c-d>
    Toggle between full-path search and filename only search.
    Note: in filename mode, the prompt's base is '>d>' instead of '>>>'

  <c-r>                                                    *'ctrlp-fullregexp'*
    Toggle between the string mode and full regexp mode.
    Note: in full regexp mode, the prompt's base is 'r>>' instead of '>>>'

    See also: |input-formats| (guide) and |g:ctrlp_regexp_search| (option).

  <c-f>, 'forward'
  <c-up>
    Scroll to the 'next' search mode in the sequence.

  <c-b>, 'backward'
  <c-down>
    Scroll to the 'previous' search mode in the sequence.

  <tab>                                                *'ctrlp-autocompletion'*
    Auto-complete directory names under the current working directory inside
    the prompt.

  <s-tab>
    Toggle the focus between the match window and the prompt.

  <esc>,
  <c-c>
    Exit CtrlP.

Moving:~

  <c-j>,
  <down>
    Move selection down.

  <c-k>,
  <up>
    Move selection up.

  <c-a>
    Move the cursor to the 'start' of the prompt.

  <c-e>
    Move the cursor to the 'end' of the prompt.

  <c-h>,
  <left>,
  <c-^>
    Move the cursor one character to the 'left'.

  <c-l>,
  <right>
    Move the cursor one character to the 'right'.

Editing:~

  <c-]>,
  <bs>
    Delete the preceding character.

  <del>
    Delete the current character.

  <c-w>
    Delete a preceding inner word.

  <c-u>
    Clear the input field.

Browsing input history:~

  <c-n>
    Next string in the prompt's history.

  <c-p>
    Previous string in the prompt's history.

Opening/Creating a file:~

  <cr>
    Open the selected file in the 'current' window if possible.

  <c-t>
    Open the selected file in a new 'tab'.

  <c-v>
    Open the selected file in a 'vertical' split.

  <c-x>,
  <c-cr>,
  <c-s>
    Open the selected file in a 'horizontal' split.

  <c-y>
    Create a new file and its parent directories.

Opening multiple files:~

  <c-z>
    - Mark/unmark a file to be opened with <c-o>.
    - Mark/unmark a file to create a new file in its directory using <c-y>.

  <c-o>
    - Open files marked by <c-z>.
    - When no file has been marked by <c-z>, open a console dialog with the
      following options:

      Open the selected file:
        t - in a tab page.
        v - in a vertical split.
        h - in a horizontal split.
        r - in the current window.
        i - as a hidden buffer.
        x - (optional) with the function defined in |g:ctrlp_open_func|.

      Other options (not shown):
        a - mark all files in the match window.
        d - change CtrlP's local working directory to the selected file's
            directory and switch to find file mode.

Function keys:~

  <F5>
    - Refresh the match window and purge the cache for the current directory.
    - Remove deleted files from the MRU list.

  <F7>
    - Wipe the MRU list.
    - Delete MRU entries marked by <c-z>.

Pasting:~

  <Insert>,                                                   *'ctrlp-pasting'*
  <MiddleMouse>
    Paste the clipboard content into the prompt.

  <c-\>
    Open a console dialog to paste <cword>, <cfile>, the content of the search
    register, the last visual selection, the clipboard or any register into the
    prompt.

Choose your own mappings with |g:ctrlp_prompt_mappings|.

----------------------------------------
When inside the match window (press <s-tab> to switch):~

  a-z
  0-9
  ~^-=;`',.+!@#$%&_(){}[]
    Cycle through the lines which have the matching first character.

===============================================================================
INPUT FORMATS                                             *ctrlp-input-formats*

Formats for inputting in the prompt:~

a)  Simple string.

    E.g. 'abc' is understood internally as 'a[^a]\{-}b[^b]\{-}c'

b)  When in regexp mode, the input string's treated as a Vim's regexp |pattern|
    without any modification.

    E.g. 'abc\d*efg' will be read as 'abc\d*efg'.

    See |ctrlp-fullregexp| (keymap) and |g:ctrlp_regexp_search| (option) for
    how to enable regexp mode.

c)  End the string with a colon ':' followed by a Vim command to execute that
    command after opening the file. If you need to use ':' literally, escape it
    with a backslash: '\:'. When opening multiple files, the command will be
    executed on each opening file.

    E.g. Use ':45' to jump to line 45.

         Use ':/any\:string' to jump to the first instance of 'any:string'.

         Use ':+setf\ myfiletype|50' to set the filetype to 'myfiletype', then
         jump to line 50.

         Use ':diffthis' when opening multiple files to run |:diffthis| on the
         first 4 files.

    See also: Vim's |++opt| and |+cmd|.

d)  Submit two dots '..' to go upward the directory tree by 1 level. To go up
    multiple levels, use one extra dot for each extra level:
>
         Raw input    Interpreted as
         ..           ../
         ...          ../../
         ....         ../../../
<
    Note: if the parent directories are large and uncached, this can be slow.

    You can also use '@cd path/' to change CtrlP's local working directory.
    Use '@cd %:h' to change to the directory of the current file.

e)  Similarly, submit '/' or '\' to find and go to the project's root.

    If the project is large, using a VCS listing command to look for files
    might help speeding up the intial scan (see |g:ctrlp_user_command| for more
    details).

    Note: d) and e) only work in file, directory and mixed modes.

f)  Type the name of a non-existent file and press <c-y> to create it. Mark a
    file with <c-z> to create the new file in the same directory as the marked
    file.

    E.g. Using 'newdir/newfile.txt' will create a directory named 'newdir' as
         well as a file named 'newfile.txt'.

         If an entry 'some/old/dirs/oldfile.txt' is marked with <c-z>, then
         'newdir' and 'newfile.txt' will be created under 'some/old/dirs'. The
         final path will then be 'some/old/dirs/newdir/newfile.txt'.

    Note: use '\' in place of '/' on Windows (if |'shellslash'| is not set).

g)  In filename mode (toggle with <c-d>), you can use one primary pattern and
    one refining pattern separated by a semicolon. Both patterns work like (a),
    or (b) when in regexp mode.

h)  Submit ? to open this help file.

===============================================================================
EXTENSIONS                                                   *ctrlp-extensions*

Extensions are optional. To enable an extension, add its name to the variable
g:ctrlp_extensions: >
  let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
<
The order of the items will be the order they appear on the statusline and when
using <c-f>, <c-b>.

Available extensions:~

                                                                    *:CtrlPTag*
  * Tag mode:~
    - Name: 'tag'
    - Command: ":CtrlPTag"
    - Search for a tag within a generated central tags file, and jump to the
      definition. Use the Vim's option |'tags'| to specify the names and the
      locations of the tags file(s).
      E.g. set tags+=doc/tags

                                                                 *:CtrlPBufTag*
                                                              *:CtrlPBufTagAll*
  * Buffer Tag mode:~
    - Name: 'buffertag'
    - Commands: ":CtrlPBufTag [buffer]",
                ":CtrlPBufTagAll".
    - Search for a tag within the current buffer or all listed buffers and jump
      to the definition. Requires |exuberant_ctags| or compatible programs.

                                                               *:CtrlPQuickfix*
  * Quickfix mode:~
    - Name: 'quickfix'
    - Command: ":CtrlPQuickfix"
    - Search for an entry in the current quickfix errors and jump to it.

                                                                    *:CtrlPDir*
  * Directory mode:~
    - Name: 'dir'
    - Command: ":CtrlPDir [starting-directory]"
    - Search for a directory and change the working directory to it.
    - Mappings:
      + <cr> change the local working directory for CtrlP and keep it open.
      + <c-t> change the global working directory (exit).
      + <c-v> change the local working directory for the current window (exit).
      + <c-x> change the global working directory to CtrlP's current local
        working directory (exit).

                                                                    *:CtrlPRTS*
  * Runtime script mode:~
    - Name: 'rtscript'
    - Command: ":CtrlPRTS"
    - Search for files (vimscripts, docs, snippets...) in runtimepath.

                                                                   *:CtrlPUndo*
  * Undo mode:~
    - Name: 'undo'
    - Command: ":CtrlPUndo"
    - Browse undo history.

                                                                   *:CtrlPLine*
  * Line mode:~
    - Name: 'line'
    - Command: ":CtrlPLine [buffer]"
    - Search for a line in all listed buffers or in the specified [buffer].

                                                                 *:CtrlPChange*
                                                              *:CtrlPChangeAll*
  * Change list mode:~
    - Name: 'changes'
    - Commands: ":CtrlPChange [buffer]",
                ":CtrlPChangeAll".
    - Search for and jump to a recent change in the current buffer or in all
      listed buffers.

                                                                  *:CtrlPMixed*
  * Mixed mode:~
    - Name: 'mixed'
    - Command: ":CtrlPMixed"
    - Search in files, buffers and MRU files at the same time.

                                                            *:CtrlPBookmarkDir*
                                                         *:CtrlPBookmarkDirAdd*
  * BookmarkDir mode:~
    - Name: 'bookmarkdir'
    - Commands: ":CtrlPBookmarkDir",
                ":CtrlPBookmarkDirAdd [directory]".
    - Search for a bookmarked directory and change the working directory to it.
    - Mappings:
      + <cr> change the local working directory for CtrlP, keep it open and
        switch to find file mode.
      + <c-x> change the global working directory (exit).
      + <c-v> change the local working directory for the current window (exit).
      + <F7>
        - Wipe bookmark list.
        - Delete entries marked by <c-z>.

----------------------------------------
Buffer Tag mode options:~

                                                   *'g:ctrlp_buftag_ctags_bin'*
If ctags isn't in your $PATH, use this to set its location: >
  let g:ctrlp_buftag_ctags_bin = ''
<

                                                   *'g:ctrlp_buftag_systemenc'*
Match this with your OS's encoding (not Vim's). The default value mirrors Vim's
global |'encoding'| option: >
  let g:ctrlp_buftag_systemenc = &encoding
<

                                                       *'g:ctrlp_buftag_types'*
Use this to set the arguments for ctags, jsctags... for a given filetype: >
  let g:ctrlp_buftag_types = ''
<
Examples: >
  let g:ctrlp_buftag_types = {
    \ 'erlang'     : '--language-force=erlang --erlang-types=drmf',
    \ 'javascript' : {
      \ 'bin': 'jsctags',
      \ 'args': '-f -',
      \ },
    \ }
<

===============================================================================
CUSTOMIZATION                                             *ctrlp-customization*

Highlighting:~
  * For the CtrlP buffer:
    CtrlPNoEntries : the message when no match is found (Error)
    CtrlPMatch     : the matched pattern (Identifier)
    CtrlPLinePre   : the line prefix '>' in the match window
    CtrlPPrtBase   : the prompt's base (Comment)
    CtrlPPrtText   : the prompt's text (|hl-Normal|)
    CtrlPPrtCursor : the prompt's cursor when moving over the text (Constant)

  * In extensions:
    CtrlPTabExtra  : the part of each line that's not matched against (Comment)
    CtrlPBufName   : the buffer name an entry belongs to (|hl-Directory|)
    CtrlPTagKind   : the kind of the tag in buffer-tag mode (|hl-Title|)
    CtrlPqfLineCol : the line and column numbers in quickfix mode (Comment)
    CtrlPUndoT     : the elapsed time in undo mode (|hl-Directory|)
    CtrlPUndoBr    : the square brackets [] in undo mode (Comment)
    CtrlPUndoNr    : the undo number inside [] in undo mode (String)
    CtrlPUndoSv    : the point where the file was saved (Comment)
    CtrlPUndoPo    : the current position in the undo tree (|hl-Title|)
    CtrlPBookmark  : the name of the bookmark (Identifier)

Statuslines:~
  * Highlight groups:
    CtrlPMode1 : 'file' or 'path' or 'line', and the current mode (Character)
    CtrlPMode2 : 'prt' or 'win', 'regex', the working directory (|hl-LineNr|)
    CtrlPStats : the scanning status (Function)

  For rebuilding the statuslines, see |g:ctrlp_status_func|.

===============================================================================
MISCELLANEOUS CONFIGS                             *ctrlp-miscellaneous-configs*

* Using |wildignore| for |g:ctrlp_user_command|:
>
  function! s:wig2cmd()
    " Change wildignore into space or | separated groups
    " e.g. .aux .out .toc .jpg .bmp .gif
    " or   .aux$\|.out$\|.toc$\|.jpg$\|.bmp$\|.gif$
    let pats = ['[*\/]*\([?_.0-9A-Za-z]\+\)\([*\/]*\)\(\\\@<!,\|$\)','\\\@<!,']
    let subs = has('win32') || has('win64') ? ['\1\3', ' '] : ['\1\2\3', '\\|']
    let expr = substitute(&wig, pats[0], subs[0], 'g')
    let expr = substitute(expr, pats[1], subs[1], 'g')
    let expr = substitute(expr, '\\,', ',', 'g')

    " Set the user_command option
    let g:ctrlp_user_command = has('win32') || has('win64')
      \ ? 'dir %s /-n /b /s /a-d | findstr /V /l "'.expr.'"'
      \ : 'find %s -type f | grep -v "'.expr .'"'
  endfunction

  call s:wig2cmd()
<
(submitted by Rich Alesi <github.com/ralesi>)

* A standalone function to set the working directory to the project's root, or
  to the parent directory of the current file if a root can't be found:
>
  function! s:setcwd()
    let cph = expand('%:p:h', 1)
    if cph =~ '^.\+://' | retu | en
    for mkr in ['.git/', '.hg/', '.svn/', '.bzr/', '_darcs/', '.vimprojects']
      let wd = call('find'.(mkr =~ '/$' ? 'dir' : 'file'), [mkr, cph.';'])
      if wd != '' | let &acd = 0 | brea | en
    endfo
    exe 'lc!' fnameescape(wd == '' ? cph : substitute(wd, mkr.'$', '.', ''))
  endfunction

  autocmd BufEnter * call s:setcwd()
<
(requires Vim 7.1.299+)

* Using a |count| to invoke different commands using the same mapping:
>
  let g:ctrlp_cmd = 'exe "CtrlP".get(["", "Buffer", "MRU"], v:count)'
<

===============================================================================
CREDITS                                                         *ctrlp-credits*

Developed by Kien Nguyen <github.com/kien>. Distributed under Vim's |license|.

Project's homepage:   http://kien.github.com/ctrlp.vim
Git repository:       https://github.com/kien/ctrlp.vim
Mercurial repository: https://bitbucket.org/kien/ctrlp.vim

-------------------------------------------------------------------------------
Thanks to everyone that has submitted ideas, bug reports or helped debugging on
gibhub, bitbucket, and through email.

Special thanks:~

    * Woojong Koh <github.com/wjkoh>
    * Simon Ruderich
    * Yasuhiro Matsumoto <github.com/mattn>
    * Ken Earley <github.com/kenearley>
    * Kyo Nagashima <github.com/hail2u>
    * Zak Johnson <github.com/zakj>
    * Diego Viola <github.com/diegoviola>
    * Piet Delport <github.com/pjdelport>
    * Thibault Duplessis <github.com/ornicar>
    * Kent Sibilev <github.com/datanoise>
    * Tacahiroy <github.com/tacahiroy>
    * Luca Pette <github.com/lucapette>
    * Seth Fowler <github.com/sfowler>
    * Lowe Thiderman <github.com/thiderman>
    * Christopher Fredén <github.com/icetan>
    * Zahary Karadjov <github.com/zah>
    * Jo De Boeck <github.com/grimpy>
    * Rudi Grinberg <github.com/rgrinberg>
    * Timothy Mellor <github.com/mellort>

===============================================================================
CHANGELOG                                                     *ctrlp-changelog*

    + Combine *g:ctrlp_match_window_bottom* *g:ctrlp_match_window_reversed* and
      *g:ctrlp_max_height* into |g:ctrlp_match_window|.
    + New option: |g:ctrlp_match_window|.

Before 2012/11/30~

    + New options: |g:ctrlp_abbrev|,
                   |g:ctrlp_key_loop|,
                   |g:ctrlp_open_func|,
                   |g:ctrlp_tabpage_position|,
                   |g:ctrlp_mruf_save_on_update|
    + Rename:
        *g:ctrlp_dotfiles* -> |g:ctrlp_show_hidden|.
    + Change |g:ctrlp_switch_buffer|'s and |g:ctrlp_working_path_mode|'s type
      (old values still work).
    + New key for |g:ctrlp_user_command| when it's a Dictionary: 'ignore'.

Before 2012/06/15~

    + New value for |g:ctrlp_follow_symlinks|: 2.
    + New value for |g:ctrlp_open_multiple_files|: 'j'.
    + Allow using <c-t>, <c-x>, <c-v> to open files marked by <c-z>.
    + Extend '..' (|ctrlp-input-formats| (d))
    + New input format: '@cd' (|ctrlp-input-formats| (d))

Before 2012/04/30~

    + New option: |g:ctrlp_mruf_default_order|
    + New feature: Bookmarked directories extension.
    + New commands: |:CtrlPBookmarkDir|
                    |:CtrlPBookmarkDirAdd|

Before 2012/04/15~

    + New option: |g:ctrlp_buffer_func|, callback functions for CtrlP buffer.
    + Remove: g:ctrlp_mruf_last_entered, make it a default for MRU mode.
    + New commands: |:CtrlPLastMode|, open CtrlP in the last mode used.
                    |:CtrlPMixed|, search in files, buffers and MRU files.

Before 2012/03/31~

    + New options: |g:ctrlp_default_input|, default input when entering CtrlP.
                   |g:ctrlp_match_func|, allow using a custom fuzzy matcher.
    + Rename:
        *ClearCtrlPCache* -> |CtrlPClearCache|
        *ClearAllCtrlPCaches* -> |CtrlPClearAllCaches|
        *ResetCtrlP* -> |CtrlPReload|

Before 2012/03/02~

    + Rename:
        *g:ctrlp_regexp_search* -> |g:ctrlp_regexp|,
        *g:ctrlp_dont_split* -> |g:ctrlp_reuse_window|,
        *g:ctrlp_jump_to_buffer* -> |g:ctrlp_switch_buffer|.
    + Rename and tweak:
        *g:ctrlp_open_multi* -> |g:ctrlp_open_multiple_files|.
    + Deprecate *g:ctrlp_highlight_match*
    + Extend |g:ctrlp_user_command| to support multiple commands.
    + New option: |g:ctrlp_mruf_last_entered| change MRU to Recently-Entered.

Before 2012/01/15~

    + New mapping: Switch <tab> and <s-tab>. <tab> is now used for completion
                   of directory names under the current working directory.
    + New options: |g:ctrlp_arg_map| for <c-y>, <c-o> to accept an argument.
                   |g:ctrlp_status_func| custom statusline.
                   |g:ctrlp_mruf_relative| show only MRU files inside cwd.
    + Extend g:ctrlp_open_multi with new optional values: tr, hr, vr.
    + Extend |g:ctrlp_custom_ignore| to specifically filter dir, file and link.

Before 2012/01/05~

    + New feature: Buffer Tag extension.
    + New commands: |:CtrlPBufTag|, |:CtrlPBufTagAll|.
    + New options: |g:ctrlp_cmd|,
                   |g:ctrlp_custom_ignore|

Before 2011/11/30~

    + New features: Tag, Quickfix and Directory extensions.
    + New commands: |:CtrlPTag|, |:CtrlPQuickfix|, |:CtrlPDir|.
    + New options: |g:ctrlp_use_migemo|,
                   |g:ctrlp_lazy_update|,
                   |g:ctrlp_follow_symlinks|

Before 2011/11/13~

    + New special input: '/' and '\' find root (|ctrlp-input-formats| (e))
    + Remove ctrlp#SetWorkingPath().
    + Remove *g:ctrlp_mru_files* and make MRU mode permanent.
    + Extend g:ctrlp_open_multi, add new ways to open files.
    + New option: g:ctrlp_dont_split,
                  |g:ctrlp_mruf_case_sensitive|

Before 2011/10/30~

    + New feature: Support for custom extensions.
                   <F5> also removes non-existent files from MRU list.
    + New option: g:ctrlp_jump_to_buffer

Before 2011/10/12~

    + New features: Open multiple files.
                    Pass Vim's |++opt| and |+cmd| to the opening file
                    (|ctrlp-input-formats| (c))
                    Auto-complete each dir for |:CtrlP| [starting-directory]
    + New mappings: <c-z> mark/unmark a file to be opened with <c-o>.
                    <c-o> open all marked files.
    + New option: g:ctrlp_open_multi
    + Remove *g:ctrlp_persistent_input* *g:ctrlp_live_update* and <c-^>.

Before 2011/09/29~

    + New mappings: <c-n>, <c-p> next/prev string in the input history.
                    <c-y> create a new file and its parent dirs.
    + New options: |g:ctrlp_open_new_file|,
                   |g:ctrlp_max_history|
    + Added a new open-in-horizontal-split mapping: <c-x>

Before 2011/09/19~

    + New command: ResetCtrlP
    + New options: |g:ctrlp_max_files|,
                   |g:ctrlp_max_depth|,
                   g:ctrlp_live_update
    + New mapping: <c-^>

Before 2011/09/12~

    + Ability to cycle through matched lines in the match window.
    + Extend the behavior of g:ctrlp_persistent_input
    + Extend the behavior of |:CtrlP|
    + New options: |g:ctrlp_dotfiles|,
                   |g:ctrlp_clear_cache_on_exit|,
                   g:ctrlp_highlight_match,
                   |g:ctrlp_user_command|
    + New special input: '..' (|ctrlp-input-formats| (d))
    + New mapping: <F5>.
    + New commands: |:CtrlPCurWD|,
                    |:CtrlPCurFile|,
                    |:CtrlPRoot|

    + New feature: Search in most recently used (MRU) files
    + New mapping: <c-b>.
    + Extended the behavior of <c-f>.
    + New options: g:ctrlp_mru_files,
                   |g:ctrlp_mruf_max|,
                   |g:ctrlp_mruf_exclude|,
                   |g:ctrlp_mruf_include|
    + New command: |:CtrlPMRU|

First public release: 2011/09/06~

===============================================================================
vim:ft=help:et:ts=2:sw=2:sts=2:norl
                                                                                                                                                                                                                                                                                                         .vim/plugin/grep.vim                                                                                000644  000765  000024  00000100345 13147503021 015600  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " File: grep.vim
" Author: Yegappan Lakshmanan (yegappan AT yahoo DOT com)
" Version: 1.11
" Last Modified: April 24, 2013
" 
" Overview
" --------
" The grep plugin integrates the grep, fgrep, egrep, and agrep tools with
" Vim and allows you to search for a pattern in one or more files and jump
" to them.
"
" To use this plugin, you need the grep, fgrep, egrep, agrep, find and
" xargs utilities. These tools are present in most of the Unix installations.
" For MS-Windows systems, you can download the GNU grep and find utilities
" from the following sites:
"
"    http://gnuwin32.sourceforge.net/packages/grep.htm
"    http://gnuwin32.sourceforge.net/packages/findutils.htm
"
" Installation
" ------------
" 1. Copy the grep.vim file to the $HOME/.vim/plugin or $HOME/vimfiles/plugin
"    or $VIM/vimfiles/plugin directory. 
"    Refer to the following Vim help topics for more information about Vim
"    plugins:
"       :help add-plugin
"       :help add-global-plugin
"       :help runtimepath
" 2. If the grep executables are not already present in one of the directories
"    in the PATH environment variable, then set the Grep_Path and other _Path
"    variables to point to the location of the grep utilites in the .vimrc
"    file.
" 3. Restart Vim.
" 4. You can now use the ":Grep" and other commands to search for patterns in
"    files.
"
" Usage
" -----
" The grep.vim plugin introduces the following Vim commands:
"
" :Grep          - Search for the specified pattern in the specified files
" :GrepAdd       - Same as ":Grep" but adds the results to the current results
" :Rgrep         - Run recursive grep
" :RgrepAdd      - Same as ":Rgrep" but adds the results to the current results
" :GrepBuffer    - Search for a pattern on all open buffers
" :GrepBufferAdd - Same as ":GrepBuffer" but adds the results to the current
"                  results
" :Bgrep         - Same as :GrepBuffer
" :BgrepAdd      - Same as :GrepBufferAdd
" :GrepArgs      - Search for a pattern on all the Vim argument 
"                  filenames (:args)
" :GrepArgsAdd   - Same as ":GrepArgs" but adds the results to the current
"                  results
" :Fgrep         - Run fgrep
" :FgrepAdd      - Same as ":Fgrep" but adds the results to the current
"                  results
" :Rfgrep        - Run recursive fgrep
" :RfgrepAdd     - Same as ":Rfgrep" but adds the results to the current
"                  results
" :Egrep         - Run egrep
" :EgrepAdd      - Same as ":Egrep" but adds the results to the current
"                  results
" :Regrep        - Run recursive egrep
" :RegrepAdd     - Same as ":Regrep" but adds the results to the current
"                  results
" :Agrep         - Run agrep
" :AgrepAdd      - Same as ":Agrep" but adds the results to the current
"                  results
" :Ragrep        - Run recursive agrep
" :RagrepAdd     - Same as ":Ragrep" but adds the results to the current
"                  results
"
" The above commands can be invoked like this:
"
"    :Grep   [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :Rgrep  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :Fgrep  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :Rfgrep [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :Egrep  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :Regrep [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :Agrep  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :Ragrep [<grep_options>] [<search_pattern> [<file_name(s)>]]
"
"    :GrepAdd   [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :RgrepAdd  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :FgrepAdd  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :RfgrepAdd [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :EgrepAdd  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :RegrepAdd [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :AgrepAdd  [<grep_options>] [<search_pattern> [<file_name(s)>]]
"    :RagrepAdd [<grep_options>] [<search_pattern> [<file_name(s)>]]
"
"    :GrepBuffer [<grep_options>] [<search_pattern>]
"    :Bgrep [<grep_options>] [<search_pattern>]
"    :GrepArgs [<grep_options>] [<search_pattern>]
"
"    :GrepBufferAdd [<grep_options>] [<search_pattern>]
"    :BgrepAdd [<grep_options>] [<search_pattern>]
"    :GrepArgsAdd [<grep_options>] [<search_pattern>]
"
" In the above commands, all the arguments are optional.
"
" You can specify grep options like -i (ignore case) or -w (search for a word)
" to the above commands.  If the <grep_options> are not specified, then the
" default grep options specified by the variable Grep_Default_Options is 
" used.
"
" You can specify the grep pattern to search as an argument to the above
" commands.  If the <search_pattern> is not specified, then you will be
" prompted to enter a search pattern. By default, the keyword under the cursor
" is displayed for the search pattern prompt. You can accept the default or
" modify it.
"
" The search pattern is automatically enclosed by the character specified in
" the Grep_Shell_Quote_Char variable. You should not enclose the search
" pattern with a shell escape character.
"
" If you want to specify a search pattern with space characters or a
" multi-word pattern, then you should use the Grep command pattern input
" prompt to supply the pattern.
"
" You can specify one or more file names (or file patterns) to the above
" commands.  If the <file_names> are not specified, then you will be prompted
" to enter file names.  By default, the pattern specified by the
" Grep_Default_Filelist variable is used. To specify the file name(s) as an
" argument to the above commands, you have to specify the search pattern also.
"
" When you enter only the command name, you will be prompted to enter the
" search pattern and the files in which to search for the pattern. By default,
" the keyword under the cursor is displayed for the search pattern prompt.
" Depending on the command, you may prompted for additional parameters like
" the directories to search for the pattern.
"
" You can retrieve previously entered values for the Grep prompts using the up
" and down arrow keys. You can cancel the command by pressing the escape key.
" You can use CTRL-U to erase the default shown for the prompt and CTRL-W to
" erase the previous word in the prompt. For more information about editing
" the prompt, read ':help cmdline-editing' Vim help topic.
"
" After invoking any of the grep commands, you can cancel the command, when
" you are prompted for a search pattern or file names or a directory by
" pressing the <Esc> key. You cannot cancel (or kill) the
" grep/fgrep/egrep/agrep commands after the external command is invoked.
"
" The GrepAdd, RgrepAdd and other *Add commands append the search output to
" the current search output. This is useful if you want to see the search
" results for multiple patterns at the same time. These commands are available
" only in Vim version 7.0 and above.
"
" You can map a key to invoke any of the above commands. For example, the
" following map invokes the :Grep command to search for the keyword under the
" cursor:
"
"       nnoremap <silent> <F3> :Grep<CR>
"
" The output of the grep command will be listed in the Vim quickfix window.
" 1. You can select a line in the quickfix window and press <Enter> or double
"    click on a match to jump to that line.
" 2. You can use the ":cnext" and ":cprev" commands to the jump to the next or
"    previous output line.
" 3. You can use the ":colder" and ":cnewer" commands to go between multiple
"    grep quickfix output windows.
" 4. The quickfix window need not be opened always to use the grep output.
"    You can close the quickfix window and use the quickfix commands to jump
"    to the grep matches.  Use the ":copen" command to open the quickfix
"    window again.
"
" For more information about other quickfix commands read ":help quickfix"
" 
" When using GUI Vim, the Tools->Search menu item with a few sub-menu items is
" created for few variations of the search command.
"
" Configuration
" -------------
" By changing the following variables you can configure the behavior of this
" plugin. Set the following variables in your .vimrc file using the 'let'
" command.
"
" The 'Grep_Path' variable is used to locate the grep utility. By default,
" this is set to grep. You can change this using the let command:
"
"       :let Grep_Path = 'd:\tools\grep.exe'
"
" The 'Fgrep_Path' variable is used to locate the fgrep utility. By default,
" this is set to fgrep. You can change this using the let command:
"
"       :let Fgrep_Path = 'd:\tools\fgrep.exe'
"
" The 'Egrep_Path' variable is used to locate the egrep utility. By default,
" this is set to egrep. You can change this using the let command:
"
"       :let Egrep_Path = 'd:\tools\egrep.exe'
"
" The 'Agrep_Path' variable is used to locate the agrep utility. By default,
" this is set to agrep. You can change this using the let command:
"
"       :let Agrep_Path = 'd:\tools\agrep.exe'
"
" The 'Grep_Find_Path' variable is used to locate the find utility. By
" default, this is set to 'find'. Note that on MS-Windows, there is a find.exe
" that is part of the base OS. This find utility is different from the the
" Unix find utility. You cannot use this utility with this plugin. You must
" install the Unix compatible find utility and set the Grep_Find_Path variable
" to point to the location of the utility. You can change this using the let
" command:
"
"       :let Grep_Find_Path = 'd:\tools\find.exe'
"
" The 'Grep_Xargs_Path' variable is used to locate the xargs utility. By
" default, this is set to xargs. You can change this using the let
" command:
"
"       :let Grep_Xargs_Path = 'd:\tools\xargs.exe'
"
" When running any one of the Grep commands, you will be prompted for the
" files in which to search for the pattern. The 'Grep_Default_Filelist'
" variable is used to specify to default for this prompt. By default, this
" variable is set to '*'. You can specify multiple matching patterns separated
" by spaces. You can change this settings using the let command:
"
"       :let Grep_Default_Filelist = '*.[chS]'
"       :let Grep_Default_Filelist = '*.c *.cpp *.asm'
"
" The 'Grep_Default_Options' is used to pass default command line options to
" the grep/fgrep/egrep/agrep utilities. By default, this is set to an empty
" string. You can change this using the let command:
"
"       :let Grep_Default_Options = '-i'
"
" The 'Grep_Skip_Dirs' variable specifies the list of directories to skip
" while doing recursive searches. By default, this is set to 'RCS CVS SCCS'.
" You can change this using the let command:
"
"       :let Grep_Skip_Dirs = 'dir1 dir2 dir3'
"
" The 'Grep_Skip_Files' variable specifies the list of files to skip while
" doing recursive searches. By default, this is set to '*~ *,v s.*'. You can
" change this using the let command:
"
"       :let Grep_Skip_Files = '*.bak *~'
"
" By default, when you invoke the Grep commands the quickfix window will be
" opened with the grep output.  You can disable opening the quickfix window,
" by setting the 'Grep_OpenQuickfixWindow' variable  to zero:
"
"       :let Grep_OpenQuickfixWindow = 0
"
" You can manually open the quickfix window using the :cwindow command.
"
" By default, for recursive searches, the 'find' and 'xargs' utilities are
" used.  If you don't have the 'xargs' utility or don't want to use the
" 'xargs' utility, " then you can set the 'Grep_Find_Use_Xargs' variable to
" zero. If this is set to zero, then only the 'find' utility is used for
" recursive searches:
"
"       :let Grep_Find_Use_Xargs = 0
" 
" To handle file names with space characters in them, the xargs utility is
" invoked with the '-0' argument. If the xargs utility in your system doesn't
" accept the '-0' argument, then you can change the Grep_Xargs_Options
" variable. For example, to use the '--null' xargs argument, you can use the
" following command:
"
" 	:let Grep_Xargs_Options = '--null'
"
" The Grep_Cygwin_Find variable should be set to 1, if you are using the find
" utility from the cygwin package. This setting is used to handle the
" difference between the backslash and forward slash path separators.
"
"       :let Grep_Cygwin_Find = 1
" 
" The 'Grep_Null_Device' variable specifies the name of the null device to
" pass to the grep commands. This is needed to force the grep commands to
" print the name of the file in which a match is found, if only one filename
" is specified. For Unix systems, this is set to /dev/null and for MS-Windows
" systems, this is set to NUL. You can modify this by using the let command:
"
"       :let Grep_Null_Device = '/dev/null'
"
" The 'Grep_Shell_Quote_Char' variable specifies the quote character to use
" for protecting patterns from being interpreted by the shell. For Unix
" systems, this is set to "'" and for MS-Window systems, this is set to an
" empty string.  You can change this using the let command:
"
"       :let Grep_Shell_Quote_Char = "'"
"
" The 'Grep_Shell_Escape_Char' variable specifies the escape character to use
" for protecting special characters from being interpreted by the shell.  For
" Unix systems, this is set to '\' and for MS-Window systems, this is set to
" an empty string.  You can change this using the let command:
"
"       :let Grep_Shell_Escape_Char = "'"
"
" --------------------- Do not modify after this line ---------------------
if exists("loaded_grep")
    finish
endif
let loaded_grep = 1

" Line continuation used here
let s:cpo_save = &cpo
set cpo&vim

" Location of the grep utility
if !exists("Grep_Path")
    let Grep_Path = 'grep'
endif

" Location of the fgrep utility
if !exists("Fgrep_Path")
    let Fgrep_Path = 'fgrep'
endif

" Location of the egrep utility
if !exists("Egrep_Path")
    let Egrep_Path = 'egrep'
endif

" Location of the agrep utility
if !exists("Agrep_Path")
    let Agrep_Path = 'agrep'
endif

" Location of the find utility
if !exists("Grep_Find_Path")
    let Grep_Find_Path = 'find'
endif

" Location of the xargs utility
if !exists("Grep_Xargs_Path")
    let Grep_Xargs_Path = 'xargs'
endif

" Open the Grep output window.  Set this variable to zero, to not open
" the Grep output window by default.  You can open it manually by using
" the :cwindow command.
if !exists("Grep_OpenQuickfixWindow")
    let Grep_OpenQuickfixWindow = 1
endif

" Default grep file list
if !exists("Grep_Default_Filelist")
    let Grep_Default_Filelist = '*'
endif

" Default grep options
if !exists("Grep_Default_Options")
    let Grep_Default_Options = ''
endif

" Use the 'xargs' utility in combination with the 'find' utility. Set this
" to zero to not use the xargs utility.
if !exists("Grep_Find_Use_Xargs")
    let Grep_Find_Use_Xargs = 1
endif

" The command-line arguments to supply to the xargs utility
if !exists('Grep_Xargs_Options')
    let Grep_Xargs_Options = '-0'
endif

" The find utility is from the cygwin package or some other find utility.
if !exists("Grep_Cygwin_Find")
    let Grep_Cygwin_Find = 0
endif

" NULL device name to supply to grep.  We need this because, grep will not
" print the name of the file, if only one filename is supplied. We need the
" filename for Vim quickfix processing.
if !exists("Grep_Null_Device")
    if has("win32") || has("win16") || has("win95")
        let Grep_Null_Device = 'NUL'
    else
        let Grep_Null_Device = '/dev/null'
    endif
endif

" Character to use to quote patterns and filenames before passing to grep.
if !exists("Grep_Shell_Quote_Char")
    if has("win32") || has("win16") || has("win95")
        let Grep_Shell_Quote_Char = ''
    else
        let Grep_Shell_Quote_Char = "'"
    endif
endif

" Character to use to escape special characters before passing to grep.
if !exists("Grep_Shell_Escape_Char")
    if has("win32") || has("win16") || has("win95")
        let Grep_Shell_Escape_Char = ''
    else
        let Grep_Shell_Escape_Char = '\'
    endif
endif

" The list of directories to skip while searching for a pattern. Set this
" variable to '', if you don't want to skip directories.
if !exists("Grep_Skip_Dirs")
    let Grep_Skip_Dirs = 'RCS CVS SCCS'
endif

" The list of files to skip while searching for a pattern. Set this variable
" to '', if you don't want to skip any files.
if !exists("Grep_Skip_Files")
    let Grep_Skip_Files = '*~ *,v s.*'
endif

" RunGrepCmd()
" Run the specified grep command using the supplied pattern
function! s:RunGrepCmd(cmd, pattern, action)
    if has('win32') && !has('win32unix') && !has('win95')
                \ && (&shell =~ 'cmd.exe')
        " Windows does not correctly deal with commands that have more than 1
        " set of double quotes.  It will strip them all resulting in:
        " 'C:\Program' is not recognized as an internal or external command
        " operable program or batch file.  To work around this, place the
        " command inside a batch file and call the batch file.
        " Do this only on Win2K, WinXP and above.
        let s:grep_tempfile = fnamemodify(tempname(), ':h') . '\mygrep.cmd'
        if v:version >= 700
            call writefile([a:cmd], s:grep_tempfile, "b")
        else
            exe 'redir! > ' . s:grep_tempfile
            silent echo a:cmd
            redir END
        endif

	let cmd_output = system('"' . s:grep_tempfile . '"')
    else
        let cmd_output = system(a:cmd)
    endif

    if exists('s:grep_tempfile')
        " Delete the temporary cmd file created on MS-Windows
        call delete(s:grep_tempfile)
    endif

    " Do not check for the shell_error (return code from the command).
    " Even if there are valid matches, grep returns error codes if there
    " are problems with a few input files.

    if cmd_output == ""
        echohl WarningMsg | 
        \ echomsg "Error: Pattern " . a:pattern . " not found" | 
        \ echohl None
        return
    endif

    let tmpfile = tempname()

    let old_verbose = &verbose
    set verbose&vim

    exe "redir! > " . tmpfile
    silent echon '[Search results for pattern: ' . a:pattern . "]\n"
    silent echon cmd_output
    redir END

    let &verbose = old_verbose

    let old_efm = &efm
    set efm=%f:%\\s%#%l:%m

    if v:version >= 700 && a:action == 'add'
        execute "silent! caddfile " . tmpfile
    else
        if exists(":cgetfile")
            execute "silent! cgetfile " . tmpfile
        else
            execute "silent! cfile " . tmpfile
        endif
    endif

    let &efm = old_efm

    " Open the grep output window
    if g:Grep_OpenQuickfixWindow == 1
        " Open the quickfix window below the current window
        botright copen
    endif

    call delete(tmpfile)
endfunction

" RunGrepRecursive()
" Run specified grep command recursively
function! s:RunGrepRecursive(cmd_name, grep_cmd, action, ...)
    if a:0 > 0 && (a:1 == "-?" || a:1 == "-h")
        echo 'Usage: ' . a:cmd_name . " [<grep_options>] [<search_pattern> " .
                        \ "[<file_name(s)>]]"
        return
    endif

    let grep_opt    = ""
    let pattern     = ""
    let filepattern = ""

    let argcnt = 1
    while argcnt <= a:0
        if a:{argcnt} =~ '^-'
            let grep_opt = grep_opt . " " . a:{argcnt}
        elseif pattern == ""
            let pattern = g:Grep_Shell_Quote_Char . a:{argcnt} . 
                            \ g:Grep_Shell_Quote_Char
        else
            if filepattern != ""
                let filepattern = filepattern . " " . a:{argcnt}
            else
                let filepattern = a:{argcnt}
            endif
        endif
        let argcnt= argcnt + 1
    endwhile
    if grep_opt == ""
        let grep_opt = g:Grep_Default_Options
    endif

    if a:grep_cmd != 'agrep'
        " Don't display messages about non-existent files
        " Agrep doesn't support the -s option
        let grep_opt = grep_opt . " -s"
    endif

    if a:grep_cmd == 'grep'
        let grep_path = g:Grep_Path
        let grep_expr_option = '--'
    elseif a:grep_cmd == 'fgrep'
        let grep_path = g:Fgrep_Path
        let grep_expr_option = '-e'
    elseif a:grep_cmd == 'egrep'
        let grep_path = g:Egrep_Path
        let grep_expr_option = '-e'
    elseif a:grep_cmd == 'agrep'
        let grep_path = g:Agrep_Path
        let grep_expr_option = ''
    else
        return
    endif

    " No argument supplied. Get the identifier and file list from user
    if pattern == "" 
        let pattern = input("Search for pattern: ", expand("<cword>"))
        if pattern == ""
            return
        endif
        let pattern = g:Grep_Shell_Quote_Char . pattern . 
                        \ g:Grep_Shell_Quote_Char
        echo "\r"
    endif

    let cwd = getcwd()
    if g:Grep_Cygwin_Find == 1
        let cwd = substitute(cwd, "\\", "/", "g")
    endif
    if v:version >= 700
        let startdir = input("Start searching from directory: ", cwd, "dir")
    else
        let startdir = input("Start searching from directory: ", cwd)
    endif
    if startdir == ""
        return
    endif
    echo "\r"

    if filepattern == ""
        let filepattern = input("Search in files matching pattern: ", 
                                          \ g:Grep_Default_Filelist)
        if filepattern == ""
            return
        endif
        echo "\r"
    endif

    let txt = filepattern . ' '
    let find_file_pattern = ''
    while txt != ''
        let one_pattern = strpart(txt, 0, stridx(txt, ' '))
        if find_file_pattern != ''
            let find_file_pattern = find_file_pattern . ' -o'
        endif
        let find_file_pattern = find_file_pattern . ' -name ' .
              \ g:Grep_Shell_Quote_Char . one_pattern . g:Grep_Shell_Quote_Char
        let txt = strpart(txt, stridx(txt, ' ') + 1)
    endwhile
    let find_file_pattern = g:Grep_Shell_Escape_Char . '(' .
                    \ find_file_pattern . ' ' . g:Grep_Shell_Escape_Char . ')'

    let txt = g:Grep_Skip_Dirs
    let find_prune = ''
    if txt != ''
        let txt = txt . ' '
        while txt != ''
            let one_dir = strpart(txt, 0, stridx(txt, ' '))
            if find_prune != ''
                let find_prune = find_prune . ' -o'
            endif
            let find_prune = find_prune . ' -name ' . one_dir
            let txt = strpart(txt, stridx(txt, ' ') + 1)
        endwhile
        let find_prune = '-type d ' . g:Grep_Shell_Escape_Char . '(' .
                         \ find_prune
        let find_prune = find_prune . ' ' . g:Grep_Shell_Escape_Char . ')'
    endif

    let txt = g:Grep_Skip_Files
    let find_skip_files = '-type f'
    if txt != ''
        let txt = txt . ' '
        while txt != ''
            let one_file = strpart(txt, 0, stridx(txt, ' '))
            let find_skip_files = find_skip_files . ' ! -name ' .
                                  \ g:Grep_Shell_Quote_Char . one_file .
                                  \ g:Grep_Shell_Quote_Char
            let txt = strpart(txt, stridx(txt, ' ') + 1)
        endwhile
    endif

    if g:Grep_Find_Use_Xargs == 1
        let cmd = g:Grep_Find_Path . ' "' . startdir . '"'
        let cmd = cmd . " " . find_prune . " -prune -o"
        let cmd = cmd . " " . find_skip_files
        let cmd = cmd . " " . find_file_pattern
        let cmd = cmd . " -print0 | "
        let cmd = cmd . g:Grep_Xargs_Path . ' ' . g:Grep_Xargs_Options
        let cmd = cmd . ' ' . grep_path . " " . grep_opt . " -n "
        let cmd = cmd . grep_expr_option . " " . pattern
        let cmd = cmd . ' ' . g:Grep_Null_Device 
    else
        let cmd = g:Grep_Find_Path . " " . startdir
        let cmd = cmd . " " . find_prune . " -prune -o"
        let cmd = cmd . " " . find_skip_files
        let cmd = cmd . " " . find_file_pattern
        let cmd = cmd . " -exec " . grep_path . " " . grep_opt . " -n "
        let cmd = cmd . grep_expr_option . " " . pattern
        let cmd = cmd . " {} " . g:Grep_Null_Device . ' ' .
                         \ g:Grep_Shell_Escape_Char . ';'
    endif

    call s:RunGrepCmd(cmd, pattern, a:action)
endfunction

" RunGrepSpecial()
" Search for a pattern in all the opened buffers or filenames in the
" argument list
function! s:RunGrepSpecial(cmd_name, which, action, ...)
    if a:0 > 0 && (a:1 == "-?" || a:1 == "-h")
        echo 'Usage: ' . a:cmd_name . " [<grep_options>] [<search_pattern>]"
        return
    endif

    " Search in all the Vim buffers
    if a:which == 'buffer'
        " Get a list of all the buffer names
        let last_bufno = bufnr("$")

        let i = 1
        let filenames = ""

        while i <= last_bufno
            if bufexists(i) && buflisted(i)
                let fullpath = fnamemodify(bufname(i), ':p')
                if filereadable(fullpath)
                    if v:version >= 702
                        let filenames = filenames . " " . fnameescape(fullpath)
                    else
                        let filenames = filenames . " " . fullpath
                    endif
                endif
            endif
            let i = i + 1
        endwhile

        " No buffers
        if filenames == ""
            return
        endif
    elseif a:which == 'args'
        " Search in all the filenames in the argument list
        let arg_cnt = argc()

        if arg_cnt == 0
            echohl WarningMsg
            echomsg "Error: Argument list is empty"
            echohl None
            return
        endif

        let i = 0
        let filenames = ""

        while i < arg_cnt
            let filenames = filenames . " " . argv(i)
            let i = i + 1
        endwhile

        " No arguments
        if filenames == ""
            echohl WarningMsg
            echomsg "Error: Argument list is empty"
            echohl None
            return
        endif
    endif

    let grep_opt = ""
    let pattern = ""

    " Get the list of optional grep command-line options (if present)
    " supplied by the user. All the grep options will be preceded
    " by a '-'
    let argcnt= 1
    while argcnt <= a:0 && a:{argcnt} =~ '^-'
        let grep_opt = grep_opt . " " . a:{argcnt}
        let argcnt = argcnt + 1
    endwhile

    " If the user didn't specify the option, then use the defaults
    if grep_opt == ""
        let grep_opt = g:Grep_Default_Options
    endif

    " Don't display messages about non-existent files
    let grep_opt = grep_opt . " -s"

    " The last argument specified by the user is the pattern
    if argcnt == a:0
        let pattern = a:{argcnt}
    else
        " No argument supplied. Get the identifier and file list from user
        let pattern = input("Search for pattern: ", expand("<cword>"))
        if pattern == ""
            return
        endif
        echo "\r"
    endif

    let pattern = g:Grep_Shell_Quote_Char . pattern . g:Grep_Shell_Quote_Char

    " Add /dev/null to the list of filenames, so that grep print the
    " filename and linenumber when grepping in a single file
    let filenames = filenames . " " . g:Grep_Null_Device
    let cmd = g:Grep_Path . " " . grep_opt . " -n -- "
    let cmd = cmd . pattern . " " . filenames

    call s:RunGrepCmd(cmd, pattern, a:action)
endfunction

" RunGrep()
" Run the specified grep command
function! s:RunGrep(cmd_name, grep_cmd, action, ...)
    if a:0 > 0 && (a:1 == "-?" || a:1 == "-h")
        echo 'Usage: ' . a:cmd_name . " [<grep_options>] [<search_pattern> " .
                        \ "[<file_name(s)>]]"
        return
    endif

    let grep_opt  = ""
    let pattern   = ""
    let filenames = ""

    " Parse the arguments
    " grep command-line flags are specified using the "-flag" format
    " the next argument is assumed to be the pattern
    " and the next arguments are assumed to be filenames or file patterns
    let argcnt = 1
    while argcnt <= a:0
        if a:{argcnt} =~ '^-'
            let grep_opt = grep_opt . " " . a:{argcnt}
        elseif pattern == ""
            let pattern = g:Grep_Shell_Quote_Char . a:{argcnt} .
                            \ g:Grep_Shell_Quote_Char
        else
            let filenames= filenames . " " . a:{argcnt}
        endif
        let argcnt = argcnt + 1
    endwhile

    if grep_opt == ""
        let grep_opt = g:Grep_Default_Options
    endif

    if a:grep_cmd != 'agrep'
        " Don't display messages about non-existent files
        " Agrep doesn't support the -s option
        let grep_opt = grep_opt . " -s"
    endif

    if a:grep_cmd == 'grep'
        let grep_path = g:Grep_Path
        let grep_expr_option = '--'
    elseif a:grep_cmd == 'fgrep'
        let grep_path = g:Fgrep_Path
        let grep_expr_option = '-e'
    elseif a:grep_cmd == 'egrep'
        let grep_path = g:Egrep_Path
        let grep_expr_option = '-e'
    elseif a:grep_cmd == 'agrep'
        let grep_path = g:Agrep_Path
        let grep_expr_option = ''
    else
        return
    endif

    " Get the identifier and file list from user
    if pattern == "" 
        let pattern = input("Search for pattern: ", expand("<cword>"))
        if pattern == ""
            return
        endif
        let pattern = g:Grep_Shell_Quote_Char . pattern .
                        \ g:Grep_Shell_Quote_Char
        echo "\r"
    endif

    if filenames == ""
        if v:version >= 700
            let filenames = input("Search in files: ", g:Grep_Default_Filelist,
                        \ "file")
        else
            let filenames = input("Search in files: ", g:Grep_Default_Filelist)
        endif
        if filenames == ""
            return
        endif
        echo "\r"
    endif

    " Add /dev/null to the list of filenames, so that grep print the
    " filename and linenumber when grepping in a single file
    let filenames = filenames . " " . g:Grep_Null_Device
    let cmd = grep_path . " " . grep_opt . " -n "
    let cmd = cmd . grep_expr_option . " " . pattern
    let cmd = cmd . " " . filenames

    call s:RunGrepCmd(cmd, pattern, a:action)
endfunction

" Define the set of grep commands
command! -nargs=* -complete=file Grep
            \ call s:RunGrep('Grep', 'grep', 'set', <f-args>)
command! -nargs=* -complete=file Rgrep
            \ call s:RunGrepRecursive('Rgrep', 'grep', 'set', <f-args>)
command! -nargs=* GrepBuffer
            \ call s:RunGrepSpecial('GrepBuffer', 'buffer', 'set', <f-args>)
command! -nargs=* Bgrep
            \ call s:RunGrepSpecial('Bgrep', 'buffer', 'set', <f-args>)
command! -nargs=* GrepArgs
            \ call s:RunGrepSpecial('GrepArgs', 'args', 'set', <f-args>)

command! -nargs=* -complete=file Fgrep
            \ call s:RunGrep('Fgrep', 'fgrep', 'set', <f-args>)
command! -nargs=* -complete=file Rfgrep
            \ call s:RunGrepRecursive('Rfgrep', 'fgrep', 'set', <f-args>)
command! -nargs=* -complete=file Egrep
            \ call s:RunGrep('Egrep', 'egrep', 'set', <f-args>)
command! -nargs=* -complete=file Regrep
            \ call s:RunGrepRecursive('Regrep', 'egrep', 'set', <f-args>)
command! -nargs=* -complete=file Agrep
            \ call s:RunGrep('Agrep', 'agrep', 'set', <f-args>)
command! -nargs=* -complete=file Ragrep
            \ call s:RunGrepRecursive('Ragrep', 'agrep', 'set', <f-args>)

if v:version >= 700
command! -nargs=* -complete=file GrepAdd
            \ call s:RunGrep('GrepAdd', 'grep', 'add', <f-args>)
command! -nargs=* -complete=file RgrepAdd
            \ call s:RunGrepRecursive('RgrepAdd', 'grep', 'add', <f-args>)
command! -nargs=* GrepBufferAdd
            \ call s:RunGrepSpecial('GrepBufferAdd', 'buffer', 'add', <f-args>)
command! -nargs=* BgrepAdd
            \ call s:RunGrepSpecial('BgrepAdd', 'buffer', 'add', <f-args>)
command! -nargs=* GrepArgsAdd
            \ call s:RunGrepSpecial('GrepArgsAdd', 'args', 'add', <f-args>)

command! -nargs=* -complete=file FgrepAdd
            \ call s:RunGrep('FgrepAdd', 'fgrep', 'add', <f-args>)
command! -nargs=* -complete=file RfgrepAdd
            \ call s:RunGrepRecursive('RfgrepAdd', 'fgrep', 'add', <f-args>)
command! -nargs=* -complete=file EgrepAdd
            \ call s:RunGrep('EgrepAdd', 'egrep', 'add', <f-args>)
command! -nargs=* -complete=file RegrepAdd
            \ call s:RunGrepRecursive('RegrepAdd', 'egrep', 'add', <f-args>)
command! -nargs=* -complete=file AgrepAdd
            \ call s:RunGrep('AgrepAdd', 'agrep', 'add', <f-args>)
command! -nargs=* -complete=file RagrepAdd
            \ call s:RunGrepRecursive('RagrepAdd', 'agrep', 'add', <f-args>)
endif

" Add the Tools->Search Files menu
if has('gui_running')
    anoremenu <silent> Tools.Search.Current\ Directory<Tab>:Grep
                \ :Grep<CR>
    anoremenu <silent> Tools.Search.Recursively<Tab>:Rgrep
                \ :Rgrep<CR>
    anoremenu <silent> Tools.Search.Buffer\ List<Tab>:Bgrep
                \ :Bgrep<CR>
    anoremenu <silent> Tools.Search.Argument\ List<Tab>:GrepArgs
                \ :GrepArgs<CR>
endif

" restore 'cpo'
let &cpo = s:cpo_save
unlet s:cpo_save

                                                                                                                                                                                                                                                                                           .vim/plugin/minibufexpl.vim                                                                         000644  000765  000024  00000204727 13147501344 017204  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Mini Buffer Explorer <minibufexpl.vim>
"
" HINT: Type zR if you don't know how to use folds
"
" Script Info and Documentation  {{{
"=============================================================================
"    Copyright: Copyright (C) 2002 & 2003 Bindu Wavell 
"               Permission is hereby granted to use and distribute this code,
"               with or without modifications, provided that this copyright
"               notice is copied with it. Like anything else that's free,
"               minibufexplorer.vim is provided *as is* and comes with no
"               warranty of any kind, either expressed or implied. In no
"               event will the copyright holder be liable for any damamges
"               resulting from the use of this software.
"
" Name Of File: minibufexpl.vim
"  Description: Mini Buffer Explorer Vim Plugin
"   Maintainer: Bindu Wavell <bindu@wavell.net>
"          URL: http://vim.sourceforge.net/scripts/script.php?script_id=159
"  Last Change: Sunday, June 21, 2004
"      Version: 6.3.2
"               Derived from Jeff Lanzarotta's bufexplorer.vim version 6.0.7
"               Jeff can be reached at (jefflanzarotta@yahoo.com) and the
"               original plugin can be found at:
"               http://lanzarotta.tripod.com/vim/plugin/6/bufexplorer.vim.zip
"
"        Usage: Normally, this file should reside in the plugins
"               directory and be automatically sourced. If not, you must
"               manually source this file using ':source minibufexplorer.vim'.
"
"               You may use the default keymappings of
"
"                 <Leader>mbe - Opens MiniBufExplorer
"
"               or you may want to add something like the following
"               key mapping to your _vimrc/.vimrc file.
"
"                 map <Leader>b :MiniBufExplorer<cr>
"
"               However, in most cases you won't need any key-bindings at all.
"
"               <Leader> is usually backslash so type "\mbe" (quickly) to open 
"               the -MiniBufExplorer- window.
"
"               Other keymappings include: <Leader>mbc to close the Explorer
"               window,  <Leader>mbu to force the Explorer to Update and
"               <Leader>mbt to toggle the Explorer window; it will open if
"               closed or close if open. Each of these key bindings can be
"               overridden (see the notes on <Leader>mbe above.)
" 
"               You can map these additional commands as follows:
"
"                 map <Leader>c :CMiniBufExplorer<cr>
"                 map <Leader>u :UMiniBufExplorer<cr>
"                 map <Leader>t :TMiniBufExplorer<cr>
"
"               NOTE: you can change the key binding used in these mappings
"                     so that they fit with your configuration of vim.
"
"               You can also call each of these features by typing the
"               following in command mode:
"
"                 :MiniBufExplorer    " Open and/or goto Explorer
"                 :CMiniBufExplorer   " Close the Explorer if it's open
"                 :UMiniBufExplorer   " Update Explorer without navigating
"                 :TMiniBufExplorer   " Toggle the Explorer window open and 
"                                       closed.
"
"               To control where the new split window goes relative to the 
"               current window, use the setting:
"
"                 let g:miniBufExplSplitBelow=0  " Put new window above
"                                                " current or on the
"                                                " left for vertical split
"                 let g:miniBufExplSplitBelow=1  " Put new window below
"                                                " current or on the
"                                                " right for vertical split
"
"               The default for this is read from the &splitbelow VIM option.
"
"               By default we are now (as of 6.0.2) forcing the -MiniBufExplorer-
"               window to open up at the edge of the screen. You can turn this 
"               off by setting the following variable in your .vimrc:
"
"                 let g:miniBufExplSplitToEdge = 0
"
"               If you would like a vertical explorer you can assign the column
"               width (in characters) you want for your explorer window with the
"               following .vimrc variable (this was introduced in 6.3.0):
"
"                 let g:miniBufExplVSplit = 20   " column width in chars
"
"               IN HORIZONTAL MODE:
"               It is now (as of 6.1.1) possible to set a maximum height for
"               the -MiniBufExplorer- window. You can set the max height by
"               letting the following variable in your .vimrc:
"
"                 let g:miniBufExplMaxSize = <max lines: defualt 0>
"               
"               setting this to 0 will mean the window gets as big as
"               needed to fit all your buffers. 
"
"               NOTE: This was g:miniBufExplMaxHeight before 6.3.0; the old
"               setting is backwards compatible if you don't use MaxSize.
"
"               As of 6.2.2 it is possible to set a minimum height for the 
"               -MiniBufExplorer- window. You can set the min height by
"               letting the following variable in your .vimrc:
"
"                 let g:miniBufExplMinSize = <min height: default 1>
"
"               NOTE: This was g:miniBufExplMinHeight before 6.3.0; the old
"               setting is backwards compatible if you don't use MinSize.
"
"               IN VERTICAL MODE: (as of 6.3.0)
"               By default the vertical explorer has a fixed width. If you put:
"
"                 let g:miniBufExplMaxSize = <max width: default 0> 
"
"               into your .vimrc then MBE will attempt to set the width of the
"               MBE window to be as wide as your widest tab. The width will not
"               exceed MaxSize even if you have wider tabs. 
"
"               Accepting the default value of 0 for this will give you a fixed
"               width MBE window.
"
"               You can specify a MinSize for the vertical explorer window by
"               putting the following in your .vimrc:
"
"                 let g:miniBufExplMinSize = <min width: default 1>
"
"               This will have no effect unless you also specivy MaxSize.
"
"               By default we are now (as of 6.0.1) turning on the MoreThanOne
"               option. This stops the -MiniBufExplorer- from opening 
"               automatically until more than one eligible buffer is available.
"               You can turn this feature off by setting the following variable
"               in your .vimrc:
"                 
"                 let g:miniBufExplorerMoreThanOne=1
"
"               (The following enhancement is as of 6.2.2)
"               Setting this to 0 will cause the MBE window to be loaded even
"               if no buffers are available. Setting it to 1 causes the MBE
"               window to be loaded as soon as an eligible buffer is read. You
"               can also set it to larger numbers. So if you set it to 4 for
"               example the MBE window wouldn't auto-open until 4 eligibles
"               buffers had been loaded. This is nice for folks that don't 
"               want an MBE window unless they are editing more than two or
"               three buffers.
"
"               To enable the optional mapping of Control + Vim Direction Keys 
"               [hjkl] to window movement commands, you can put the following into 
"               your .vimrc:
"
"                 let g:miniBufExplMapWindowNavVim = 1
"
"               To enable the optional mapping of Control + Arrow Keys to window 
"               movement commands, you can put the following into your .vimrc:
"
"                 let g:miniBufExplMapWindowNavArrows = 1
"
"               To enable the optional mapping of <C-TAB> and <C-S-TAB> to a 
"               function that will bring up the next or previous buffer in the
"               current window, you can put the following into your .vimrc:
"
"                 let g:miniBufExplMapCTabSwitchBufs = 1
"
"               To enable the optional mapping of <C-TAB> and <C-S-TAB> to mappings
"               that will move to the next and previous (respectively) window, you
"               can put the following into your .vimrc:
"
"                 let g:miniBufExplMapCTabSwitchWindows = 1
"
"
"               NOTE: If you set the ...TabSwitchBufs AND ...TabSwitchWindows, 
"                     ...TabSwitchBufs will be enabled and ...TabSwitchWindows 
"                     will not.
"               
"               As of MBE 6.3.0, you can put the following into your .vimrc:
"               
"                 let g:miniBufExplUseSingleClick = 1
"
"               If you would like to single click on tabs rather than double
"               clicking on them to goto the selected buffer. 
"
"               NOTE: If you use the single click option in taglist.vim you may 
"                     need to get an updated version that includes a patch I 
"                     provided to allow both explorers to provide single click 
"                     buffer selection.
"
"               It is possible to customize the the highlighting for the tabs in 
"               the MBE by configuring the following highlighting groups:
"
"                 MBENormal         - for buffers that have NOT CHANGED and
"                                     are NOT VISIBLE.
"                 MBEChanged        - for buffers that HAVE CHANGED and are
"                                     NOT VISIBLE
"                 MBEVisibleNormal  - buffers that have NOT CHANGED and are
"                                     VISIBLE
"                 MBEVisibleChanged - buffers that have CHANGED and are VISIBLE
"
"               You can either link to an existing highlighting group by
"               adding a command like:
"
"                 hi link MBEVisibleChanged Error
"
"               to your .vimrc or you can specify exact foreground and background
"               colors using the following syntax:
"
"                 hi MBEChanged guibg=darkblue ctermbg=darkblue termbg=white
"
"               NOTE: If you set a colorscheme in your .vimrc you should do it
"                     BEFORE updating the MBE highlighting groups.
"
"               If you use other explorers like TagList you can (As of 6.2.8) put:
"
"                 let g:miniBufExplModSelTarget = 1
" 
"               into your .vimrc in order to force MBE to try to place selected 
"               buffers into a window that does not have a nonmodifiable buffer.
"               The upshot of this should be that if you go into MBE and select
"               a buffer, the buffer should not show up in a window that is 
"               hosting an explorer.
"
"               There is a VIM bug that can cause buffers to show up without 
"               their highlighting. The following setting will cause MBE to
"               try and turn highlighting back on (introduced in 6.3.1):
"
"                 let g:miniBufExplForceSyntaxEnable = 1
"
"               MBE has had a basic debugging capability for quite some time.
"               However, it has not been very friendly in the past. As of 6.0.8, 
"               you can put one of each of the following into your .vimrc:
"
"                 let g:miniBufExplorerDebugLevel = 0  " MBE serious errors output
"                 let g:miniBufExplorerDebugLevel = 4  " MBE all errors output
"                 let g:miniBufExplorerDebugLevel = 10 " MBE reports everything
"
"               You can also set a DebugMode to cause output to be target as
"               follows (default is mode 3):
"
"                 let g:miniBufExplorerDebugMode  = 0  " Errors will show up in 
"                                                      " a vim window
"                 let g:miniBufExplorerDebugMode  = 1  " Uses VIM's echo function
"                                                      " to display on the screen
"                 let g:miniBufExplorerDebugMode  = 2  " Writes to a file
"                                                      " MiniBufExplorer.DBG
"                 let g:miniBufExplorerDebugMode  = 3  " Store output in global:
"                                                 " g:miniBufExplorerDebugOutput
"
"               Or if you are able to start VIM, you might just perform these
"               at a command prompt right before you do the operation that is
"               failing.
"
"      History: Moved to end of file
"      
" Known Issues: When debugging is turned on and set to output to a window, there
"               are some cases where the window is opened more than once, there
"               are other cases where an old debug window can be lost.
" 
"               Several MBE commands can break the window history so <C-W>[pnw]
"               might not take you to the expected window.
"
"         Todo: Add the ability to specify a regexp for eligible buffers
"               allowing the ability to filter out certain buffers that 
"               you don't want to control from MBE
"
"=============================================================================
" }}}

" Startup Check
"
" Has this plugin already been loaded? {{{
"
if exists('loaded_minibufexplorer')
  finish
endif
let loaded_minibufexplorer = 1
" }}}

" Mappings and Commands
"
" MBE Keyboard Mappings {{{
" If we don't already have keyboard mappings for MBE then create them 
" 
if !hasmapto('<Plug>MiniBufExplorer')
  map <unique> <Leader>mbe <Plug>MiniBufExplorer
endif
if !hasmapto('<Plug>CMiniBufExplorer')
  map <unique> <Leader>mbc <Plug>CMiniBufExplorer
endif
if !hasmapto('<Plug>UMiniBufExplorer')
  map <unique> <Leader>mbu <Plug>UMiniBufExplorer
endif
if !hasmapto('<Plug>TMiniBufExplorer')
  map <unique> <Leader>mbt <Plug>TMiniBufExplorer
endif

" }}}
" MBE <Script> internal map {{{
" 
noremap <unique> <script> <Plug>MiniBufExplorer  :call <SID>StartExplorer(1, -1)<CR>:<BS>
noremap <unique> <script> <Plug>CMiniBufExplorer :call <SID>StopExplorer(1)<CR>:<BS>
noremap <unique> <script> <Plug>UMiniBufExplorer :call <SID>AutoUpdate(-1)<CR>:<BS>
noremap <unique> <script> <Plug>TMiniBufExplorer :call <SID>ToggleExplorer()<CR>:<BS>

" }}}
" MBE commands {{{
" 
if !exists(':MiniBufExplorer')
  command! MiniBufExplorer  call <SID>StartExplorer(1, -1)
endif
if !exists(':CMiniBufExplorer')
  command! CMiniBufExplorer  call <SID>StopExplorer(1)
endif
if !exists(':UMiniBufExplorer')
  command! UMiniBufExplorer  call <SID>AutoUpdate(-1)
endif
if !exists(':TMiniBufExplorer')
  command! TMiniBufExplorer  call <SID>ToggleExplorer()
endif
if !exists(':MBEbn')
  command! MBEbn call <SID>CycleBuffer(1)
endif
if !exists(':MBEbp')
  command! MBEbp call <SID>CycleBuffer(0)
endif " }}}

" Global Configuration Variables
"
" Debug Level {{{
"
" 0 = no logging
" 1=5 = errors ; 1 is the most important
" 5-9 = info ; 5 is the most important
" 10 = Entry/Exit
if !exists('g:miniBufExplorerDebugLevel')
  let g:miniBufExplorerDebugLevel = 0 
endif

" }}}
" Debug Mode {{{
"
" 0 = debug to a window
" 1 = use vim's echo facility
" 2 = write to a file named MiniBufExplorer.DBG
"     in the directory where vim was started
"     THIS IS VERY SLOW
" 3 = Write into g:miniBufExplorerDebugOutput
"     global variable [This is the default]
if !exists('g:miniBufExplorerDebugMode')
  let g:miniBufExplorerDebugMode = 3 
endif 

" }}}
" Allow auto update? {{{
"
" We start out with this off for startup, but once vim is running we 
" turn this on.
if !exists('g:miniBufExplorerAutoUpdate')
  let g:miniBufExplorerAutoUpdate = 0
endif

" }}}
" MoreThanOne? {{{
" Display Mini Buf Explorer when there are 'More Than One' eligible buffers 
"
if !exists('g:miniBufExplorerMoreThanOne')
  let g:miniBufExplorerMoreThanOne = 2
endif 

" }}}
" Split below/above/left/right? {{{
" When opening a new -MiniBufExplorer- window, split the new windows below or 
" above the current window?  1 = below, 0 = above.
"
if !exists('g:miniBufExplSplitBelow')
  let g:miniBufExplSplitBelow = &splitbelow
endif 

" }}}
" Split to edge? {{{
" When opening a new -MiniBufExplorer- window, split the new windows to the
" full edge? 1 = yes, 0 = no.
"
if !exists('g:miniBufExplSplitToEdge')
  let g:miniBufExplSplitToEdge = 1
endif 

" }}}
" MaxHeight (depreciated) {{{
" When sizing the -MiniBufExplorer- window, assign a maximum window height.
" 0 = size to fit all buffers, otherwise the value is number of lines for
" buffer. [Depreciated use g:miniBufExplMaxSize]
"
if !exists('g:miniBufExplMaxHeight')
  let g:miniBufExplMaxHeight = 0
endif 

" }}}
" MaxSize {{{
" Same as MaxHeight but also works for vertical splits if specified with a
" vertical split then vertical resizing will be performed. If left at 0 
" then the number of columns in g:miniBufExplVSplit will be used as a
" static window width.
if !exists('g:miniBufExplMaxSize')
  let g:miniBufExplMaxSize = g:miniBufExplMaxHeight
endif

" }}}
" MinHeight (depreciated) {{{
" When sizing the -MiniBufExplorer- window, assign a minumum window height.
" the value is minimum number of lines for buffer. Setting this to zero can
" cause strange height behavior. The default value is 1 [Depreciated use
" g:miniBufExplMinSize]
"
if !exists('g:miniBufExplMinHeight')
  let g:miniBufExplMinHeight = 1
endif

" }}}
" MinSize {{{
" Same as MinHeight but also works for vertical splits. For vertical splits, 
" this is ignored unless g:miniBufExplMax(Size|Height) are specified.
if !exists('g:miniBufExplMinSize')
  let g:miniBufExplMinSize = g:miniBufExplMinHeight
endif

" }}}
" Horizontal or Vertical explorer? {{{
" For folks that like vertical explorers, I'm caving in and providing for
" veritcal splits. If this is set to 0 then the current horizontal 
" splitting logic will be run. If however you want a vertical split,
" assign the width (in characters) you wish to assign to the MBE window.
"
if !exists('g:miniBufExplVSplit')
  let g:miniBufExplVSplit = 0
endif

" }}}
" TabWrap? {{{
" By default line wrap is used (possibly breaking a tab name between two
" lines.) Turning this option on (setting it to 1) can take more screen
" space, but will make sure that each tab is on one and only one line.
"
if !exists('g:miniBufExplTabWrap')
  let g:miniBufExplTabWrap = 0
endif

" }}}
" Extended window navigation commands? {{{
" Global flag to turn extended window navigation commands on or off
" enabled = 1, dissabled = 0
"
if !exists('g:miniBufExplMapWindowNav')
  " This is for backwards compatibility and may be removed in a
  " later release, please use the ...NavVim and/or ...NavArrows 
  " settings.
  let g:miniBufExplMapWindowNav = 0
endif
if !exists('g:miniBufExplMapWindowNavVim')
  let g:miniBufExplMapWindowNavVim = 0
endif
if !exists('g:miniBufExplMapWindowNavArrows')
  let g:miniBufExplMapWindowNavArrows = 0
endif
if !exists('g:miniBufExplMapCTabSwitchBufs')
  let g:miniBufExplMapCTabSwitchBufs = 0
endif
" Notice: that if CTabSwitchBufs is turned on then
" we turn off CTabSwitchWindows.
if g:miniBufExplMapCTabSwitchBufs == 1 || !exists('g:miniBufExplMapCTabSwitchWindows')
  let g:miniBufExplMapCTabSwitchWindows = 0
endif 

"
" If we have enabled control + vim direction key remapping
" then perform the remapping
"
" Notice: I left g:miniBufExplMapWindowNav in for backward
" compatibility. Eventually this mapping will be removed so
" please use the newer g:miniBufExplMapWindowNavVim setting.
if g:miniBufExplMapWindowNavVim || g:miniBufExplMapWindowNav
  noremap <C-J> <C-W>j
  noremap <C-K> <C-W>k
  noremap <C-H> <C-W>h
  noremap <C-L> <C-W>l
endif

"
" If we have enabled control + arrow key remapping
" then perform the remapping
"
if g:miniBufExplMapWindowNavArrows
  noremap <C-Down>  <C-W>j
  noremap <C-Up>    <C-W>k
  noremap <C-Left>  <C-W>h
  noremap <C-Right> <C-W>l
endif

" If we have enabled <C-TAB> and <C-S-TAB> to switch buffers
" in the current window then perform the remapping
"
if g:miniBufExplMapCTabSwitchBufs
  noremap <C-TAB>   :call <SID>CycleBuffer(1)<CR>:<BS>
  noremap <C-S-TAB> :call <SID>CycleBuffer(0)<CR>:<BS>
endif

"
" If we have enabled <C-TAB> and <C-S-TAB> to switch windows
" then perform the remapping
"
if g:miniBufExplMapCTabSwitchWindows
  noremap <C-TAB>   <C-W>w
  noremap <C-S-TAB> <C-W>W
endif

" }}}
" Modifiable Select Target {{{
"
if !exists('g:miniBufExplModSelTarget')
  let g:miniBufExplModSelTarget = 0
endif

"}}}
" Force Syntax Enable {{{
"
if !exists('g:miniBufExplForceSyntaxEnable')
  let g:miniBufExplForceSyntaxEnable = 0
endif

" }}}
" Single/Double Click? {{{
" flag that can be set to 1 in a users .vimrc to allow 
" single click switching of tabs. By default we use
" double click for tab selection.
"
if !exists('g:miniBufExplUseSingleClick')
  let g:miniBufExplUseSingleClick = 0
endif 

"
" attempt to perform single click mapping, it would be much
" nicer if we could nnoremap <buffer> ... however vim does
" not fire the <buffer> <leftmouse> when you use the mouse
" to enter a buffer.
"
if g:miniBufExplUseSingleClick == 1
  let s:clickmap = ':if bufname("%") == "-MiniBufExplorer-" <bar> call <SID>MBEClick() <bar> endif <CR>'
  if maparg('<LEFTMOUSE>', 'n') == '' 
    " no mapping for leftmouse
    exec ':nnoremap <silent> <LEFTMOUSE> <LEFTMOUSE>' . s:clickmap
  else
    " we have a mapping
    let  g:miniBufExplDoneClickSave = 1
    let  s:m = ':nnoremap <silent> <LEFTMOUSE> <LEFTMOUSE>'
    let  s:m = s:m . substitute(substitute(maparg('<LEFTMOUSE>', 'n'), '|', '<bar>', 'g'), '\c^<LEFTMOUSE>', '', '')
    let  s:m = s:m . s:clickmap
    exec s:m
  endif
endif " }}}

" Variables used internally
"
" Script/Global variables {{{
" Global used to store the buffer list so we don't update the
" UI unless the list has changed.
if !exists('g:miniBufExplBufList')
  let g:miniBufExplBufList = ''
endif

" Variable used as a mutex so that we don't do lots
" of AutoUpdates at the same time.
if !exists('g:miniBufExplInAutoUpdate')
  let g:miniBufExplInAutoUpdate = 0
endif

" In debug mode 3 this variable will hold the debug output
if !exists('g:miniBufExplorerDebugOutput')
  let g:miniBufExplorerDebugOutput = ''
endif

" In debug mode 3 this variable will hold the debug output
if !exists('g:miniBufExplForceDisplay')
  let g:miniBufExplForceDisplay = 0
endif

" Variable used to pass maxTabWidth info between functions
let s:maxTabWidth = 0 

" Variable used to count debug output lines
let s:debugIndex = 0 

  
" }}}
" Setup an autocommand group and some autocommands {{{
" that keep our explorer updated automatically.
"
augroup MiniBufExplorer
autocmd MiniBufExplorer BufDelete   * call <SID>DEBUG('-=> BufDelete AutoCmd', 10) |call <SID>AutoUpdate(expand('<abuf>'))
autocmd MiniBufExplorer BufEnter    * call <SID>DEBUG('-=> BufEnter  AutoCmd', 10) |call <SID>AutoUpdate(-1)
autocmd MiniBufExplorer VimEnter    * call <SID>DEBUG('-=> VimEnter  AutoCmd', 10) |let g:miniBufExplorerAutoUpdate = 1 |call <SID>AutoUpdate(-1)
" }}}

" Functions
"
" StartExplorer - Sets up our explorer and causes it to be displayed {{{
"
function! <SID>StartExplorer(sticky, delBufNum)
  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Entering StartExplorer()'   ,10)
  call <SID>DEBUG('===========================',10)

  if a:sticky == 1
    let g:miniBufExplorerAutoUpdate = 1
  endif

  " Store the current buffer
  let l:curBuf = bufnr('%')

  " Prevent a report of our actions from showing up.
  let l:save_rep = &report
  let l:save_sc  = &showcmd
  let &report    = 10000
  set noshowcmd 

  call <SID>FindCreateWindow('-MiniBufExplorer-', -1, 1, 1)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('StartExplorer called in invalid window',1)
    let &report  = l:save_rep
    let &showcmd = l:save_sc
    return
  endif

  " !!! We may want to make the following optional -- Bindu
  " New windows don't cause all windows to be resized to equal sizes
  set noequalalways
  " !!! We may want to make the following optional -- Bindu
  " We don't want the mouse to change focus without a click
  set nomousefocus

  " If folks turn numbering and columns on by default we will turn 
  " them off for the MBE window
  setlocal foldcolumn=0
  setlocal nonumber
 
  if has("syntax")
    syn clear
    syn match MBENormal             '\[[^\]]*\]'
    syn match MBEChanged            '\[[^\]]*\]+'
    syn match MBEVisibleNormal      '\[[^\]]*\]\*+\='
    syn match MBEVisibleChanged     '\[[^\]]*\]\*+'
    
    if !exists("g:did_minibufexplorer_syntax_inits")
      let g:did_minibufexplorer_syntax_inits = 1
      hi def link MBENormal         Comment
      hi def link MBEChanged        String
      hi def link MBEVisibleNormal  Special
      hi def link MBEVisibleChanged Special
    endif
  endif

  " If you press return in the -MiniBufExplorer- then try
  " to open the selected buffer in the previous window.
  nnoremap <buffer> <CR> :call <SID>MBESelectBuffer()<CR>:<BS>
  " If you DoubleClick in the -MiniBufExplorer- then try
  " to open the selected buffer in the previous window.
  nnoremap <buffer> <2-LEFTMOUSE> :call <SID>MBEDoubleClick()<CR>:<BS>
  " If you press d in the -MiniBufExplorer- then try to
  " delete the selected buffer.
  nnoremap <buffer> d :call <SID>MBEDeleteBuffer()<CR>:<BS>
  " If you press w in the -MiniBufExplorer- then switch back
  " to the previous window.
  nnoremap <buffer> p :wincmd p<CR>:<BS>
  " The following allow us to use regular movement keys to 
  " scroll in a wrapped single line buffer
  nnoremap <buffer> j gj
  nnoremap <buffer> k gk
  nnoremap <buffer> <down> gj
  nnoremap <buffer> <up> gk
  " The following allows for quicker moving between buffer
  " names in the [MBE] window it also saves the last-pattern
  " and restores it.
  nnoremap <buffer> <TAB>   :call search('\[[0-9]*:[^\]]*\]')<CR>:<BS>
  nnoremap <buffer> <S-TAB> :call search('\[[0-9]*:[^\]]*\]','b')<CR>:<BS>
 
  call <SID>DisplayBuffers(a:delBufNum)

  if (l:curBuf != -1)
    call search('\['.l:curBuf.':'.expand('#'.l:curBuf.':t').'\]')
  else
    call <SID>DEBUG('No current buffer to search for',9)
  endif

  let &report  = l:save_rep
  let &showcmd = l:save_sc

  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Completed StartExplorer()'  ,10)
  call <SID>DEBUG('===========================',10)

endfunction 

" }}}
" StopExplorer - Looks for our explorer and closes the window if it is open {{{
"
function! <SID>StopExplorer(sticky)
  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Entering StopExplorer()'    ,10)
  call <SID>DEBUG('===========================',10)

  if a:sticky == 1
    let g:miniBufExplorerAutoUpdate = 0
  endif

  let l:winNum = <SID>FindWindow('-MiniBufExplorer-', 1)

  if l:winNum != -1 
    exec l:winNum.' wincmd w'
    silent! close
    wincmd p
  endif

  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Completed StopExplorer()'   ,10)
  call <SID>DEBUG('===========================',10)

endfunction

" }}}
" ToggleExplorer - Looks for our explorer and opens/closes the window {{{
"
function! <SID>ToggleExplorer()
  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Entering ToggleExplorer()'  ,10)
  call <SID>DEBUG('===========================',10)

  let g:miniBufExplorerAutoUpdate = 0

  let l:winNum = <SID>FindWindow('-MiniBufExplorer-', 1)

  if l:winNum != -1 
    call <SID>StopExplorer(1)
  else
    call <SID>StartExplorer(1, -1)
    wincmd p
  endif

  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Completed ToggleExplorer()' ,10)
  call <SID>DEBUG('===========================',10)

endfunction

" }}}
" FindWindow - Return the window number of a named buffer {{{
" If none is found then returns -1. 
"
function! <SID>FindWindow(bufName, doDebug)
  if a:doDebug
    call <SID>DEBUG('Entering FindWindow()',10)
  endif

  " Try to find an existing window that contains 
  " our buffer.
  let l:bufNum = bufnr(a:bufName)
  if l:bufNum != -1
    if a:doDebug
      call <SID>DEBUG('Found buffer ('.a:bufName.'): '.l:bufNum,9)
    endif
    let l:winNum = bufwinnr(l:bufNum)
  else
    let l:winNum = -1
  endif

  return l:winNum

endfunction

" }}}
" FindCreateWindow - Attempts to find a window for a named buffer. {{{
"
" If it is found then moves there. Otherwise creates a new window and 
" configures it and moves there.
"
" forceEdge, -1 use defaults, 0 below, 1 above
" isExplorer, 0 no, 1 yes 
" doDebug, 0 no, 1 yes
"
function! <SID>FindCreateWindow(bufName, forceEdge, isExplorer, doDebug)
  if a:doDebug
    call <SID>DEBUG('Entering FindCreateWindow('.a:bufName.')',10)
  endif

  " Save the user's split setting.
  let l:saveSplitBelow = &splitbelow

  " Set to our new values.
  let &splitbelow = g:miniBufExplSplitBelow

  " Try to find an existing explorer window
  let l:winNum = <SID>FindWindow(a:bufName, a:doDebug)

  " If found goto the existing window, otherwise 
  " split open a new window.
  if l:winNum != -1
    if a:doDebug
      call <SID>DEBUG('Found window ('.a:bufName.'): '.l:winNum,9)
    endif
    exec l:winNum.' wincmd w'
    let l:winFound = 1
  else

    if g:miniBufExplSplitToEdge == 1 || a:forceEdge >= 0

        let l:edge = &splitbelow
        if a:forceEdge >= 0
            let l:edge = a:forceEdge
        endif

        if l:edge
            if g:miniBufExplVSplit == 0
              exec 'bo sp '.a:bufName
            else
              exec 'bo vsp '.a:bufName
            endif
        else
            if g:miniBufExplVSplit == 0
              exec 'to sp '.a:bufName
            else
              exec 'to vsp '.a:bufName
            endif
        endif
    else
        if g:miniBufExplVSplit == 0
          exec 'sp '.a:bufName
        else
          " &splitbelow doesn't affect vertical splits
          " so we have to do this explicitly.. ugh.
          if &splitbelow
            exec 'rightb vsp '.a:bufName
          else
            exec 'vsp '.a:bufName
          endif
        endif
    endif

    let g:miniBufExplForceDisplay = 1

    " Try to find an existing explorer window
    let l:winNum = <SID>FindWindow(a:bufName, a:doDebug)
    if l:winNum != -1
      if a:doDebug
        call <SID>DEBUG('Created and then found window ('.a:bufName.'): '.l:winNum,9)
      endif
      exec l:winNum.' wincmd w'
    else
      if a:doDebug
        call <SID>DEBUG('FindCreateWindow failed to create window ('.a:bufName.').',1)
      endif
      return
    endif

    if a:isExplorer
      " Turn off the swapfile, set the buffer type so that it won't get written,
      " and so that it will get deleted when it gets hidden and turn on word wrap.
      setlocal noswapfile
      setlocal buftype=nofile
      setlocal bufhidden=delete
      if g:miniBufExplVSplit == 0
        setlocal wrap
      else
        setlocal nowrap
        exec('setlocal winwidth='.g:miniBufExplMinSize)
      endif
    endif

    if a:doDebug
      call <SID>DEBUG('Window ('.a:bufName.') created: '.winnr(),9)
    endif

  endif

  " Restore the user's split setting.
  let &splitbelow = l:saveSplitBelow

endfunction

" }}}
" DisplayBuffers - Wrapper for getting MBE window shown {{{
"
" Makes sure we are in our explorer, then erases the current buffer and turns 
" it into a mini buffer explorer window.
"
function! <SID>DisplayBuffers(delBufNum)
  call <SID>DEBUG('Entering DisplayBuffers()',10)
  
  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('DisplayBuffers called in invalid window',1)
    return
  endif

  " We need to be able to modify the buffer
  setlocal modifiable

  call <SID>ShowBuffers(a:delBufNum)
  call <SID>ResizeWindow()
  
  normal! zz
  
  " Prevent the buffer from being modified.
  setlocal nomodifiable
  set nobuflisted

endfunction

" }}}
" Resize Window - Set width/height of MBE window {{{
" 
" Makes sure we are in our explorer, then sets the height/width for our explorer 
" window so that we can fit all of our information without taking extra lines.
"
function! <SID>ResizeWindow()
  call <SID>DEBUG('Entering ResizeWindow()',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('ResizeWindow called in invalid window',1)
    return
  endif

  let l:width  = winwidth('.')

  " Horizontal Resize
  if g:miniBufExplVSplit == 0

    if g:miniBufExplTabWrap == 0
      let l:length = strlen(getline('.'))
      let l:height = 0
      if (l:width == 0)
        let l:height = winheight('.')
      else
        let l:height = (l:length / l:width) 
        " handle truncation from div
        if (l:length % l:width) != 0
          let l:height = l:height + 1
        endif
      endif
    else
      exec("setlocal textwidth=".l:width)
      normal gg
      normal gq}
      normal G
      let l:height = line('.')
      normal gg
    endif
  
    " enforce max window height
    if g:miniBufExplMaxSize != 0
      if g:miniBufExplMaxSize < l:height
        let l:height = g:miniBufExplMaxSize
      endif
    endif
  
    " enfore min window height
    if l:height < g:miniBufExplMinSize || l:height == 0
      let l:height = g:miniBufExplMinSize
    endif
  
    call <SID>DEBUG('ResizeWindow to '.l:height.' lines',9)
  
    exec('resize '.l:height)
  
  " Vertical Resize
  else 

    if g:miniBufExplMaxSize != 0
      let l:newWidth = s:maxTabWidth
      if l:newWidth > g:miniBufExplMaxSize 
          let l:newWidth = g:miniBufExplMaxSize
      endif
      if l:newWidth < g:miniBufExplMinSize
          let l:newWidth = g:miniBufExplMinSize
      endif
    else
      let l:newWidth = g:miniBufExplVSplit
    endif

    if l:width != l:newWidth
      call <SID>DEBUG('ResizeWindow to '.l:newWidth.' columns',9)
      exec('vertical resize '.l:newWidth)
    endif

  endif
  
endfunction

" }}}
" ShowBuffers - Clear current buffer and put the MBE text into it {{{
" 
" Makes sure we are in our explorer, then adds a list of all modifiable 
" buffers to the current buffer. Special marks are added for buffers that 
" are in one or more windows (*) and buffers that have been modified (+)
"
function! <SID>ShowBuffers(delBufNum)
  call <SID>DEBUG('Entering ShowBuffers()',10)

  let l:ListChanged = <SID>BuildBufferList(a:delBufNum, 1)

  if (l:ListChanged == 1 || g:miniBufExplForceDisplay)
    let l:save_rep = &report
    let l:save_sc = &showcmd
    let &report = 10000
    set noshowcmd 

    " Delete all lines in buffer.
    1,$d _
  
    " Goto the end of the buffer put the buffer list 
    " and then delete the extra trailing blank line
    $
    put! =g:miniBufExplBufList
    $ d _

    let g:miniBufExplForceDisplay = 0

    let &report  = l:save_rep
    let &showcmd = l:save_sc
  else
    call <SID>DEBUG('Buffer list not update since there was no change',9)
  endif
  
endfunction

" }}}
" Max - Returns the max of two numbers {{{
"
function! <SID>Max(argOne, argTwo)
  if a:argOne > a:argTwo
    return a:argOne
  else
    return a:argTwo
  endif
endfunction

" }}}
" BuildBufferList - Build the text for the MBE window {{{
" 
" Creates the buffer list string and returns 1 if it is different than
" last time this was called and 0 otherwise.
"
function! <SID>BuildBufferList(delBufNum, updateBufList)
  call <SID>DEBUG('Entering BuildBufferList()',10)

  let l:NBuffers = bufnr('$')     " Get the number of the last buffer.
  let l:i = 0                     " Set the buffer index to zero.

  let l:fileNames = ''
  let l:maxTabWidth = 0

  " Loop through every buffer less than the total number of buffers.
  while(l:i <= l:NBuffers)
    let l:i = l:i + 1
   
    " If we have a delBufNum and it is the current
    " buffer then ignore the current buffer. 
    " Otherwise, continue.
    if (a:delBufNum == -1 || l:i != a:delBufNum)
      " Make sure the buffer in question is listed.
      if(getbufvar(l:i, '&buflisted') == 1)
        " Get the name of the buffer.
        let l:BufName = bufname(l:i)
        " Check to see if the buffer is a blank or not. If the buffer does have
        " a name, process it.
        if(strlen(l:BufName))
          " Only show modifiable buffers (The idea is that we don't 
          " want to show Explorers)
          if (getbufvar(l:i, '&modifiable') == 1 && BufName != '-MiniBufExplorer-')
            
            " Get filename & Remove []'s & ()'s
            let l:shortBufName = fnamemodify(l:BufName, ":t")                  
            let l:shortBufName = substitute(l:shortBufName, '[][()]', '', 'g') 
            let l:tab = '['.l:i.':'.l:shortBufName.']'

            " If the buffer is open in a window mark it
            if bufwinnr(l:i) != -1
              let l:tab = l:tab . '*'
            endif

            " If the buffer is modified then mark it
            if(getbufvar(l:i, '&modified') == 1)
              let l:tab = l:tab . '+'
            endif

            let l:maxTabWidth = <SID>Max(strlen(l:tab), l:maxTabWidth)
            let l:fileNames = l:fileNames.l:tab

            " If horizontal and tab wrap is turned on we need to add spaces
            if g:miniBufExplVSplit == 0
              if g:miniBufExplTabWrap != 0
                let l:fileNames = l:fileNames.' '
              endif
            " If not horizontal we need a newline
            else
              let l:fileNames = l:fileNames . "\n"
            endif
          endif
        endif
      endif
    endif
  endwhile

  if (g:miniBufExplBufList != l:fileNames)
    if (a:updateBufList)
      let g:miniBufExplBufList = l:fileNames
      let s:maxTabWidth = l:maxTabWidth
    endif
    return 1
  else
    return 0
  endif

endfunction

" }}}
" HasEligibleBuffers - Are there enough MBE eligible buffers to open the MBE window? {{{
" 
" Returns 1 if there are any buffers that can be displayed in a 
" mini buffer explorer. Otherwise returns 0. If delBufNum is
" any non -1 value then don't include that buffer in the list
" of eligible buffers.
"
function! <SID>HasEligibleBuffers(delBufNum)
  call <SID>DEBUG('Entering HasEligibleBuffers()',10)

  let l:save_rep = &report
  let l:save_sc = &showcmd
  let &report = 10000
  set noshowcmd 
  
  let l:NBuffers = bufnr('$')     " Get the number of the last buffer.
  let l:i        = 0              " Set the buffer index to zero.
  let l:found    = 0              " No buffer found

  if (g:miniBufExplorerMoreThanOne > 1)
    call <SID>DEBUG('More Than One mode turned on',6)
  endif
  let l:needed = g:miniBufExplorerMoreThanOne

  " Loop through every buffer less than the total number of buffers.
  while(l:i <= l:NBuffers && l:found < l:needed)
    let l:i = l:i + 1
   
    " If we have a delBufNum and it is the current
    " buffer then ignore the current buffer. 
    " Otherwise, continue.
    if (a:delBufNum == -1 || l:i != a:delBufNum)
      " Make sure the buffer in question is listed.
      if (getbufvar(l:i, '&buflisted') == 1)
        " Get the name of the buffer.
        let l:BufName = bufname(l:i)
        " Check to see if the buffer is a blank or not. If the buffer does have
        " a name, process it.
        if (strlen(l:BufName))
          " Only show modifiable buffers (The idea is that we don't 
          " want to show Explorers)
          if ((getbufvar(l:i, '&modifiable') == 1) && (BufName != '-MiniBufExplorer-'))
            
              let l:found = l:found + 1
  
          endif
        endif
      endif
    endif
  endwhile

  let &report  = l:save_rep
  let &showcmd = l:save_sc

  call <SID>DEBUG('HasEligibleBuffers found '.l:found.' eligible buffers of '.l:needed.' needed',6)

  return (l:found >= l:needed)
  
endfunction

" }}}
" Auto Update - Function called by auto commands for auto updating the MBE {{{
"
" IF auto update is turned on        AND
"    we are in a real buffer         AND
"    we have enough eligible buffers THEN
" Update our explorer and get back to the current window
"
" If we get a buffer number for a buffer that 
" is being deleted, we need to make sure and 
" remove the buffer from the list of eligible 
" buffers in case we are down to one eligible
" buffer, in which case we will want to close
" the MBE window.
"
function! <SID>AutoUpdate(delBufNum)
  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Entering AutoUpdate('.a:delBufNum.') : '.bufnr('%').' : '.bufname('%'),10)
  call <SID>DEBUG('===========================',10)

  if (g:miniBufExplInAutoUpdate == 1)
    call <SID>DEBUG('AutoUpdate recursion stopped',9)
    call <SID>DEBUG('===========================',10)
    call <SID>DEBUG('Terminated AutoUpdate()'    ,10)
    call <SID>DEBUG('===========================',10)
    return
  else
    let g:miniBufExplInAutoUpdate = 1
  endif

  " Don't bother autoupdating the MBE window
  if (bufname('%') == '-MiniBufExplorer-')
    " If this is the only buffer left then toggle the buffer
    if (winbufnr(2) == -1)
        call <SID>CycleBuffer(1)
        call <SID>DEBUG('AutoUpdate does not run for cycled windows', 9)
    else
      call <SID>DEBUG('AutoUpdate does not run for the MBE window', 9)
    endif

    call <SID>DEBUG('===========================',10)
    call <SID>DEBUG('Terminated AutoUpdate()'    ,10)
    call <SID>DEBUG('===========================',10)

    let g:miniBufExplInAutoUpdate = 0
    return

  endif

  if (a:delBufNum != -1)
    call <SID>DEBUG('AutoUpdate will make sure that buffer '.a:delBufNum.' is not included in the buffer list.', 5)
  endif
  
  " Only allow updates when the AutoUpdate flag is set
  " this allows us to stop updates on startup.
  if g:miniBufExplorerAutoUpdate == 1
    " Only show MiniBufExplorer if we have a real buffer
    if ((g:miniBufExplorerMoreThanOne == 0) || (bufnr('%') != -1 && bufname('%') != ""))
      if <SID>HasEligibleBuffers(a:delBufNum) == 1
        " if we don't have a window then create one
        let l:bufnr = <SID>FindWindow('-MiniBufExplorer-', 0)
        if (l:bufnr == -1)
          call <SID>DEBUG('About to call StartExplorer (Create MBE)', 9)
          call <SID>StartExplorer(0, a:delBufNum)
        else
        " otherwise only update the window if the contents have
        " changed
          let l:ListChanged = <SID>BuildBufferList(a:delBufNum, 0)
          if (l:ListChanged)
            call <SID>DEBUG('About to call StartExplorer (Update MBE)', 9) 
            call <SID>StartExplorer(0, a:delBufNum)
          endif
        endif

        " go back to the working buffer
        if (bufname('%') == '-MiniBufExplorer-')
          wincmd p
        endif
      else
        call <SID>DEBUG('Failed in eligible check', 9)
        call <SID>StopExplorer(0)
      endif

	  " VIM sometimes turns syntax highlighting off,
	  " we can force it on, but this may cause weird
	  " behavior so this is an optional hack to force
	  " syntax back on when we enter a buffer
	  if g:miniBufExplForceSyntaxEnable
		call <SID>DEBUG('Enable Syntax', 9)
		exec 'syntax enable'
	  endif

    else
      call <SID>DEBUG('No buffers loaded...',9)
    endif
  else
    call <SID>DEBUG('AutoUpdates are turned off, terminating',9)
  endif

  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Completed AutoUpdate()'     ,10)
  call <SID>DEBUG('===========================',10)

  let g:miniBufExplInAutoUpdate = 0

endfunction

" }}}
" GetSelectedBuffer - From the MBE window, return the bufnum for buf under cursor {{{
" 
" If we are in our explorer window then return the buffer number
" for the buffer under the cursor.
"
function! <SID>GetSelectedBuffer()
  call <SID>DEBUG('Entering GetSelectedBuffer()',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('GetSelectedBuffer called in invalid window',1)
    return -1
  endif

  let l:save_reg = @"
  let @" = ""
  normal ""yi[
  if @" != ""
    let l:retv = substitute(@",'\([0-9]*\):.*', '\1', '') + 0
    let @" = l:save_reg
    return l:retv
  else
    let @" = l:save_reg
    return -1
  endif

endfunction

" }}}
" MBESelectBuffer - From the MBE window, open buffer under the cursor {{{
" 
" If we are in our explorer, then we attempt to open the buffer under the
" cursor in the previous window.
"
function! <SID>MBESelectBuffer()
  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Entering MBESelectBuffer()' ,10)
  call <SID>DEBUG('===========================',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('MBESelectBuffer called in invalid window',1)
    return 
  endif

  let l:save_rep = &report
  let l:save_sc  = &showcmd
  let &report    = 10000
  set noshowcmd 
  
  let l:bufnr  = <SID>GetSelectedBuffer()
  let l:resize = 0

  if(l:bufnr != -1)             " If the buffer exists.

    let l:saveAutoUpdate = g:miniBufExplorerAutoUpdate
    let g:miniBufExplorerAutoUpdate = 0
    " Switch to the previous window
    wincmd p

    " If we are in the buffer explorer or in a nonmodifiable buffer with
    " g:miniBufExplModSelTarget set then try another window (a few times)
    if bufname('%') == '-MiniBufExplorer-' || (g:miniBufExplModSelTarget == 1 && getbufvar(bufnr('%'), '&modifiable') == 0)
      wincmd w
      if bufname('%') == '-MiniBufExplorer-' || (g:miniBufExplModSelTarget == 1 && getbufvar(bufnr('%'), '&modifiable') == 0)
        wincmd w
        if bufname('%') == '-MiniBufExplorer-' || (g:miniBufExplModSelTarget == 1 && getbufvar(bufnr('%'), '&modifiable') == 0)
          wincmd w
          " The following handles the case where -MiniBufExplorer-
          " is the only window left. We need to resize so we don't
          " end up with a 1 or two line buffer.
          if bufname('%') == '-MiniBufExplorer-'
            let l:resize = 1
          endif
        endif
      endif
    endif

    exec('b! '.l:bufnr)
    if (l:resize)
      resize
    endif
    let g:miniBufExplorerAutoUpdate = l:saveAutoUpdate
    call <SID>AutoUpdate(-1)

  endif

  let &report  = l:save_rep
  let &showcmd = l:save_sc

  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Completed MBESelectBuffer()',10)
  call <SID>DEBUG('===========================',10)

endfunction

" }}}
" MBEDeleteBuffer - From the MBE window, delete selected buffer from list {{{
" 
" After making sure that we are in our explorer, This will delete the buffer 
" under the cursor. If the buffer under the cursor is being displayed in a
" window, this routine will attempt to get different buffers into the 
" windows that will be affected so that windows don't get removed.
"
function! <SID>MBEDeleteBuffer()
  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Entering MBEDeleteBuffer()' ,10)
  call <SID>DEBUG('===========================',10)

  " Make sure we are in our window
  if bufname('%') != '-MiniBufExplorer-'
    call <SID>DEBUG('MBEDeleteBuffer called in invalid window',1)
    return 
  endif

  let l:curLine    = line('.')
  let l:curCol     = virtcol('.')
  let l:selBuf     = <SID>GetSelectedBuffer()
  let l:selBufName = bufname(l:selBuf)

  if l:selBufName == 'MiniBufExplorer.DBG' && g:miniBufExplorerDebugLevel > 0
    call <SID>DEBUG('MBEDeleteBuffer will not delete the debug window, when debugging is turned on.',1)
    return
  endif

  let l:save_rep = &report
  let l:save_sc  = &showcmd
  let &report    = 10000
  set noshowcmd 
  
  
  if l:selBuf != -1 

    " Don't want auto updates while we are processing a delete
    " request.
    let l:saveAutoUpdate = g:miniBufExplorerAutoUpdate
    let g:miniBufExplorerAutoUpdate = 0

    " Save previous window so that if we show a buffer after
    " deleting. The show will come up in the correct window.
    wincmd p
    let l:prevWin    = winnr()
    let l:prevWinBuf = winbufnr(winnr())

    call <SID>DEBUG('Previous window: '.l:prevWin.' buffer in window: '.l:prevWinBuf,5)
    call <SID>DEBUG('Selected buffer is <'.l:selBufName.'>['.l:selBuf.']',5)

    " If buffer is being displayed in a window then 
    " move window to a different buffer before 
    " deleting this one. 
    let l:winNum = (bufwinnr(l:selBufName) + 0)
    " while we have windows that contain our buffer
    while l:winNum != -1 
        call <SID>DEBUG('Buffer '.l:selBuf.' is being displayed in window: '.l:winNum,5)

        " move to window that contains our selected buffer
        exec l:winNum.' wincmd w'

        call <SID>DEBUG('We are now in window: '.winnr().' which contains buffer: '.bufnr('%').' and should contain buffer: '.l:selBuf,5)

        let l:origBuf = bufnr('%')
        call <SID>CycleBuffer(1)
        let l:curBuf  = bufnr('%')

        call <SID>DEBUG('Window now contains buffer: '.bufnr('%').' which should not be: '.l:selBuf,5)

        if l:origBuf == l:curBuf
            " we wrapped so we are going to have to delete a buffer 
            " that is in an open window.
            let l:winNum = -1
        else
            " see if we have anymore windows with our selected buffer
            let l:winNum = (bufwinnr(l:selBufName) + 0)
        endif
    endwhile

    " Attempt to restore previous window
    call <SID>DEBUG('Restoring previous window to: '.l:prevWin,5)
    exec l:prevWin.' wincmd w'

    " Try to get back to the -MiniBufExplorer- window 
    let l:winNum = bufwinnr(bufnr('-MiniBufExplorer-'))
    if l:winNum != -1
        exec l:winNum.' wincmd w'
        call <SID>DEBUG('Got to -MiniBufExplorer- window: '.winnr(),5)
    else
        call <SID>DEBUG('Unable to get to -MiniBufExplorer- window',1)
    endif
  
    " Delete the buffer selected.
    call <SID>DEBUG('About to delete buffer: '.l:selBuf,5)
    exec('silent! bd '.l:selBuf)

    let g:miniBufExplorerAutoUpdate = l:saveAutoUpdate 
    call <SID>DisplayBuffers(-1)
    call cursor(l:curLine, l:curCol)

  endif

  let &report  = l:save_rep
  let &showcmd = l:save_sc

  call <SID>DEBUG('===========================',10)
  call <SID>DEBUG('Completed MBEDeleteBuffer()',10)
  call <SID>DEBUG('===========================',10)

endfunction

" }}}
" MBEClick - Handle mouse double click {{{
"
function! s:MBEClick()
  call <SID>DEBUG('Entering MBEClick()',10)
  call <SID>MBESelectBuffer()
endfunction

"
" MBEDoubleClick - Double click with the mouse.
"
function! s:MBEDoubleClick()
  call <SID>DEBUG('Entering MBEDoubleClick()',10)
  call <SID>MBESelectBuffer()
endfunction

" }}}
" CycleBuffer - Cycle Through Buffers {{{
"
" Move to next or previous buffer in the current window. If there 
" are no more modifiable buffers then stay on the current buffer.
" can be called with no parameters in which case the buffers are
" cycled forward. Otherwise a single argument is accepted, if 
" it's 0 then the buffers are cycled backwards, otherwise they
" are cycled forward.
"
function! <SID>CycleBuffer(forward)

  " The following hack handles the case where we only have one
  " window open and it is too small
  let l:saveAutoUpdate = g:miniBufExplorerAutoUpdate
  if (winbufnr(2) == -1)
    resize
    let g:miniBufExplorerAutoUpdate = 0
  endif
  
  " Change buffer (keeping track of before and after buffers)
  let l:origBuf = bufnr('%')
  if (a:forward == 1)
    bn!
  else
    bp!
  endif
  let l:curBuf  = bufnr('%')

  " Skip any non-modifiable buffers, but don't cycle forever
  " This should stop us from stopping in any of the [Explorers]
  while getbufvar(l:curBuf, '&modifiable') == 0 && l:origBuf != l:curBuf
    if (a:forward == 1)
        bn!
    else
        bp!
    endif
    let l:curBuf = bufnr('%')
  endwhile

  let g:miniBufExplorerAutoUpdate = l:saveAutoUpdate
  if (l:saveAutoUpdate == 1)
    call <SID>AutoUpdate(-1)
  endif

endfunction

" }}}
" DEBUG - Display debug output when debugging is turned on {{{
"
" Thanks to Charles E. Campbell, Jr. PhD <cec@NgrOyphSon.gPsfAc.nMasa.gov> 
" for Decho.vim which was the inspiration for this enhanced debugging 
" capability.
"
function! <SID>DEBUG(msg, level)

  if g:miniBufExplorerDebugLevel >= a:level

    " Prevent a report of our actions from showing up.
    let l:save_rep    = &report
    let l:save_sc     = &showcmd
    let &report       = 10000
    set noshowcmd 

    " Debug output to a buffer
    if g:miniBufExplorerDebugMode == 0
        " Save the current window number so we can come back here
        let l:prevWin     = winnr()
        wincmd p
        let l:prevPrevWin = winnr()
        wincmd p

        " Get into the debug window or create it if needed
        call <SID>FindCreateWindow('MiniBufExplorer.DBG', 1, 0, 0)
    
        " Make sure we really got to our window, if not we 
        " will display a confirm dialog and turn debugging
        " off so that we won't break things even more.
        if bufname('%') != 'MiniBufExplorer.DBG'
            call confirm('Error in window debugging code. Dissabling MiniBufExplorer debugging.', 'OK')
            let g:miniBufExplorerDebugLevel = 0
        endif

        " Write Message to DBG buffer
        let res=append("$",s:debugIndex.':'.a:level.':'.a:msg)
        norm G
        "set nomodified

        " Return to original window
        exec l:prevPrevWin.' wincmd w'
        exec l:prevWin.' wincmd w'
    " Debug output using VIM's echo facility
    elseif g:miniBufExplorerDebugMode == 1
      echo s:debugIndex.':'.a:level.':'.a:msg
    " Debug output to a file -- VERY SLOW!!!
    " should be OK on UNIX and Win32 (not the 95/98 variants)
    elseif g:miniBufExplorerDebugMode == 2
        if has('system') || has('fork')
            if has('win32') && !has('win95')
                let l:result = system("cmd /c 'echo ".s:debugIndex.':'.a:level.':'.a:msg." >> MiniBufExplorer.DBG'")
            endif
            if has('unix')
                let l:result = system("echo '".s:debugIndex.':'.a:level.':'.a:msg." >> MiniBufExplorer.DBG'")
            endif
        else
            call confirm('Error in file writing version of the debugging code, vim not compiled with system or fork. Dissabling MiniBufExplorer debugging.', 'OK')
            let g:miniBufExplorerDebugLevel = 0
        endif
    elseif g:miniBufExplorerDebugMode == 3
        let g:miniBufExplorerDebugOutput = g:miniBufExplorerDebugOutput."\n".s:debugIndex.':'.a:level.':'.a:msg
    endif
    let s:debugIndex = s:debugIndex + 1

    let &report  = l:save_rep
    let &showcmd = l:save_sc

  endif

endfunc " }}}

" MBE Script History {{{
"=============================================================================
"
"      History: 6.3.2 o For some reason there was still a call to StopExplorer
"                       with 2 params. Very old bug. I know I fixed before, 
"                       any way many thanks to Jason Mills for reporting this!
"               6.3.1 o Include folds in source so that it's easier to 
"                       navigate.
"                     o Added g:miniBufExplForceSyntaxEnable setting for folks
"                       that want a :syntax enable to be called when we enter 
"                       buffers. This can resolve issues caused by a vim bug
"                       where buffers show up without highlighting when another 
"                       buffer has been closed, quit, wiped or deleted.
"               6.3.0 o Added an option to allow single click (rather than
"                       the default double click) to select buffers in the
"                       MBE window. This feature was requested by AW Law
"                       and was inspired by taglist.vim. Note that you will 
"                       need the latest version of taglist.vim if you want to 
"                       use MBE and taglist both with singleclick turned on.
"                       Also thanks to AW Law for pointing out that you can
"                       make an Explorer not be listed in a standard :ls.
"                     o Added the ability to have your tabs show up in a
"                       vertical window rather than the standard horizontal
"                       one. Just let g:miniBufExplVSplit = <width> in your
"                       .vimrc and your will get this functionality.
"                     o If you use the vertical explorer and you want it to
"                       autosize then let g:miniBufExplMaxSize = <max width>
"                       in your .vimrc. You may use the MinSize letting in
"                       addition to the MaxLetting if you don't want a super
"                       thin window.
"                     o g:miniBufExplMaxHeight was renamed g:miniBufExplMaxSize
"                       g:miniBufExplMinHeight was renamed g:miniBufExplMinSize
"                       the old settings are backwards compatible if you don't
"                       use the new settings, but they are depreciated.
"               6.2.8 o Add an option to stop MBE from targeting non-modifiable
"                       buffers when switching buffers. Thanks to AW Law for
"                       the inspiration for this. This may not work if a user
"                       has lots of explorer/help windows open.
"               6.2.7 o Very minor bug fix for people who want to set
"                       loaded_minibufexplorer in their .vimrc in order to
"                       stop MBE from loading. 99.99% of users do not need
"                       this update.
"               6.2.6 o Moved history to end of source file
"                     o Updated highlighting documentation
"                     o Created global commands MBEbn and MBEbp that can be 
"                       used in mappings if folks want to cycle buffers while 
"                       skipping non-eligible buffers.
"               6.2.5 o Added <Leader>mbt key mapping which will toggle
"                       the MBE window. I map this to F3 in my .vimrc
"                       with "map <F3> :TMiniBufExplorer<CR>" which 
"                       means I can easily close the MBE window when I'm 
"                       not using it and get it back when I want it.
"                     o Changed default debug mode to 3 (write to global
"                       g:miniBufExplorerDebugOutput)
"                     o Made a pass through the documentation to clarify 
"                       serveral issues and provide more complete docs
"                       for mappings and commands.
"               6.2.4 o Because of the autocommand switch (see 6.2.0) it 
"                       was possible to remove the restriction on the
"                       :set hidden option. It is now possible to use
"                       this option with MBE.
"               6.2.3 o Added miniBufExplTabWrap option. It is turned 
"                       off by default. When turned on spaces are added
"                       between tabs and gq} is issued to perform line
"                       formatting. This won't work very well if filenames
"                       contain spaces. It would be pretty easy to write
"                       my own formatter, but I'm too lazy, so if someone
"                       really needs that feature I'll add it :)
"               6.2.2 o Changed the way the g:miniBufExplorerMoreThanOne
"                       global is handled. You can set this to the number
"                       of eligible buffers you want to be loaded before
"                       the MBE window is loaded. Setting it to 0 causes
"                       the MBE window to be opened even if there are no
"                       buffers. Setting it to 4 causes the window to stay
"                       closed until the 4th eligible buffer is loaded.
"                     o Added a MinHeight option. This is nice if you want
"                       the MBE window to always take the same amount of
"                       space. For example set MaxSize and MinSize to 2
"                       and set MoreThanOne to 0 and you will always have
"                       a 2 row (plus the ruler :) MBE window.
"                       NOTE: in 6.3.0 we started using MinSize instead of
"                       Minheight. This will still work if MinSize is not
"                       specified, but it is depreciated. Use MinSize instead.
"                     o I now setlocal foldcomun=0 and nonumber in the MBE 
"                       window. This is for those of you that like to have
"                       these options turned on locally. I'm assuming noone
"                       outthere wants foldcolumns and line numbers in the
"                       MBE window? :)
"                     o Fixed a bug where an empty MBE window was taking half
"                       of the screen (partly why the MinHeight option was 
"                       added.)
"               6.2.1 o If MBE is the only window (because of :bd for example)
"                       and there are still eligible buffers then one of them
"                       will be displayed.
"                     o The <Leader>mbe mapping now highlights the buffer from
"                       the current window.
"                     o The delete ('d') binding in the MBE window now restors
"                       the cursor position, which can help if you want to 
"                       delete several buffers in a row that are not at the
"                       beginning of the buffer list.
"                     o Added a new key binding ('p') in the MBE window to 
"                       switch to the previous window (last edit window)
"               6.2.0 o Major overhaul of autocommand and list updating code,
"                       we now have much better handling of :bd (which is the 
"                       most requested feature.) As well as resolving other
"                       issues where the buffer list would not be updated
"                       automatically. The old version tried to trap specific
"                       events, this one just updates frequently, but it keeps
"                       track and only changes the screen if there has been
"                       a change.
"                     o Added g:miniBufExplMaxHeight variable so you can keep
"                       the -MiniBufExplorer- window small when you have lots
"                       of buffers (or buffers with long names :)
"                       NOTE: in 6.3.0 we started using MaxSize instead of
"                       MaxHeight. This will still work if MaxSize is not
"                       specified, but it is depreciated. Use MaxSize instead.
"                     o Improvement to internal syntax highlighting code
"                       I renamed the syntax group names. Anyone who has 
"                       figured out how to use them already shouldn't have
"                       any trouble with the new Nameing :)
"                     o Added debug mode 3 which writes to a global variable
"                       this is fast and doesn't mess with the buffer/window
"                       lists.
"               6.1.0 o <Leader>mbc was failing because I was calling one of
"                       my own functions with the wrong number of args. :(
"                       Thanks to Gerry Patterson for finding this!
"                       This code is very stable (although it has some
"                       idiocyncracies.)
"               6.0.9 o Double clicking tabs was overwriting the cliboard 
"                       register on MS Windows.  Thanks to Shoeb Bhinderwala 
"                       for reporting this issue.
"               6.0.8 o Apparently some VIM builds are having a hard time with
"                       line continuation in scripts so the few that were here
"                       have been removed.
"                     o Generalized FindExplorer and FindCreateExplorer so
"                       that they can be used for the debug window. Renaming
"                       to FindWindow and FindCreateWindow.
"                     o Updated debugging code so that debug output is put into
"                       a buffer which can then be written to disk or emailed
"                       to me when someone is having a major issue. Can also
"                       write directly to a file (VERY SLOWLY) on UNIX or Win32
"                       (not 95 or 98 at the moment) or use VIM's echo function 
"                       to display the output to the screen.
"                     o Several people have had issues when the hidden option 
"                       is turned on. So I have put in several checks to make
"                       sure folks know this if they try to use MBE with this
"                       option set.
"               6.0.7 o Handling BufDelete autocmd so that the UI updates 
"                       properly when using :bd (rather than going through 
"                       the MBE UI.)
"                     o The AutoUpdate code will now close the MBE window when 
"                       there is a single eligible buffer available.
"                       This has the usefull side effect of stopping the MBE
"                       window from blocking the VIM session open when you close 
"                       the last buffer.
"                     o Added functions, commands and maps to close & update
"                       the MBE window (<leader>mbc and <leader>mbu.)
"                     o Made MBE open/close state be sticky if set through
"                       StartExplorer(1) or StopExplorer(1), which are 
"                       called from the standard mappings. So if you close
"                       the mbe window with \mbc it won't be automatically 
"                       opened again unless you do a \mbe (or restart VIM).
"                     o Removed spaces between "tabs" (even more mini :)
"                     o Simplified MBE tab processing 
"               6.0.6 o Fixed register overwrite bug found by S�bastien Pierre
"               6.0.5 o Fixed an issue with window sizing when we run out of 
"                       buffers.  
"                     o Fixed some weird commenting bugs.  
"                     o Added more optional fancy window/buffer navigation:
"                     o You can turn on the capability to use control and the 
"                       arrow keys to move between windows.
"                     o You can turn on the ability to use <C-TAB> and 
"                       <C-S-TAB> to open the next and previous (respectively) 
"                       buffer in the current window.
"                     o You can turn on the ability to use <C-TAB> and 
"                       <C-S-TAB> to switch windows (forward and backwards 
"                       respectively.)
"               6.0.4 o Added optional fancy window navigation: 
"                     o Holding down control and pressing a vim direction 
"                       [hjkl] will switch windows in the indicated direction.
"               6.0.3 o Changed buffer name to -MiniBufExplorer- to resolve
"                       Issue in filename pattern matching on Windows.
"               6.0.2 o 2 Changes requested by Suresh Govindachar:
"                     o Added SplitToEdge option and set it on by default
"                     o Added tab and shift-tab mappings in [MBE] window
"               6.0.1 o Added MoreThanOne option and set it on by default
"                       MiniBufExplorer will not automatically open until
"                       more than one eligible buffers are opened. This
"                       reduces cluter when you are only working on a
"                       single file. 
"                       NOTE: See change log for 6.2.2 for more details about 
"                             this feature
"               6.0.0 o Initial Release on November 20, 2001
"
"=============================================================================
" }}}
" vim:ft=vim:fdm=marker:ff=unix:nowrap:tabstop=4:shiftwidth=4:softtabstop=4:smarttab:shiftround:expandtab
                                         .vim/plugin/taglist.vim                                                                             000644  000765  000024  00000451262 12113120304 016310  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " File: taglist.vim
" Author: Yegappan Lakshmanan (yegappan AT yahoo DOT com)
" Version: 4.6
" Last Modified: Feb 26, 2013
" Copyright: Copyright (C) 2002-2013 Yegappan Lakshmanan
"            Permission is hereby granted to use and distribute this code,
"            with or without modifications, provided that this copyright
"            notice is copied with it. Like anything else that's free,
"            taglist.vim is provided *as is* and comes with no warranty of any
"            kind, either expressed or implied. In no event will the copyright
"            holder be liable for any damamges resulting from the use of this
"            software.
"
" The "Tag List" plugin is a source code browser plugin for Vim and provides
" an overview of the structure of the programming language files and allows
" you to efficiently browse through source code files for different
" programming languages.  You can visit the taglist plugin home page for more
" information:
"
"       http://vim-taglist.sourceforge.net
"
" You can subscribe to the taglist mailing list to post your questions
" or suggestions for improvement or to report bugs. Visit the following
" page for subscribing to the mailing list:
"
"       http://groups.yahoo.com/group/taglist/
"
" For more information about using this plugin, after installing the
" taglist plugin, use the ":help taglist" command.
"
" Installation
" ------------
" 1. Download the taglist.zip file and unzip the files to the $HOME/.vim
"    or the $HOME/vimfiles or the $VIM/vimfiles directory. This should
"    unzip the following two files (the directory structure should be
"    preserved):
"
"       plugin/taglist.vim - main taglist plugin file
"       doc/taglist.txt    - documentation (help) file
"
"    Refer to the 'add-plugin', 'add-global-plugin' and 'runtimepath'
"    Vim help pages for more details about installing Vim plugins.
" 2. Change to the $HOME/.vim/doc or $HOME/vimfiles/doc or
"    $VIM/vimfiles/doc directory, start Vim and run the ":helptags ."
"    command to process the taglist help file.
" 3. If the exuberant ctags utility is not present in your PATH, then set the
"    Tlist_Ctags_Cmd variable to point to the location of the exuberant ctags
"    utility (not to the directory) in the .vimrc file.
" 4. If you are running a terminal/console version of Vim and the
"    terminal doesn't support changing the window width then set the
"    'Tlist_Inc_Winwidth' variable to 0 in the .vimrc file.
" 5. Restart Vim.
" 6. You can now use the ":TlistToggle" command to open/close the taglist
"    window. You can use the ":help taglist" command to get more
"    information about using the taglist plugin.
"
" ****************** Do not modify after this line ************************

" Line continuation used here
if !exists('s:cpo_save')
    " If the taglist plugin is sourced recursively, the 'cpo' setting will be
    " set to the default value.  To avoid this problem, save the cpo setting
    " only when the plugin is loaded for the first time.
    let s:cpo_save = &cpo
endif
set cpo&vim

if !exists('loaded_taglist')
    " First time loading the taglist plugin
    "
    " To speed up the loading of Vim, the taglist plugin uses autoload
    " mechanism to load the taglist functions.
    " Only define the configuration variables, user commands and some
    " auto-commands and finish sourcing the file

    " The taglist plugin requires the built-in Vim system() function. If this
    " function is not available, then don't load the plugin.
    if !exists('*system')
        echomsg 'Taglist: Vim system() built-in function is not available. ' .
                    \ 'Plugin is not loaded.'
        let loaded_taglist = 'no'
        let &cpo = s:cpo_save
        finish
    endif

    " Location of the exuberant ctags tool
    if !exists('Tlist_Ctags_Cmd')
        if executable('exuberant-ctags')
            " On Debian Linux, exuberant ctags is installed
            " as exuberant-ctags
            let Tlist_Ctags_Cmd = 'exuberant-ctags'
        elseif executable('exctags')
            " On Free-BSD, exuberant ctags is installed as exctags
            let Tlist_Ctags_Cmd = 'exctags'
        elseif executable('ctags')
            let Tlist_Ctags_Cmd = 'ctags'
        elseif executable('ctags.exe')
            let Tlist_Ctags_Cmd = 'ctags.exe'
        elseif executable('tags')
            let Tlist_Ctags_Cmd = 'tags'
        else
            echomsg 'Taglist: Exuberant ctags (http://ctags.sf.net) ' .
                        \ 'not found in PATH. Plugin is not loaded.'
            " Skip loading the plugin
            let loaded_taglist = 'no'
            let &cpo = s:cpo_save
            finish
        endif
    endif


    " Automatically open the taglist window on Vim startup
    if !exists('Tlist_Auto_Open')
        let Tlist_Auto_Open = 0
    endif

    " When the taglist window is toggle opened, move the cursor to the
    " taglist window
    if !exists('Tlist_GainFocus_On_ToggleOpen')
        let Tlist_GainFocus_On_ToggleOpen = 0
    endif

    " Process files even when the taglist window is not open
    if !exists('Tlist_Process_File_Always')
        let Tlist_Process_File_Always = 0
    endif

    if !exists('Tlist_Show_Menu')
        let Tlist_Show_Menu = 0
    endif

    " Tag listing sort type - 'name' or 'order'
    if !exists('Tlist_Sort_Type')
        let Tlist_Sort_Type = 'order'
    endif

    " Tag listing window split (horizontal/vertical) control
    if !exists('Tlist_Use_Horiz_Window')
        let Tlist_Use_Horiz_Window = 0
    endif

    " Open the vertically split taglist window on the left or on the right
    " side.  This setting is relevant only if Tlist_Use_Horiz_Window is set to
    " zero (i.e.  only for vertically split windows)
    if !exists('Tlist_Use_Right_Window')
        let Tlist_Use_Right_Window = 0
    endif

    " Increase Vim window width to display vertically split taglist window.
    " For MS-Windows version of Vim running in a MS-DOS window, this must be
    " set to 0 otherwise the system may hang due to a Vim limitation.
    if !exists('Tlist_Inc_Winwidth')
        if (has('win16') || has('win95')) && !has('gui_running')
            let Tlist_Inc_Winwidth = 0
        else
            let Tlist_Inc_Winwidth = 1
        endif
    endif

    " Vertically split taglist window width setting
    if !exists('Tlist_WinWidth')
        let Tlist_WinWidth = 30
    endif

    " Horizontally split taglist window height setting
    if !exists('Tlist_WinHeight')
        let Tlist_WinHeight = 10
    endif

    " Display tag prototypes or tag names in the taglist window
    if !exists('Tlist_Display_Prototype')
        let Tlist_Display_Prototype = 0
    endif

    " Display tag scopes in the taglist window
    if !exists('Tlist_Display_Tag_Scope')
        let Tlist_Display_Tag_Scope = 1
    endif

    " Use single left mouse click to jump to a tag. By default this is disabled.
    " Only double click using the mouse will be processed.
    if !exists('Tlist_Use_SingleClick')
        let Tlist_Use_SingleClick = 0
    endif

    " Control whether additional help is displayed as part of the taglist or
    " not.  Also, controls whether empty lines are used to separate the tag
    " tree.
    if !exists('Tlist_Compact_Format')
        let Tlist_Compact_Format = 0
    endif

    " Exit Vim if only the taglist window is currently open. By default, this is
    " set to zero.
    if !exists('Tlist_Exit_OnlyWindow')
        let Tlist_Exit_OnlyWindow = 0
    endif

    " Automatically close the folds for the non-active files in the taglist
    " window
    if !exists('Tlist_File_Fold_Auto_Close')
        let Tlist_File_Fold_Auto_Close = 0
    endif

    " Close the taglist window when a tag is selected
    if !exists('Tlist_Close_On_Select')
        let Tlist_Close_On_Select = 0
    endif

    " Automatically update the taglist window to display tags for newly
    " edited files
    if !exists('Tlist_Auto_Update')
        let Tlist_Auto_Update = 1
    endif

    " Automatically highlight the current tag
    if !exists('Tlist_Auto_Highlight_Tag')
        let Tlist_Auto_Highlight_Tag = 1
    endif
    
    " Automatically highlight the current tag on entering a buffer
    if !exists('Tlist_Highlight_Tag_On_BufEnter')
        let Tlist_Highlight_Tag_On_BufEnter = 1
    endif

    " Enable fold column to display the folding for the tag tree
    if !exists('Tlist_Enable_Fold_Column')
        let Tlist_Enable_Fold_Column = 1
    endif

    " Display the tags for only one file in the taglist window
    if !exists('Tlist_Show_One_File')
        let Tlist_Show_One_File = 0
    endif

    if !exists('Tlist_Max_Submenu_Items')
        let Tlist_Max_Submenu_Items = 20
    endif

    if !exists('Tlist_Max_Tag_Length')
        let Tlist_Max_Tag_Length = 10
    endif

    " Do not change the name of the taglist title variable. The winmanager
    " plugin relies on this name to determine the title for the taglist
    " plugin.
    let TagList_title = "__Tag_List__"

    " Taglist debug messages
    let s:tlist_msg = ''

    " Define the taglist autocommand to automatically open the taglist window
    " on Vim startup
    if g:Tlist_Auto_Open
        autocmd VimEnter * nested call s:Tlist_Window_Check_Auto_Open()
    endif

    " Refresh the taglist
    if g:Tlist_Process_File_Always
        autocmd BufEnter * call s:Tlist_Refresh()
    endif

    if g:Tlist_Show_Menu
        autocmd GUIEnter * call s:Tlist_Menu_Init()
    endif

    " When the taglist buffer is created when loading a Vim session file,
    " the taglist buffer needs to be initialized. The BufFilePost event
    " is used to handle this case.
    autocmd BufFilePost __Tag_List__ call s:Tlist_Vim_Session_Load()

    " Define the user commands to manage the taglist window
    command! -nargs=0 -bar TlistToggle call s:Tlist_Window_Toggle()
    command! -nargs=0 -bar TlistOpen call s:Tlist_Window_Open()
    " For backwards compatiblity define the Tlist command
    command! -nargs=0 -bar Tlist TlistToggle
    command! -nargs=+ -complete=file TlistAddFiles
                \  call s:Tlist_Add_Files(<f-args>)
    command! -nargs=+ -complete=dir TlistAddFilesRecursive
                \ call s:Tlist_Add_Files_Recursive(<f-args>)
    command! -nargs=0 -bar TlistClose call s:Tlist_Window_Close()
    command! -nargs=0 -bar TlistUpdate call s:Tlist_Update_Current_File()
    command! -nargs=0 -bar TlistHighlightTag call s:Tlist_Window_Highlight_Tag(
                        \ fnamemodify(bufname('%'), ':p'), line('.'), 2, 1)
    " For backwards compatiblity define the TlistSync command
    command! -nargs=0 -bar TlistSync TlistHighlightTag
    command! -nargs=* -complete=buffer TlistShowPrototype
                \ echo Tlist_Get_Tag_Prototype_By_Line(<f-args>)
    command! -nargs=* -complete=buffer TlistShowTag
                \ echo Tlist_Get_Tagname_By_Line(<f-args>)
    command! -nargs=* -complete=file TlistSessionLoad
                \ call s:Tlist_Session_Load(<q-args>)
    command! -nargs=* -complete=file TlistSessionSave
                \ call s:Tlist_Session_Save(<q-args>)
    command! -bar TlistLock let Tlist_Auto_Update=0
    command! -bar TlistUnlock let Tlist_Auto_Update=1

    " Commands for enabling/disabling debug and to display debug messages
    command! -nargs=? -complete=file -bar TlistDebug
                \ call s:Tlist_Debug_Enable(<q-args>)
    command! -nargs=0 -bar TlistUndebug  call s:Tlist_Debug_Disable()
    command! -nargs=0 -bar TlistMessages call s:Tlist_Debug_Show()

    " Define autocommands to autoload the taglist plugin when needed.

    " Trick to get the current script ID
    map <SID>xx <SID>xx
    let s:tlist_sid = substitute(maparg('<SID>xx'), '<SNR>\(\d\+_\)xx$',
                                \ '\1', '')
    unmap <SID>xx

    exe 'autocmd FuncUndefined *' . s:tlist_sid . 'Tlist_* source ' .
                \ escape(expand('<sfile>'), ' ')
    exe 'autocmd FuncUndefined *' . s:tlist_sid . 'Tlist_Window_* source ' .
                \ escape(expand('<sfile>'), ' ')
    exe 'autocmd FuncUndefined *' . s:tlist_sid . 'Tlist_Menu_* source ' .
                \ escape(expand('<sfile>'), ' ')
    exe 'autocmd FuncUndefined Tlist_* source ' .
                \ escape(expand('<sfile>'), ' ')
    exe 'autocmd FuncUndefined TagList_* source ' .
                \ escape(expand('<sfile>'), ' ')

    let loaded_taglist = 'fast_load_done'

    if g:Tlist_Show_Menu && has('gui_running')
        call s:Tlist_Menu_Init()
    endif

    " restore 'cpo'
    let &cpo = s:cpo_save
    finish
endif

if !exists('s:tlist_sid')
    " Two or more versions of taglist plugin are installed. Don't
    " load this version of the plugin.
    let &cpo = s:cpo_save
    finish
endif

unlet! s:tlist_sid

if loaded_taglist != 'fast_load_done'
    " restore 'cpo'
    let &cpo = s:cpo_save
    finish
endif

" Taglist plugin functionality is available
let loaded_taglist = 'available'

"------------------- end of user configurable options --------------------

" Default language specific settings for supported file types and tag types
"
" Variable name format:
"
"       s:tlist_def_{vim_ftype}_settings
" 
" vim_ftype - Filetype detected by Vim
"
" Value format:
"
"       <ctags_ftype>;<flag>:<name>;<flag>:<name>;...
"
" ctags_ftype - File type supported by exuberant ctags
" flag        - Flag supported by exuberant ctags to generate a tag type
" name        - Name of the tag type used in the taglist window to display the
"               tags of this type
"

" Ant language
let s:tlist_def_ant_settings = 'ant;p:projects;t:targets'

" assembly language
let s:tlist_def_asm_settings = 'asm;d:define;l:label;m:macro;t:type'

" aspperl language
let s:tlist_def_aspperl_settings =
            \ 'asp;c:constants;v:variable;f:function;s:subroutine'

" aspvbs language
let s:tlist_def_aspvbs_settings =
            \ 'asp;c:constants;v:variable;f:function;s:subroutine'

" awk language
let s:tlist_def_awk_settings = 'awk;f:function'

" basic language
let s:tlist_def_basic_settings =
            \ 'basic;c:constant;l:label;g:enum;v:variable;' .
            \ 't:type;f:function'

" beta language
let s:tlist_def_beta_settings = 'beta;f:fragment;s:slot;v:pattern'

" c language
let s:tlist_def_c_settings = 'c;d:macro;g:enum;s:struct;u:union;t:typedef;' .
                           \ 'v:variable;f:function'

" c++ language
let s:tlist_def_cpp_settings = 'c++;n:namespace;v:variable;d:macro;t:typedef;' .
                             \ 'c:class;g:enum;s:struct;u:union;f:function'

" c# language
let s:tlist_def_cs_settings = 'c#;d:macro;t:typedef;n:namespace;c:class;' .
                             \ 'E:event;g:enum;s:struct;i:interface;' .
                             \ 'p:properties;m:method'

" cobol language
let s:tlist_def_cobol_settings = 'cobol;d:data;f:file;g:group;p:paragraph;' .
                               \ 'P:program;s:section'
" D programming language
let s:tlist_def_d_settings = 'c++;n:namespace;v:variable;t:typedef;' .
                        \'c:class;g:enum;s:struct;u:union;f:function'

" Dosbatch
let s:tlist_def_dosbatch_settings = 'dosbatch;l:labels;v:variables'

" eiffel language
let s:tlist_def_eiffel_settings = 'eiffel;c:class;f:feature'

" erlang language
let s:tlist_def_erlang_settings = 'erlang;d:macro;r:record;m:module;f:function'

" expect (same as tcl) language
let s:tlist_def_expect_settings = 'tcl;c:class;f:method;p:procedure'

" flex
let s:tlist_def_flex_settings = 'flex;v:global;c:classes;p:properties;'.
            \ 'm:methods;f:functions;x:mxtags'

" fortran language
let s:tlist_def_fortran_settings = 'fortran;p:program;b:block data;' .
                    \ 'c:common;e:entry;i:interface;k:type;l:label;m:module;' .
                    \ 'n:namelist;t:derived;v:variable;f:function;s:subroutine'

" GO language
let s:tlist_def_go_settings = 'go;f:function;p:package;t:struct'

" HTML language
let s:tlist_def_html_settings = 'html;a:anchor;f:function'

" java language
let s:tlist_def_java_settings = 'java;p:package;c:class;i:interface;' .
                              \ 'g:enum;f:field;m:method'

" javascript language
let s:tlist_def_javascript_settings =
            \ 'javascript;c:class;m:method;v:global;f:function;p:properties'

" lisp language
let s:tlist_def_lisp_settings = 'lisp;f:function'

" lua language
let s:tlist_def_lua_settings = 'lua;f:function'

" makefiles
let s:tlist_def_make_settings = 'make;m:macro'

" Matlab
let s:tlist_def_matlab_settings = 'matlab;f:function'

" Ocamal
let s:tlist_def_ocamal_settings = 'ocamal;M:module;v:global;t:type;'.
            \ 'c:class;f:function;m:method;C:constructor;e:exception'

" pascal language
let s:tlist_def_pascal_settings = 'pascal;f:function;p:procedure'

" perl language
let s:tlist_def_perl_settings = 'perl;c:constant;l:label;p:package;s:subroutine'

" php language
let s:tlist_def_php_settings =
            \ 'php;c:class;i:interface;d:constant;v:variable;f:function'

" python language
let s:tlist_def_python_settings = 'python;c:class;m:member;f:function'

" cython language
let tlist_pyrex_settings='python;c:classe;m:memder;f:function'

" rexx language
let s:tlist_def_rexx_settings = 'rexx;s:subroutine'

" ruby language
let s:tlist_def_ruby_settings = 'ruby;c:class;f:method;F:function;' .
                              \ 'm:singleton method'

" scheme language
let s:tlist_def_scheme_settings = 'scheme;s:set;f:function'

" shell language
let s:tlist_def_sh_settings = 'sh;f:function'

" C shell language
let s:tlist_def_csh_settings = 'sh;f:function'

" Z shell language
let s:tlist_def_zsh_settings = 'sh;f:function'

" slang language
let s:tlist_def_slang_settings = 'slang;n:namespace;f:function'

" sml language
let s:tlist_def_sml_settings = 'sml;e:exception;c:functor;s:signature;' .
            \ 'r:structure;t:type;v:value;c:functor;f:function'

" sql language
let s:tlist_def_sql_settings = 'sql;f:functions;' .
           \ 'P:packages;p:procedures;t:tables;T:triggers;' .
           \ 'v:variables;e:events;U:publications;R:services;' .
           \ 'D:domains;x:MLTableScripts;y:MLConnScripts;z:MLProperties;'.
           \ 'i:indexes;c:cursors;V:views;'.
           \ 'd:prototypes;'.
           \ 'l:local variables;'.
           \ 'F:record fields;'.
           \ 'L:block label;'.
           \ 'r:records;'.
           \ 's:subtypes'

" tcl language
let s:tlist_def_tcl_settings = 'tcl;c:class;f:method;m:method;p:procedure'

" Tex
let s:tlist_def_tex_settings = 'tex;c:chapters;s:sections;u:subsections;'.
            \ 'b:subsubsections;p:parts;P:paragraphs;G:subparagraphs'

" vera language
let s:tlist_def_vera_settings = 'vera;c:class;d:macro;e:enumerator;' .
                                \ 'f:function;g:enum;m:member;p:program;' .
                                \ 'P:prototype;t:task;T:typedef;v:variable;' .
                                \ 'x:externvar'

"verilog language
let s:tlist_def_verilog_settings = 'verilog;m:module;c:constant;P:parameter;' .
            \ 'e:event;r:register;t:task;w:write;p:port;v:variable;f:function'

" VHDL
let s:tlist_def_vhdl_settings = 'vhdl;c:constant;t:type;T:subtype;r:record;e:entity;f:function;p:procedure;P:package'

" vim language
let s:tlist_def_vim_settings =
            \ 'vim;v:variable;a:autocmds;c:commands;m:map;f:function'

" yacc language
let s:tlist_def_yacc_settings = 'yacc;l:label'

"------------------- end of language specific options --------------------

" Vim window size is changed by the taglist plugin or not
let s:tlist_winsize_chgd = -1
" Taglist window is maximized or not
let s:tlist_win_maximized = 0
" Name of files in the taglist
let s:tlist_file_names=''
" Number of files in the taglist
let s:tlist_file_count = 0
" Number of filetypes supported by taglist
let s:tlist_ftype_count = 0
" Is taglist part of other plugins like winmanager or cream?
let s:tlist_app_name = "none"
" Are we displaying brief help text
let s:tlist_brief_help = 1
" List of files removed on user request
let s:tlist_removed_flist = ""
" Index of current file displayed in the taglist window
let s:tlist_cur_file_idx = -1
" Taglist menu is empty or not
let s:tlist_menu_empty = 1

" An autocommand is used to refresh the taglist window when entering any
" buffer. We don't want to refresh the taglist window if we are entering the
" file window from one of the taglist functions. The 'Tlist_Skip_Refresh'
" variable is used to skip the refresh of the taglist window and is set
" and cleared appropriately.
let s:Tlist_Skip_Refresh = 0

" Tlist_Window_Display_Help()
function! s:Tlist_Window_Display_Help()
    if s:tlist_app_name == "winmanager"
        " To handle a bug in the winmanager plugin, add a space at the
        " last line
        call setline('$', ' ')
    endif

    if s:tlist_brief_help
        " Add the brief help
        call append(0, '" Press <F1> to display help text')
    else
        " Add the extensive help
        call append(0, '" <enter> : Jump to tag definition')
        call append(1, '" o : Jump to tag definition in new window')
        call append(2, '" p : Preview the tag definition')
        call append(3, '" <space> : Display tag prototype')
        call append(4, '" u : Update tag list')
        call append(5, '" s : Select sort field')
        call append(6, '" d : Remove file from taglist')
        call append(7, '" x : Zoom-out/Zoom-in taglist window')
        call append(8, '" + : Open a fold')
        call append(9, '" - : Close a fold')
        call append(10, '" * : Open all folds')
        call append(11, '" = : Close all folds')
        call append(12, '" [[ : Move to the start of previous file')
        call append(13, '" ]] : Move to the start of next file')
        call append(14, '" q : Close the taglist window')
        call append(15, '" <F1> : Remove help text')
    endif
endfunction

" Tlist_Window_Toggle_Help_Text()
" Toggle taglist plugin help text between the full version and the brief
" version
function! s:Tlist_Window_Toggle_Help_Text()
    if g:Tlist_Compact_Format
        " In compact display mode, do not display help
        return
    endif

    " Include the empty line displayed after the help text
    let brief_help_size = 1
    let full_help_size = 16

    setlocal modifiable

    " Set report option to a huge value to prevent informational messages
    " while deleting the lines
    let old_report = &report
    set report=99999

    " Remove the currently highlighted tag. Otherwise, the help text
    " might be highlighted by mistake
    match none

    " Toggle between brief and full help text
    if s:tlist_brief_help
        let s:tlist_brief_help = 0

        " Remove the previous help
        exe '1,' . brief_help_size . ' delete _'

        " Adjust the start/end line numbers for the files
        call s:Tlist_Window_Update_Line_Offsets(0, 1, full_help_size - brief_help_size)
    else
        let s:tlist_brief_help = 1

        " Remove the previous help
        exe '1,' . full_help_size . ' delete _'

        " Adjust the start/end line numbers for the files
        call s:Tlist_Window_Update_Line_Offsets(0, 0, full_help_size - brief_help_size)
    endif

    call s:Tlist_Window_Display_Help()

    " Restore the report option
    let &report = old_report

    setlocal nomodifiable
endfunction

" Taglist debug support
let s:tlist_debug = 0

" File for storing the debug messages
let s:tlist_debug_file = ''

" Tlist_Debug_Enable
" Enable logging of taglist debug messages.
function! s:Tlist_Debug_Enable(...)
    let s:tlist_debug = 1

    " Check whether a valid file name is supplied.
    if a:1 != ''
        let s:tlist_debug_file = fnamemodify(a:1, ':p')

        " Empty the log file
        exe 'redir! > ' . s:tlist_debug_file
        redir END

        " Check whether the log file is present/created
        if !filewritable(s:tlist_debug_file)
            call s:Tlist_Warning_Msg('Taglist: Unable to create log file '
                        \ . s:tlist_debug_file)
            let s:tlist_debug_file = ''
        endif
    endif
endfunction

" Tlist_Debug_Disable
" Disable logging of taglist debug messages.
function! s:Tlist_Debug_Disable(...)
    let s:tlist_debug = 0
    let s:tlist_debug_file = ''
endfunction

" Tlist_Debug_Show
" Display the taglist debug messages in a new window
function! s:Tlist_Debug_Show()
    if s:tlist_msg == ''
        call s:Tlist_Warning_Msg('Taglist: No debug messages')
        return
    endif

    " Open a new window to display the taglist debug messages
    new taglist_debug.txt
    " Delete all the lines (if the buffer already exists)
    silent! %delete _
    " Add the messages
    silent! put =s:tlist_msg
    " Move the cursor to the first line
    normal! gg
endfunction

" Tlist_Log_Msg
" Log the supplied debug message along with the time
function! s:Tlist_Log_Msg(msg)
    if s:tlist_debug
        if s:tlist_debug_file != ''
            exe 'redir >> ' . s:tlist_debug_file
            silent echon strftime('%H:%M:%S') . ': ' . a:msg . "\n"
            redir END
        else
            " Log the message into a variable
            " Retain only the last 3000 characters
            let len = strlen(s:tlist_msg)
            if len > 3000
                let s:tlist_msg = strpart(s:tlist_msg, len - 3000)
            endif
            let s:tlist_msg = s:tlist_msg . strftime('%H:%M:%S') . ': ' . 
                        \ a:msg . "\n"
        endif
    endif
endfunction

" Tlist_Warning_Msg()
" Display a message using WarningMsg highlight group
function! s:Tlist_Warning_Msg(msg)
    echohl WarningMsg
    echomsg a:msg
    echohl None
endfunction

" Last returned file index for file name lookup.
" Used to speed up file lookup
let s:tlist_file_name_idx_cache = -1

" Tlist_Get_File_Index()
" Return the index of the specified filename
function! s:Tlist_Get_File_Index(fname)
    if s:tlist_file_count == 0 || a:fname == ''
        return -1
    endif

    " If the new filename is same as the last accessed filename, then
    " return that index
    if s:tlist_file_name_idx_cache != -1 &&
                \ s:tlist_file_name_idx_cache < s:tlist_file_count
        if s:tlist_{s:tlist_file_name_idx_cache}_filename == a:fname
            " Same as the last accessed file
            return s:tlist_file_name_idx_cache
        endif
    endif

    " First, check whether the filename is present
    let s_fname = a:fname . "\n"
    let i = stridx(s:tlist_file_names, s_fname)
    if i == -1
        let s:tlist_file_name_idx_cache = -1
        return -1
    endif

    " Second, compute the file name index
    let nl_txt = substitute(strpart(s:tlist_file_names, 0, i), "[^\n]", '', 'g')
    let s:tlist_file_name_idx_cache = strlen(nl_txt)
    return s:tlist_file_name_idx_cache
endfunction

" Last returned file index for line number lookup.
" Used to speed up file lookup
let s:tlist_file_lnum_idx_cache = -1

" Tlist_Window_Get_File_Index_By_Linenum()
" Return the index of the filename present in the specified line number
" Line number refers to the line number in the taglist window
function! s:Tlist_Window_Get_File_Index_By_Linenum(lnum)
    call s:Tlist_Log_Msg('Tlist_Window_Get_File_Index_By_Linenum (' . a:lnum . ')')

    " First try to see whether the new line number is within the range
    " of the last returned file
    if s:tlist_file_lnum_idx_cache != -1 &&
                \ s:tlist_file_lnum_idx_cache < s:tlist_file_count
        if a:lnum >= s:tlist_{s:tlist_file_lnum_idx_cache}_start &&
                    \ a:lnum <= s:tlist_{s:tlist_file_lnum_idx_cache}_end
            return s:tlist_file_lnum_idx_cache
        endif
    endif

    let fidx = -1

    if g:Tlist_Show_One_File
        " Displaying only one file in the taglist window. Check whether
        " the line is within the tags displayed for that file
        if s:tlist_cur_file_idx != -1
            if a:lnum >= s:tlist_{s:tlist_cur_file_idx}_start
                        \ && a:lnum <= s:tlist_{s:tlist_cur_file_idx}_end
                let fidx = s:tlist_cur_file_idx
            endif

        endif
    else
        " Do a binary search in the taglist
        let left = 0
        let right = s:tlist_file_count - 1

        while left < right
            let mid = (left + right) / 2

            if a:lnum >= s:tlist_{mid}_start && a:lnum <= s:tlist_{mid}_end
                let s:tlist_file_lnum_idx_cache = mid
                return mid
            endif

            if a:lnum < s:tlist_{mid}_start
                let right = mid - 1
            else
                let left = mid + 1
            endif
        endwhile

        if left >= 0 && left < s:tlist_file_count
                    \ && a:lnum >= s:tlist_{left}_start
                    \ && a:lnum <= s:tlist_{left}_end
            let fidx = left
        endif
    endif

    let s:tlist_file_lnum_idx_cache = fidx

    return fidx
endfunction

" Tlist_Exe_Cmd_No_Acmds
" Execute the specified Ex command after disabling autocommands
function! s:Tlist_Exe_Cmd_No_Acmds(cmd)
    let old_eventignore = &eventignore
    set eventignore=all
    exe a:cmd
    let &eventignore = old_eventignore
endfunction

" Tlist_Skip_File()
" Check whether tag listing is supported for the specified file
function! s:Tlist_Skip_File(filename, ftype)
    " Skip buffers with no names and buffers with filetype not set
    if a:filename == '' || a:ftype == ''
        return 1
    endif

    " Skip files which are not supported by exuberant ctags
    " First check whether default settings for this filetype are available.
    " If it is not available, then check whether user specified settings are
    " available. If both are not available, then don't list the tags for this
    " filetype
    let var = 's:tlist_def_' . a:ftype . '_settings'
    if !exists(var)
        let var = 'g:tlist_' . a:ftype . '_settings'
        if !exists(var)
            return 1
        endif
    endif

    " Skip files which are not readable or files which are not yet stored
    " to the disk
    if !filereadable(a:filename)
        return 1
    endif

    return 0
endfunction

" Tlist_User_Removed_File
" Returns 1 if a file is removed by a user from the taglist
function! s:Tlist_User_Removed_File(filename)
    return stridx(s:tlist_removed_flist, a:filename . "\n") != -1
endfunction

" Tlist_Update_Remove_List
" Update the list of user removed files from the taglist
" add == 1, add the file to the removed list
" add == 0, delete the file from the removed list
function! s:Tlist_Update_Remove_List(filename, add)
    if a:add
        let s:tlist_removed_flist = s:tlist_removed_flist . a:filename . "\n"
    else
        let idx = stridx(s:tlist_removed_flist, a:filename . "\n")
        let text_before = strpart(s:tlist_removed_flist, 0, idx)
        let rem_text = strpart(s:tlist_removed_flist, idx)
        let next_idx = stridx(rem_text, "\n")
        let text_after = strpart(rem_text, next_idx + 1)

        let s:tlist_removed_flist = text_before . text_after
    endif
endfunction

" Tlist_FileType_Init
" Initialize the ctags arguments and tag variable for the specified
" file type
function! s:Tlist_FileType_Init(ftype)
    call s:Tlist_Log_Msg('Tlist_FileType_Init (' . a:ftype . ')')
    " If the user didn't specify any settings, then use the default
    " ctags args. Otherwise, use the settings specified by the user
    let var = 'g:tlist_' . a:ftype . '_settings'
    if exists(var)
        " User specified ctags arguments
        let settings = {var} . ';'
    else
        " Default ctags arguments
        let var = 's:tlist_def_' . a:ftype . '_settings'
        if !exists(var)
            " No default settings for this file type. This filetype is
            " not supported
            return 0
        endif
        let settings = s:tlist_def_{a:ftype}_settings . ';'
    endif

    let msg = 'Taglist: Invalid ctags option setting - ' . settings

    " Format of the option that specifies the filetype and ctags arugments:
    "
    "       <language_name>;flag1:name1;flag2:name2;flag3:name3
    "

    " Extract the file type to pass to ctags. This may be different from the
    " file type detected by Vim
    let pos = stridx(settings, ';')
    if pos == -1
        call s:Tlist_Warning_Msg(msg)
        return 0
    endif
    let ctags_ftype = strpart(settings, 0, pos)
    if ctags_ftype == ''
        call s:Tlist_Warning_Msg(msg)
        return 0
    endif
    " Make sure a valid filetype is supplied. If the user didn't specify a
    " valid filetype, then the ctags option settings may be treated as the
    " filetype
    if ctags_ftype =~ ':'
        call s:Tlist_Warning_Msg(msg)
        return 0
    endif

    " Remove the file type from settings
    let settings = strpart(settings, pos + 1)
    if settings == ''
        call s:Tlist_Warning_Msg(msg)
        return 0
    endif

    " Process all the specified ctags flags. The format is
    " flag1:name1;flag2:name2;flag3:name3
    let ctags_flags = ''
    let cnt = 0
    while settings != ''
        " Extract the flag
        let pos = stridx(settings, ':')
        if pos == -1
            call s:Tlist_Warning_Msg(msg)
            return 0
        endif
        let flag = strpart(settings, 0, pos)
        if flag == ''
            call s:Tlist_Warning_Msg(msg)
            return 0
        endif
        " Remove the flag from settings
        let settings = strpart(settings, pos + 1)

        " Extract the tag type name
        let pos = stridx(settings, ';')
        if pos == -1
            call s:Tlist_Warning_Msg(msg)
            return 0
        endif
        let name = strpart(settings, 0, pos)
        if name == ''
            call s:Tlist_Warning_Msg(msg)
            return 0
        endif
        let settings = strpart(settings, pos + 1)

        let cnt = cnt + 1

        let s:tlist_{a:ftype}_{cnt}_name = flag
        let s:tlist_{a:ftype}_{cnt}_fullname = name
        let ctags_flags = ctags_flags . flag
    endwhile

    let s:tlist_{a:ftype}_ctags_args = '--language-force=' . ctags_ftype .
                            \ ' --' . ctags_ftype . '-types=' . ctags_flags
    let s:tlist_{a:ftype}_count = cnt
    let s:tlist_{a:ftype}_ctags_flags = ctags_flags

    " Save the filetype name
    let s:tlist_ftype_{s:tlist_ftype_count}_name = a:ftype
    let s:tlist_ftype_count = s:tlist_ftype_count + 1

    return 1
endfunction

" Tlist_Detect_Filetype
" Determine the filetype for the specified file using the filetypedetect
" autocmd.
function! s:Tlist_Detect_Filetype(fname)
    " Ignore the filetype autocommands
    let old_eventignore = &eventignore
    set eventignore=FileType

    " Save the 'filetype', as this will be changed temporarily
    let old_filetype = &filetype

    " Run the filetypedetect group of autocommands to determine
    " the filetype
    exe 'doautocmd filetypedetect BufRead ' . a:fname

    " Save the detected filetype
    let ftype = &filetype

    " Restore the previous state
    let &filetype = old_filetype
    let &eventignore = old_eventignore

    return ftype
endfunction

" Tlist_Get_Buffer_Filetype
" Get the filetype for the specified buffer
function! s:Tlist_Get_Buffer_Filetype(bnum)
    let buf_ft = getbufvar(a:bnum, '&filetype')

    " Check whether 'filetype' contains multiple file types separated by '.'
    " If it is, then use the first file type
    if buf_ft =~ '\.'
        let buf_ft = matchstr(buf_ft, '[^.]\+')
    endif

    if bufloaded(a:bnum)
        " For loaded buffers, the 'filetype' is already determined
        return buf_ft
    endif

    " For unloaded buffers, if the 'filetype' option is set, return it
    if buf_ft != ''
        return buf_ft
    endif

    " Skip non-existent buffers
    if !bufexists(a:bnum)
        return ''
    endif

    " For buffers whose filetype is not yet determined, try to determine
    " the filetype
    let bname = bufname(a:bnum)

    return s:Tlist_Detect_Filetype(bname)
endfunction

" Tlist_Discard_TagInfo
" Discard the stored tag information for a file
function! s:Tlist_Discard_TagInfo(fidx)
    call s:Tlist_Log_Msg('Tlist_Discard_TagInfo (' .
                \ s:tlist_{a:fidx}_filename . ')')
    let ftype = s:tlist_{a:fidx}_filetype

    " Discard information about the tags defined in the file
    let i = 1
    while i <= s:tlist_{a:fidx}_tag_count
        let fidx_i = 's:tlist_' . a:fidx . '_' . i
        unlet! {fidx_i}_tag
        unlet! {fidx_i}_tag_name
        unlet! {fidx_i}_tag_type
        unlet! {fidx_i}_ttype_idx
        unlet! {fidx_i}_tag_proto
        unlet! {fidx_i}_tag_scope
        unlet! {fidx_i}_tag_searchpat
        unlet! {fidx_i}_tag_linenum
        let i = i + 1
    endwhile

    let s:tlist_{a:fidx}_tag_count = 0

    " Discard information about tag type groups
    let i = 1
    while i <= s:tlist_{ftype}_count
        let ttype = s:tlist_{ftype}_{i}_name
        if s:tlist_{a:fidx}_{ttype} != ''
            let fidx_ttype = 's:tlist_' . a:fidx . '_' . ttype
            let {fidx_ttype} = ''
            let {fidx_ttype}_offset = 0
            let cnt = {fidx_ttype}_count
            let {fidx_ttype}_count = 0
            let j = 1
            while j <= cnt
                unlet! {fidx_ttype}_{j}
                let j = j + 1
            endwhile
        endif
        let i = i + 1
    endwhile

    " Discard the stored menu command also
    let s:tlist_{a:fidx}_menu_cmd = ''
endfunction

" Tlist_Window_Update_Line_Offsets
" Update the line offsets for tags for files starting from start_idx
" and displayed in the taglist window by the specified offset
function! s:Tlist_Window_Update_Line_Offsets(start_idx, increment, offset)
    let i = a:start_idx

    while i < s:tlist_file_count
        if s:tlist_{i}_visible
            " Update the start/end line number only if the file is visible
            if a:increment
                let s:tlist_{i}_start = s:tlist_{i}_start + a:offset
                let s:tlist_{i}_end = s:tlist_{i}_end + a:offset
            else
                let s:tlist_{i}_start = s:tlist_{i}_start - a:offset
                let s:tlist_{i}_end = s:tlist_{i}_end - a:offset
            endif
        endif
        let i = i + 1
    endwhile
endfunction

" Tlist_Discard_FileInfo
" Discard the stored information for a file
function! s:Tlist_Discard_FileInfo(fidx)
    call s:Tlist_Log_Msg('Tlist_Discard_FileInfo (' .
                \ s:tlist_{a:fidx}_filename . ')')
    call s:Tlist_Discard_TagInfo(a:fidx)

    let ftype = s:tlist_{a:fidx}_filetype

    let i = 1
    while i <= s:tlist_{ftype}_count
        let ttype = s:tlist_{ftype}_{i}_name
        unlet! s:tlist_{a:fidx}_{ttype}
        unlet! s:tlist_{a:fidx}_{ttype}_offset
        unlet! s:tlist_{a:fidx}_{ttype}_count
        let i = i + 1
    endwhile

    unlet! s:tlist_{a:fidx}_filename
    unlet! s:tlist_{a:fidx}_sort_type
    unlet! s:tlist_{a:fidx}_filetype
    unlet! s:tlist_{a:fidx}_mtime
    unlet! s:tlist_{a:fidx}_start
    unlet! s:tlist_{a:fidx}_end
    unlet! s:tlist_{a:fidx}_valid
    unlet! s:tlist_{a:fidx}_visible
    unlet! s:tlist_{a:fidx}_tag_count
    unlet! s:tlist_{a:fidx}_menu_cmd
endfunction

" Tlist_Window_Remove_File_From_Display
" Remove the specified file from display
function! s:Tlist_Window_Remove_File_From_Display(fidx)
    call s:Tlist_Log_Msg('Tlist_Window_Remove_File_From_Display (' .
                \ s:tlist_{a:fidx}_filename . ')')
    " If the file is not visible then no need to remove it
    if !s:tlist_{a:fidx}_visible
        return
    endif

    " Remove the tags displayed for the specified file from the window
    let start = s:tlist_{a:fidx}_start
    " Include the empty line after the last line also
    if g:Tlist_Compact_Format
        let end = s:tlist_{a:fidx}_end
    else
        let end = s:tlist_{a:fidx}_end + 1
    endif

    setlocal modifiable
    exe 'silent! ' . start . ',' . end . 'delete _'
    setlocal nomodifiable

    " Correct the start and end line offsets for all the files following
    " this file, as the tags for this file are removed
    call s:Tlist_Window_Update_Line_Offsets(a:fidx + 1, 0, end - start + 1)
endfunction

" Tlist_Remove_File
" Remove the file under the cursor or the specified file index
" user_request - User requested to remove the file from taglist
function! s:Tlist_Remove_File(file_idx, user_request)
    let fidx = a:file_idx

    if fidx == -1
        let fidx = s:Tlist_Window_Get_File_Index_By_Linenum(line('.'))
        if fidx == -1
            return
        endif
    endif
    call s:Tlist_Log_Msg('Tlist_Remove_File (' .
                \ s:tlist_{fidx}_filename . ', ' . a:user_request . ')')

    let save_winnr = winnr()
    let winnum = bufwinnr(g:TagList_title)
    if winnum != -1
        " Taglist window is open, remove the file from display

        if save_winnr != winnum
            let old_eventignore = &eventignore
            set eventignore=all
            exe winnum . 'wincmd w'
        endif

        call s:Tlist_Window_Remove_File_From_Display(fidx)

        if save_winnr != winnum
            exe save_winnr . 'wincmd w'
            let &eventignore = old_eventignore
        endif
    endif

    let fname = s:tlist_{fidx}_filename

    if a:user_request
        " As the user requested to remove the file from taglist,
        " add it to the removed list
        call s:Tlist_Update_Remove_List(fname, 1)
    endif

    " Remove the file name from the taglist list of filenames
    let idx = stridx(s:tlist_file_names, fname . "\n")
    let text_before = strpart(s:tlist_file_names, 0, idx)
    let rem_text = strpart(s:tlist_file_names, idx)
    let next_idx = stridx(rem_text, "\n")
    let text_after = strpart(rem_text, next_idx + 1)
    let s:tlist_file_names = text_before . text_after

    call s:Tlist_Discard_FileInfo(fidx)

    " Shift all the file variables by one index
    let i = fidx + 1

    while i < s:tlist_file_count
        let j = i - 1

        let s:tlist_{j}_filename = s:tlist_{i}_filename
        let s:tlist_{j}_sort_type = s:tlist_{i}_sort_type
        let s:tlist_{j}_filetype = s:tlist_{i}_filetype
        let s:tlist_{j}_mtime = s:tlist_{i}_mtime
        let s:tlist_{j}_start = s:tlist_{i}_start
        let s:tlist_{j}_end = s:tlist_{i}_end
        let s:tlist_{j}_valid = s:tlist_{i}_valid
        let s:tlist_{j}_visible = s:tlist_{i}_visible
        let s:tlist_{j}_tag_count = s:tlist_{i}_tag_count
        let s:tlist_{j}_menu_cmd = s:tlist_{i}_menu_cmd

        let k = 1
        while k <= s:tlist_{j}_tag_count
            let s:tlist_{j}_{k}_tag = s:tlist_{i}_{k}_tag
            let s:tlist_{j}_{k}_tag_name = s:tlist_{i}_{k}_tag_name
            let s:tlist_{j}_{k}_tag_type = s:Tlist_Get_Tag_Type_By_Tag(i, k)
            let s:tlist_{j}_{k}_ttype_idx = s:tlist_{i}_{k}_ttype_idx
            let s:tlist_{j}_{k}_tag_proto = s:Tlist_Get_Tag_Prototype(i, k)
            let s:tlist_{j}_{k}_tag_scope = s:Tlist_Get_Tag_Scope(i, k)
            let s:tlist_{j}_{k}_tag_searchpat = s:Tlist_Get_Tag_SearchPat(i, k)
            let s:tlist_{j}_{k}_tag_linenum = s:Tlist_Get_Tag_Linenum(i, k)
            let k = k + 1
        endwhile

        let ftype = s:tlist_{i}_filetype

        let k = 1
        while k <= s:tlist_{ftype}_count
            let ttype = s:tlist_{ftype}_{k}_name
            let s:tlist_{j}_{ttype} = s:tlist_{i}_{ttype}
            let s:tlist_{j}_{ttype}_offset = s:tlist_{i}_{ttype}_offset
            let s:tlist_{j}_{ttype}_count = s:tlist_{i}_{ttype}_count
            if s:tlist_{j}_{ttype} != ''
                let l = 1
                while l <= s:tlist_{j}_{ttype}_count
                    let s:tlist_{j}_{ttype}_{l} = s:tlist_{i}_{ttype}_{l}
                    let l = l + 1
                endwhile
            endif
            let k = k + 1
        endwhile

        " As the file and tag information is copied to the new index,
        " discard the previous information
        call s:Tlist_Discard_FileInfo(i)

        let i = i + 1
    endwhile

    " Reduce the number of files displayed
    let s:tlist_file_count = s:tlist_file_count - 1

    if g:Tlist_Show_One_File
        " If the tags for only one file is displayed and if we just
        " now removed that file, then invalidate the current file idx
        if s:tlist_cur_file_idx == fidx
            let s:tlist_cur_file_idx = -1
        endif
    endif
endfunction

" Tlist_Window_Goto_Window
" Goto the taglist window
function! s:Tlist_Window_Goto_Window()
    let winnum = bufwinnr(g:TagList_title)
    if winnum != -1
        if winnr() != winnum
            call s:Tlist_Exe_Cmd_No_Acmds(winnum . 'wincmd w')
        endif
    endif
endfunction

" Tlist_Window_Create
" Create a new taglist window. If it is already open, jump to it
function! s:Tlist_Window_Create()
    call s:Tlist_Log_Msg('Tlist_Window_Create()')
    " If the window is open, jump to it
    let winnum = bufwinnr(g:TagList_title)
    if winnum != -1
        " Jump to the existing window
        if winnr() != winnum
            exe winnum . 'wincmd w'
        endif
        return
    endif

    " If used with winmanager don't open windows. Winmanager will handle
    " the window/buffer management
    if s:tlist_app_name == "winmanager"
        return
    endif

    " Create a new window. If user prefers a horizontal window, then open
    " a horizontally split window. Otherwise open a vertically split
    " window
    if g:Tlist_Use_Horiz_Window
        " Open a horizontally split window
        let win_dir = 'botright'
        " Horizontal window height
        let win_size = g:Tlist_WinHeight
    else
        if s:tlist_winsize_chgd == -1
            " Open a vertically split window. Increase the window size, if
            " needed, to accomodate the new window
            if g:Tlist_Inc_Winwidth &&
                        \ &columns < (80 + g:Tlist_WinWidth)
                " Save the original window position
                let s:tlist_pre_winx = getwinposx()
                let s:tlist_pre_winy = getwinposy()

                " one extra column is needed to include the vertical split
                let &columns= &columns + g:Tlist_WinWidth + 1

                let s:tlist_winsize_chgd = 1
            else
                let s:tlist_winsize_chgd = 0
            endif
        endif

        if g:Tlist_Use_Right_Window
            " Open the window at the rightmost place
            let win_dir = 'botright vertical'
        else
            " Open the window at the leftmost place
            let win_dir = 'topleft vertical'
        endif
        let win_size = g:Tlist_WinWidth
    endif

    " If the tag listing temporary buffer already exists, then reuse it.
    " Otherwise create a new buffer
    let bufnum = bufnr(g:TagList_title)
    if bufnum == -1
        " Create a new buffer
        let wcmd = g:TagList_title
    else
        " Edit the existing buffer
        let wcmd = '+buffer' . bufnum
    endif

    " Create the taglist window
    " Preserve the alternate file
    let cmd_mod = (v:version >= 700) ? 'keepalt ' : ''
    exe 'silent! ' . cmd_mod . win_dir . ' ' . win_size . 'split ' . wcmd

    " Save the new window position
    let s:tlist_winx = getwinposx()
    let s:tlist_winy = getwinposy()

    " Initialize the taglist window
    call s:Tlist_Window_Init()
endfunction

" Tlist_Window_Zoom
" Zoom (maximize/minimize) the taglist window
function! s:Tlist_Window_Zoom()
    if s:tlist_win_maximized
        " Restore the window back to the previous size
        if g:Tlist_Use_Horiz_Window
            exe 'resize ' . g:Tlist_WinHeight
        else
            exe 'vert resize ' . g:Tlist_WinWidth
        endif
        let s:tlist_win_maximized = 0
    else
        " Set the window size to the maximum possible without closing other
        " windows
        if g:Tlist_Use_Horiz_Window
            resize
        else
            vert resize
        endif
        let s:tlist_win_maximized = 1
    endif
endfunction

" Tlist_Ballon_Expr
" When the mouse cursor is over a tag in the taglist window, display the
" tag prototype (balloon)
function! Tlist_Ballon_Expr()
    " Get the file index
    let fidx = s:Tlist_Window_Get_File_Index_By_Linenum(v:beval_lnum)
    if fidx == -1
        return ''
    endif

    " Get the tag output line for the current tag
    let tidx = s:Tlist_Window_Get_Tag_Index(fidx, v:beval_lnum)
    if tidx == 0
        return ''
    endif

    " Get the tag search pattern and display it
    return s:Tlist_Get_Tag_Prototype(fidx, tidx)
endfunction

" Tlist_Window_Check_Width
" Check the width of the taglist window. For horizontally split windows, the
" 'winfixheight' option is used to fix the height of the window. For
" vertically split windows, Vim doesn't support the 'winfixwidth' option. So
" need to handle window width changes from this function.
function! s:Tlist_Window_Check_Width()
    let tlist_winnr = bufwinnr(g:TagList_title)
    if tlist_winnr == -1
        return
    endif

    let width = winwidth(tlist_winnr)
    if width != g:Tlist_WinWidth
        call s:Tlist_Log_Msg("Tlist_Window_Check_Width: Changing window " .
                    \ "width from " . width . " to " . g:Tlist_WinWidth)
        let save_winnr = winnr()
        if save_winnr != tlist_winnr
            call s:Tlist_Exe_Cmd_No_Acmds(tlist_winnr . 'wincmd w')
        endif
        exe 'vert resize ' . g:Tlist_WinWidth
        if save_winnr != tlist_winnr
            call s:Tlist_Exe_Cmd_No_Acmds('wincmd p')
        endif
    endif
endfunction

" Tlist_Window_Exit_Only_Window
" If the 'Tlist_Exit_OnlyWindow' option is set, then exit Vim if only the
" taglist window is present.
function! s:Tlist_Window_Exit_Only_Window()
    " Before quitting Vim, delete the taglist buffer so that
    " the '0 mark is correctly set to the previous buffer.
    if v:version < 700
	if winbufnr(2) == -1
            bdelete
	    quit
	endif
    else
	if winbufnr(2) == -1
	    if tabpagenr('$') == 1
		" Only one tag page is present
                "
                " When deleting the taglist buffer, autocommands cannot be
                " disabled. If autocommands are disabled, then on exiting Vim,
                " the window size will not be restored back to the original
                " size.
                bdelete
		quit
	    else
		" More than one tab page is present. Close only the current
		" tab page
                close
	    endif
	endif
    endif
endfunction

" Tlist_Window_Init
" Set the default options for the taglist window
function! s:Tlist_Window_Init()
    call s:Tlist_Log_Msg('Tlist_Window_Init()')

    " The 'readonly' option should not be set for the taglist buffer.
    " If Vim is started as "view/gview" or if the ":view" command is
    " used, then the 'readonly' option is set for all the buffers.
    " Unset it for the taglist buffer
    setlocal noreadonly

    " Set the taglist buffer filetype to taglist
    setlocal filetype=taglist

    " Define taglist window element highlighting
    syntax match TagListComment '^" .*'
    syntax match TagListFileName '^[^" ].*$'
    syntax match TagListTitle '^  \S.*$'
    syntax match TagListTagScope  '\s\[.\{-\}\]$'

    " Define the highlighting only if colors are supported
    if has('gui_running') || &t_Co > 2
        " Colors to highlight various taglist window elements
        " If user defined highlighting group exists, then use them.
        " Otherwise, use default highlight groups.
        if hlexists('MyTagListTagName')
            highlight link TagListTagName MyTagListTagName
        else
            highlight default link TagListTagName Search
        endif
        " Colors to highlight comments and titles
        if hlexists('MyTagListComment')
            highlight link TagListComment MyTagListComment
        else
            highlight clear TagListComment
            highlight default link TagListComment Comment
        endif
        if hlexists('MyTagListTitle')
            highlight link TagListTitle MyTagListTitle
        else
            highlight clear TagListTitle
            highlight default link TagListTitle Title
        endif
        if hlexists('MyTagListFileName')
            highlight link TagListFileName MyTagListFileName
        else
            highlight clear TagListFileName
            highlight default TagListFileName guibg=Grey ctermbg=darkgray
                        \ guifg=white ctermfg=white
        endif
        if hlexists('MyTagListTagScope')
            highlight link TagListTagScope MyTagListTagScope
        else
            highlight clear TagListTagScope
            highlight default link TagListTagScope Identifier
        endif
    else
        highlight default TagListTagName term=reverse cterm=reverse
    endif

    " Folding related settings
    setlocal foldenable
    setlocal foldminlines=0
    setlocal foldmethod=manual
    setlocal foldlevel=9999
    if g:Tlist_Enable_Fold_Column
        setlocal foldcolumn=3
    else
        setlocal foldcolumn=0
    endif
    setlocal foldtext=v:folddashes.getline(v:foldstart)

    if s:tlist_app_name != "winmanager"
        " Mark buffer as scratch
        silent! setlocal buftype=nofile
        if s:tlist_app_name == "none"
            silent! setlocal bufhidden=delete
        endif
        silent! setlocal noswapfile
        " Due to a bug in Vim 6.0, the winbufnr() function fails for unlisted
        " buffers. So if the taglist buffer is unlisted, multiple taglist
        " windows will be opened. This bug is fixed in Vim 6.1 and above
        if v:version >= 601
            silent! setlocal nobuflisted
        endif
    endif

    silent! setlocal nowrap

    " If the 'number' option is set in the source window, it will affect the
    " taglist window. So forcefully disable 'number' option for the taglist
    " window
    silent! setlocal nonumber
    if exists('&relativenumber')
        silent! setlocal norelativenumber
    endif

    " Use fixed height when horizontally split window is used
    if g:Tlist_Use_Horiz_Window
        if v:version >= 602
            set winfixheight
        endif
    endif
    if !g:Tlist_Use_Horiz_Window && v:version >= 700
        set winfixwidth
    endif

    " Setup balloon evaluation to display tag prototype
    if v:version >= 700 && has('balloon_eval')
        setlocal balloonexpr=Tlist_Ballon_Expr()
        set ballooneval
    endif

    " Setup the cpoptions properly for the maps to work
    let old_cpoptions = &cpoptions
    set cpoptions&vim

    " Create buffer local mappings for jumping to the tags and sorting the list
    nnoremap <buffer> <silent> <CR>
                \ :call <SID>Tlist_Window_Jump_To_Tag('useopen')<CR>
    nnoremap <buffer> <silent> o
                \ :call <SID>Tlist_Window_Jump_To_Tag('newwin')<CR>
    nnoremap <buffer> <silent> p
                \ :call <SID>Tlist_Window_Jump_To_Tag('preview')<CR>
    nnoremap <buffer> <silent> P
                \ :call <SID>Tlist_Window_Jump_To_Tag('prevwin')<CR>
    if v:version >= 700
    nnoremap <buffer> <silent> t
                \ :call <SID>Tlist_Window_Jump_To_Tag('checktab')<CR>
    nnoremap <buffer> <silent> <C-t>
                \ :call <SID>Tlist_Window_Jump_To_Tag('newtab')<CR>
    endif
    nnoremap <buffer> <silent> <2-LeftMouse>
                \ :call <SID>Tlist_Window_Jump_To_Tag('useopen')<CR>
    nnoremap <buffer> <silent> s
                \ :call <SID>Tlist_Change_Sort('cmd', 'toggle', '')<CR>
    nnoremap <buffer> <silent> + :silent! foldopen<CR>
    nnoremap <buffer> <silent> - :silent! foldclose<CR>
    nnoremap <buffer> <silent> * :silent! %foldopen!<CR>
    nnoremap <buffer> <silent> = :silent! %foldclose<CR>
    nnoremap <buffer> <silent> <kPlus> :silent! foldopen<CR>
    nnoremap <buffer> <silent> <kMinus> :silent! foldclose<CR>
    nnoremap <buffer> <silent> <kMultiply> :silent! %foldopen!<CR>
    nnoremap <buffer> <silent> <Space> :call <SID>Tlist_Window_Show_Info()<CR>
    nnoremap <buffer> <silent> u :call <SID>Tlist_Window_Update_File()<CR>
    nnoremap <buffer> <silent> d :call <SID>Tlist_Remove_File(-1, 1)<CR>
    nnoremap <buffer> <silent> x :call <SID>Tlist_Window_Zoom()<CR>
    nnoremap <buffer> <silent> [[ :call <SID>Tlist_Window_Move_To_File(-1)<CR>
    nnoremap <buffer> <silent> <BS> :call <SID>Tlist_Window_Move_To_File(-1)<CR>
    nnoremap <buffer> <silent> ]] :call <SID>Tlist_Window_Move_To_File(1)<CR>
    nnoremap <buffer> <silent> <Tab> :call <SID>Tlist_Window_Move_To_File(1)<CR>
    nnoremap <buffer> <silent> <F1> :call <SID>Tlist_Window_Toggle_Help_Text()<CR>
    nnoremap <buffer> <silent> q :close<CR>

    " Insert mode mappings
    inoremap <buffer> <silent> <CR>
                \ <C-o>:call <SID>Tlist_Window_Jump_To_Tag('useopen')<CR>
    " Windows needs return
    inoremap <buffer> <silent> <Return>
                \ <C-o>:call <SID>Tlist_Window_Jump_To_Tag('useopen')<CR>
    inoremap <buffer> <silent> o
                \ <C-o>:call <SID>Tlist_Window_Jump_To_Tag('newwin')<CR>
    inoremap <buffer> <silent> p
                \ <C-o>:call <SID>Tlist_Window_Jump_To_Tag('preview')<CR>
    inoremap <buffer> <silent> P
                \ <C-o>:call <SID>Tlist_Window_Jump_To_Tag('prevwin')<CR>
    if v:version >= 700
    inoremap <buffer> <silent> t
                \ <C-o>:call <SID>Tlist_Window_Jump_To_Tag('checktab')<CR>
    inoremap <buffer> <silent> <C-t>
                \ <C-o>:call <SID>Tlist_Window_Jump_To_Tag('newtab')<CR>
    endif
    inoremap <buffer> <silent> <2-LeftMouse>
                \ <C-o>:call <SID>Tlist_Window_Jump_To_Tag('useopen')<CR>
    inoremap <buffer> <silent> s
                \ <C-o>:call <SID>Tlist_Change_Sort('cmd', 'toggle', '')<CR>
    inoremap <buffer> <silent> +             <C-o>:silent! foldopen<CR>
    inoremap <buffer> <silent> -             <C-o>:silent! foldclose<CR>
    inoremap <buffer> <silent> *             <C-o>:silent! %foldopen!<CR>
    inoremap <buffer> <silent> =             <C-o>:silent! %foldclose<CR>
    inoremap <buffer> <silent> <kPlus>       <C-o>:silent! foldopen<CR>
    inoremap <buffer> <silent> <kMinus>      <C-o>:silent! foldclose<CR>
    inoremap <buffer> <silent> <kMultiply>   <C-o>:silent! %foldopen!<CR>
    inoremap <buffer> <silent> <Space>       <C-o>:call
                                    \ <SID>Tlist_Window_Show_Info()<CR>
    inoremap <buffer> <silent> u
                            \ <C-o>:call <SID>Tlist_Window_Update_File()<CR>
    inoremap <buffer> <silent> d    <C-o>:call <SID>Tlist_Remove_File(-1, 1)<CR>
    inoremap <buffer> <silent> x    <C-o>:call <SID>Tlist_Window_Zoom()<CR>
    inoremap <buffer> <silent> [[   <C-o>:call <SID>Tlist_Window_Move_To_File(-1)<CR>
    inoremap <buffer> <silent> <BS> <C-o>:call <SID>Tlist_Window_Move_To_File(-1)<CR>
    inoremap <buffer> <silent> ]]   <C-o>:call <SID>Tlist_Window_Move_To_File(1)<CR>
    inoremap <buffer> <silent> <Tab> <C-o>:call <SID>Tlist_Window_Move_To_File(1)<CR>
    inoremap <buffer> <silent> <F1>  <C-o>:call <SID>Tlist_Window_Toggle_Help_Text()<CR>
    inoremap <buffer> <silent> q    <C-o>:close<CR>

    " Map single left mouse click if the user wants this functionality
    if g:Tlist_Use_SingleClick == 1
        " Contributed by Bindu Wavell
        " attempt to perform single click mapping, it would be much
        " nicer if we could nnoremap <buffer> ... however vim does
        " not fire the <buffer> <leftmouse> when you use the mouse
        " to enter a buffer.
        let clickmap = ':if bufname("%") =~ "__Tag_List__" <bar> ' .
                    \ 'call <SID>Tlist_Window_Jump_To_Tag("useopen") ' .
                    \ '<bar> endif <CR>'
        if maparg('<leftmouse>', 'n') == ''
            " no mapping for leftmouse
            exe ':nnoremap <silent> <leftmouse> <leftmouse>' . clickmap
        else
            " we have a mapping
            let mapcmd = ':nnoremap <silent> <leftmouse> <leftmouse>'
            let mapcmd = mapcmd . substitute(substitute(
                        \ maparg('<leftmouse>', 'n'), '|', '<bar>', 'g'),
                        \ '\c^<leftmouse>', '', '')
            let mapcmd = mapcmd . clickmap
            exe mapcmd
        endif
    endif

    " Define the taglist autocommands
    augroup TagListAutoCmds
        autocmd!
        " Display the tag prototype for the tag under the cursor.
        autocmd CursorHold __Tag_List__ call s:Tlist_Window_Show_Info()
        " Highlight the current tag periodically
        autocmd CursorHold * silent call s:Tlist_Window_Highlight_Tag(
                            \ fnamemodify(bufname('%'), ':p'), line('.'), 1, 0)

        " Adjust the Vim window width when taglist window is closed
        autocmd BufUnload __Tag_List__ call s:Tlist_Post_Close_Cleanup()
        " Close the fold for this buffer when leaving the buffer
        if g:Tlist_File_Fold_Auto_Close
            autocmd BufEnter * silent
                \ call s:Tlist_Window_Open_File_Fold(expand('<abuf>'))
        endif
        " Exit Vim itself if only the taglist window is present (optional)
        if g:Tlist_Exit_OnlyWindow
	    autocmd BufEnter __Tag_List__ nested
			\ call s:Tlist_Window_Exit_Only_Window()
        endif
        if s:tlist_app_name != "winmanager" &&
                    \ !g:Tlist_Process_File_Always &&
                    \ (!has('gui_running') || !g:Tlist_Show_Menu)
            " Auto refresh the taglist window
            autocmd BufEnter * call s:Tlist_Refresh()
        endif

        if !g:Tlist_Use_Horiz_Window
            if v:version < 700
                autocmd WinEnter * call s:Tlist_Window_Check_Width()
            endif
        endif
        if v:version >= 700
            autocmd TabEnter * silent call s:Tlist_Refresh_Folds()
        endif
    augroup end

    " Restore the previous cpoptions settings
    let &cpoptions = old_cpoptions
endfunction

" Tlist_Window_Refresh
" Display the tags for all the files in the taglist window
function! s:Tlist_Window_Refresh()
    call s:Tlist_Log_Msg('Tlist_Window_Refresh()')
    " Set report option to a huge value to prevent informational messages
    " while deleting the lines
    let old_report = &report
    set report=99999

    " Mark the buffer as modifiable
    setlocal modifiable

    " Delete the contents of the buffer to the black-hole register
    silent! %delete _

    " As we have cleared the taglist window, mark all the files
    " as not visible
    let i = 0
    while i < s:tlist_file_count
        let s:tlist_{i}_visible = 0
        let i = i + 1
    endwhile

    if g:Tlist_Compact_Format == 0
        " Display help in non-compact mode
        call s:Tlist_Window_Display_Help()
    endif

    " Mark the buffer as not modifiable
    setlocal nomodifiable

    " Restore the report option
    let &report = old_report

    " If the tags for only one file should be displayed in the taglist
    " window, then no need to add the tags here. The bufenter autocommand
    " will add the tags for that file.
    if g:Tlist_Show_One_File
        return
    endif

    " List all the tags for the previously processed files
    " Do this only if taglist is configured to display tags for more than
    " one file. Otherwise, when Tlist_Show_One_File is configured,
    " tags for the wrong file will be displayed.
    let i = 0
    while i < s:tlist_file_count
        call s:Tlist_Window_Refresh_File(s:tlist_{i}_filename,
                    \ s:tlist_{i}_filetype)
        let i = i + 1
    endwhile

    if g:Tlist_Auto_Update
        " Add and list the tags for all buffers in the Vim buffer list
        let i = 1
        let last_bufnum = bufnr('$')
        while i <= last_bufnum
            if buflisted(i)
                let fname = fnamemodify(bufname(i), ':p')
                let ftype = s:Tlist_Get_Buffer_Filetype(i)
                " If the file doesn't support tag listing, skip it
                if !s:Tlist_Skip_File(fname, ftype)
                    call s:Tlist_Window_Refresh_File(fname, ftype)
                endif
            endif
            let i = i + 1
        endwhile
    endif

    " If Tlist_File_Fold_Auto_Close option is set, then close all the folds
    if g:Tlist_File_Fold_Auto_Close
        " Close all the folds
        silent! %foldclose
    endif

    " Move the cursor to the top of the taglist window
    normal! gg
endfunction

" Tlist_Post_Close_Cleanup()
" Close the taglist window and adjust the Vim window width
function! s:Tlist_Post_Close_Cleanup()
    call s:Tlist_Log_Msg('Tlist_Post_Close_Cleanup()')
    " Mark all the files as not visible
    let i = 0
    while i < s:tlist_file_count
        let s:tlist_{i}_visible = 0
        let i = i + 1
    endwhile

    " Remove the taglist autocommands
    silent! autocmd! TagListAutoCmds

    " Clear all the highlights
    match none

    silent! syntax clear TagListTitle
    silent! syntax clear TagListComment
    silent! syntax clear TagListTagScope

    " Remove the left mouse click mapping if it was setup initially
    if g:Tlist_Use_SingleClick
        if hasmapto('<LeftMouse>')
            nunmap <LeftMouse>
        endif
    endif

    if s:tlist_app_name != "winmanager"
    if g:Tlist_Use_Horiz_Window || g:Tlist_Inc_Winwidth == 0 ||
                \ s:tlist_winsize_chgd != 1 ||
                \ &columns < (80 + g:Tlist_WinWidth)
        " No need to adjust window width if using horizontally split taglist
        " window or if columns is less than 101 or if the user chose not to
        " adjust the window width
    else
        " If the user didn't manually move the window, then restore the window
        " position to the pre-taglist position
        if s:tlist_pre_winx != -1 && s:tlist_pre_winy != -1 &&
                    \ getwinposx() == s:tlist_winx &&
                    \ getwinposy() == s:tlist_winy
            exe 'winpos ' . s:tlist_pre_winx . ' ' . s:tlist_pre_winy
        endif

        " Adjust the Vim window width
        let &columns= &columns - (g:Tlist_WinWidth + 1)
    endif
    endif

    let s:tlist_winsize_chgd = -1

    " Reset taglist state variables
    if s:tlist_app_name == "winmanager"
        let s:tlist_app_name = "none"
    endif
    let s:tlist_window_initialized = 0
endfunction

" Tlist_Window_Refresh_File()
" List the tags defined in the specified file in a Vim window
function! s:Tlist_Window_Refresh_File(filename, ftype)
    call s:Tlist_Log_Msg('Tlist_Window_Refresh_File (' . a:filename . ')')
    " First check whether the file already exists
    let fidx = s:Tlist_Get_File_Index(a:filename)
    if fidx != -1
        let file_listed = 1
    else
        let file_listed = 0
    endif

    if !file_listed
        " Check whether this file is removed based on user request
        " If it is, then don't display the tags for this file
        if s:Tlist_User_Removed_File(a:filename)
            return
        endif
    endif

    if file_listed && s:tlist_{fidx}_visible
        " Check whether the file tags are currently valid
        if s:tlist_{fidx}_valid
            " Goto the first line in the file
            exe s:tlist_{fidx}_start

            " If the line is inside a fold, open the fold
            if foldclosed('.') != -1
                exe "silent! " . s:tlist_{fidx}_start . "," .
                            \ s:tlist_{fidx}_end . "foldopen!"
            endif
            return
        endif

        " Discard and remove the tags for this file from display
        call s:Tlist_Discard_TagInfo(fidx)
        call s:Tlist_Window_Remove_File_From_Display(fidx)
    endif

    " Process and generate a list of tags defined in the file
    if !file_listed || !s:tlist_{fidx}_valid
        let ret_fidx = s:Tlist_Process_File(a:filename, a:ftype)
        if ret_fidx == -1
            return
        endif
        let fidx = ret_fidx
    endif

    " Set report option to a huge value to prevent informational messages
    " while adding lines to the taglist window
    let old_report = &report
    set report=99999

    if g:Tlist_Show_One_File
        " Remove the previous file
        if s:tlist_cur_file_idx != -1
            call s:Tlist_Window_Remove_File_From_Display(s:tlist_cur_file_idx)
            let s:tlist_{s:tlist_cur_file_idx}_visible = 0
            let s:tlist_{s:tlist_cur_file_idx}_start = 0
            let s:tlist_{s:tlist_cur_file_idx}_end = 0
        endif
        let s:tlist_cur_file_idx = fidx
    endif

    " Mark the buffer as modifiable
    setlocal modifiable

    " Add new files to the end of the window. For existing files, add them at
    " the same line where they were previously present. If the file is not
    " visible, then add it at the end
    if s:tlist_{fidx}_start == 0 || !s:tlist_{fidx}_visible
        if g:Tlist_Compact_Format
            let s:tlist_{fidx}_start = line('$')
        else
            let s:tlist_{fidx}_start = line('$') + 1
        endif
    endif

    let s:tlist_{fidx}_visible = 1

    " Goto the line where this file should be placed
    if g:Tlist_Compact_Format
        exe s:tlist_{fidx}_start
    else
        exe s:tlist_{fidx}_start - 1
    endif

    let txt = fnamemodify(s:tlist_{fidx}_filename, ':t') . ' (' .
                \ fnamemodify(s:tlist_{fidx}_filename, ':p:h') . ')'
    if g:Tlist_Compact_Format == 0
        silent! put =txt
    else
        silent! put! =txt
        " Move to the next line
        exe line('.') + 1
    endif
    let file_start = s:tlist_{fidx}_start

    " Add the tag names grouped by tag type to the buffer with a title
    let i = 1
    let ttype_cnt = s:tlist_{a:ftype}_count
    while i <= ttype_cnt
        let ttype = s:tlist_{a:ftype}_{i}_name
        " Add the tag type only if there are tags for that type
        let fidx_ttype = 's:tlist_' . fidx . '_' . ttype
        let ttype_txt = {fidx_ttype}
        if ttype_txt != ''
            let txt = '  ' . s:tlist_{a:ftype}_{i}_fullname
            if g:Tlist_Compact_Format == 0
                let ttype_start_lnum = line('.') + 1
                silent! put =txt
            else
                let ttype_start_lnum = line('.')
                silent! put! =txt
            endif
            silent! put =ttype_txt

            let {fidx_ttype}_offset = ttype_start_lnum - file_start

            " Adjust the cursor position
            if g:Tlist_Compact_Format == 0
                exe ttype_start_lnum + {fidx_ttype}_count
            else
                exe ttype_start_lnum + {fidx_ttype}_count + 1
            endif

            if g:Tlist_Compact_Format == 0
                " Separate the tag types by a empty line
                silent! put =''
            endif
        endif
        let i = i + 1
    endwhile

    if s:tlist_{fidx}_tag_count == 0
        if g:Tlist_Compact_Format == 0
            silent! put =''
        endif
    endif

    let s:tlist_{fidx}_end = line('.') - 1

    call s:Tlist_Create_Folds_For_File(fidx)

    " Goto the starting line for this file,
    exe s:tlist_{fidx}_start

    if s:tlist_app_name == "winmanager"
        " To handle a bug in the winmanager plugin, add a space at the
        " last line
        call setline('$', ' ')
    endif

    " Mark the buffer as not modifiable
    setlocal nomodifiable

    " Restore the report option
    let &report = old_report

    " Update the start and end line numbers for all the files following this
    " file
    let start = s:tlist_{fidx}_start
    " include the empty line after the last line
    if g:Tlist_Compact_Format
        let end = s:tlist_{fidx}_end
    else
        let end = s:tlist_{fidx}_end + 1
    endif
    call s:Tlist_Window_Update_Line_Offsets(fidx + 1, 1, end - start + 1)

    " Now that we have updated the taglist window, update the tags
    " menu (if present)
    if g:Tlist_Show_Menu
        call s:Tlist_Menu_Update_File(1)
    endif
endfunction

" Tlist_Init_File
" Initialize the variables for a new file
function! s:Tlist_Init_File(filename, ftype)
    call s:Tlist_Log_Msg('Tlist_Init_File (' . a:filename . ')')
    " Add new files at the end of the list
    let fidx = s:tlist_file_count
    let s:tlist_file_count = s:tlist_file_count + 1
    " Add the new file name to the taglist list of file names
    let s:tlist_file_names = s:tlist_file_names . a:filename . "\n"

    " Initialize the file variables
    let s:tlist_{fidx}_filename = a:filename
    let s:tlist_{fidx}_sort_type = g:Tlist_Sort_Type
    let s:tlist_{fidx}_filetype = a:ftype
    let s:tlist_{fidx}_mtime = -1
    let s:tlist_{fidx}_start = 0
    let s:tlist_{fidx}_end = 0
    let s:tlist_{fidx}_valid = 0
    let s:tlist_{fidx}_visible = 0
    let s:tlist_{fidx}_tag_count = 0
    let s:tlist_{fidx}_menu_cmd = ''

    " Initialize the tag type variables
    let i = 1
    while i <= s:tlist_{a:ftype}_count
        let ttype = s:tlist_{a:ftype}_{i}_name
        let s:tlist_{fidx}_{ttype} = ''
        let s:tlist_{fidx}_{ttype}_offset = 0
        let s:tlist_{fidx}_{ttype}_count = 0
        let i = i + 1
    endwhile

    return fidx
endfunction

" Tlist_Get_Tag_Type_By_Tag
" Return the tag type for the specified tag index
function! s:Tlist_Get_Tag_Type_By_Tag(fidx, tidx)
    let ttype_var = 's:tlist_' . a:fidx . '_' . a:tidx . '_tag_type'

    " Already parsed and have the tag name
    if exists(ttype_var)
        return {ttype_var}
    endif

    let tag_line = s:tlist_{a:fidx}_{a:tidx}_tag
    let {ttype_var} = s:Tlist_Extract_Tagtype(tag_line)

    return {ttype_var}
endfunction

" Tlist_Get_Tag_Prototype
function! s:Tlist_Get_Tag_Prototype(fidx, tidx)
    let tproto_var = 's:tlist_' . a:fidx . '_' . a:tidx . '_tag_proto'

    " Already parsed and have the tag prototype
    if exists(tproto_var)
        return {tproto_var}
    endif

    " Parse and extract the tag prototype
    let tag_line = s:tlist_{a:fidx}_{a:tidx}_tag
    let start = stridx(tag_line, '/^') + 2
    let end = stridx(tag_line, '/;"' . "\t")
    if tag_line[end - 1] == '$'
        let end = end -1
    endif
    let tag_proto = strpart(tag_line, start, end - start)
    let {tproto_var} = substitute(tag_proto, '\s*', '', '')

    return {tproto_var}
endfunction

" Tlist_Get_Tag_Scope
" Get the scope (e.g. C++ class) of a tag
"
" Tag scope is the last field after the 'line:<num>\t' field
function! s:Tlist_Get_Tag_Scope(fidx, tidx)
    let tscope_var = 's:tlist_' . a:fidx . '_' . a:tidx . '_tag_scope'

    " Already parsed and have the tag scope
    if exists(tscope_var)
        return {tscope_var}
    endif

    " Parse and extract the tag scope
    let tag_line = s:tlist_{a:fidx}_{a:tidx}_tag
    let {tscope_var} = s:Tlist_Extract_Tag_Scope(tag_line)

    return {tscope_var}
endfunction

" Tlist_Get_Tag_SearchPat
function! s:Tlist_Get_Tag_SearchPat(fidx, tidx)
    let tpat_var = 's:tlist_' . a:fidx . '_' . a:tidx . '_tag_searchpat'

    " Already parsed and have the tag search pattern
    if exists(tpat_var)
        return {tpat_var}
    endif

    " Parse and extract the tag search pattern
    let tag_line = s:tlist_{a:fidx}_{a:tidx}_tag
    let start = stridx(tag_line, '/^') + 2
    let end = stridx(tag_line, '/;"' . "\t")
    if tag_line[end - 1] == '$'
        let end = end -1
    endif
    let {tpat_var} = '\V\^' . strpart(tag_line, start, end - start) .
                        \ (tag_line[end] == '$' ? '\$' : '')

    return {tpat_var}
endfunction

" Tlist_Get_Tag_Linenum
" Return the tag line number, given the tag index
function! s:Tlist_Get_Tag_Linenum(fidx, tidx)
    let tline_var = 's:tlist_' . a:fidx . '_' . a:tidx . '_tag_linenum'

    " Already parsed and have the tag line number
    if exists(tline_var)
        return {tline_var}
    endif

    " Parse and extract the tag line number
    let tag_line = s:tlist_{a:fidx}_{a:tidx}_tag
    let start = strridx(tag_line, 'line:') + 5
    let end = strridx(tag_line, "\t")
    if end < start
        let {tline_var} = strpart(tag_line, start) + 0
    else
        let {tline_var} = strpart(tag_line, start, end - start) + 0
    endif

    return {tline_var}
endfunction

" Tlist_Parse_Tagline
" Parse a tag line from the ctags output. Separate the tag output based on the
" tag type and store it in the tag type variable.
" The format of each line in the ctags output is:
"
"     tag_name<TAB>file_name<TAB>ex_cmd;"<TAB>extension_fields
"
function! s:Tlist_Parse_Tagline(tag_line)
    if a:tag_line == ''
        " Skip empty lines
        return
    endif

    " Extract the tag type
    let ttype = s:Tlist_Extract_Tagtype(a:tag_line)

    " Make sure the tag type is a valid and supported one
    if ttype == '' || stridx(s:ctags_flags, ttype) == -1
        " Line is not in proper tags format or Tag type is not supported
        return
    endif

    " Update the total tag count
    let s:tidx = s:tidx + 1

    " The following variables are used to optimize this code.  Vim is slow in
    " using curly brace names. To reduce the amount of processing needed, the
    " curly brace variables are pre-processed here
    let fidx_tidx = 's:tlist_' . s:fidx . '_' . s:tidx
    let fidx_ttype = 's:tlist_' . s:fidx . '_' . ttype

    " Update the count of this tag type
    let ttype_idx = {fidx_ttype}_count + 1
    let {fidx_ttype}_count = ttype_idx

    " Store the ctags output for this tag
    let {fidx_tidx}_tag = a:tag_line

    " Store the tag index and the tag type index (back pointers)
    let {fidx_ttype}_{ttype_idx} = s:tidx
    let {fidx_tidx}_ttype_idx = ttype_idx

    " Extract the tag name
    let tag_name = strpart(a:tag_line, 0, stridx(a:tag_line, "\t"))

    " Extract the tag scope/prototype
    if g:Tlist_Display_Prototype
        let ttxt = '    ' . s:Tlist_Get_Tag_Prototype(s:fidx, s:tidx)
    else
        let ttxt = '    ' . tag_name

        " Add the tag scope, if it is available and is configured. Tag
        " scope is the last field after the 'line:<num>\t' field
        if g:Tlist_Display_Tag_Scope
            let tag_scope = s:Tlist_Get_Tag_Scope(s:fidx, s:tidx)
            if tag_scope != ''
                let ttxt = ttxt . ' [' . tag_scope . ']'
            endif
        endif
    endif

    " Add this tag to the tag type variable
    let {fidx_ttype} = {fidx_ttype} . ttxt . "\n"

    " Save the tag name
    let {fidx_tidx}_tag_name = tag_name
endfunction

" Tlist_Process_File
" Get the list of tags defined in the specified file and store them
" in Vim variables. Returns the file index where the tags are stored.
function! s:Tlist_Process_File(filename, ftype)
    call s:Tlist_Log_Msg('Tlist_Process_File (' . a:filename . ', ' .
                \ a:ftype . ')')
    " Check whether this file is supported
    if s:Tlist_Skip_File(a:filename, a:ftype)
        return -1
    endif

    " If the tag types for this filetype are not yet created, then create
    " them now
    let var = 's:tlist_' . a:ftype . '_count'
    if !exists(var)
        if s:Tlist_FileType_Init(a:ftype) == 0
            return -1
        endif
    endif

    " If this file is already processed, then use the cached values
    let fidx = s:Tlist_Get_File_Index(a:filename)
    if fidx == -1
        " First time, this file is loaded
        let fidx = s:Tlist_Init_File(a:filename, a:ftype)
    else
        " File was previously processed. Discard the tag information
        call s:Tlist_Discard_TagInfo(fidx)
    endif

    let s:tlist_{fidx}_valid = 1

    " Exuberant ctags arguments to generate a tag list
    let ctags_args = ' -f - --format=2 --excmd=pattern --fields=nks '

    " Form the ctags argument depending on the sort type
    if s:tlist_{fidx}_sort_type == 'name'
        let ctags_args = ctags_args . '--sort=yes'
    else
        let ctags_args = ctags_args . '--sort=no'
    endif

    " Add the filetype specific arguments
    let ctags_args = ctags_args . ' ' . s:tlist_{a:ftype}_ctags_args

    " Ctags command to produce output with regexp for locating the tags
    let ctags_cmd = g:Tlist_Ctags_Cmd . ctags_args
    let ctags_cmd = ctags_cmd . ' "' . a:filename . '"'

    if &shellxquote == '"'
        " Double-quotes within double-quotes will not work in the
        " command-line.If the 'shellxquote' option is set to double-quotes,
        " then escape the double-quotes in the ctags command-line.
        let ctags_cmd = escape(ctags_cmd, '"')
    endif

    " In Windows 95, if not using cygwin, disable the 'shellslash'
    " option. Otherwise, this will cause problems when running the
    " ctags command.
    if has('win95') && !has('win32unix')
        let old_shellslash = &shellslash
        set noshellslash
    endif

    if has('win32') && !has('win32unix') && !has('win95')
                \ && (&shell =~ 'cmd.exe')
        " Windows does not correctly deal with commands that have more than 1
        " set of double quotes.  It will strip them all resulting in:
        " 'C:\Program' is not recognized as an internal or external command
        " operable program or batch file.  To work around this, place the
        " command inside a batch file and call the batch file.
        " Do this only on Win2K, WinXP and above.
        " Contributed by: David Fishburn.
        let s:taglist_tempfile = fnamemodify(tempname(), ':h') .
                    \ '\taglist.cmd'
        if v:version >= 700
            call writefile([ctags_cmd], s:taglist_tempfile, "b")
        else
            exe 'redir! > ' . s:taglist_tempfile
            silent echo ctags_cmd
            redir END
        endif

        call s:Tlist_Log_Msg('Cmd inside batch file: ' . ctags_cmd)
        let ctags_cmd = '"' . s:taglist_tempfile . '"'
    endif

    call s:Tlist_Log_Msg('Cmd: ' . ctags_cmd)

    " Run ctags and get the tag list
    let cmd_output = system(ctags_cmd)

    " Restore the value of the 'shellslash' option.
    if has('win95') && !has('win32unix')
        let &shellslash = old_shellslash
    endif

    if exists('s:taglist_tempfile')
        " Delete the temporary cmd file created on MS-Windows
        call delete(s:taglist_tempfile)
    endif

    " Handle errors
    if v:shell_error
        let msg = "Taglist: Failed to generate tags for " . a:filename
        call s:Tlist_Warning_Msg(msg)
        if cmd_output != ''
            call s:Tlist_Warning_Msg(cmd_output)
        endif
        return fidx
    endif

    " Store the modification time for the file
    let s:tlist_{fidx}_mtime = getftime(a:filename)

    " No tags for current file
    if cmd_output == ''
        call s:Tlist_Log_Msg('No tags defined in ' . a:filename)
        return fidx
    endif

    call s:Tlist_Log_Msg('Generated tags information for ' . a:filename)

    if v:version > 601
        " The following script local variables are used by the
        " Tlist_Parse_Tagline() function.
        let s:ctags_flags = s:tlist_{a:ftype}_ctags_flags
        let s:fidx = fidx
        let s:tidx = 0

        " Process the ctags output one line at a time.  The substitute()
        " command is used to parse the tag lines instead of using the
        " matchstr()/stridx()/strpart() functions for performance reason
        call substitute(cmd_output, "\\([^\n]\\+\\)\n",
                    \ '\=s:Tlist_Parse_Tagline(submatch(1))', 'g')

        " Save the number of tags for this file
        let s:tlist_{fidx}_tag_count = s:tidx

        " The following script local variables are no longer needed
        unlet! s:ctags_flags
        unlet! s:tidx
        unlet! s:fidx
    else
        " Due to a bug in Vim earlier than version 6.1,
        " we cannot use substitute() to parse the ctags output.
        " Instead the slow str*() functions are used
        let ctags_flags = s:tlist_{a:ftype}_ctags_flags
        let tidx = 0

        while cmd_output != ''
            " Extract one line at a time
            let idx = stridx(cmd_output, "\n")
            let one_line = strpart(cmd_output, 0, idx)
            " Remove the line from the tags output
            let cmd_output = strpart(cmd_output, idx + 1)

            if one_line == ''
                " Line is not in proper tags format
                continue
            endif

            " Extract the tag type
            let ttype = s:Tlist_Extract_Tagtype(one_line)

            " Make sure the tag type is a valid and supported one
            if ttype == '' || stridx(ctags_flags, ttype) == -1
                " Line is not in proper tags format or Tag type is not
                " supported
                continue
            endif

            " Update the total tag count
            let tidx = tidx + 1

            " The following variables are used to optimize this code.  Vim is
            " slow in using curly brace names. To reduce the amount of
            " processing needed, the curly brace variables are pre-processed
            " here
            let fidx_tidx = 's:tlist_' . fidx . '_' . tidx
            let fidx_ttype = 's:tlist_' . fidx . '_' . ttype

            " Update the count of this tag type
            let ttype_idx = {fidx_ttype}_count + 1
            let {fidx_ttype}_count = ttype_idx

            " Store the ctags output for this tag
            let {fidx_tidx}_tag = one_line

            " Store the tag index and the tag type index (back pointers)
            let {fidx_ttype}_{ttype_idx} = tidx
            let {fidx_tidx}_ttype_idx = ttype_idx

            " Extract the tag name
            let tag_name = strpart(one_line, 0, stridx(one_line, "\t"))

            " Extract the tag scope/prototype
            if g:Tlist_Display_Prototype
                let ttxt = '    ' . s:Tlist_Get_Tag_Prototype(fidx, tidx)
            else
                let ttxt = '    ' . tag_name

                " Add the tag scope, if it is available and is configured. Tag
                " scope is the last field after the 'line:<num>\t' field
                if g:Tlist_Display_Tag_Scope
                    let tag_scope = s:Tlist_Get_Tag_Scope(fidx, tidx)
                    if tag_scope != ''
                        let ttxt = ttxt . ' [' . tag_scope . ']'
                    endif
                endif
            endif

            " Add this tag to the tag type variable
            let {fidx_ttype} = {fidx_ttype} . ttxt . "\n"

            " Save the tag name
            let {fidx_tidx}_tag_name = tag_name
        endwhile

        " Save the number of tags for this file
        let s:tlist_{fidx}_tag_count = tidx
    endif

    call s:Tlist_Log_Msg('Processed ' . s:tlist_{fidx}_tag_count . 
                \ ' tags in ' . a:filename)

    return fidx
endfunction

" Tlist_Update_File
" Update the tags for a file (if needed)
function! Tlist_Update_File(filename, ftype)
    call s:Tlist_Log_Msg('Tlist_Update_File (' . a:filename . ')')
    " If the file doesn't support tag listing, skip it
    if s:Tlist_Skip_File(a:filename, a:ftype)
        return
    endif

    " Convert the file name to a full path
    let fname = fnamemodify(a:filename, ':p')

    " First check whether the file already exists
    let fidx = s:Tlist_Get_File_Index(fname)

    if fidx != -1 && s:tlist_{fidx}_valid
        " File exists and the tags are valid
        " Check whether the file was modified after the last tags update
        " If it is modified, then update the tags
        if s:tlist_{fidx}_mtime == getftime(fname)
            return
        endif
    else
        " If the tags were removed previously based on a user request,
        " as we are going to update the tags (based on the user request),
        " remove the filename from the deleted list
        call s:Tlist_Update_Remove_List(fname, 0)
    endif

    " If the taglist window is opened, update it
    let winnum = bufwinnr(g:TagList_title)
    if winnum == -1
        " Taglist window is not present. Just update the taglist
        " and return
        call s:Tlist_Process_File(fname, a:ftype)
    else
        if g:Tlist_Show_One_File && s:tlist_cur_file_idx != -1
            " If tags for only one file are displayed and we are not
            " updating the tags for that file, then no need to
            " refresh the taglist window. Otherwise, the taglist
            " window should be updated.
            if s:tlist_{s:tlist_cur_file_idx}_filename != fname
                call s:Tlist_Process_File(fname, a:ftype)
                return
            endif
        endif

        " Save the current window number
        let save_winnr = winnr()

        " Goto the taglist window
        call s:Tlist_Window_Goto_Window()

        " Save the cursor position
        let save_line = line('.')
        let save_col = col('.')

        " Update the taglist window
        call s:Tlist_Window_Refresh_File(fname, a:ftype)

        " Restore the cursor position
        if v:version >= 601
            call cursor(save_line, save_col)
        else
            exe save_line
            exe 'normal! ' . save_col . '|'
        endif

        if winnr() != save_winnr
            " Go back to the original window
            call s:Tlist_Exe_Cmd_No_Acmds(save_winnr . 'wincmd w')
        endif
    endif

    " Update the taglist menu
    if g:Tlist_Show_Menu
        call s:Tlist_Menu_Update_File(1)
    endif
endfunction

" Tlist_Window_Close
" Close the taglist window
function! s:Tlist_Window_Close()
    call s:Tlist_Log_Msg('Tlist_Window_Close()')
    " Make sure the taglist window exists
    let winnum = bufwinnr(g:TagList_title)
    if winnum == -1
        call s:Tlist_Warning_Msg('Error: Taglist window is not open')
        return
    endif

    if winnr() == winnum
        " Already in the taglist window. Close it and return
        if winbufnr(2) != -1
            " If a window other than the taglist window is open,
            " then only close the taglist window.
            close
        endif
    else
        " Goto the taglist window, close it and then come back to the
        " original window
        let curbufnr = bufnr('%')
        exe winnum . 'wincmd w'
        close
        " Need to jump back to the original window only if we are not
        " already in that window
        let winnum = bufwinnr(curbufnr)
        if winnr() != winnum
            exe winnum . 'wincmd w'
        endif
    endif
endfunction

" Tlist_Window_Mark_File_Window
" Mark the current window as the file window to use when jumping to a tag.
" Only if the current window is a non-plugin, non-preview and non-taglist
" window
function! s:Tlist_Window_Mark_File_Window()
    if getbufvar('%', '&buftype') == '' && !&previewwindow
        let w:tlist_file_window = "yes"
    endif
endfunction

" Tlist_Window_Open
" Open and refresh the taglist window
function! s:Tlist_Window_Open()
    call s:Tlist_Log_Msg('Tlist_Window_Open()')
    " If the window is open, jump to it
    let winnum = bufwinnr(g:TagList_title)
    if winnum != -1
        " Jump to the existing window
        if winnr() != winnum
            exe winnum . 'wincmd w'
        endif
        return
    endif

    if s:tlist_app_name == "winmanager"
        " Taglist plugin is no longer part of the winmanager app
        let s:tlist_app_name = "none"
    endif

    " Get the filename and filetype for the specified buffer
    let curbuf_name = fnamemodify(bufname('%'), ':p')
    let curbuf_ftype = s:Tlist_Get_Buffer_Filetype('%')
    let cur_lnum = line('.')

    " Mark the current window as the desired window to open a file when a tag
    " is selected.
    call s:Tlist_Window_Mark_File_Window()

    " Open the taglist window
    call s:Tlist_Window_Create()

    call s:Tlist_Window_Refresh()

    if g:Tlist_Show_One_File
        " Add only the current buffer and file
        "
        " If the file doesn't support tag listing, skip it
        if !s:Tlist_Skip_File(curbuf_name, curbuf_ftype)
            call s:Tlist_Window_Refresh_File(curbuf_name, curbuf_ftype)
        endif
    endif

    if g:Tlist_File_Fold_Auto_Close
        " Open the fold for the current file, as all the folds in
        " the taglist window are closed
        let fidx = s:Tlist_Get_File_Index(curbuf_name)
        if fidx != -1
            exe "silent! " . s:tlist_{fidx}_start . "," .
                        \ s:tlist_{fidx}_end . "foldopen!"
        endif
    endif

    " Highlight the current tag
    call s:Tlist_Window_Highlight_Tag(curbuf_name, cur_lnum, 1, 1)
endfunction

" Tlist_Window_Toggle()
" Open or close a taglist window
function! s:Tlist_Window_Toggle()
    call s:Tlist_Log_Msg('Tlist_Window_Toggle()')
    " If taglist window is open then close it.
    let winnum = bufwinnr(g:TagList_title)
    if winnum != -1
        call s:Tlist_Window_Close()
        return
    endif

    call s:Tlist_Window_Open()

    " Go back to the original window, if Tlist_GainFocus_On_ToggleOpen is not
    " set
    if !g:Tlist_GainFocus_On_ToggleOpen
        call s:Tlist_Exe_Cmd_No_Acmds('wincmd p')
    endif

    " Update the taglist menu
    if g:Tlist_Show_Menu
        call s:Tlist_Menu_Update_File(0)
    endif
endfunction

" Tlist_Process_Filelist
" Process multiple files. Each filename is separated by "\n"
" Returns the number of processed files
function! s:Tlist_Process_Filelist(file_names)
    let flist = a:file_names

    " Enable lazy screen updates
    let old_lazyredraw = &lazyredraw
    set lazyredraw

    " Keep track of the number of processed files
    let fcnt = 0

    " Process one file at a time
    while flist != ''
        let nl_idx = stridx(flist, "\n")
        let one_file = strpart(flist, 0, nl_idx)

        " Remove the filename from the list
        let flist = strpart(flist, nl_idx + 1)

        if one_file == ''
            continue
        endif

        " Skip directories
        if isdirectory(one_file)
            continue
        endif

        let ftype = s:Tlist_Detect_Filetype(one_file)

        echon "\r                                                              "
        echon "\rProcessing tags for " . fnamemodify(one_file, ':p:t')

        let fcnt = fcnt + 1

        call Tlist_Update_File(one_file, ftype)
    endwhile

    " Clear the displayed informational messages
    echon "\r                                                            "

    " Restore the previous state
    let &lazyredraw = old_lazyredraw

    return fcnt
endfunction

" Tlist_Process_Dir
" Process the files in a directory matching the specified pattern
function! s:Tlist_Process_Dir(dir_name, pat)
    let flist = glob(a:dir_name . '/' . a:pat) . "\n"

    let fcnt = s:Tlist_Process_Filelist(flist)

    let len = strlen(a:dir_name)
    if a:dir_name[len - 1] == '\' || a:dir_name[len - 1] == '/'
        let glob_expr = a:dir_name . '*'
    else
        let glob_expr = a:dir_name . '/*'
    endif
    let all_files = glob(glob_expr) . "\n"

    while all_files != ''
        let nl_idx = stridx(all_files, "\n")
        let one_file = strpart(all_files, 0, nl_idx)

        let all_files = strpart(all_files, nl_idx + 1)
        if one_file == ''
            continue
        endif

        " Skip non-directory names
        if !isdirectory(one_file)
            continue
        endif

        echon "\r                                                              "
        echon "\rProcessing files in directory " . fnamemodify(one_file, ':t')
        let fcnt = fcnt + s:Tlist_Process_Dir(one_file, a:pat)
    endwhile

    return fcnt
endfunction

" Tlist_Add_Files_Recursive
" Add files recursively from a directory
function! s:Tlist_Add_Files_Recursive(dir, ...)
    let dir_name = fnamemodify(a:dir, ':p')
    if !isdirectory(dir_name)
        call s:Tlist_Warning_Msg('Error: ' . dir_name . ' is not a directory')
        return
    endif

    if a:0 == 1
        " User specified file pattern
        let pat = a:1
    else
        " Default file pattern
        let pat = '*'
    endif

    echon "\r                                                              "
    echon "\rProcessing files in directory " . fnamemodify(dir_name, ':t')
    let fcnt = s:Tlist_Process_Dir(dir_name, pat)

    echon "\rAdded " . fcnt . " files to the taglist"
endfunction

" Tlist_Add_Files
" Add the specified list of files to the taglist
function! s:Tlist_Add_Files(...)
    let flist = ''
    let i = 1

    " Get all the files matching the file patterns supplied as argument
    while i <= a:0
        let flist = flist . glob(a:{i}) . "\n"
        let i = i + 1
    endwhile

    if flist == ''
        call s:Tlist_Warning_Msg('Error: No matching files are found')
        return
    endif

    let fcnt = s:Tlist_Process_Filelist(flist)
    echon "\rAdded " . fcnt . " files to the taglist"
endfunction

" Tlist_Extract_Tagtype
" Extract the tag type from the tag text
function! s:Tlist_Extract_Tagtype(tag_line)
    " The tag type is after the tag prototype field. The prototype field
    " ends with the /;"\t string. We add 4 at the end to skip the characters
    " in this special string..
    let start = strridx(a:tag_line, '/;"' . "\t") + 4
    let end = strridx(a:tag_line, 'line:') - 1
    let ttype = strpart(a:tag_line, start, end - start)

    return ttype
endfunction

" Tlist_Extract_Tag_Scope
" Extract the tag scope from the tag text
function! s:Tlist_Extract_Tag_Scope(tag_line)
    let start = strridx(a:tag_line, 'line:')
    let end = strridx(a:tag_line, "\t")
    if end <= start
        return ''
    endif

    let tag_scope = strpart(a:tag_line, end + 1)
    let tag_scope = strpart(tag_scope, stridx(tag_scope, ':') + 1)

    return tag_scope
endfunction

" Tlist_Refresh()
" Refresh the taglist
function! s:Tlist_Refresh()
    call s:Tlist_Log_Msg('Tlist_Refresh (Skip_Refresh = ' .
                \ s:Tlist_Skip_Refresh . ', ' . bufname('%') . ')')
    " If we are entering the buffer from one of the taglist functions, then
    " no need to refresh the taglist window again.
    if s:Tlist_Skip_Refresh
        " We still need to update the taglist menu
        if g:Tlist_Show_Menu
            call s:Tlist_Menu_Update_File(0)
        endif
        return
    endif

    " If part of the winmanager plugin and not configured to process
    " tags always and not configured to display the tags menu, then return
    if (s:tlist_app_name == 'winmanager') && !g:Tlist_Process_File_Always
                \ && !g:Tlist_Show_Menu
        return
    endif

    " Skip buffers with 'buftype' set to nofile, nowrite, quickfix or help
    if &buftype != ''
        return
    endif

    let filename = fnamemodify(bufname('%'), ':p')
    let ftype = s:Tlist_Get_Buffer_Filetype('%')

    " If the file doesn't support tag listing, skip it
    if s:Tlist_Skip_File(filename, ftype)
        return
    endif

    let tlist_win = bufwinnr(g:TagList_title)

    " If the taglist window is not opened and not configured to process
    " tags always and not displaying the tags menu, then return
    if tlist_win == -1 && !g:Tlist_Process_File_Always && !g:Tlist_Show_Menu
        return
    endif

    let fidx = s:Tlist_Get_File_Index(filename)
    if fidx == -1
        " Check whether this file is removed based on user request
        " If it is, then don't display the tags for this file
        if s:Tlist_User_Removed_File(filename)
            return
        endif

        " If the taglist should not be auto updated, then return
        if !g:Tlist_Auto_Update
            return
        endif
    endif

    let cur_lnum = line('.')

    if fidx == -1
        " Update the tags for the file
        let fidx = s:Tlist_Process_File(filename, ftype)
    else
        let mtime = getftime(filename)
        if s:tlist_{fidx}_mtime != mtime
            " Invalidate the tags listed for this file
            let s:tlist_{fidx}_valid = 0

            " Update the taglist and the window
            call Tlist_Update_File(filename, ftype)

            " Store the new file modification time
            let s:tlist_{fidx}_mtime = mtime
        endif
    endif

    " Update the taglist window
    if tlist_win != -1
        " Disable screen updates
        let old_lazyredraw = &lazyredraw
        set nolazyredraw

        " Save the current window number
        let save_winnr = winnr()

        " Goto the taglist window
        call s:Tlist_Window_Goto_Window()

        if !g:Tlist_Auto_Highlight_Tag || !g:Tlist_Highlight_Tag_On_BufEnter
            " Save the cursor position
            let save_line = line('.')
            let save_col = col('.')
        endif

        " Update the taglist window
        call s:Tlist_Window_Refresh_File(filename, ftype)

        " Open the fold for the file
        exe "silent! " . s:tlist_{fidx}_start . "," .
                    \ s:tlist_{fidx}_end . "foldopen!"

        if g:Tlist_Highlight_Tag_On_BufEnter && g:Tlist_Auto_Highlight_Tag
            if g:Tlist_Show_One_File && s:tlist_cur_file_idx != fidx
                " If displaying tags for only one file in the taglist
                " window and about to display the tags for a new file,
                " then center the current tag line for the new file
                let center_tag_line = 1
            else
                let center_tag_line = 0
            endif

            " Highlight the current tag
            call s:Tlist_Window_Highlight_Tag(filename, cur_lnum, 1, center_tag_line)
        else
            " Restore the cursor position
            if v:version >= 601
                call cursor(save_line, save_col)
            else
                exe save_line
                exe 'normal! ' . save_col . '|'
            endif
        endif

        " Jump back to the original window
        if save_winnr != winnr()
            call s:Tlist_Exe_Cmd_No_Acmds(save_winnr . 'wincmd w')
        endif

        " Restore screen updates
        let &lazyredraw = old_lazyredraw
    endif

    " Update the taglist menu
    if g:Tlist_Show_Menu
        call s:Tlist_Menu_Update_File(0)
    endif
endfunction

" Tlist_Change_Sort()
" Change the sort order of the tag listing
" caller == 'cmd', command used in the taglist window
" caller == 'menu', taglist menu
" action == 'toggle', toggle sort from name to order and vice versa
" action == 'set', set the sort order to sort_type
function! s:Tlist_Change_Sort(caller, action, sort_type)
    call s:Tlist_Log_Msg('Tlist_Change_Sort (caller = ' . a:caller .
            \ ', action = ' . a:action . ', sort_type = ' . a:sort_type . ')')
    if a:caller == 'cmd'
        let fidx = s:Tlist_Window_Get_File_Index_By_Linenum(line('.'))
        if fidx == -1
            return
        endif

        " Remove the previous highlighting
        match none
    elseif a:caller == 'menu'
        let fidx = s:Tlist_Get_File_Index(fnamemodify(bufname('%'), ':p'))
        if fidx == -1
            return
        endif
    endif

    if a:action == 'toggle'
        let sort_type = s:tlist_{fidx}_sort_type

        " Toggle the sort order from 'name' to 'order' and vice versa
        if sort_type == 'name'
            let s:tlist_{fidx}_sort_type = 'order'
        else
            let s:tlist_{fidx}_sort_type = 'name'
        endif
    else
        let s:tlist_{fidx}_sort_type = a:sort_type
    endif

    " Invalidate the tags listed for this file
    let s:tlist_{fidx}_valid = 0

    if a:caller  == 'cmd'
        " Save the current line for later restoration
        let curline = '\V\^' . escape(getline('.'), "\\") . '\$'

        call s:Tlist_Window_Refresh_File(s:tlist_{fidx}_filename,
                    \   s:tlist_{fidx}_filetype)

        exe s:tlist_{fidx}_start . ',' . s:tlist_{fidx}_end . 'foldopen!'

        " Go back to the cursor line before the tag list is sorted
        call search(curline, 'w')

        call s:Tlist_Menu_Update_File(1)
    else
        call s:Tlist_Menu_Remove_File()

        call s:Tlist_Refresh()
    endif
endfunction

" Tlist_Update_Current_File()
" Update taglist for the current buffer by regenerating the tag list
" Contributed by WEN Guopeng.
function! s:Tlist_Update_Current_File()
    call s:Tlist_Log_Msg('Tlist_Update_Current_File()')
    if winnr() == bufwinnr(g:TagList_title)
        " In the taglist window. Update the current file
        call s:Tlist_Window_Update_File()
    else
        " Not in the taglist window. Update the current buffer
        let filename = fnamemodify(bufname('%'), ':p')
        let fidx = s:Tlist_Get_File_Index(filename)
        if fidx != -1
            let s:tlist_{fidx}_valid = 0
        endif
        let ft = s:Tlist_Get_Buffer_Filetype('%')
        call Tlist_Update_File(filename, ft)
    endif
endfunction

" Tlist_Window_Update_File()
" Update the tags displayed in the taglist window
function! s:Tlist_Window_Update_File()
    call s:Tlist_Log_Msg('Tlist_Window_Update_File()')
    let fidx = s:Tlist_Window_Get_File_Index_By_Linenum(line('.'))
    if fidx == -1
        return
    endif

    " Remove the previous highlighting
    match none

    " Save the current line for later restoration
    let curline = '\V\^' . escape(getline('.'), "\\") . '\$'

    let s:tlist_{fidx}_valid = 0

    " Update the taglist window
    call s:Tlist_Window_Refresh_File(s:tlist_{fidx}_filename,
                \ s:tlist_{fidx}_filetype)

    exe s:tlist_{fidx}_start . ',' . s:tlist_{fidx}_end . 'foldopen!'

    " Go back to the tag line before the list is updated
    call search(curline, 'w')
endfunction

" Tlist_Window_Get_Tag_Type_By_Linenum()
" Return the tag type index for the specified line in the taglist window
function! s:Tlist_Window_Get_Tag_Type_By_Linenum(fidx, lnum)
    let ftype = s:tlist_{a:fidx}_filetype

    " Determine to which tag type the current line number belongs to using the
    " tag type start line number and the number of tags in a tag type
    let i = 1
    while i <= s:tlist_{ftype}_count
        let ttype = s:tlist_{ftype}_{i}_name
        let start_lnum =
                    \ s:tlist_{a:fidx}_start + s:tlist_{a:fidx}_{ttype}_offset
        let end =  start_lnum + s:tlist_{a:fidx}_{ttype}_count
        if a:lnum >= start_lnum && a:lnum <= end
            break
        endif
        let i = i + 1
    endwhile

    " Current line doesn't belong to any of the displayed tag types
    if i > s:tlist_{ftype}_count
        return ''
    endif

    return ttype
endfunction

" Tlist_Window_Get_Tag_Index()
" Return the tag index for the specified line in the taglist window
function! s:Tlist_Window_Get_Tag_Index(fidx, lnum)
    let ttype = s:Tlist_Window_Get_Tag_Type_By_Linenum(a:fidx, a:lnum)

    " Current line doesn't belong to any of the displayed tag types
    if ttype == ''
        return 0
    endif

    " Compute the index into the displayed tags for the tag type
    let ttype_lnum = s:tlist_{a:fidx}_start + s:tlist_{a:fidx}_{ttype}_offset
    let tidx = a:lnum - ttype_lnum
    if tidx == 0
        return 0
    endif

    " Get the corresponding tag line and return it
    return s:tlist_{a:fidx}_{ttype}_{tidx}
endfunction

" Tlist_Window_Highlight_Line
" Highlight the current line
function! s:Tlist_Window_Highlight_Line()
    " Clear previously selected name
    match none

    " Highlight the current line
    if g:Tlist_Display_Prototype == 0
        let pat = '/\%' . line('.') . 'l\s\+\zs.*/'
    else
        let pat = '/\%' . line('.') . 'l.*/'
    endif

    exe 'match TagListTagName ' . pat
endfunction

" Tlist_Window_Open_File
" Open the specified file in either a new window or an existing window
" and place the cursor at the specified tag pattern
function! s:Tlist_Window_Open_File(win_ctrl, filename, tagpat)
    call s:Tlist_Log_Msg('Tlist_Window_Open_File (' . a:filename . ',' .
                \ a:win_ctrl . ')')
    let prev_Tlist_Skip_Refresh = s:Tlist_Skip_Refresh
    let s:Tlist_Skip_Refresh = 1

    if s:tlist_app_name == "winmanager"
        " Let the winmanager edit the file
        call WinManagerFileEdit(a:filename, a:win_ctrl == 'newwin')
    else

    if a:win_ctrl == 'newtab'
        " Create a new tab
        exe 'tabnew ' . escape(a:filename, ' ')
        " Open the taglist window in the new tab
        call s:Tlist_Window_Open()
    endif

    if a:win_ctrl == 'checktab'
        " Check whether the file is present in any of the tabs.
        " If the file is present in the current tab, then use the
        " current tab.
        if bufwinnr(a:filename) != -1
            let file_present_in_tab = 1
            let i = tabpagenr()
        else
            let i = 1
            let bnum = bufnr(a:filename)
            let file_present_in_tab = 0
            while i <= tabpagenr('$')
                if index(tabpagebuflist(i), bnum) != -1
                    let file_present_in_tab = 1
                    break
                endif
                let i += 1
            endwhile
        endif

        if file_present_in_tab
            " Goto the tab containing the file
            exe 'tabnext ' . i
        else
            " Open a new tab
            exe 'tabnew ' . escape(a:filename, ' ')

            " Open the taglist window
            call s:Tlist_Window_Open()
        endif
    endif

    let winnum = -1
    if a:win_ctrl == 'prevwin'
        " Open the file in the previous window, if it is usable
        let cur_win = winnr()
        wincmd p
        if &buftype == '' && !&previewwindow
            exe "edit " . escape(a:filename, ' ')
            let winnum = winnr()
        else
            " Previous window is not usable
            exe cur_win . 'wincmd w'
        endif
    endif

    " Goto the window containing the file.  If the window is not there, open a
    " new window
    if winnum == -1
        let winnum = bufwinnr(a:filename)
    endif

    if winnum == -1
        " Locate the previously used window for opening a file
        let fwin_num = 0
        let first_usable_win = 0

        let i = 1
        let bnum = winbufnr(i)
        while bnum != -1
            if getwinvar(i, 'tlist_file_window') == 'yes'
                let fwin_num = i
                break
            endif
            if first_usable_win == 0 &&
                        \ getbufvar(bnum, '&buftype') == '' &&
                        \ !getwinvar(i, '&previewwindow')
                " First non-taglist, non-plugin and non-preview window
                let first_usable_win = i
            endif
            let i = i + 1
            let bnum = winbufnr(i)
        endwhile

        " If a previously used window is not found, then use the first
        " non-taglist window
        if fwin_num == 0
            let fwin_num = first_usable_win
        endif

        if fwin_num != 0
            " Jump to the file window
            exe fwin_num . "wincmd w"

            " If the user asked to jump to the tag in a new window, then split
            " the existing window into two.
            if a:win_ctrl == 'newwin'
                split
            endif
            exe "edit " . escape(a:filename, ' ')
        else
            " Open a new window
            let cmd_mod = (v:version >= 700) ? 'keepalt ' : ''
            if g:Tlist_Use_Horiz_Window
                exe cmd_mod . 'leftabove split ' . escape(a:filename, ' ')
            else
                if winbufnr(2) == -1
                    " Only the taglist window is present
                    if g:Tlist_Use_Right_Window
                        exe cmd_mod . 'leftabove vertical split ' .
                                    \ escape(a:filename, ' ')
                    else
                        exe cmd_mod . 'rightbelow vertical split ' .
                                    \ escape(a:filename, ' ')
                    endif

                    " Go to the taglist window to change the window size to
                    " the user configured value
                    call s:Tlist_Exe_Cmd_No_Acmds('wincmd p')
                    if g:Tlist_Use_Horiz_Window
                        exe 'resize ' . g:Tlist_WinHeight
                    else
                        exe 'vertical resize ' . g:Tlist_WinWidth
                    endif
                    " Go back to the file window
                    call s:Tlist_Exe_Cmd_No_Acmds('wincmd p')
                else
                    " A plugin or help window is also present
                    wincmd w
                    exe cmd_mod . 'leftabove split ' . escape(a:filename, ' ')
                endif
            endif
        endif
        " Mark the window, so that it can be reused.
        call s:Tlist_Window_Mark_File_Window()
    else
        if v:version >= 700
            " If the file is opened in more than one window, then check
            " whether the last accessed window has the selected file.
            " If it does, then use that window.
            let lastwin_bufnum = winbufnr(winnr('#'))
            if bufnr(a:filename) == lastwin_bufnum
                let winnum = winnr('#')
            endif
        endif
        exe winnum . 'wincmd w'

        " If the user asked to jump to the tag in a new window, then split the
        " existing window into two.
        if a:win_ctrl == 'newwin'
            split
        endif
    endif
    endif

    " Jump to the tag
    if a:tagpat != ''
        " Add the current cursor position to the jump list, so that user can
        " jump back using the ' and ` marks.
        mark '
        silent call search(a:tagpat, 'w')

        " Bring the line to the middle of the window
        normal! z.

        " If the line is inside a fold, open the fold
        if foldclosed('.') != -1
            .foldopen
        endif
    endif

    " If the user selects to preview the tag then jump back to the
    " taglist window
    if a:win_ctrl == 'preview'
        " Go back to the taglist window
        let winnum = bufwinnr(g:TagList_title)
        exe winnum . 'wincmd w'
    else
        " If the user has selected to close the taglist window, when a
        " tag is selected, close the taglist  window
        if g:Tlist_Close_On_Select
            call s:Tlist_Window_Goto_Window()
            close

            " Go back to the window displaying the selected file
            let wnum = bufwinnr(a:filename)
            if wnum != -1 && wnum != winnr()
                call s:Tlist_Exe_Cmd_No_Acmds(wnum . 'wincmd w')
            endif
        endif
    endif

    let s:Tlist_Skip_Refresh = prev_Tlist_Skip_Refresh
endfunction

" Tlist_Window_Jump_To_Tag()
" Jump to the location of the current tag
" win_ctrl == useopen - Reuse the existing file window
" win_ctrl == newwin - Open a new window
" win_ctrl == preview - Preview the tag
" win_ctrl == prevwin - Open in previous window
" win_ctrl == newtab - Open in new tab
function! s:Tlist_Window_Jump_To_Tag(win_ctrl)
    call s:Tlist_Log_Msg('Tlist_Window_Jump_To_Tag(' . a:win_ctrl . ')')
    " Do not process comment lines and empty lines
    let curline = getline('.')
    if curline =~ '^\s*$' || curline[0] == '"'
        return
    endif

    " If inside a closed fold, then use the first line of the fold
    " and jump to the file.
    let lnum = foldclosed('.')
    if lnum == -1
        " Jump to the selected tag or file
        let lnum = line('.')
    else
        " Open the closed fold
        .foldopen!
    endif

    let fidx = s:Tlist_Window_Get_File_Index_By_Linenum(lnum)
    if fidx == -1
        return
    endif

    " Get the tag output for the current tag
    let tidx = s:Tlist_Window_Get_Tag_Index(fidx, lnum)
    if tidx != 0
        let tagpat = s:Tlist_Get_Tag_SearchPat(fidx, tidx)

        " Highlight the tagline
        call s:Tlist_Window_Highlight_Line()
    else
        " Selected a line which is not a tag name. Just edit the file
        let tagpat = ''
    endif

    call s:Tlist_Window_Open_File(a:win_ctrl, s:tlist_{fidx}_filename, tagpat)
endfunction

" Tlist_Window_Show_Info()
" Display information about the entry under the cursor
function! s:Tlist_Window_Show_Info()
    call s:Tlist_Log_Msg('Tlist_Window_Show_Info()')

    " Clear the previously displayed line
    echo

    " Do not process comment lines and empty lines
    let curline = getline('.')
    if curline =~ '^\s*$' || curline[0] == '"'
        return
    endif

    " If inside a fold, then don't display the prototype
    if foldclosed('.') != -1
        return
    endif

    let lnum = line('.')

    " Get the file index
    let fidx = s:Tlist_Window_Get_File_Index_By_Linenum(lnum)
    if fidx == -1
        return
    endif

    if lnum == s:tlist_{fidx}_start
        " Cursor is on a file name
        let fname = s:tlist_{fidx}_filename
        if strlen(fname) > 50
            let fname = fnamemodify(fname, ':t')
        endif
        echo fname . ', Filetype=' . s:tlist_{fidx}_filetype .
                    \  ', Tag count=' . s:tlist_{fidx}_tag_count
        return
    endif

    " Get the tag output line for the current tag
    let tidx = s:Tlist_Window_Get_Tag_Index(fidx, lnum)
    if tidx == 0
        " Cursor is on a tag type
        let ttype = s:Tlist_Window_Get_Tag_Type_By_Linenum(fidx, lnum)
        if ttype == ''
            return
        endif

        let ttype_name = ''

        let ftype = s:tlist_{fidx}_filetype
        let i = 1
        while i <= s:tlist_{ftype}_count
            if ttype == s:tlist_{ftype}_{i}_name
                let ttype_name = s:tlist_{ftype}_{i}_fullname
                break
            endif
            let i = i + 1
        endwhile

        echo 'Tag type=' . ttype_name .
                    \ ', Tag count=' . s:tlist_{fidx}_{ttype}_count
        return
    endif

    " Get the tag search pattern and display it
    let proto = s:Tlist_Get_Tag_Prototype(fidx, tidx)
    echo strpart(proto, 0, &columns - 1)
endfunction

" Tlist_Find_Nearest_Tag_Idx
" Find the tag idx nearest to the supplied line number
" Returns -1, if a tag couldn't be found for the specified line number
function! s:Tlist_Find_Nearest_Tag_Idx(fidx, linenum)
    let sort_type = s:tlist_{a:fidx}_sort_type

    let left = 1
    let right = s:tlist_{a:fidx}_tag_count

    if sort_type == 'order'
        " Tags sorted by order, use a binary search.
        " The idea behind this function is taken from the ctags.vim script (by
        " Alexey Marinichev) available at the Vim online website.

        " If the current line is the less than the first tag, then no need to
        " search
        let first_lnum = s:Tlist_Get_Tag_Linenum(a:fidx, 1)

        if a:linenum < first_lnum
            return -1
        endif

        while left < right
            let middle = (right + left + 1) / 2
            let middle_lnum = s:Tlist_Get_Tag_Linenum(a:fidx, middle)

            if middle_lnum == a:linenum
                let left = middle
                break
            endif

            if middle_lnum > a:linenum
                let right = middle - 1
            else
                let left = middle
            endif
        endwhile
    else
        " Tags sorted by name, use a linear search. (contributed by Dave
        " Eggum).
        " Look for a tag with a line number less than or equal to the supplied
        " line number. If multiple tags are found, then use the tag with the
        " line number closest to the supplied line number. IOW, use the tag
        " with the highest line number.
        let closest_lnum = 0
        let final_left = 0
        while left <= right
            let lnum = s:Tlist_Get_Tag_Linenum(a:fidx, left)

            if lnum < a:linenum && lnum > closest_lnum
                let closest_lnum = lnum
                let final_left = left
            elseif lnum == a:linenum
                let closest_lnum = lnum
                let final_left = left
                break
            else
                let left = left + 1
            endif
        endwhile
        if closest_lnum == 0
            return -1
        endif
        if left >= right
            let left = final_left
        endif
    endif

    return left
endfunction

" Tlist_Window_Highlight_Tag()
" Highlight the current tag
" cntx == 1, Called by the taglist plugin itself
" cntx == 2, Forced by the user through the TlistHighlightTag command
" center = 1, move the tag line to the center of the taglist window
function! s:Tlist_Window_Highlight_Tag(filename, cur_lnum, cntx, center)
    " Highlight the current tag only if the user configured the
    " taglist plugin to do so or if the user explictly invoked the
    " command to highlight the current tag.
    if !g:Tlist_Auto_Highlight_Tag && a:cntx == 1
        return
    endif

    if a:filename == ''
        return
    endif

    " Make sure the taglist window is present
    let winnum = bufwinnr(g:TagList_title)
    if winnum == -1
        call s:Tlist_Warning_Msg('Error: Taglist window is not open')
        return
    endif

    let fidx = s:Tlist_Get_File_Index(a:filename)
    if fidx == -1
        return
    endif

    " If the file is currently not displayed in the taglist window, then retrn
    if !s:tlist_{fidx}_visible
        return
    endif

    " If there are no tags for this file, then no need to proceed further
    if s:tlist_{fidx}_tag_count == 0
        return
    endif

    " Ignore all autocommands
    let old_ei = &eventignore
    set eventignore=all

    " Save the original window number
    let org_winnr = winnr()

    if org_winnr == winnum
        let in_taglist_window = 1
    else
        let in_taglist_window = 0
    endif

    " Go to the taglist window
    if !in_taglist_window
        exe winnum . 'wincmd w'
    endif

    " Clear previously selected name
    match none

    let tidx = s:Tlist_Find_Nearest_Tag_Idx(fidx, a:cur_lnum)
    if tidx == -1
        " Make sure the current tag line is visible in the taglist window.
        " Calling the winline() function makes the line visible.  Don't know
        " of a better way to achieve this.
        let lnum = line('.')

        if lnum < s:tlist_{fidx}_start || lnum > s:tlist_{fidx}_end
            " Move the cursor to the beginning of the file
            exe s:tlist_{fidx}_start
        endif

        if foldclosed('.') != -1
            .foldopen
        endif

        call winline()

        if !in_taglist_window
            exe org_winnr . 'wincmd w'
        endif

        " Restore the autocommands
        let &eventignore = old_ei
        return
    endif

    " Extract the tag type
    let ttype = s:Tlist_Get_Tag_Type_By_Tag(fidx, tidx)

    " Compute the line number
    " Start of file + Start of tag type + offset
    let lnum = s:tlist_{fidx}_start + s:tlist_{fidx}_{ttype}_offset +
                \ s:tlist_{fidx}_{tidx}_ttype_idx

    " Goto the line containing the tag
    exe lnum

    " Open the fold
    if foldclosed('.') != -1
        .foldopen
    endif

    if a:center
        " Move the tag line to the center of the taglist window
        normal! z.
    else
        " Make sure the current tag line is visible in the taglist window.
        " Calling the winline() function makes the line visible.  Don't know
        " of a better way to achieve this.
        call winline()
    endif

    " Highlight the tag name
    call s:Tlist_Window_Highlight_Line()

    " Go back to the original window
    if !in_taglist_window
        exe org_winnr . 'wincmd w'
    endif

    " Restore the autocommands
    let &eventignore = old_ei
    return
endfunction

" Tlist_Get_Tag_Prototype_By_Line
" Get the prototype for the tag on or before the specified line number in the
" current buffer
function! Tlist_Get_Tag_Prototype_By_Line(...)
    if a:0 == 0
        " Arguments are not supplied. Use the current buffer name
        " and line number
        let filename = bufname('%')
        let linenr = line('.')
    elseif a:0 == 2
        " Filename and line number are specified
        let filename = a:1
        let linenr = a:2
        if linenr !~ '\d\+'
            " Invalid line number
            return ""
        endif
    else
        " Sufficient arguments are not supplied
        let msg =  'Usage: Tlist_Get_Tag_Prototype_By_Line <filename> ' .
                                \ '<line_number>'
        call s:Tlist_Warning_Msg(msg)
        return ""
    endif

    " Expand the file to a fully qualified name
    let filename = fnamemodify(filename, ':p')
    if filename == ''
        return ""
    endif

    let fidx = s:Tlist_Get_File_Index(filename)
    if fidx == -1
        return ""
    endif

    " If there are no tags for this file, then no need to proceed further
    if s:tlist_{fidx}_tag_count == 0
        return ""
    endif

    " Get the tag text using the line number
    let tidx = s:Tlist_Find_Nearest_Tag_Idx(fidx, linenr)
    if tidx == -1
        return ""
    endif

    return s:Tlist_Get_Tag_Prototype(fidx, tidx)
endfunction

" Tlist_Get_Tagname_By_Line
" Get the tag name on or before the specified line number in the
" current buffer
function! Tlist_Get_Tagname_By_Line(...)
    if a:0 == 0
        " Arguments are not supplied. Use the current buffer name
        " and line number
        let filename = bufname('%')
        let linenr = line('.')
    elseif a:0 == 2
        " Filename and line number are specified
        let filename = a:1
        let linenr = a:2
        if linenr !~ '\d\+'
            " Invalid line number
            return ""
        endif
    else
        " Sufficient arguments are not supplied
        let msg =  'Usage: Tlist_Get_Tagname_By_Line <filename> <line_number>'
        call s:Tlist_Warning_Msg(msg)
        return ""
    endif

    " Make sure the current file has a name
    let filename = fnamemodify(filename, ':p')
    if filename == ''
        return ""
    endif

    let fidx = s:Tlist_Get_File_Index(filename)
    if fidx == -1
        return ""
    endif

    " If there are no tags for this file, then no need to proceed further
    if s:tlist_{fidx}_tag_count == 0
        return ""
    endif

    " Get the tag name using the line number
    let tidx = s:Tlist_Find_Nearest_Tag_Idx(fidx, linenr)
    if tidx == -1
        return ""
    endif

    let name = s:tlist_{fidx}_{tidx}_tag_name

    if g:Tlist_Display_Tag_Scope
        " Add the scope of the tag
        let tag_scope = s:tlist_{fidx}_{tidx}_tag_scope
        if tag_scope != ''
            let name = name . ' [' . tag_scope . ']'
        endif
    endif

    return name
endfunction

" Tlist_Get_Filenames
" Return the list of file names in the taglist. The names are separated
" by a newline ('\n')
function! Tlist_Get_Filenames()
    let fnames = ''

    let i = 0

    while i < s:tlist_file_count
        let fnames = fnames . s:tlist_{i}_filename . "\n"
        let i = i + 1
    endwhile

    return fnames
endfunction

" Tlist_Window_Move_To_File
" Move the cursor to the beginning of the current file or the next file
" or the previous file in the taglist window
" dir == -1, move to start of current or previous function
" dir == 1, move to start of next function
function! s:Tlist_Window_Move_To_File(dir)
    if foldlevel('.') == 0
        " Cursor is on a non-folded line (it is not in any of the files)
        " Move it to a folded line
        if a:dir == -1
            normal! zk
        else
            " While moving down to the start of the next fold,
            " no need to do go to the start of the next file.
            normal! zj
            return
        endif
    endif

    let fidx = s:Tlist_Window_Get_File_Index_By_Linenum(line('.'))
    if fidx == -1
        return
    endif

    let cur_lnum = line('.')

    if a:dir == -1
        if cur_lnum > s:tlist_{fidx}_start
            " Move to the beginning of the current file
            exe s:tlist_{fidx}_start
            return
        endif

        if fidx != 0
            " Move to the beginning of the previous file
            let fidx = fidx - 1
        else
            " Cursor is at the first file, wrap around to the last file
            let fidx = s:tlist_file_count - 1
        endif

        exe s:tlist_{fidx}_start
        return
    else
        " Move to the beginning of the next file
        let fidx = fidx + 1

        if fidx >= s:tlist_file_count
            " Cursor is at the last file, wrap around to the first file
            let fidx = 0
        endif

        if s:tlist_{fidx}_start != 0
            exe s:tlist_{fidx}_start
        endif
        return
    endif
endfunction

" Tlist_Session_Load
" Load a taglist session (information about all the displayed files
" and the tags) from the specified file
function! s:Tlist_Session_Load(...)
    if a:0 == 0 || a:1 == ''
        call s:Tlist_Warning_Msg('Usage: TlistSessionLoad <filename>')
        return
    endif

    let sessionfile = a:1

    if !filereadable(sessionfile)
        let msg = 'Taglist: Error - Unable to open file ' . sessionfile
        call s:Tlist_Warning_Msg(msg)
        return
    endif

    " Mark the current window as the file window
    call s:Tlist_Window_Mark_File_Window()

    " Source the session file
    exe 'source ' . sessionfile

    let new_file_count = g:tlist_file_count
    unlet! g:tlist_file_count

    let i = 0
    while i < new_file_count
        let ftype = g:tlist_{i}_filetype
        unlet! g:tlist_{i}_filetype

        if !exists('s:tlist_' . ftype . '_count')
            if s:Tlist_FileType_Init(ftype) == 0
                let i = i + 1
                continue
            endif
        endif

        let fname = g:tlist_{i}_filename
        unlet! g:tlist_{i}_filename

        let fidx = s:Tlist_Get_File_Index(fname)
        if fidx != -1
            let s:tlist_{fidx}_visible = 0
            let i = i + 1
            continue
        else
            " As we are loading the tags from the session file, if this
            " file was previously deleted by the user, now we need to
            " add it back. So remove the file from the deleted list.
            call s:Tlist_Update_Remove_List(fname, 0)
        endif

        let fidx = s:Tlist_Init_File(fname, ftype)

        let s:tlist_{fidx}_filename = fname

        let s:tlist_{fidx}_sort_type = g:tlist_{i}_sort_type
        unlet! g:tlist_{i}_sort_type

        let s:tlist_{fidx}_filetype = ftype
        let s:tlist_{fidx}_mtime = getftime(fname)

        let s:tlist_{fidx}_start = 0
        let s:tlist_{fidx}_end = 0

        let s:tlist_{fidx}_valid = 1

        let s:tlist_{fidx}_tag_count = g:tlist_{i}_tag_count
        unlet! g:tlist_{i}_tag_count

        let j = 1
        while j <= s:tlist_{fidx}_tag_count
            let s:tlist_{fidx}_{j}_tag = g:tlist_{i}_{j}_tag
            let s:tlist_{fidx}_{j}_tag_name = g:tlist_{i}_{j}_tag_name
            let s:tlist_{fidx}_{j}_ttype_idx = g:tlist_{i}_{j}_ttype_idx
            unlet! g:tlist_{i}_{j}_tag
            unlet! g:tlist_{i}_{j}_tag_name
            unlet! g:tlist_{i}_{j}_ttype_idx
            let j = j + 1
        endwhile

        let j = 1
        while j <= s:tlist_{ftype}_count
            let ttype = s:tlist_{ftype}_{j}_name

            if exists('g:tlist_' . i . '_' . ttype)
                let s:tlist_{fidx}_{ttype} = g:tlist_{i}_{ttype}
                unlet! g:tlist_{i}_{ttype}
                let s:tlist_{fidx}_{ttype}_offset = 0
                let s:tlist_{fidx}_{ttype}_count = g:tlist_{i}_{ttype}_count
                unlet! g:tlist_{i}_{ttype}_count

                let k = 1
                while k <= s:tlist_{fidx}_{ttype}_count
                    let s:tlist_{fidx}_{ttype}_{k} = g:tlist_{i}_{ttype}_{k}
                    unlet! g:tlist_{i}_{ttype}_{k}
                    let k = k + 1
                endwhile
            else
                let s:tlist_{fidx}_{ttype} = ''
                let s:tlist_{fidx}_{ttype}_offset = 0
                let s:tlist_{fidx}_{ttype}_count = 0
            endif

            let j = j + 1
        endwhile

        let i = i + 1
    endwhile

    " If the taglist window is open, then update it
    let winnum = bufwinnr(g:TagList_title)
    if winnum != -1
        let save_winnr = winnr()

        " Goto the taglist window
        call s:Tlist_Window_Goto_Window()

        " Refresh the taglist window
        call s:Tlist_Window_Refresh()

        " Go back to the original window
        if save_winnr != winnr()
            call s:Tlist_Exe_Cmd_No_Acmds('wincmd p')
        endif
    endif
endfunction

" Tlist_Session_Save
" Save a taglist session (information about all the displayed files
" and the tags) into the specified file
function! s:Tlist_Session_Save(...)
    if a:0 == 0 || a:1 == ''
        call s:Tlist_Warning_Msg('Usage: TlistSessionSave <filename>')
        return
    endif

    let sessionfile = a:1

    if s:tlist_file_count == 0
        " There is nothing to save
        call s:Tlist_Warning_Msg('Warning: Taglist is empty. Nothing to save.')
        return
    endif

    if filereadable(sessionfile)
        let ans = input('Do you want to overwrite ' . sessionfile . ' (Y/N)?')
        if ans !=? 'y'
            return
        endif

        echo "\n"
    endif

    let old_verbose = &verbose
    set verbose&vim

    exe 'redir! > ' . sessionfile

    silent! echo '" Taglist session file. This file is auto-generated.'
    silent! echo '" File information'
    silent! echo 'let tlist_file_count = ' . s:tlist_file_count

    let i = 0

    while i < s:tlist_file_count
        " Store information about the file
        silent! echo 'let tlist_' . i . "_filename = '" .
                                            \ s:tlist_{i}_filename . "'"
        silent! echo 'let tlist_' . i . '_sort_type = "' .
                                                \ s:tlist_{i}_sort_type . '"'
        silent! echo 'let tlist_' . i . '_filetype = "' .
                                            \ s:tlist_{i}_filetype . '"'
        silent! echo 'let tlist_' . i . '_tag_count = ' .
                                                        \ s:tlist_{i}_tag_count
        " Store information about all the tags
        let j = 1
        while j <= s:tlist_{i}_tag_count
            let txt = escape(s:tlist_{i}_{j}_tag, '"\\')
            silent! echo 'let tlist_' . i . '_' . j . '_tag = "' . txt . '"'
            silent! echo 'let tlist_' . i . '_' . j . '_tag_name = "' .
                        \ s:tlist_{i}_{j}_tag_name . '"'
            silent! echo 'let tlist_' . i . '_' . j . '_ttype_idx' . ' = ' .
                        \ s:tlist_{i}_{j}_ttype_idx
            let j = j + 1
        endwhile

        " Store information about all the tags grouped by their type
        let ftype = s:tlist_{i}_filetype
        let j = 1
        while j <= s:tlist_{ftype}_count
            let ttype = s:tlist_{ftype}_{j}_name
            if s:tlist_{i}_{ttype}_count != 0
                let txt = escape(s:tlist_{i}_{ttype}, '"\')
                let txt = substitute(txt, "\n", "\\\\n", 'g')
                silent! echo 'let tlist_' . i . '_' . ttype . ' = "' .
                                                \ txt . '"'
                silent! echo 'let tlist_' . i . '_' . ttype . '_count = ' .
                                                     \ s:tlist_{i}_{ttype}_count
                let k = 1
                while k <= s:tlist_{i}_{ttype}_count
                    silent! echo 'let tlist_' . i . '_' . ttype . '_' . k .
                                \ ' = ' . s:tlist_{i}_{ttype}_{k}
                    let k = k + 1
                endwhile
            endif
            let j = j + 1
        endwhile

        silent! echo

        let i = i + 1
    endwhile

    redir END

    let &verbose = old_verbose
endfunction

" Tlist_Buffer_Removed
" A buffer is removed from the Vim buffer list. Remove the tags defined
" for that file
function! s:Tlist_Buffer_Removed(filename)
    call s:Tlist_Log_Msg('Tlist_Buffer_Removed (' . a:filename .  ')')

    " Make sure a valid filename is supplied
    if a:filename == ''
        return
    endif

    " Get tag list index of the specified file
    let fidx = s:Tlist_Get_File_Index(a:filename)
    if fidx == -1
        " File not present in the taglist
        return
    endif

    " Remove the file from the list
    call s:Tlist_Remove_File(fidx, 0)
endfunction

" When a buffer is deleted, remove the file from the taglist
autocmd BufDelete * silent call s:Tlist_Buffer_Removed(expand('<afile>:p'))

" Tlist_Window_Open_File_Fold
" Open the fold for the specified file and close the fold for all the
" other files
function! s:Tlist_Window_Open_File_Fold(acmd_bufnr)
    call s:Tlist_Log_Msg('Tlist_Window_Open_File_Fold (' . a:acmd_bufnr . ')')

    " Make sure the taglist window is present
    let winnum = bufwinnr(g:TagList_title)
    if winnum == -1
        call s:Tlist_Warning_Msg('Taglist: Error - Taglist window is not open')
        return
    endif

    " Save the original window number
    let org_winnr = winnr()
    if org_winnr == winnum
        let in_taglist_window = 1
    else
        let in_taglist_window = 0
    endif

    if in_taglist_window
        " When entering the taglist window, no need to update the folds
        return
    endif

    " Go to the taglist window
    if !in_taglist_window
        call s:Tlist_Exe_Cmd_No_Acmds(winnum . 'wincmd w')
    endif

    " Close all the folds
    silent! %foldclose

    " Get tag list index of the specified file
    let fname = fnamemodify(bufname(a:acmd_bufnr + 0), ':p')
    if filereadable(fname)
        let fidx = s:Tlist_Get_File_Index(fname)
        if fidx != -1
            " Open the fold for the file
            exe "silent! " . s:tlist_{fidx}_start . "," .
                        \ s:tlist_{fidx}_end . "foldopen"
        endif
    endif

    " Go back to the original window
    if !in_taglist_window
        call s:Tlist_Exe_Cmd_No_Acmds(org_winnr . 'wincmd w')
    endif
endfunction

" Tlist_Window_Check_Auto_Open
" Open the taglist window automatically on Vim startup.
" Open the window only when files present in any of the Vim windows support
" tags.
function! s:Tlist_Window_Check_Auto_Open()
    let open_window = 0

    let i = 1
    let buf_num = winbufnr(i)
    while buf_num != -1
        let filename = fnamemodify(bufname(buf_num), ':p')
        let ft = s:Tlist_Get_Buffer_Filetype(buf_num)
        if !s:Tlist_Skip_File(filename, ft)
            let open_window = 1
            break
        endif
        let i = i + 1
        let buf_num = winbufnr(i)
    endwhile

    if open_window
        call s:Tlist_Window_Toggle()
    endif
endfunction

" Tlist_Create_Folds_For_File
" Create the folds in the taglist window for the specified file
function! s:Tlist_Create_Folds_For_File(fidx)
    let ftype = s:tlist_{a:fidx}_filetype

    " Create the folds for each tag type in a file
    let j = 1
    while j <= s:tlist_{ftype}_count
        let ttype = s:tlist_{ftype}_{j}_name
        if s:tlist_{a:fidx}_{ttype}_count
            let s = s:tlist_{a:fidx}_start + s:tlist_{a:fidx}_{ttype}_offset
            let e = s + s:tlist_{a:fidx}_{ttype}_count
            exe s . ',' . e . 'fold'
        endif
        let j = j + 1
    endwhile

    exe s:tlist_{a:fidx}_start . ',' . s:tlist_{a:fidx}_end . 'fold'
    exe 'silent! ' . s:tlist_{a:fidx}_start . ',' .
                \ s:tlist_{a:fidx}_end . 'foldopen!'
endfunction

" Tlist_Refresh_Folds
" Remove and create the folds for all the files displayed in the taglist
" window. Used after entering a tab. If this is not done, then the folds
" are not properly created for taglist windows displayed in multiple tabs.
function! s:Tlist_Refresh_Folds()
    let winnum = bufwinnr(g:TagList_title)
    if winnum == -1
        return
    endif

    let save_wnum = winnr()
    exe winnum . 'wincmd w'

    " First remove all the existing folds
    normal! zE

    if g:Tlist_Show_One_File 
        " If only one file is displayed in the taglist window, then there
        " is no need to refresh the folds for the tags as the tags for the
        " current file will be removed anyway.
    else
        " Create the folds for each file in the tag list
        let fidx = 0
        while fidx < s:tlist_file_count
            call s:Tlist_Create_Folds_For_File(fidx)
            let fidx = fidx + 1
        endwhile
    endif

    exe save_wnum . 'wincmd w'
endfunction

function! s:Tlist_Menu_Add_Base_Menu()
    call s:Tlist_Log_Msg('Adding the base menu')

    " Add the menu
    anoremenu <silent> T&ags.Refresh\ menu :call <SID>Tlist_Menu_Refresh()<CR>
    anoremenu <silent> T&ags.Sort\ menu\ by.Name
                    \ :call <SID>Tlist_Change_Sort('menu', 'set', 'name')<CR>
    anoremenu <silent> T&ags.Sort\ menu\ by.Order
                    \ :call <SID>Tlist_Change_Sort('menu', 'set', 'order')<CR>
    anoremenu T&ags.-SEP1-           :

    if &mousemodel =~ 'popup'
        anoremenu <silent> PopUp.T&ags.Refresh\ menu
                    \ :call <SID>Tlist_Menu_Refresh()<CR>
        anoremenu <silent> PopUp.T&ags.Sort\ menu\ by.Name
                  \ :call <SID>Tlist_Change_Sort('menu', 'set', 'name')<CR>
        anoremenu <silent> PopUp.T&ags.Sort\ menu\ by.Order
                  \ :call <SID>Tlist_Change_Sort('menu', 'set', 'order')<CR>
        anoremenu PopUp.T&ags.-SEP1-           :
    endif
endfunction

let s:menu_char_prefix =
            \ '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

" Tlist_Menu_Get_Tag_Type_Cmd
" Get the menu command for the specified tag type
" fidx - File type index
" ftype - File Type
" add_ttype_name - To add or not to add the tag type name to the menu entries
" ttype_idx - Tag type index
function! s:Tlist_Menu_Get_Tag_Type_Cmd(fidx, ftype, add_ttype_name, ttype_idx)
    " Curly brace variable name optimization
    let ftype_ttype_idx = a:ftype . '_' . a:ttype_idx

    let ttype = s:tlist_{ftype_ttype_idx}_name
    if a:add_ttype_name
        " If the tag type name contains space characters, escape it. This
        " will be used to create the menu entries.
        let ttype_fullname = escape(s:tlist_{ftype_ttype_idx}_fullname, ' ')
    endif

    " Curly brace variable name optimization
    let fidx_ttype = a:fidx . '_' . ttype

    " Number of tag entries for this tag type
    let tcnt = s:tlist_{fidx_ttype}_count
    if tcnt == 0 " No entries for this tag type
        return ''
    endif

    let mcmd = ''

    " Create the menu items for the tags.
    " Depending on the number of tags of this type, split the menu into
    " multiple sub-menus, if needed.
    if tcnt > g:Tlist_Max_Submenu_Items
        let j = 1
        while j <= tcnt
            let final_index = j + g:Tlist_Max_Submenu_Items - 1
            if final_index > tcnt
                let final_index = tcnt
            endif

            " Extract the first and last tag name and form the
            " sub-menu name
            let tidx = s:tlist_{fidx_ttype}_{j}
            let first_tag = s:tlist_{a:fidx}_{tidx}_tag_name

            let tidx = s:tlist_{fidx_ttype}_{final_index}
            let last_tag = s:tlist_{a:fidx}_{tidx}_tag_name

            " Truncate the names, if they are greater than the
            " max length
            let first_tag = strpart(first_tag, 0, g:Tlist_Max_Tag_Length)
            let last_tag = strpart(last_tag, 0, g:Tlist_Max_Tag_Length)

            " Form the menu command prefix
            let m_prefix = 'anoremenu <silent> T\&ags.'
            if a:add_ttype_name
                let m_prefix = m_prefix . ttype_fullname . '.'
            endif
            let m_prefix = m_prefix . first_tag . '\.\.\.' . last_tag . '.'

            " Character prefix used to number the menu items (hotkey)
            let m_prefix_idx = 0

            while j <= final_index
                let tidx = s:tlist_{fidx_ttype}_{j}

                let tname = s:tlist_{a:fidx}_{tidx}_tag_name

                let mcmd = mcmd . m_prefix . '\&' .
                            \ s:menu_char_prefix[m_prefix_idx] . '\.' .
                            \ tname . ' :call <SID>Tlist_Menu_Jump_To_Tag(' .
                            \ tidx . ')<CR>|'

                let m_prefix_idx = m_prefix_idx + 1
                let j = j + 1
            endwhile
        endwhile
    else
        " Character prefix used to number the menu items (hotkey)
        let m_prefix_idx = 0

        let m_prefix = 'anoremenu <silent> T\&ags.'
        if a:add_ttype_name
            let m_prefix = m_prefix . ttype_fullname . '.'
        endif
        let j = 1
        while j <= tcnt
            let tidx = s:tlist_{fidx_ttype}_{j}

            let tname = s:tlist_{a:fidx}_{tidx}_tag_name

            let mcmd = mcmd . m_prefix . '\&' .
                        \ s:menu_char_prefix[m_prefix_idx] . '\.' .
                        \ tname . ' :call <SID>Tlist_Menu_Jump_To_Tag(' . tidx
                        \ . ')<CR>|'

            let m_prefix_idx = m_prefix_idx + 1
            let j = j + 1
        endwhile
    endif

    return mcmd
endfunction

" Update the taglist menu with the tags for the specified file
function! s:Tlist_Menu_File_Refresh(fidx)
    call s:Tlist_Log_Msg('Refreshing the tag menu for ' . s:tlist_{a:fidx}_filename)
    " The 'B' flag is needed in the 'cpoptions' option
    let old_cpoptions = &cpoptions
    set cpoptions&vim

    exe s:tlist_{a:fidx}_menu_cmd

    " Update the popup menu (if enabled)
    if &mousemodel =~ 'popup'
        let cmd = substitute(s:tlist_{a:fidx}_menu_cmd, ' T\\&ags\.',
                                        \ ' PopUp.T\\\&ags.', "g")
        exe cmd
    endif

    " The taglist menu is not empty now
    let s:tlist_menu_empty = 0

    " Restore the 'cpoptions' settings
    let &cpoptions = old_cpoptions
endfunction

" Tlist_Menu_Update_File
" Add the taglist menu
function! s:Tlist_Menu_Update_File(clear_menu)
    if !has('gui_running')
        " Not running in GUI mode
        return
    endif

    call s:Tlist_Log_Msg('Updating the tag menu, clear_menu = ' . a:clear_menu)

    " Remove the tags menu
    if a:clear_menu
        call s:Tlist_Menu_Remove_File()

    endif

    " Skip buffers with 'buftype' set to nofile, nowrite, quickfix or help
    if &buftype != ''
        return
    endif

    let filename = fnamemodify(bufname('%'), ':p')
    let ftype = s:Tlist_Get_Buffer_Filetype('%')

    " If the file doesn't support tag listing, skip it
    if s:Tlist_Skip_File(filename, ftype)
        return
    endif

    let fidx = s:Tlist_Get_File_Index(filename)
    if fidx == -1 || !s:tlist_{fidx}_valid
        " Check whether this file is removed based on user request
        " If it is, then don't display the tags for this file
        if s:Tlist_User_Removed_File(filename)
            return
        endif

        " Process the tags for the file
        let fidx = s:Tlist_Process_File(filename, ftype)
        if fidx == -1
            return
        endif
    endif

    let fname = escape(fnamemodify(bufname('%'), ':t'), '.')
    if fname != ''
        exe 'anoremenu T&ags.' .  fname . ' <Nop>'
        anoremenu T&ags.-SEP2-           :
    endif

    if !s:tlist_{fidx}_tag_count
        return
    endif

    if s:tlist_{fidx}_menu_cmd != ''
        " Update the menu with the cached command
        call s:Tlist_Menu_File_Refresh(fidx)

        return
    endif

    " We are going to add entries to the tags menu, so the menu won't be
    " empty
    let s:tlist_menu_empty = 0

    let cmd = ''

    " Determine whether the tag type name needs to be added to the menu
    " If more than one tag type is present in the taglisting for a file,
    " then the tag type name needs to be present
    let add_ttype_name = -1
    let i = 1
    while i <= s:tlist_{ftype}_count && add_ttype_name < 1
        let ttype = s:tlist_{ftype}_{i}_name
        if s:tlist_{fidx}_{ttype}_count
            let add_ttype_name = add_ttype_name + 1
        endif
        let i = i + 1
    endwhile

    " Process the tags by the tag type and get the menu command
    let i = 1
    while i <= s:tlist_{ftype}_count
        let mcmd = s:Tlist_Menu_Get_Tag_Type_Cmd(fidx, ftype, add_ttype_name, i)
        if mcmd != ''
            let cmd = cmd . mcmd
        endif

        let i = i + 1
    endwhile

    " Cache the menu command for reuse
    let s:tlist_{fidx}_menu_cmd = cmd

    " Update the menu
    call s:Tlist_Menu_File_Refresh(fidx)
endfunction

" Tlist_Menu_Remove_File
" Remove the tags displayed in the tags menu
function! s:Tlist_Menu_Remove_File()
    if !has('gui_running') || s:tlist_menu_empty
        return
    endif

    call s:Tlist_Log_Msg('Removing the tags menu for a file')

    " Cleanup the Tags menu
    silent! unmenu T&ags
    if &mousemodel =~ 'popup'
        silent! unmenu PopUp.T&ags
    endif

    " Add a dummy menu item to retain teared off menu
    noremenu T&ags.Dummy l

    silent! unmenu! T&ags
    if &mousemodel =~ 'popup'
        silent! unmenu! PopUp.T&ags
    endif

    call s:Tlist_Menu_Add_Base_Menu()

    " Remove the dummy menu item
    unmenu T&ags.Dummy

    let s:tlist_menu_empty = 1
endfunction

" Tlist_Menu_Refresh
" Refresh the taglist menu
function! s:Tlist_Menu_Refresh()
    call s:Tlist_Log_Msg('Refreshing the tags menu')
    let fidx = s:Tlist_Get_File_Index(fnamemodify(bufname('%'), ':p'))
    if fidx != -1
        " Invalidate the cached menu command
        let s:tlist_{fidx}_menu_cmd = ''
    endif

    " Update the taglist, menu and window
    call s:Tlist_Update_Current_File()
endfunction

" Tlist_Menu_Jump_To_Tag
" Jump to the selected tag
function! s:Tlist_Menu_Jump_To_Tag(tidx)
    let fidx = s:Tlist_Get_File_Index(fnamemodify(bufname('%'), ':p'))
    if fidx == -1
        return
    endif

    let tagpat = s:Tlist_Get_Tag_SearchPat(fidx, a:tidx)
    if tagpat == ''
        return
    endif

    " Add the current cursor position to the jump list, so that user can
    " jump back using the ' and ` marks.
    mark '

    silent call search(tagpat, 'w')

    " Bring the line to the middle of the window
    normal! z.

    " If the line is inside a fold, open the fold
    if foldclosed('.') != -1
        .foldopen
    endif
endfunction

" Tlist_Menu_Init
" Initialize the taglist menu
function! s:Tlist_Menu_Init()
    call s:Tlist_Menu_Add_Base_Menu()

    " Automatically add the tags defined in the current file to the menu
    augroup TagListMenuCmds
        autocmd!

        if !g:Tlist_Process_File_Always
            autocmd BufEnter * call s:Tlist_Refresh()
        endif
        autocmd BufLeave * call s:Tlist_Menu_Remove_File()
    augroup end

    call s:Tlist_Menu_Update_File(0)
endfunction

" Tlist_Vim_Session_Load
" Initialize the taglist window/buffer, which is created when loading
" a Vim session file.
function! s:Tlist_Vim_Session_Load()
    call s:Tlist_Log_Msg('Tlist_Vim_Session_Load')

    " Initialize the taglist window
    call s:Tlist_Window_Init()

    " Refresh the taglist window
    call s:Tlist_Window_Refresh()
endfunction

" Tlist_Set_App
" Set the name of the external plugin/application to which taglist
" belongs.
" Taglist plugin is part of another plugin like cream or winmanager.
function! Tlist_Set_App(name)
    if a:name == ""
        return
    endif

    let s:tlist_app_name = a:name
endfunction

" Winmanager integration

" Initialization required for integration with winmanager
function! TagList_Start()
    " If current buffer is not taglist buffer, then don't proceed
    if bufname('%') != '__Tag_List__'
        return
    endif

    call Tlist_Set_App('winmanager')

    " Get the current filename from the winmanager plugin
    let bufnum = WinManagerGetLastEditedFile()
    if bufnum != -1
        let filename = fnamemodify(bufname(bufnum), ':p')
        let ftype = s:Tlist_Get_Buffer_Filetype(bufnum)
    endif

    " Initialize the taglist window, if it is not already initialized
    if !exists('s:tlist_window_initialized') || !s:tlist_window_initialized
        call s:Tlist_Window_Init()
        call s:Tlist_Window_Refresh()
        let s:tlist_window_initialized = 1
    endif

    " Update the taglist window
    if bufnum != -1
        if !s:Tlist_Skip_File(filename, ftype) && g:Tlist_Auto_Update
            call s:Tlist_Window_Refresh_File(filename, ftype)
        endif
    endif
endfunction

function! TagList_IsValid()
    return 0
endfunction

function! TagList_WrapUp()
    return 0
endfunction

" restore 'cpo'
let &cpo = s:cpo_save
unlet s:cpo_save

                                                                                                                                                                                                                                                                                                                                              .vim/plugin/winmanager.vim                                                                          000644  000765  000024  00000115113 07452727431 017011  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         "=============================================================================
"        File: winmanager.vim
"      Author: Srinath Avadhanula (srinath@eecs.berkeley.edu)
" Last Change: Wed Apr 03 05:00 PM 2002 PST
"        Help: winmanager.vim is a plugin which implements a classical windows
"              type IDE in Vim-6.0.  When you open up a new file, simply type
"              in :WMToggle. This will start up the file explorer.
"
"
" NOTE:  Starting from winmanager-2.x you can add new plugins to winmanager
" and also customize the window layout in your .vimrc
"
" See ":help winmanager" for additional details.
" ============================================================================

" quit if the user doesnt want us or if we are already loaded.
if exists("loaded_winmanager")
	finish
end
let loaded_winmanager = 1

" width of the explorer windows 
if !exists("g:winManagerWidth")
	let g:winManagerWidth = 25
end

" whether to close winmanager if only explorer windows are visible.
if !exists("g:persistentBehaviour")
	let g:persistentBehaviour = 1
end

" default window layout
if !exists("g:winManagerWindowLayout")
	let g:winManagerWindowLayout = "FileExplorer,TagsExplorer|BufExplorer"
end

" use default explorer plugin which ships with vim.
if !exists("g:defaultExplorer")
	let g:defaultExplorer = 1
end

" commands
" toggling between the windows manager open or closed. this can also be used
" to start win manager.
if !exists(':WMToggle')
	command -nargs=0 WMToggle :silent call <SID>ToggleWindowsManager()
end

" WManager and WMclose still exist for backward compatibility, but their use
" is deprecated because WMToggle has the functionality of both of them.
if !exists(':WManager')
	command -nargs=0 WManager :silent call <SID>StartWindowsManager()
end
if !exists(':WMClose')
	command -nargs=0 WMClose :silent call <SID>CloseWindowsManager()
end
" command to go to either the first explorer window visible
if !exists(':FirstExplorerWindow')
	command -nargs=0 FirstExplorerWindow :silent call <SID>GotoExplorerWindow('1')
end
" command to go to either the last explorer window visible
if !exists(':BottomExplorerWindow')
	command -nargs=0 BottomExplorerWindow :silent call <SID>GotoExplorerWindow('$')
end

" this command is used internally by winmanager. shouldnt be of concern to the
" user.
if !exists(':WinManagerGotoNextInGroup')
	command -nargs=1 WinManagerGotoNextInGroup :silent call <SID>GotoNextExplorerInGroup(<args>)
end	
if !exists(':WinManagerGotoPrevInGroup')
	command -nargs=1 WinManagerGotoPrevInGroup :silent call <SID>GotoNextExplorerInGroup(<args>,-1)
end	

" nifty command for debugging. SVarValueWinManager 'MRUList' will echo the
" value of 's:MRUList' for instance. to be used for debugging winmanager.
" shouldn't be of interest to the user.
if !exists(':SVarValueWinManager')
	command -nargs=* SVarValueWinManager :call <SID>ShowVariableValue(<args>)
end

" characters that must be escaped for filenames
if has("dos16") || has("dos32") || has("win16") || has("win32") || has("os2")
	let s:escfilename = ' %#'
else
	let s:escfilename = ' \%#'
endif

" a quick way to "uncomment" all the debug print statements.
let g:debugWinManager = 1
let g:numRefs = 0

" initialization.
let s:numExplorerGroups = 0
let s:numExplorers = 0

" Line continuation used here
let s:cpo_save = &cpo
set cpo&vim

"---
" this function creates a variable 
" s:explorerGroup_i
" for the i^th time it is called. This variable will be of the form
" s:explorerGroup_i = ",member1,member2,member3,"
"
" this provides a way to "group" various explorers into common groups, so that
" one of them will be visible at a time.
"
function! <SID>RegisterExplorerGroup()
	" g:winManagerWindowLayout is of the form
	" 'FileExplorer,TagsExplorer|BufExplorer'
	
	" begin extracting groups from the layout variable.
	let groupNum = 1
	while 1
		" if no more groups then break.	
		let curGroup = s:Strntok(g:winManagerWindowLayout, '|', groupNum)
		if curGroup == ''
			break
		end
		
		" otherwise extract the explorers belonging to this group and the
		" explorer ID's etc. also protect against the same explorer being put
		" in 2 groups.
		let grplist = ','
		let numlist = ','
		let curgn = s:numExplorerGroups + 1

		let i = 1
		while 1
			let name = s:Strntok(curGroup, ',', i)
			if name == ''
				break
			end
			" refuse to register an explorer twice, or if the explorer's title
			" doesnt exist.
			if exists('s:'.name.'_numberID') || !exists('g:'.name.'_title')
				if  !exists('g:'.name.'_title')
					if has('gui_running')
						call confirm(name." is registered as a plugin, but I cannot seem to find it anywhere.\n"
							\.'Make sure you have downloaded the relevant plugin or change the g:winManagerWindowLayout variable',
							\"&ok", 1, 'Warning')
					else
						echohl Error
						echomsg name." is registered as a plugin, but I cannot seem to find it anywhere."
							\.'Please make sure you have downloaded the relevant plugin'
						echohl None
					endif
				endif
				let i = i + 1
				continue
			end

			let s:numExplorers = s:numExplorers + 1
			let num = s:numExplorers

			exe 'let s:explorerName_'.num.' = name'

			let grplist = grplist.name.","
			let numlist = numlist.''.num.','

			" create variables of the form ExplorerName_<group/member/number>ID
			" which contains which group the explorer belongs to and its member
			" number within that group and also its number
			" this will create a variable of the form
			exe 'let s:'.name.'_groupID  = "'.curgn.'"'
			exe 'let s:'.name.'_memberID = "'.i.'"'
			exe 'let s:'.name.'_numberID = "'.num.'"'

			let i = i + 1
		endwhile
		if grplist == ','
			call PrintError('no explorers registered in this run')
			return
		end

		let s:numExplorerGroups = s:numExplorerGroups + 1

		exe 'let s:explorerGroup_'.curgn.' = grplist'
		exe 'let s:explorerGroupNums_'.curgn.' = numlist'
		exe 'let s:numMembers_'.curgn.' = a:0'

		let groupNum = groupNum + 1
	endwhile

endfunction


"---
" initializes the window manager. sets the initial layout. as of now, the
" layout of the explorer windows (i.e, which plugin appears above or below the
" other) depends on the order in which the plugins are sourced. 
" TODO: make this easily user customizable later.
"       Done! See comments about registration.
"
" this function opens each "registered" plugin in its appropriate position. it
" also starts off the autocommand which makes dynamic updating of buffers
" possible.
"
function! <SID>StartWindowsManager()
	" for the first few versions of winmanager, if no registration is done,
	" assume the following default configuration of the windows:
	"    (FileExplorer, TagsExplorer)
	"    (BufExplorer)
	" This allows for an "easy" distribution. i.e, the installation will not
	" break if the user is careless with his .vimrc
	let oldRep=&report
	let save_sc = &sc
	set report=10000 nosc
	if s:numExplorers == 0
		call s:RegisterExplorerGroup()
	end
	let nothingShown = 1
	let s:commandRunning = 1

	if !exists("s:MRUList")
		call s:InitializeMRUList()
	end
	let currentWindowNumber = winnr()

	if !exists("s:gotExplorerTitles")
		let s:gotExplorerTitles = 1
		let i = 1
		while i <= s:numExplorers
			exe 'let name = s:explorerName_'.i
			exe 'let s:explorerTitle_'.i.' = g:'.name.'_title'
			let i = i + 1
		endwhile
	endif

	" focus on the first visible explorer window.
	let gotvisible = 0
	let i = 1
	while i <= s:numExplorerGroups
		" check if the ith explorer is visible.
		let windownum = s:IsExplorerGroupVisible(i)
		if windownum != -1
			call s:GotoWindow(windownum)
			let gotvisible = 1
			" cen is the "current explorer number". used while restoring the
			" layout.
			let cen = i
			let nothingShown = 0
			break
		end
		let i = i + 1
	endwhile

	" split the current window or vsplit a new window for the explorers if
	" none of the explorers is visible.
	if !gotvisible
		if exists('s:lastMemberDisplayed_1')
			let lastmem = s:lastMemberDisplayed_1
		else
			let lastmem = 1
		end
		let somethingDisplayed = s:EditNextVisibleExplorer(1, lastmem-1, 1, 'vsplit')
		" if nothing was displayed this time, there is a possiblity it could
		" happen later during one of the refresh cycles. remember this for
		" then.
		call PrintError('something displayed on '.lastmem.' of 1 :'.somethingDisplayed)
		if !somethingDisplayed
			let s:tryGroupAgain_1 = 1
			q
		else
			let s:tryGroupAgain_1 = 0
			let nothingShown = 0
			let currentWindowNumber = currentWindowNumber + 1
		end
		let cen = 1
		" for now assume that the explorer windows always stay on the left.
		" TODO: make this optional later
		wincmd H
		" set up the correct width
		exe g:winManagerWidth.'wincmd |'
	end

	" now we are on one of the explorers. time to redo the original layout.
	let _split = &splitbelow
	let i = 1
	while i <= s:numExplorerGroups
		" for each group, see if any member of it is visible.
		let windownum = s:IsExplorerGroupVisible(i)
		
		" if this explorer group is not visible, then open the first plugin
		" belonging to this group
		if windownum == -1

			" if this explorer group is "before" the cen, then split above, else
			" below. except for the first time when this could possibly be
			" true, it always evaluates to the else.
			if i < cen
				set nosplitbelow
			else
				set splitbelow
			end
			" find the last plugin belonging to this "group" which was
			" displayed.
			if exists('s:lastMemberDisplayed_'.i)
				exe 'let lastmem = s:lastMemberDisplayed_'.i
			else
				let lastmem = 1
			end
			" try to display either that plugin or the one after it.
			let somethingDisplayed = s:EditNextVisibleExplorer(i, lastmem-1,1,"split")
			if !somethingDisplayed
				exe 'let s:tryGroupAgain_'.i.' = 1'
				q
			else
				exe 'let s:tryGroupAgain_'.i.' = 0'
				" if this is the first explorer shown, need to push it to the
				" right.
				if nothingShown
					wincmd H
					" set up the correct width
					exe g:winManagerWidth.'wincmd |'
				end
				let nothingShown = 0
				let currentWindowNumber = currentWindowNumber + 1
			end
			let cen = i

		" the group is visible, go to it so we can split the one after that
		" from it.
		else
			call s:GotoWindow(windownum)
		endif

		let i = i + 1
		" cen: current explorer (group) number which was visited.
		let cen = i
	endwhile
	call PrintError('done with start while loop')
	
	" now make the run for resizing. 
	let i = 1
	while i <= s:numExplorerGroups
		" find if its visible and the explorer of this group which is
		" currently displayed.
		let windownum = s:IsExplorerGroupVisible(i)
		" need to check because some of the explorer groups might not have
		" been displayed, if all their members were unable to display
		" anything.
		if windownum == -1
			let i = i + 1
			continue
		end
		let numexp = s:WhichMemberVisible(i)
		
		" visible, goto that window. 
		call s:GotoWindow(windownum)
		exe 'let name = s:explorerName_'.numexp
		" if this is not occupying the entire height of the window, then call
		" its ReSize() function (if it exists).
		if exists('*'.name.'_ReSize') && !s:IsOnlyVertical()
			exe 'call '.name.'_ReSize()'
		end
		let i = i + 1
	endwhile
	call PrintError('done with refresh while loop')

	let &splitbelow = _split

	augroup WinManagerRefresh
		au!
		au BufEnter * call <SID>RefreshWinManager()
		au BufDelete * call <SID>RefreshWinManager("BufDelete")
	augroup END

	call s:GotoWindow(currentWindowNumber)
	" RepairAltRegister needs to be called here as well, because 
	" 1. when winmanager is re-started, we need to restore the @# register to
	"    what it was.
	" 2. if winmanager is started for the first time, then we need to ensure
	"    that @# is at least not one of the explorer windows.
	if buflisted(bufnr('%'))
		call s:RepairAltRegister()
	end
	let s:commandRunning = 0
	let &report=oldRep
	let &sc = save_sc
	if nothingShown
		echomsg "[ no valid explorers available. winmanager will start when next possible ]"
	end
endfunction

"---
" if this window occupies the entire height of the screen, return 1, else
" return 0. i.e return 1 if there is no window above or below this window.
"
function! <SID>IsOnlyVertical()
	let curwin = winnr()
	wincmd k
	if curwin != winnr()
		wincmd j
		return 0
	else
		wincmd j
		if winnr() != curwin
			wincmd k
			return 0
		end
	end
	return 1
endfunction

"---
" this function first takes focus to the last listed file being edited and
" then depending on the users action and modified, etc opens the file bufName
" either on it or splits a new window etc.
"
function! WinManagerFileEdit(bufName, split)
	" this function is usually _not_ triggered from an autocommand, so the
	" movement commands in this function will trigger RefreshWinManager().
	" make that do nothing with this flag.
	let s:commandRunning = 1
	let oldRep=&report
	let save_sc = &sc
	set report=10000 nosc
	
	" if the file is already visible somewhere just go there.
	" a:bufName is a fully qualified filename of the form
	"    e:/path/to/file
	" now bufnr('e:/path/to/file') != -1 even in the case where a file called
	" e:/path/to/file/other/name is opened. (this is bufnr()'s behavior).
	" therefore make an additional check so were protected against false
	" matches.
	if bufwinnr(bufnr(a:bufName)) != -1 &&
		\ a:bufName == expand('#'.bufnr(a:bufName).':p')

		call s:GotoWindow(bufwinnr(a:bufName))
		" however, we still have to repair the @# register
		call s:RepairAltRegister()

	" otherwise goto the last listed buffer being edited.
	else 

		" if we had already opened this file, then use the #n notation instead
		" of opening by file name. this preserves cursor position.
		if bufnr(a:bufName) != -1 &&
			\ a:bufName == expand('#'.bufnr(a:bufName).':p')
			let bufcall = '#'.bufnr(a:bufName)
		else
			let bufcall = a:bufName
		end

		let lastBufferNumber = s:MRUGet(1)
		" if the last accessed buffer is visible, then goto it.
		if bufwinnr(lastBufferNumber) != -1
			" the fact that we go to the last listed buffer and then open this
			" buffer automatically protects the @# register.
			call s:GotoWindow(bufwinnr(bufnr(lastBufferNumber)))
			" now split it or not depending on stuff.
			if (&modified && !&hidden) || a:split
				exe 'silent! split '.bufcall
			else
				exe 'silent! e '.bufcall
			end
		else
			" the last accessed buffer is not visible. this most probably
			" means that the explorer buffers are the only windows visible.
			" this means that the layout has to be redone by v-splitting a new
			" window for this file.
			" first open the alternate file just to retain @# if its still
			" listed. 
			if buflisted(lastBufferNumber)
				exe 'silent! vsplit #'.lastBufferNumber
				exe 'silent! e '.bufcall
			" the last accessed buffer has dissapeared. just edit this file.
			else
				exe 'silent! vsplit '.bufcall
			end
			" now push this to the very right
			wincmd L
			" calculate the width of this window and reset it.
			exe &columns-g:winManagerWidth.' wincmd |'
		end
	end

	let s:commandRunning = 0

	" call Refresh incase this fileopen made some displays invalid.
	call s:RefreshWinManager()
	let &report=oldRep
	let &sc = save_sc
endfunction


"---
" function to repair the @# register.
"
" quickly edit the alternate buffer previously being edited in the
" FileExplorer area so that the % and # registers are not screwed with.
" This function must be called while focus is on a listed buffer which needs
" to be made @%.
"
function! <SID>RepairAltRegister()
	" setting hidden while going back and forth is very wise because sometimes
	" this function is used from within an autocommand. in such cases,
	" switching back and forth between buffers makes the syntax highlighting
	" dissapear.
	let _hidden = &l:bufhidden
	setlocal bufhidden=hide
	let oldRep=&report
	let save_sc = &sc
	set report=10000 nosc

	let currentBufferNumber = bufnr('%')
	let currentBufferName = expand('%:p')
	let alternateBufferNumber = s:MRUGet(2)

	" if the required alternatebuffer exists, then first edit it to preserve @#
 	if alternateBufferNumber != bufnr("#") 
		\ && alternateBufferNumber != -1
		\ && buflisted(alternateBufferNumber)
 		exec 'silent! b! '.alternateBufferNumber
	elseif alternateBufferNumber == -1
	" if the alternate buffer doesnt exist, do some randomness so that the @#
	" register is at least not some explorer buffer number. ideally, at this
	" stage, something would have been done to ensure that @# = -1, however,
	" for now, edit a temporary file.
		exe "e ".tempname()
		setlocal nobuflisted
		setlocal nomodifiable
		setlocal bufhidden=delete
		setlocal buftype=nofile
		let tmpBufNum = bufnr('%')
		exe 'silent! b! '.currentBufferNumber
		exe 'silent! bwipeout '.tmpBufNum
		let &l:bufhidden = _hidden
		return
	end

 	" now edit the current file (to preserve @% :-) )
	" it seems that using ":b !" is _very_ important to preserve syntax
	" highlighting. if ":e #" or ":b " is used, then syntax highlighting is
	" lost and the ugly hack thing keeps getting called everytime. 
	" still dont know exactly why this is. it has something to do with
	" abandoned buffers being kept and also nested autocommands, but its not
	" very clear to me what it is.
	exec('silent! b! '.currentBufferNumber)

	" a totally ugly hack to restore syntax highlighting... i have NO idea why
	" this has to be here... somehow mixing opening files with autocommands
	" has always been very very problematic.
	" NOTE: the problem seems to have gone away now... see above comment.
	if has("syntax") && exists("g:syntax_on") && !has("syntax_items")
		call PrintError('needing to reset syntax!')
		do syntax
	else
		call PrintError('fugly hack not needed!')
	end
	" end fugly hack.

	let &l:bufhidden = _hidden
	let &report=oldRep
	let &sc = save_sc
endfunction

"---
" the main function. this is responsible for updating plugins dynamically.
" this function is triggered on the BufEnter and BufDelete events. every time
" it is called, it makes a pass through all visible plugins and if their
" display is not valid, it calls their Start() function.
"
" if this function is called with no arguments, it is assumed to be triggered
" from a BufEnter even or due to a forcible refresh. If it is called with one
" argument called "BufDelete", then it is assumed that it is triggered from
" the BufDelete event.
"
function! <SID>RefreshWinManager(...)
	" refreshes the window layout and the displayes of windows which trigger
	" on autocommands.
	
	" make a note of whether this refresh was triggered by the BufDelete event
	" or not.
	let _split = &splitbelow
	if a:0 > 0 && a:1 == "BufDelete"
		let BufDelete = 1
	else
		let BufDelete = 0
	end
	" do the push pop thing irrespective of whether we do the rest of the
	" stuff or not.
	if BufDelete
		call s:MRUPop()
	else
		call s:MRUPush()
	end
	" if this autocommand was triggered because of internal movements/commands
	" due to other winmanager commands, then quit.
	if exists("s:commandRunning") && s:commandRunning
		return
	end
	" check if only explorer windows are visible and if so quit if we dont
	" want persistent behavior.
	if !g:persistentBehaviour && s:OnlyExplorerWindowsOpen()
		qa
	end
	
	" this magic statement is curing the syntax losing problem. WHY?
	let s:commandRunning = 1
	let g:numRefs = g:numRefs + 1

	" remember this window number because we will return to it after
	" refreshing the buffer listing.
	let currentWindowNumber = winnr()
	let curBufListed = buflisted(bufnr('%'))
	let cfn = s:Path(expand("%:p"))

	" now cycle through all the visible explorers and and for each "invalid"ly
	" displayed explorer call its corresponding refresh and resize functions.
	let i = 1
	while i <= s:numExplorerGroups  && curBufListed
		" find if its visible and the explorer of this group which is
		" currently displayed.
		let windownum = s:IsExplorerGroupVisible(i)
		" if this explorer is visible, then call its _IsValid() function, etc.
		if windownum == -1
			let i = i + 1
			continue
		end
		let numexp = s:WhichMemberVisible(i)
		" visible, goto that window.
		call s:GotoWindow(windownum)
		exe 'let name = s:explorerName_'.numexp

		exe 'let explorerName = s:explorerName_'.numexp
		exe 'let isvalid = '.explorerName.'_IsValid()'
		" ... and if it isnt then update it.
		if !isvalid
			call <SID>GotoWindow(windownum)
			exe 'call '.explorerName.'_Start()'
			if exists('*'.explorerName.'_ReSize') && !s:IsOnlyVertical()
				exe 'call '.explorerName.'_ReSize()'
			end
		end
		let i = i + 1
	endwhile

	" this while loop handles the case where a group of explorers are was not
	" valid at some point and therefore didnt occupy a window, but became
	" valid after some point and therefore need to obtain a seperate window.
	let i = 1
	while i <= s:numExplorerGroups && curBufListed
		exe 'let retry = s:tryGroupAgain_'.i
		" only do this if we need to retry opening this buffer. we should not
		" keep opening a group which the user has closed using a ":quit"
		" command.
		if retry
			call PrintError('retrying group '.i)
			" find the 'nearest' group which is open.
			let nearestGroup = 'inf'
			let nearestWindow = 'inf'
			" TODO: possible bug: what if there are more than a million
			" plugins being used? :-)
			let nearestGroupDist = 1000000
			let j = 1
			while j <= s:numExplorerGroups
				
				let windownum = s:IsExplorerGroupVisible(j)
				if windownum != -1
					let dist = ( (j-i) < 0 ? (i-j) : (j-i) )
					if dist < nearestGroupDist
						let nearestGroupDist = dist
						let nearestGroup = j
						let nearestWindow = windownum
					end
				end
				let j = j + 1
			endwhile

			call PrintError('nearestWindow = '.nearestWindow)
			" if nearestWindow is 'inf', it means no other explorer plugins
			" are open. which means that this thing needs to go the very
			" right.
			if nearestWindow == 'inf'
				let ecmd = 'vsplit'
			else
				let ecmd = 'split'
				if nearestGroup > i
					setlocal nosplitbelow
				else
					setlocal splitbelow
				end
			end
			let somethingDisplayed = s:EditNextVisibleExplorer(i, 0, 1, ecmd)
			" if nothing was displayed this time, there is a possiblity it could
			" happen later during one of the refresh cycles. remember this for
			" then.
			if !somethingDisplayed
				exe 'let s:tryGroupAgain_'.i.' = 1'
				q
			else
				exe 'let s:tryGroupAgain_'.i.' = 0'
				let currentWindowNumber = currentWindowNumber + 1
				exe 'let name = s:explorerName_'.somethingDisplayed
				if exists('*'.name.'_ReSize') && !s:IsOnlyVertical()
					exe 'call '.name.'_ReSize()'
				end
				if nearestWindow == 'inf'
					wincmd H
					" set up the correct width
					" set width only if we are creating a new window...
					exe g:winManagerWidth.'wincmd |'
				end
				call PrintError('doing the funky open thing')
			end
		end
		let i = i + 1
	endwhile

	call s:ResizeAllExplorers()

	" refreshing done, now return back to where we were originally.
	call <SID>GotoWindow(currentWindowNumber)
	
	" however, we still have to "repair" the actual @% and @# registers, in
	" case we are returning to a listed buffer.  also should do this only for
	" a BufEnter event. For a BufDelete event, the do this only if the current
	" buffer is not the buffer being deleted.
	call PrintError('refresh: abuf = '.expand('<abuf>'))
	if buflisted(bufnr("%")) && !isdirectory(bufname("%")) && 
	\	( !BufDelete || ( bufnr('%') != expand('<abuf>') ) )
		call <SID>RepairAltRegister()
	end

	let s:commandRunning = 0
	let &splitbelow = _split
endfunction

function! <SID>ResizeAllExplorers()
	let i = 1
	while i <= s:numExplorers
		let explorerWinNum = s:IsExplorerVisible(i)
		if explorerWinNum != -1
			exe 'let explorerName = s:explorerName_'.i
			if exists('*'.explorerName.'_ReSize') && !s:IsOnlyVertical()
			" if a resize() function exists for this explorer and there
			" is some window above and/or below this window, then call its
			" resize function. this allows for dynamic resizing.
				call s:GotoWindow(explorerWinNum)
				exe 'call '.explorerName.'_ReSize()'
				call PrintError('calling resize for '.explorerName)
			end
		end
		let i = i + 1
	endwhile
endfunction

"---
" Make sure a path has proper form. 
" this function forces every path to take the following form
" dir1/dir2/file    OR
" dir1/dir2/dir/ 
" i.e, it replaces \ with / and stuff.
"
function! <SID>Path(p)
	let _p = a:p
	if a:p =~ '//$'
		return ""
	end
	if isdirectory(_p)
		let origdir= getcwd()
		exe "chdir" _p
		let _p = getcwd()
		exe "chdir" origdir
	end
	if has("dos16") || has("dos32") || has("win16") || has("win32") || has("os2")
		let _p = substitute(_p,'\\','/','g')
	endif
	if _p !~ '/$' && isdirectory(_p)
		let _p = _p.'/'
	endif
	return _p
endfunction

" goto the reqdWinNum^th window. returns 0 on failure otherwise 1.
function! <SID>GotoWindow(reqdWinNum)
	let startWinNum = winnr()
	if startWinNum == a:reqdWinNum
		return 1
	end
	if winbufnr(a:reqdWinNum) == -1
		return 0
	else
		exe a:reqdWinNum.' wincmd w'
		return 1
	end

endfunction

" returns the window number of the ith explorer if its visible, else -1
function! <SID>IsExplorerVisible(i)
	if exists('s:explorerBufNum_'.a:i)
		exe 'let explorerBufNum = s:explorerBufNum_'.a:i
	else
		let explorerBufNum = -1
	end
	return bufwinnr(explorerBufNum)
endfunction

" returns the window number of the first explorer of the ith explorer group if
" its visible, else -1
"
" if called with 2 arguments with the second being 'member', then returns the
" member number which is visible instead of its window number
"
function! <SID>IsExplorerGroupVisible(i, ...)
	" numList : the list of explorer numbers belonging to this group
	exe 'let numList = s:explorerGroupNums_'.a:i
	" ncl : next comma location
	" pcl : previous comma location
	let pcl = 0
	let ncl	= match(numList, ',', pcl + 1)
	while ncl != -1
		exe 'let num = '.strpart(numList, pcl + 1, ncl - pcl - 1)
		if s:IsExplorerVisible(num) != -1
			if a:0 == 1 && a:1 == 'mem'
				return num
			else
				return s:IsExplorerVisible(num)
			end
		end
		let pcl = ncl
		let ncl	= match(numList, ',', pcl + 1)
	endwhile
	return -1
endfunction

" returns the member number of the first explorer of the ith explorer group if
" its visible, else -1
function! <SID>WhichMemberVisible(i)
	return s:IsExplorerGroupVisible(a:i, 'mem')
endfunction

" a handy little function for debugging.
function! PrintError(eline)
	if !g:debugWinManager
		return
	end
	if !exists("g:myerror")
		let g:myerror = ""
	end
	let g:myerror = g:myerror . "\n" . a:eline
endfunction

"---
" find the memn^th member's explorer number of the groupn^th explorer group
" i.e, if s:explorerGroup_2 = ",3,4,5,"
" then FindExplorerInGroup(2,3) = 5
" 
" returs -1 if its not possible.
"
function! <SID>FindExplorerInGroup(groupn, memn)
	" numList : the list of explorer numbers belonging to this group
	exe 'let numList = s:explorerGroupNums_'.a:groupn

	let num = s:Strntok2(numList, ',', a:memn)
	if num == ''
		return -1
	end
	exe 'return '.num
endfunction

"---
" goto the next explorer in the group which this one belongs to.
" if called with 2 arguments, goto the previous explorer.
"
function! <SID>GotoNextExplorerInGroup(name, ...)
	let s:commandRunning = 1
	" go forward or back?
	if a:0 > 1
		let dir = -1
	else
		let dir = 1
	end

	" first extract the ID variable from the name
	exe 'let grpn = s:'.a:name.'_groupID'
	exe 'let memn = s:'.a:name.'_memberID'
	exe 'let numn = s:'.a:name.'_numberID'

	" find the number of members of this group.
	exe 'let nummems = s:numMembers_'.grpn
	if nummems == 1
		return 0
	end

	if exists('*'.a:name.'_WrapUp')
		exe 'call '.a:name.'_WrapUp()'
	end

	let curbufnum = bufnr('%')
	let somethingDisplayed = s:EditNextVisibleExplorer(grpn, memn, dir, 'e')
	if !somethingDisplayed && curbufnum != bufnr('%')
	   	" now start the next explorer using its title
	   	exe 'let title = s:explorerTitle_'.numn
	   	exe 'silent! e '.title
		setlocal nobuflisted
		setlocal bufhidden=delete
		setlocal buftype=nofile
		setlocal noswapfile

		" call the Start() function for the next explorer ...
		exe 'call '.a:name.'_Start()'
		exe 'nnoremap <buffer> <C-n> :WinManagerGotoNextInGroup "'.a:name.'"<cr>'
		exe 'nnoremap <buffer> <C-p> :WinManagerGotoPrevInGroup "'.a:name.'"<cr>'
		setlocal nomodifiable
		call WinManagerForceReSize(a:name)
	end

	let s:commandRunning = 0
endfunction

" edit the first possible explorer after memn belonging to groun. use editcmd
" to form the new window.
function! <SID>EditNextVisibleExplorer(grpn, memn, dir, editcmd)
	
	call PrintError('EditNext: grpn = '.a:grpn.', memn = '.a:memn.', dir = '.a:dir.' editcmd = '.a:editcmd)
	" then try to find the number of the next member.
	let startmn = (a:memn ? a:memn : 1)
	let nextmn = a:memn + a:dir
	let editcmd = a:editcmd

	let somethingDisplayed = 0

	let once = 0
	" enter this loop at least once
	while nextmn != startmn || !once
	" cycle through the next explorers in this group finding out the next
	" explorer which says its able to display anything at all.
		let once = 1
	
		let nextEN = s:FindExplorerInGroup(a:grpn, nextmn)
		" if the next member doesnt exist wrap around.
		if nextEN == -1 
			if a:dir == 1
				let nextEN = s:FindExplorerInGroup(a:grpn, 1)
				let nextmn = 1
				continue
			else
				let nextEN = s:FindExplorerInGroup(a:grpn, nummems)
				let nextmn = nummems
				continue
			end
		end

		" if we have come back to the same explorer with every other group
		" member not able to display anything, then return.
		call PrintError('nextmn = '.nextmn.' a:memn = '.a:memn)

		exe 'let name = s:explorerName_'.nextEN
		" if the _IsPossible() function doesn't exist, assume its always
		" possible to display stuff.
		let isposs = 1
		if exists('*'.name.'_IsPossible')
			exe 'let isposs = '.name.'_IsPossible()'
		end
		if isposs
			" now start the next explorer using its title
			exe 'let title = s:explorerTitle_'.nextEN
			exe 'let name = s:explorerName_'.nextEN
			exe 'silent! '.editcmd.' '.title
			" use vsplitting etc only the first time things are opened.
			if editcmd != 'e'
				let editcmd = 'e'
			end
			" these are a few setting which most well-made explorers
			" already set, but just to be on the safe side.
			setlocal nobuflisted
			setlocal bufhidden=delete
			setlocal buftype=nofile
			setlocal noswapfile

			" call the Start() function for the next explorer ...
			exe 'call '.name.'_Start()'
			setlocal nomodifiable
			" and remember its buffer number for later.
			exe 'let s:explorerBufNum_'.nextEN.' = bufnr("%")'
			" also remember that this was the last explorer of this group which was
			" displayed.
			exe 'let s:lastMemberDisplayed_'.a:grpn.' = nextmn'

			" if this explorer has actually not put anything in the buffer
			" then quit and forget.
			if line('$') > 0 && getline('$') != ''
				let somethingDisplayed = nextEN
				break
			end
		end
		" goto the next explorer of the group.
		let nextmn = nextmn + a:dir
	endwhile

	if somethingDisplayed
		" and then add this mapping to switch to the next/previous
		" explorer in this group
		exe 'nnoremap <buffer> <C-n> :WinManagerGotoNextInGroup "'.name.'"<cr>'
		exe 'nnoremap <buffer> <C-p> :WinManagerGotoPrevInGroup "'.name.'"<cr>'
	end
	return somethingDisplayed
endfunction


" goes to either the first explorer window or the last explorer window
" visible.
function! <SID>GotoExplorerWindow(which)
	let s:commandRunning = 1
	" first go to either the top left or the bottom right window.
	if a:which == '1'
		" goto to the top left and move in the bottom/right direction.
		wincmd t
		let winmovecmd = 'wincmd w'
	else
		wincmd b
		let winmovecmd = 'wincmd W'
	end
	" remember the window we started from.
	let startWin = winnr()
	let firstTime = 1
	" then begin cycling through all the windows either going in the
	" bottom/right direction or the top/left direction.
	while 1
		" if we are on an explorer window quit.
		if s:IsExplorerBuffer(bufnr('%'))
			let s:commandRunning = 0
			return
		end
		" if we have cycled through one complete time without hitting pay
		" dirt, quit.
		if winnr() == startWin && !firstTime
			" TODO: this will screw the @% and @# register.
			break
		end
		let firstTime = 0
		exe winmovecmd
	endwhile
	let s:commandRunning = 0
endfunction

" returns the explorer number if an explorer plugin exists with the specified
" buffer number
function! <SID>IsExplorerBuffer(num)
	let i = 1
	while i <= s:numExplorers
		if exists('s:explorerBufNum_'.i)
			exe 'let bufnum = s:explorerBufNum_'.i
			if bufnum == a:num
				return i
			end
		end
		let i = i + 1
	endwhile
	return 0
endfunction

" toggle showing the explorer plugins.
function! <SID>ToggleWindowsManager()
	if IsWinManagerVisible()
		call s:CloseWindowsManager()
	else
		call s:StartWindowsManager()
	end
endfunction

" exported function. returns the buffer number of the last file being edited
" in the file editing area.
function! WinManagerGetLastEditedFile(...)
	if a:0 == 0
		return s:MRUGet(1)
	else
		let ret = s:MRUGet(a:1)
		if ret == ''
			return matchstr(s:MRUList, ',\zs[0-9]\+\ze,$')
		else
			return ret
		end
endfunction


" exported function. returns 1 if any of the explorer windows are open,
" otherwise returns 0.
function! IsWinManagerVisible()
	let i = 1
	while i <= s:numExplorers
		if s:IsExplorerVisible(i) != -1
			return 1
		end
		let i = i + 1
	endwhile
	return 0
endfunction


" close all the visible explorer windows.
function! <SID>CloseWindowsManager()
	let s:commandRunning = 1

	let i = 1
	while i <= bufnr('$')
		let explNum = s:IsExplorerBuffer(i)
		if explNum > 0 && bufwinnr(i) != -1
			exe 'bd '.i
		end
		let i = i + 1
	endwhile

	let s:commandRunning = 0
endfunction

" provides a way to examine script local variables from outside the script.
" very handy for debugging.
function! <SID>ShowVariableValue(...)
	let i = 1
	while i <= a:0
		exe 'let arg = a:'.i
		if exists('s:'.arg) ||
		\  exists('*s:'.arg)
			exe 'let val = s:'.arg
			echomsg 's:'.arg.' = '.val
		end
		let i = i + 1
	endwhile
endfunction

" the following functions are hooks provided by winmanager to external plugins
" as a way to get winmanager to stop getting triggered on AUs. This is useful
" when an explorer plugin triggers a BufEnter or BufDelete *internally*. For
" example, bufexplorer.vim's "delete buffer" function triggers a BufDelete
" function.
"
function! WinManagerSuspendAUs()
	let s:commandRunning = 1
endfunction
function! WinManagerResumeAUs()
	let s:commandRunning = 0
endfunction

" Another hook provided by winmanager. Normally winmanager will call the
" plugins resize function every time the BufEnter or BufDelete event is
" triggered. However, sometimes a plugin might change the number of lines
" *internally*. In this case, the plugin could make a call to this function
" which will make a safety check and then call its resize function.
"
function! WinManagerForceReSize(explName)
	if !exists('s:'.a:explName.'_numberID') || !exists('*'.a:explName.'_ReSize')
		call PrintError('resize quitting because resize function not found or explorer not registered')
		return
	end
	exe 'let explNum = s:'.a:explName.'_numberID'
	let s:commandRunning = 1
	let windowNum = s:IsExplorerVisible(explNum)
	if windowNum == -1
		call PrintError('resize quitting because window not visible')
		return
	end
	call s:GotoWindow(windowNum)
	if s:IsOnlyVertical()
		call PrintError('resize quitting because its illegal')
		return
	end
	exe 'call '.a:explName.'_ReSize()'
	let s:commandRunning = 0
endfunction

" returns 1 if the only visible windows are explorer windows.
function! <SID>OnlyExplorerWindowsOpen()
	let i = 1
	" loop over all open windows
	while 1
		" if we have checked all open windows and not returned yet, then it
		" means only explorers are visible.
		if winbufnr(i) == -1
			return 1
		end
		" if this is a non-explorer window then return 0
		if !s:IsExplorerBuffer(winbufnr(i))
			return 0
		end
		let i = i + 1
	endwhile
endfunction

" MRUPush
function! <SID>MRUPush()
	if buflisted(bufnr("%")) && !isdirectory(bufname("%"))
		let _bufNbr = bufnr('%')
		let _list = substitute(s:MRUList, ','._bufNbr.',', ',', '')
		let s:MRUList = ','._bufNbr._list
		unlet _bufNbr _list
	end
endfunction

" MRUPop
function! <SID>MRUPop()
	let _bufNbr = expand('<abuf>')
	let s:MRUList = substitute(s:MRUList, ''._bufNbr.',', '', '')
	unlet _bufNbr
endfunction

" MRUGet
function! <SID>MRUGet(slot)
	let ret = s:Strntok2(s:MRUList, ',', a:slot)
	if ret == ''
		return -1
	end
	exe 'return '.ret
endfunction

" Strntok:
" extract the n^th token from s seperated by tok. 
" example: Strntok('1,23,3', ',', 2) = 23
fun! <SID>Strntok(s, tok, n)
	return matchstr( a:s.a:tok[0], '\v(\zs([^'.a:tok.']*)\ze['.a:tok.']){'.a:n.'}')
endfun

" Strntok2
" same as Strntok except that s is delimited by the tok character at the
" beginning and end.
" example: Strntok2(',1,23,3,', ',', 2) = 23
fun! <SID>Strntok2(s, tok, n)
	return matchstr( a:s, '\v((['.a:tok.']\zs[^'.a:tok.']*)\ze){'.a:n.'}')
endfun

" InitializeMRUList 
"
" initialize the MRU list. initially this will be just the buffers in the
" order of their buffer numbers with the @% and @# leading. The MRU list
" consists of a string of the following form: ",1,2,3,4,"
" NOTE: there are commas at the beginning and the end. this is to make
" identifying the position of buffers in the list easier even if they occur in
" the beginning or end and in situations where one buffer number is part of
" another. i.e the string "9" is part of the string "19"
" 
function! <SID>InitializeMRUList()
	let nBufs = bufnr('$')
	let _i = 1

	" put the % and the # numbers at the beginning if they are listed.
	let s:MRUList = ''
	if buflisted(bufnr("%"))
		let s:MRUList = ','.bufnr("%")
	end
	if buflisted(bufnr("#"))
		let s:MRUList = s:MRUList.','.bufnr("#")
	end
	let s:MRUList = s:MRUList.','
	
	" then proceed with the rest of the buffers
	while _i <= nBufs
		" dont keep unlisted buffers in the MRU list.
		if buflisted(_i) && bufnr("%") != _i && bufnr("#") != _i
			let s:MRUList = s:MRUList._i.','
		end
		let _i = _i + 1
	endwhile
	" Doing this makes bufexplorer.vim display the first two listed buffers as
	" @% and @# which they actually are when winmanager starts up after doing
	" something like:
	"    vim *.vim
	"    :WMtoggle
	let g:MRUList = s:MRUList
endfunction

if !g:defaultExplorer
	let loaded_explorer = 1
	"---
	" Set up the autocommand to allow directories to be edited
	"
	augroup fileExplorer
		au!
		au VimEnter * call s:EditDir("VimEnter")
		au BufEnter * call s:EditDir("BufEnter")
	augroup end
end

" handles editing a directory via winmanager.
function! <SID>EditDir(event)
	" return immediately if this isn't a directory.
	let name = expand("%")
	if name == ""
		let name = expand("%:p")
	endif
	if !isdirectory(name)
		return
	endif
	
	" if it is, then call the modified explorer.vim's Explore command.
	if a:event != "VimEnter"
 		if exists(":Explore")
 			ExploreInCurrentWindow
 		end
	end
	" if we have entered vim while editing a directory, then remove the
	" directory buffer, and start the window layout.
	" Note that we only start up winmanager in a VimEnter event because we
	" want commands such as ":e /some/dir/" within vim to have the same effect
	" as with the standard explorer.vim plugin which ships with vim.
	"
	" NOTE: if the user has chosen a layout where the FileExplorer is not at
	" the top-left, this will be unintuitive.
	if a:event == "VimEnter"
		bwipeout
		
		call s:StartWindowsManager()
		call s:MRUPush()
		call s:GotoExplorerWindow('1')
 	end
endfunction

" restore 'cpo'
let &cpo = s:cpo_save
unlet s:cpo_save
" vim:ts=4:noet:sw=4
                                                                                                                                                                                                                                                                                                                                                                                                                                                     .vim/plugin/wintagexplorer.vim                                                                      000644  000765  000024  00000032127 07452727431 017736  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         "=============================================================================
"        File: wintagexplorer.vim
"      Author: Srinath Avadhanula (srinath@eecs.berkeley.edu)
" Last Change: Wed Apr 03 05:00 PM 2002 PST
"        Help: This file provides a simple interface to a tags file. The tags
"              are grouped according to the file they belong to and the user can
"              press <enter> while on a tag to open the tag in an adjacent
"              window.
"
"              This file shows the implementation of an explorer plugin add-in
"              to winmanager.vim. As explained in |winmanager-adding|, this
"              function basically has to expose various functions which
"              winmanager calls during its refresh-diplay cycle. In turn, it
"              uses the function WinManagerRileEdit() supplied by
"              winmanager.vim.

" See ":help winmanager" for additional details.
" ============================================================================


" "TagsExplorer" is the "name" under which this plugin "registers" itself.
" Registration means including a line like:
"    RegisterExplorers "TagsExplorer"
" in the .vimrc. Registration provides a way to let the user customize the
" layout of the various windows. When a explorer is released, the user needs
" to know this "name" to register the plugin. 
"
" The first thing this plugin does is decide upon a "title" for itself. This is
" the name of the buffer which winmanager will open for displaying the
" contents of this plugin. Note that this variable has to be of the form:
"    g:<ExplorerName>_title
" where <ExplorerName> = "TagsExplorer" for this plugin.
let g:TagsExplorer_title = "[Tag List]"

" variables to remember the last position of the user within the file.
let s:savedCursorRow = 1
let s:savedCursorCol = 1

" skip display the error message if no tags file in current directory.
if !exists('g:TagsExplorerSkipError')
	let g:TagsExplorerSkipError = 0
end
if !exists('g:saveTagsDisplay')
	let g:saveTagsDisplay = 1
end

function! TagsExplorer_IsPossible()
	if glob('tags') == '' && g:TagsExplorerSkipError && !exists('s:tagsDisplay')
		return 0
	end
	return 1
endfunction

" This is the function which winmanager calls the first time this plugin is
" displayed. Again, the rule for the name of this function is:
" <ExplorerName>_Start()
"
function! TagsExplorer_Start()
	let _showcmd = &showcmd

	setlocal bufhidden=delete
	setlocal buftype=nofile
	setlocal modifiable
	setlocal noswapfile
	setlocal nowrap
	setlocal nobuflisted

	set noshowcmd

	" set up some _really_ elementary syntax highlighting.
	if has("syntax") && !has("syntax_items") && exists("g:syntax_on")
		syn match TagsExplorerFileName	'^\S*$'   
		syn match TagsExplorerTagName	'^  \S*' 
		syn match TagsExplorerError   '^"\s\+Error:'
		syn match TagsExplorerVariable 'g:TagsExplorerSkipError'
		syn match TagsExplorerIgnore '"$'

		hi def link TagsExplorerFileName Special
		hi def link TagsExplorerTagName String
		hi def link TagsExplorerError Error
		hi def link TagsExplorerVariable Comment
		hi def link TagsExplorerIgnore Ignore
	end

	" set up the maps.
	nnoremap <buffer> <silent> <c-]> :call <SID>OpenTag(0)<cr>
	nnoremap <buffer> <silent> <cr> :call <SID>OpenTag(0)<cr>
	nnoremap <buffer> <silent> <tab> :call <SID>OpenTag(1)<cr>
  	nnoremap <buffer> <silent> <2-leftmouse> :call <SID>OpenTag(0)<cr>
	nnoremap <buffer> <silent> <space> za
	nnoremap <buffer> <silent> <c-^> <Nop>
	nnoremap <buffer> <silent> <F5> :call <SID>DisplayTagsFile()<cr>

	call <SID>StartTagsFileDisplay()
	
	" clean up.
	setlocal nomodified
	let &showcmd = _showcmd
	unlet! _showcmd
endfunction

function! <SID>StartTagsFileDisplay()

	" if the tags were previously displayed, then they would have been saved
	" in this script variable. Therefore, just paste the contents of that
	" variable and quit.
	" instead of using just one variable, create a hash from the complete path
	" of the tags file so that tag files from multiple directories can be
	" displayed and there is caching for each of them.
	let presHash = substitute(fnamemodify('tags', ':p'), '[^a-zA-Z0-9]', '_', 'g')
	let taghash = ''
	if exists('s:tagHash_'.presHash)
		let taghash = 's:tagHash_'.presHash
		let dirhash = 's:dirHash_'.presHash
		let viewhash = 's:viewHash_'.presHash

		let s:lastHash = presHash
	elseif glob('tags') == '' && exists('s:lastHash')
		let taghash = 's:tagHash_'.s:lastHash
		let dirhash = 's:dirHash_'.s:lastHash
		let viewhash = 's:viewHash_'.s:lastHash
	end

	if taghash != ''

		setlocal modifiable
		1,$d_
		exe 'put='.taghash
		1d_
		setlocal nomodified
		setlocal nomodifiable

		" revert to the last saved view.
		exe 'call s:LoadView('.viewhash.')'
		exe 'let s:TagsDirectory = '.dirhash
		
		let s:lastHash = presHash
		return

	end

	if glob('.vimtagsdisplay') != '' && g:saveTagsDisplay


		let presHash = substitute(getcwd().'\tags', '[^a-zA-Z0-9]', '_', 'g')
		let taghash = 's:tagHash_'.presHash
		let dirhash = 's:dirHash_'.presHash
		let viewhash = 's:viewHash_'.presHash

		setlocal modifiable
		1,$ d_
		read .vimtagsdisplay
		let _a = @a
		0
		call search('^\S')
		1,.-1 d_
		normal! ggVG"ay
		exe 'let '.taghash.' = @a'
		let @a = _a
		call s:FoldTags()
		0
		setlocal nomodified
		setlocal nomodifiable

		exe 'let s:TagsDirectory = getcwd()'
		exe 'let '.dirhash.' = getcwd()'	
		exe 'let '.viewhash.' = s:MkViewNoNestedFolds()'
		let s:lastHash = presHash

		return

	elseif glob('tags') != ''


		let s:lastHash = substitute(fnamemodify('tags', ':p'), '[^a-zA-Z0-9]', '_', 'g')
		
		call <SID>DisplayTagsFile()

	else

	   call <SID>DisplayError()
	   " setting this variable results in the next invokations of
	   " TagsExplorer_IsPossible() to return 0. this makes
	   " EditNextVisibleExplorer() skip displaying the tags file the next time
	   " <C-n> is pressed.
	   let g:TagsExplorerSkipError = 1
	   return
	
	end

endfunction


function! <SID>DisplayTagsFile()

	let _showcmd = &showcmd
	let _report = &report
	set noshowcmd
	set report=10000
	setlocal modifiable

	if glob('tags') == ''
		return
	end

	1,$ d_
	silent! read tags

	" remove the leading comment lines.
	silent! % g/^!_/de
	" delete the first blank line which happens because of read
	0 d
	" if this is an empty tags file, then quit.
	if line('$') < 1 || getline(1) =~ '^\s*$'
		return
	end

	let startTime = localtime()
	% call s:GroupTags()
	let sortEndTime = localtime()
	
	call s:FoldTags()
	0
	let foldEndTime = localtime()

	let presHash = substitute(fnamemodify('tags', ':p'), '[^a-zA-Z0-9]', '_', 'g')
	let taghash = 's:tagHash_'.presHash
	let dirhash = 's:dirHash_'.presHash
	let viewhash = 's:viewHash_'.presHash

	" for fast redraw if this plugin is closed and reopened...
	let _a = @a
	normal! ggVG"ay
	exe 'let '.taghash.' = @a'
	let s:tagsDisplay = @a

	if g:saveTagsDisplay
		if glob('.vimtagsdisplay') != ''
			silent! redir! > .vimtagsdisplay
		else
			silent! redir > .vimtagsdisplay
		end
		silent! echo @a
		redir END
	end
		
	let @a = _a

	" store the directory of the current tags file location.
	exe 'let '.dirhash.' = getcwd()'
	exe 'let s:TagsDirectory = '.dirhash
	exe 'let '.viewhash.' = s:MkViewNoNestedFolds()'
	
	setlocal nomodified
	setlocal nomodifiable
	let &showcmd = _showcmd
	let &report = _report

endfunction

function! <SID>DisplayError()

	setlocal modifiable

	1,$ d_

    put='Error:'
    put=''
    put='No Tags File Found in the current directory. Try reopening WManager in a'
    put='directory which contains a tags file.'
    put=''
    put='An easy way to do this is to switch to the file explorer plugin (using <c-n>),'
    put='navigate to that directory, press \"c\" while there in order to set the pwd, and'
    put='then switch back to this view using <c-n>.'
    put=''
    put='This error message will not be shown for the remainder of this vim session.'
    put='To have it not appear at all, set g:TagsExplorerSkipError to 1 in your .vimrc'

	1d
	let _tw= &tw
	let &tw = g:winManagerWidth - 2
	normal! ggVGgq
	% s/$/"/g
	0

	let &tw = _tw

	setlocal nomodifiable
	setlocal nomodified

endfunction

function! TagsExplorer_WrapUp()
	if !exists('s:lastHash')
		return
	end
	
	let viewhash = 's:viewHash_'.s:lastHash
	exe 'let '.viewhash.' = s:MkViewNoNestedFolds()'
endfunction

function! TagsExplorer_IsValid()
	return 1
endfunction

function! <SID>OpenTag(split)
	let line = getline('.')
	" if ther is a quote at the end of the line, it means we are still
	" displaying the error message. 
	if match(line, '"$') != -1
		return
	end

	normal! 0
	" this is a tag, because it starts with a space.
	let tag = ''
	if line =~ '^\s'
		let tag = matchstr(getline('.'), '  \zs.*\ze')
		" go back and extract the file name
		let num = line('.')
		?^\S
		normal! 0
		let fname = getline('.')
		exe num
	else
		let fname = getline('.')
	end
	let _pwd = getcwd()
	exe 'cd '.s:TagsDirectory
	call WinManagerFileEdit(fnamemodify(fname, ':p'), a:split)
	exe 'cd '._pwd

	if tag != '' 
		exe 'silent! tag '.tag
	end
endfunction

" function to group tags according to which file they belong to...
" does not use the "% g" command. does the %g command introduce a O(n^2)
" nature into the algo?
function! <SID>GroupTags() range
	" get the first file
	let numfiles = 0
	
	let linenum = a:firstline

	while linenum <= a:lastline
		
		" extract the filename and the tag name from this line. this is
		" another potential speed killer.
		let tagname = matchstr(getline(linenum), '^[^\t]*\t\@=')
		let fname = matchstr(getline(linenum), '\t\zs[^\t]*\ze')

		" create a hash with this name.
		" this is the costliest operation in this loop. if the file names are
		" fully qualified and some 50 characters long, this might take very
		" long. however, every line _has_ to be processed and therefore
		" something has to be done with the filename. the only question is,
		" how clever can we get with that operation?
		let fhashname = substitute(fname, '[^a-zA-Z0-9_]', '_', 'g')

		if !exists('hash_'.fhashname)
			exe 'let hash_'.fhashname.' = ""'
			let numfiles = numfiles + 1
			exe 'let filehash_'.numfiles.' = fhashname'
			exe 'let filename_'.numfiles.' = fname'
		end
		" append this tag to the tag list corresponding to this file name.
		exe 'let hash_'.fhashname.' = hash_'.fhashname.'."  ".tagname."\n"'
		
		let linenum = linenum + 1
	endwhile
	0
	1,$ d_
	
	let i = 1
	while i <= numfiles
		$
		exe 'let hashname = filehash_'.i
		exe 'let tagsf = hash_'.hashname
		exe 'let filename = filename_'.i
		let disp = filename."\n".tagsf

		put=disp

		let i = i + 1
	endwhile
	0 d_
endfunction

function! <SID>FoldTags()
	
	setlocal foldmethod=manual
	1
	let lastLine = 1
	while 1
		if search('^\S', 'W')
			normal! k
			let presLine = line('.')
		else
			break
		end
		exe lastLine.','.presLine.' fold'
		normal! j
		let lastLine = line('.')
	endwhile
	exe lastLine.',$ fold'
endfunction

function! TE_ShowVariableValue(...)
	let i = 1
	while i <= a:0
		exe 'let arg = a:'.i
		if exists('s:'.arg) ||
		\  exists('*s:'.arg)
			exe 'let val = s:'.arg
			echomsg 's:'.arg.' = '.val
		end
		let i = i + 1
	endwhile
endfunction

" Synopsis: let foldInfo = s:MkViewNoNestedFolds()
" Description: returns the view information. This function is to be used when
"    it is known that there are no nested folds in the file (i.e folds with
"    depth > 1). when there are nested folds, this function silently ignores
"    them.
function! s:MkViewNoNestedFolds()
	let row = line('.')
	let col = virtcol('.')
	let viewInfo = row.'#'.col.'#'
	let openInfo = ''

	let i = 1
	while i <= line('$')
		if foldlevel(i) > 0
			let unfold = 0
			if foldclosedend(i) < 0
				exe i
				normal! zc
				let unfold = 1
				let openInfo = openInfo.0.','
			else
				let openInfo = openInfo.1.','
			end
			let j = foldclosedend(i)
			let viewInfo  = viewInfo.i.','.j.'|'
			if unfold
				exe i
				normal! zo
			end
			let i = j + 1
			continue
		end
		let i = i + 1
	endwhile
	
	let viewInfo = viewInfo.'#'.openInfo
	let viewInfo = substitute(viewInfo, '|#', '#', '')
	let viewInfo = substitute(viewInfo, ',$', '', '')

	exe row
	exe 'normal! '.col.'|'

	return viewInfo
endfunction

" Synopsis: call s:LoadView(foldInfo)
" Description: This function restores the view defined in the argument
"    foldInfo. See the description of MkView() for the format of this
"    argument. This function should only be used when the foldmethod of the
"    file is manual. There is no error-checking done in this function, so it
"    needs to be used responsibly.
function! s:LoadView(foldInfo)
	let row = s:Strntok(a:foldInfo, '#', 1)
	let col = s:Strntok(a:foldInfo, '#', 2)
	let folds = s:Strntok(a:foldInfo, '#', 3)
	let fclosedinfo = s:Strntok(a:foldInfo, '#', 4)
	
	normal! zE

	let i = 1
	let foldi = s:Strntok(folds, '|', i)
	let isclosed = s:Strntok(fclosedinfo, ',', i)

	while foldi != ''
		let n1 = s:Strntok(foldi, ',', 1)
		let n2 = s:Strntok(foldi, ',', 2)
		exe n1.','.n2.' fold'

		if !isclosed
			exe n1
			normal! zo
		end

		let i = i + 1
		let foldi = s:Strntok(folds, '|', i)
		let isclosed = s:Strntok(fclosedinfo, ',', i)
	endwhile

	exe row
	exe 'normal! '.col.'|'
endfunction

" Strntok:
" extract the n^th token from s seperated by tok. 
" example: Strntok('1,23,3', ',', 2) = 23
fun! <SID>Strntok(s, tok, n)
	return matchstr( a:s.a:tok[0], '\v(\zs([^'.a:tok.']*)\ze['.a:tok.']){'.a:n.'}')
endfun
                                                                                                                                                                                                                                                                                                                                                                                                                                         .vim/plugin/a.vim                                                                                   000644  000765  000024  00000075300 13147502325 015073  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " Copyright (c) 1998-2006
" Michael Sharpe <feline@irendi.com>
"
" We grant permission to use, copy modify, distribute, and sell this
" software for any purpose without fee, provided that the above copyright
" notice and this text are not removed. We make no guarantee about the
" suitability of this software for any purpose and we are not liable
" for any damages resulting from its use. Further, we are under no
" obligation to maintain or extend this software. It is provided on an
" "as is" basis without any expressed or implied warranty.

" Directory & regex enhancements added by Bindu Wavell who is well known on
" vim.sf.net
"
" Patch for spaces in files/directories from Nathan Stien (also reported by
" Soeren Sonnenburg)

" Do not load a.vim if is has already been loaded.
if exists("loaded_alternateFile")
    finish
endif
if (v:progname == "ex")
   finish
endif
let loaded_alternateFile = 1

let alternateExtensionsDict = {}

" setup the default set of alternate extensions. The user can override in thier
" .vimrc if the defaults are not suitable. To override in a .vimrc simply set a
" g:alternateExtensions_<EXT> variable to a comma separated list of alternates,
" where <EXT> is the extension to map.
" E.g. let g:alternateExtensions_CPP = "inc,h,H,HPP,hpp"
"      let g:alternateExtensions_{'aspx.cs'} = "aspx"


" This variable will be increased when an extension with greater number of dots
" is added by the AddAlternateExtensionMapping call.
let s:maxDotsInExtension = 1

" Function : AddAlternateExtensionMapping (PRIVATE)
" Purpose  : simple helper function to add the default alternate extension
"            mappings.
" Args     : extension -- the extension to map
"            alternates -- comma separated list of alternates extensions
" Returns  : nothing
" Author   : Michael Sharpe <feline@irendi.com>
function! <SID>AddAlternateExtensionMapping(extension, alternates)
   " This code does not actually work for variables like foo{'a.b.c.d.e'}
   "let varName = "g:alternateExtensions_" . a:extension
   "if (!exists(varName))
   "   let g:alternateExtensions_{a:extension} = a:alternates
   "endif

   " This code handles extensions which contains a dot. exists() fails with
   " such names.
   "let v:errmsg = ""
   " FIXME this line causes ex to return 1 instead of 0 for some reason??
   "silent! echo g:alternateExtensions_{a:extension}
   "if (v:errmsg != "")
      "let g:alternateExtensions_{a:extension} = a:alternates
   "endif

   let g:alternateExtensionsDict[a:extension] = a:alternates
   let dotsNumber = strlen(substitute(a:extension, "[^.]", "", "g"))
   if s:maxDotsInExtension < dotsNumber
     let s:maxDotsInExtension = dotsNumber
   endif
endfunction


" Add all the default extensions
" Mappings for C and C++
call <SID>AddAlternateExtensionMapping('h',"c,cpp,cxx,cc,CC")
call <SID>AddAlternateExtensionMapping('H',"C,CPP,CXX,CC")
call <SID>AddAlternateExtensionMapping('hpp',"cpp,c")
call <SID>AddAlternateExtensionMapping('HPP',"CPP,C")
call <SID>AddAlternateExtensionMapping('c',"h")
call <SID>AddAlternateExtensionMapping('C',"H")
call <SID>AddAlternateExtensionMapping('cpp',"h,hpp")
call <SID>AddAlternateExtensionMapping('CPP',"H,HPP")
call <SID>AddAlternateExtensionMapping('cc',"h")
call <SID>AddAlternateExtensionMapping('CC',"H,h")
call <SID>AddAlternateExtensionMapping('cxx',"h")
call <SID>AddAlternateExtensionMapping('CXX',"H")
" Mappings for PSL7
call <SID>AddAlternateExtensionMapping('psl',"ph")
call <SID>AddAlternateExtensionMapping('ph',"psl")
" Mappings for ADA
call <SID>AddAlternateExtensionMapping('adb',"ads")
call <SID>AddAlternateExtensionMapping('ads',"adb")
" Mappings for lex and yacc files
call <SID>AddAlternateExtensionMapping('l',"y,yacc,ypp")
call <SID>AddAlternateExtensionMapping('lex',"yacc,y,ypp")
call <SID>AddAlternateExtensionMapping('lpp',"ypp,y,yacc")
call <SID>AddAlternateExtensionMapping('y',"l,lex,lpp")
call <SID>AddAlternateExtensionMapping('yacc',"lex,l,lpp")
call <SID>AddAlternateExtensionMapping('ypp',"lpp,l,lex")
" Mappings for OCaml
call <SID>AddAlternateExtensionMapping('ml',"mli")
call <SID>AddAlternateExtensionMapping('mli',"ml")
" ASP stuff
call <SID>AddAlternateExtensionMapping('aspx.cs', 'aspx')
call <SID>AddAlternateExtensionMapping('aspx.vb', 'aspx')
call <SID>AddAlternateExtensionMapping('aspx', 'aspx.cs,aspx.vb')

" Setup default search path, unless the user has specified
" a path in their [._]vimrc. 
if (!exists('g:alternateSearchPath'))
  let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc'
endif

" If this variable is true then a.vim will not alternate to a file/buffer which
" does not exist. E.g while editing a.c and the :A will not swtich to a.h
" unless it exists.
if (!exists('g:alternateNoDefaultAlternate'))
   " by default a.vim will alternate to a file which does not exist
   let g:alternateNoDefaultAlternate = 0
endif

" If this variable is true then a.vim will convert the alternate filename to a
" filename relative to the current working directory.
" Feature by Nathan Huizinga
if (!exists('g:alternateRelativeFiles'))                                        
   " by default a.vim will not convert the filename to one relative to the
   " current working directory
   let g:alternateRelativeFiles = 0
endif


" Function : GetNthItemFromList (PRIVATE)
" Purpose  : Support reading items from a comma seperated list
"            Used to iterate all the extensions in an extension spec
"            Used to iterate all path prefixes
" Args     : list -- the list (extension spec, file paths) to iterate
"            n -- the extension to get
" Returns  : the nth item (extension, path) from the list (extension 
"            spec), or "" for failure
" Author   : Michael Sharpe <feline@irendi.com>
" History  : Renamed from GetNthExtensionFromSpec to GetNthItemFromList
"            to reflect a more generic use of this function. -- Bindu
function! <SID>GetNthItemFromList(list, n) 
   let itemStart = 0
   let itemEnd = -1
   let pos = 0
   let item = ""
   let i = 0
   while (i != a:n)
      let itemStart = itemEnd + 1
      let itemEnd = match(a:list, ",", itemStart)
      let i = i + 1
      if (itemEnd == -1)
         if (i == a:n)
            let itemEnd = strlen(a:list)
         endif
         break
      endif
   endwhile 
   if (itemEnd != -1) 
      let item = strpart(a:list, itemStart, itemEnd - itemStart)
   endif
   return item 
endfunction

" Function : ExpandAlternatePath (PRIVATE)
" Purpose  : Expand path info.  A path with a prefix of "wdr:" will be 
"            treated as relative to the working directory (i.e. the 
"            directory where vim was started.) A path prefix of "abs:" will 
"            be treated as absolute. No prefix or "sfr:" will result in the 
"            path being treated as relative to the source file (see sfPath 
"            argument). 
"
"            A prefix of "reg:" will treat the pathSpec as a regular
"            expression substitution that is applied to the source file 
"            path. The format is:
"
"              reg:<sep><pattern><sep><subst><sep><flag><sep>
"          
"            <sep> seperator character, we often use one of [/|%#] 
"            <pattern> is what you are looking for
"            <subst> is the output pattern
"            <flag> can be g for global replace or empty
"
"            EXAMPLE: 'reg:/inc/src/g/' will replace every instance 
"            of 'inc' with 'src' in the source file path. It is possible
"            to use match variables so you could do something like:
"            'reg:|src/\([^/]*\)|inc/\1||' (see 'help :substitute', 
"            'help pattern' and 'help sub-replace-special' for more details
"
"            NOTE: a.vim uses ',' (comma) internally so DON'T use it
"            in your regular expressions or other pathSpecs unless you update 
"            the rest of the a.vim code to use some other seperator.
"
" Args     : pathSpec -- path component (or substitution patterns)
"            sfPath -- source file path
" Returns  : a path that can be used by AlternateFile()
" Author   : Bindu Wavell <bindu@wavell.net>
function! <SID>ExpandAlternatePath(pathSpec, sfPath) 
   let prfx = strpart(a:pathSpec, 0, 4)
   if (prfx == "wdr:" || prfx == "abs:")
      let path = strpart(a:pathSpec, 4)
   elseif (prfx == "reg:")
      let re = strpart(a:pathSpec, 4)
      let sep = strpart(re, 0, 1)
      let patend = match(re, sep, 1)
      let pat = strpart(re, 1, patend - 1)
      let subend = match(re, sep, patend + 1)
      let sub = strpart(re, patend+1, subend - patend - 1)
      let flag = strpart(re, strlen(re) - 2)
      if (flag == sep)
        let flag = ''
      endif
      let path = substitute(a:sfPath, pat, sub, flag)
      "call confirm('PAT: [' . pat . '] SUB: [' . sub . ']')
      "call confirm(a:sfPath . ' => ' . path)
   else
      let path = a:pathSpec
      if (prfx == "sfr:")
         let path = strpart(path, 4)
      endif
      let path = a:sfPath . "/" . path
   endif
   return path
endfunction

" Function : FindFileInSearchPath (PRIVATE)
" Purpose  : Searches for a file in the search path list
" Args     : filename -- name of the file to search for
"            pathList -- the path list to search
"            relPathBase -- the path which relative paths are expanded from
" Returns  : An expanded filename if found, the empty string otherwise
" Author   : Michael Sharpe (feline@irendi.com)
" History  : inline code written by Bindu Wavell originally
function! <SID>FindFileInSearchPath(fileName, pathList, relPathBase)
   let filepath = ""
   let m = 1
   let pathListLen = strlen(a:pathList)
   if (pathListLen > 0)
      while (1)
         let pathSpec = <SID>GetNthItemFromList(a:pathList, m) 
         if (pathSpec != "")
            let path = <SID>ExpandAlternatePath(pathSpec, a:relPathBase)
            let fullname = path . "/" . a:fileName
            let foundMatch = <SID>BufferOrFileExists(fullname)
            if (foundMatch)
               let filepath = fullname
               break
            endif
         else
            break
         endif
         let m = m + 1
      endwhile
   endif
   return filepath
endfunction

" Function : FindFileInSearchPathEx (PRIVATE)
" Purpose  : Searches for a file in the search path list
" Args     : filename -- name of the file to search for
"            pathList -- the path list to search
"            relPathBase -- the path which relative paths are expanded from
"            count -- find the count'th occurence of the file on the path
" Returns  : An expanded filename if found, the empty string otherwise
" Author   : Michael Sharpe (feline@irendi.com)
" History  : Based on <SID>FindFileInSearchPath() but with extensions
function! <SID>FindFileInSearchPathEx(fileName, pathList, relPathBase, count)
   let filepath = ""
   let m = 1
   let spath = ""
   let pathListLen = strlen(a:pathList)
   if (pathListLen > 0)
      while (1)
         let pathSpec = <SID>GetNthItemFromList(a:pathList, m) 
         if (pathSpec != "")
            let path = <SID>ExpandAlternatePath(pathSpec, a:relPathBase)
            if (spath != "")
               let spath = spath . ','
            endif
            let spath = spath . path
         else
            break
         endif
         let m = m + 1
      endwhile
   endif

   if (&path != "")
      if (spath != "")
         let spath = spath . ','
      endif
      let spath = spath . &path
   endif

   let filepath = findfile(a:fileName, spath, a:count)
   return filepath
endfunction

" Function : EnumerateFilesByExtension (PRIVATE)
" Purpose  : enumerates all files by a particular list of alternate extensions.
" Args     : path -- path of a file (not including the file)
"            baseName -- base name of the file to be expanded
"            extension -- extension whose alternates are to be enumerated
" Returns  : comma separated list of files with extensions
" Author   : Michael Sharpe <feline@irendi.com>
function! EnumerateFilesByExtension(path, baseName, extension)
   let enumeration = ""
   let extSpec = ""
   let v:errmsg = ""
   silent! echo g:alternateExtensions_{a:extension}
   if (v:errmsg == "")
      let extSpec = g:alternateExtensions_{a:extension}
   endif
   if (extSpec == "")
      if (has_key(g:alternateExtensionsDict, a:extension))
         let extSpec = g:alternateExtensionsDict[a:extension]
      endif
   endif
   if (extSpec != "") 
      let n = 1
      let done = 0
      while (!done)
         let ext = <SID>GetNthItemFromList(extSpec, n)
         if (ext != "")
            if (a:path != "")
               let newFilename = a:path . "/" . a:baseName . "." . ext
            else
               let newFilename =  a:baseName . "." . ext
            endif
            if (enumeration == "")
               let enumeration = newFilename
            else
               let enumeration = enumeration . "," . newFilename
            endif
         else
            let done = 1
         endif
         let n = n + 1
      endwhile
   endif
   return enumeration
endfunction

" Function : EnumerateFilesByExtensionInPath (PRIVATE)
" Purpose  : enumerates all files by expanding the path list and the extension
"            list.
" Args     : baseName -- base name of the file
"            extension -- extension whose alternates are to be enumerated
"            pathList -- the list of paths to enumerate
"            relPath -- the path of the current file for expansion of relative
"                       paths in the path list.
" Returns  : A comma separated list of paths with extensions
" Author   : Michael Sharpe <feline@irendi.com>
function! EnumerateFilesByExtensionInPath(baseName, extension, pathList, relPathBase)
   let enumeration = ""
   let filepath = ""
   let m = 1
   let pathListLen = strlen(a:pathList)
   if (pathListLen > 0)
      while (1)
         let pathSpec = <SID>GetNthItemFromList(a:pathList, m) 
         if (pathSpec != "")
            let path = <SID>ExpandAlternatePath(pathSpec, a:relPathBase)
            let pe = EnumerateFilesByExtension(path, a:baseName, a:extension)
            if (enumeration == "")
               let enumeration = pe
            else
               let enumeration = enumeration . "," . pe
            endif
         else
            break
         endif
         let m = m + 1
      endwhile
   endif
   return enumeration
endfunction

" Function : DetermineExtension (PRIVATE)
" Purpose  : Determines the extension of a filename based on the register
"            alternate extension. This allow extension which contain dots to 
"            be considered. E.g. foo.aspx.cs to foo.aspx where an alternate
"            exists for the aspx.cs extension. Note that this will only accept
"            extensions which contain less than 5 dots. This is only
"            implemented in this manner for simplicity...it is doubtful that 
"            this will be a restriction in non-contrived situations.
" Args     : The path to the file to find the extension in
" Returns  : The matched extension if any
" Author   : Michael Sharpe (feline@irendi.com)
" History  : idea from Tom-Erik Duestad
" Notes    : there is some magic occuring here. The exists() function does not
"            work well when the curly brace variable has dots in it. And why
"            should it, dots are not valid in variable names. But the exists
"            function is wierd too. Lets say foo_c does exist. Then
"            exists("foo_c.e.f") will be true...even though the variable does 
"            not exist. However the curly brace variables do work when the
"            variable has dots in it. E.g foo_{'c'} is different from 
"            foo_{'c.d.e'}...and foo_{'c'} is identical to foo_c and
"            foo_{'c.d.e'} is identical to foo_c.d.e right? Yes in the current
"            implementation of vim. To trick vim to test for existence of such
"            variables echo the curly brace variable and look for an error 
"            message.
function! DetermineExtension(path) 
  let mods = ":t"
  let i = 0
  while i <= s:maxDotsInExtension
    let mods = mods . ":e"
    let extension = fnamemodify(a:path, mods)
    if (has_key(g:alternateExtensionsDict, extension))
       return extension
    endif
    let v:errmsg = ""
    silent! echo g:alternateExtensions_{extension}
    if (v:errmsg == "")
      return extension
    endif
    let i = i + 1
  endwhile
  return ""
endfunction

" Function : AlternateFile (PUBLIC)
" Purpose  : Opens a new buffer by looking at the extension of the current
"            buffer and finding the corresponding file. E.g. foo.c <--> foo.h
" Args     : accepts one argument. If present it used the argument as the new
"            extension.
" Returns  : nothing
" Author   : Michael Sharpe <feline@irendi.com>
" History  : + When an alternate can't be found in the same directory as the
"              source file, a search path will be traversed looking for the
"              alternates.
"            + Moved some code into a separate function, minor optimization
"            + rework to favor files in memory based on complete enumeration of
"              all files extensions and paths
function! AlternateFile(splitWindow, ...)
  let extension   = DetermineExtension(expand("%:p"))
  let baseName    = substitute(expand("%:t"), "\." . extension . '$', "", "")
  let currentPath = expand("%:p:h")

  if (a:0 != 0)
     let newFullname = currentPath . "/" .  baseName . "." . a:1
     call <SID>FindOrCreateBuffer(newFullname, a:splitWindow, 0)
  else
     let allfiles = ""
     if (extension != "")
        let allfiles1 = EnumerateFilesByExtension(currentPath, baseName, extension)
        let allfiles2 = EnumerateFilesByExtensionInPath(baseName, extension, g:alternateSearchPath, currentPath)

        if (allfiles1 != "")
           if (allfiles2 != "")
              let allfiles = allfiles1 . ',' . allfiles2
           else
              let allfiles = allfiles1
           endif
        else 
           let allfiles = allfiles2
        endif
     endif

     if (allfiles != "") 
        let bestFile = ""
        let bestScore = 0
        let score = 0
        let n = 1
         
        let onefile = <SID>GetNthItemFromList(allfiles, n)
        let bestFile = onefile
        while (onefile != "" && score < 2)
           let score = <SID>BufferOrFileExists(onefile)
           if (score > bestScore)
              let bestScore = score
              let bestFile = onefile
           endif
           let n = n + 1
           let onefile = <SID>GetNthItemFromList(allfiles, n)
        endwhile

        if (bestScore == 0 && g:alternateNoDefaultAlternate == 1)
           echo "No existing alternate available"
        else
           call <SID>FindOrCreateBuffer(bestFile, a:splitWindow, 1)
           let b:AlternateAllFiles = allfiles
        endif
     else
        echo "No alternate file/buffer available"
     endif
   endif
endfunction

" Function : AlternateOpenFileUnderCursor (PUBLIC)
" Purpose  : Opens file under the cursor
" Args     : splitWindow -- indicates how to open the file
" Returns  : Nothing
" Author   : Michael Sharpe (feline@irendi.com) www.irendi.com
function! AlternateOpenFileUnderCursor(splitWindow,...)
   let cursorFile = (a:0 > 0) ? a:1 : expand("<cfile>") 
   let currentPath = expand("%:p:h")
   let openCount = 1

   let fileName = <SID>FindFileInSearchPathEx(cursorFile, g:alternateSearchPath, currentPath, openCount)
   if (fileName != "")
      call <SID>FindOrCreateBuffer(fileName, a:splitWindow, 1)
      let b:openCount = openCount
      let b:cursorFile = cursorFile
      let b:currentPath = currentPath
   else
      echo "Can't find file"
   endif
endfunction

" Function : AlternateOpenNextFile (PUBLIC)
" Purpose  : Opens the next file corresponding to the search which found the 
"            current file
" Args     : bang -- indicates what to do if the current file has not been 
"                    saved
" Returns  : nothing
" Author   : Michael Sharpe (feline@irendi.com) www.irendi.com
function! AlternateOpenNextFile(bang)
   let cursorFile = ""
   if (exists("b:cursorFile"))
      let cursorFile = b:cursorFile
   endif

   let currentPath = ""
   if (exists("b:currentPath"))
      let currentPath = b:currentPath
   endif

   let openCount = 0
   if (exists("b:openCount"))
      let openCount = b:openCount + 1
   endif

   if (cursorFile != ""  && currentPath != ""  && openCount != 0)
      let fileName = <SID>FindFileInSearchPathEx(cursorFile, g:alternateSearchPath, currentPath, openCount)
      if (fileName != "")
         call <SID>FindOrCreateBuffer(fileName, "n".a:bang, 0)
         let b:openCount = openCount
         let b:cursorFile = cursorFile
         let b:currentPath = currentPath
      else 
         let fileName = <SID>FindFileInSearchPathEx(cursorFile, g:alternateSearchPath, currentPath, 1)
         if (fileName != "")
            call <SID>FindOrCreateBuffer(fileName, "n".a:bang, 0)
            let b:openCount = 1
            let b:cursorFile = cursorFile
            let b:currentPath = currentPath
         else
            echo "Can't find next file"
         endif
      endif
   endif
endfunction

comm! -nargs=? -bang IH call AlternateOpenFileUnderCursor("n<bang>", <f-args>)
comm! -nargs=? -bang IHS call AlternateOpenFileUnderCursor("h<bang>", <f-args>)
comm! -nargs=? -bang IHV call AlternateOpenFileUnderCursor("v<bang>", <f-args>)
comm! -nargs=? -bang IHT call AlternateOpenFileUnderCursor("t<bang>", <f-args>)
comm! -nargs=? -bang IHN call AlternateOpenNextFile("<bang>")
imap <Leader>ih <ESC>:IHS<CR>
nmap <Leader>ih :IHS<CR>
imap <Leader>is <ESC>:IHS<CR>:A<CR>
nmap <Leader>is :IHS<CR>:A<CR>
imap <Leader>ihn <ESC>:IHN<CR>
nmap <Leader>ihn :IHN<CR>

"function! <SID>PrintList(theList) 
"   let n = 1
"   let oneFile = <SID>GetNthItemFromList(a:theList, n)
"   while (oneFile != "")
"      let n = n + 1
"      let oneFile = <SID>GetNthItemFromList(a:theList, n)
"   endwhile
"endfunction

" Function : NextAlternate (PUBLIC)
" Purpose  : Used to cycle through any other alternate file which existed on
"            the search path.
" Args     : bang (IN) - used to implement the AN vs AN! functionality
" Returns  : nothing
" Author   : Michael Sharpe <feline@irendi.com>
function! NextAlternate(bang)
   if (exists('b:AlternateAllFiles'))
      let currentFile = expand("%")
      let n = 1
      let onefile = <SID>GetNthItemFromList(b:AlternateAllFiles, n)
      while (onefile != "" && !<SID>EqualFilePaths(fnamemodify(onefile,":p"), fnamemodify(currentFile,":p")))
         let n = n + 1
         let onefile = <SID>GetNthItemFromList(b:AlternateAllFiles, n)
      endwhile

      if (onefile != "")
         let stop = n
         let n = n + 1
         let foundAlternate = 0
         let nextAlternate = ""
         while (n != stop)
            let nextAlternate = <SID>GetNthItemFromList(b:AlternateAllFiles, n)
            if (nextAlternate == "")
               let n = 1
               continue
            endif
            let n = n + 1
            if (<SID>EqualFilePaths(fnamemodify(nextAlternate, ":p"), fnamemodify(currentFile, ":p")))
                continue
            endif
            if (filereadable(nextAlternate))
                " on cygwin filereadable("foo.H") returns true if "foo.h" exists
               if (has("unix") && $WINDIR != "" && fnamemodify(nextAlternate, ":p") ==? fnamemodify(currentFile, ":p")) 
                  continue
               endif
               let foundAlternate = 1
               break
            endif
         endwhile
         if (foundAlternate == 1)
            let s:AlternateAllFiles = b:AlternateAllFiles
            "silent! execute ":e".a:bang." " . nextAlternate
            call <SID>FindOrCreateBuffer(nextAlternate, "n".a:bang, 0)
            let b:AlternateAllFiles = s:AlternateAllFiles
         else 
            echo "Only this alternate file exists"
         endif
      else 
         echo "Could not find current file in alternates list"
      endif
   else 
      echo "No other alternate files exist"
   endif
endfunction

comm! -nargs=? -bang A call AlternateFile("n<bang>", <f-args>)
comm! -nargs=? -bang AS call AlternateFile("h<bang>", <f-args>)
comm! -nargs=? -bang AV call AlternateFile("v<bang>", <f-args>)
comm! -nargs=? -bang AT call AlternateFile("t<bang>", <f-args>)
comm! -nargs=? -bang AN call NextAlternate("<bang>")

" Function : BufferOrFileExists (PRIVATE)
" Purpose  : determines if a buffer or a readable file exists
" Args     : fileName (IN) - name of the file to check
" Returns  : 2 if it exists in memory, 1 if it exists, 0 otherwise
" Author   : Michael Sharpe <feline@irendi.com>
" History  : Updated code to handle buffernames using just the
"            filename and not the path.
function! <SID>BufferOrFileExists(fileName)
   let result = 0

   let lastBuffer = bufnr("$")
   let i = 1
   while i <= lastBuffer
     if <SID>EqualFilePaths(expand("#".i.":p"), a:fileName)
       let result = 2
       break
     endif
     let i = i + 1
   endwhile

   if (!result) 
      let bufName = fnamemodify(a:fileName,":t")
      let memBufName = bufname(bufName)
      if (memBufName != "")
         let memBufBasename = fnamemodify(memBufName, ":t")
         if (bufName == memBufBasename)
            let result = 2
         endif
      endif

      if (!result)
         let result  = bufexists(bufName) || bufexists(a:fileName) || filereadable(a:fileName)
      endif
   endif

   if (!result)
      let result = filereadable(a:fileName)
   endif
   return result
endfunction

" Function : FindOrCreateBuffer (PRIVATE)
" Purpose  : searches the buffer list (:ls) for the specified filename. If
"            found, checks the window list for the buffer. If the buffer is in
"            an already open window, it switches to the window. If the buffer
"            was not in a window, it switches to that buffer. If the buffer did
"            not exist, it creates it.
" Args     : filename (IN) -- the name of the file
"            doSplit (IN) -- indicates whether the window should be split
"                            ("v", "h", "n", "v!", "h!", "n!", "t", "t!") 
"            findSimilar (IN) -- indicate weather existing buffers should be
"                                prefered
" Returns  : nothing
" Author   : Michael Sharpe <feline@irendi.com>
" History  : + bufname() was not working very well with the possibly strange
"            paths that can abound with the search path so updated this
"            slightly.  -- Bindu
"            + updated window switching code to make it more efficient -- Bindu
"            Allow ! to be applied to buffer/split/editing commands for more
"            vim/vi like consistency
"            + implemented fix from Matt Perry
function! <SID>FindOrCreateBuffer(fileName, doSplit, findSimilar)
  " Check to see if the buffer is already open before re-opening it.
  let FILENAME = escape(a:fileName, ' ')
  let bufNr = -1
  let lastBuffer = bufnr("$")
  let i = 1
  if (a:findSimilar) 
     while i <= lastBuffer
       if <SID>EqualFilePaths(expand("#".i.":p"), a:fileName)
         let bufNr = i
         break
       endif
       let i = i + 1
     endwhile

     if (bufNr == -1)
        let bufName = bufname(a:fileName)
        let bufFilename = fnamemodify(a:fileName,":t")

        if (bufName == "")
           let bufName = bufname(bufFilename)
        endif

        if (bufName != "")
           let tail = fnamemodify(bufName, ":t")
           if (tail != bufFilename)
              let bufName = ""
           endif
        endif
        if (bufName != "")
           let bufNr = bufnr(bufName)
           let FILENAME = bufName
        endif
     endif
  endif

  if (g:alternateRelativeFiles == 1)                                            
        let FILENAME = fnamemodify(FILENAME, ":p:.")
  endif

  let splitType = a:doSplit[0]
  let bang = a:doSplit[1]
  if (bufNr == -1)
     " Buffer did not exist....create it
     let v:errmsg=""
     if (splitType == "h")
        silent! execute ":split".bang." " . FILENAME
     elseif (splitType == "v")
        silent! execute ":vsplit".bang." " . FILENAME
     elseif (splitType == "t")
        silent! execute ":tab split".bang." " . FILENAME
     else
        silent! execute ":e".bang." " . FILENAME
     endif
     if (v:errmsg != "")
        echo v:errmsg
     endif
  else

     " Find the correct tab corresponding to the existing buffer
     let tabNr = -1
     " iterate tab pages
     for i in range(tabpagenr('$'))
        " get the list of buffers in the tab
        let tabList =  tabpagebuflist(i + 1)
        let idx = 0
        " iterate each buffer in the list
        while idx < len(tabList)
           " if it matches the buffer we are looking for...
           if (tabList[idx] == bufNr)
              " ... save the number
              let tabNr = i + 1
              break
           endif
           let idx = idx + 1
        endwhile
        if (tabNr != -1)
           break
        endif
     endfor
     " switch the the tab containing the buffer
     if (tabNr != -1)
        execute "tabn ".tabNr
     endif

     " Buffer was already open......check to see if it is in a window
     let bufWindow = bufwinnr(bufNr)
     if (bufWindow == -1) 
        " Buffer was not in a window so open one
        let v:errmsg=""
        if (splitType == "h")
           silent! execute ":sbuffer".bang." " . FILENAME
        elseif (splitType == "v")
           silent! execute ":vert sbuffer " . FILENAME
        elseif (splitType == "t")
           silent! execute ":tab sbuffer " . FILENAME
        else
           silent! execute ":buffer".bang." " . FILENAME
        endif
        if (v:errmsg != "")
           echo v:errmsg
        endif
     else
        " Buffer is already in a window so switch to the window
        execute bufWindow."wincmd w"
        if (bufWindow != winnr()) 
           " something wierd happened...open the buffer
           let v:errmsg=""
           if (splitType == "h")
              silent! execute ":split".bang." " . FILENAME
           elseif (splitType == "v")
              silent! execute ":vsplit".bang." " . FILENAME
           elseif (splitType == "t")
              silent! execute ":tab split".bang." " . FILENAME
           else
              silent! execute ":e".bang." " . FILENAME
           endif
           if (v:errmsg != "")
              echo v:errmsg
           endif
        endif
     endif
  endif
endfunction

" Function : EqualFilePaths (PRIVATE)
" Purpose  : Compares two paths. Do simple string comparison anywhere but on
"            Windows. On Windows take into account that file paths could differ
"            in usage of separators and the fact that case does not matter.
"            "c:\WINDOWS" is the same path as "c:/windows". has("win32unix") Vim
"            version does not count as one having Windows path rules.
" Args     : path1 (IN) -- first path
"            path2 (IN) -- second path
" Returns  : 1 if path1 is equal to path2, 0 otherwise.
" Author   : Ilya Bobir <ilya@po4ta.com>
function! <SID>EqualFilePaths(path1, path2)
  if has("win16") || has("win32") || has("win64") || has("win95")
    return substitute(a:path1, "\/", "\\", "g") ==? substitute(a:path2, "\/", "\\", "g")
  else
    return a:path1 == a:path2
  endif
endfunction
                                                                                                                                                                                                                                                                                                                                .vim/plugin/winfileexplorer.vim                                                                     000644  000765  000024  00000114555 07452727431 020110  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         "=============================================================================
" File: explorer.vim
" Author: M A Aziz Ahmed (aziz@acorn-networks.com)
" Last Change: Sun Mar 31 11:00 PM 2002 PST
" Version: 2.5
" Additions by Mark Waggoner (waggoner@aracnet.com) et al.
"-----------------------------------------------------------------------------
" This file implements a file explorer. Latest version available at:
" http://www.freespeech.org/aziz/vim/
" Updated version available at:
" http://www.aracnet.com/~waggoner
"-----------------------------------------------------------------------------
" Normally, this file will reside in the plugins directory and be
" automatically sourced.  If not, you must manually source this file
" using :source explorer.vim
"
" To use it, just edit a directory (vi dirname) or type :Explore to
" launch the file explorer in the current window, or :Sexplore to split
" the current window and launch explorer there.
"
" If the current buffer is modified, the window is always split.
"
" It is also possible to delete files and rename files within explorer.
" See :help file-explorer for more details
"
"-----------------------------------------------------------------------------
" Update history removed, it's not very interesting.
" Contributors were: Doug Potts, Bram Moolenaar, Thomas K�hler
"
" This is a modified version to be compatible with winmanager.vim. 
" Changes by Srinath Avadhanula
"=============================================================================

" Has this already been loaded?
if exists("loaded_winfileexplorer")
  finish
endif
let loaded_winfileexplorer=1

" Line continuation used here
let s:cpo_save = &cpo
set cpo&vim

"---
" Default settings for global configuration variables

" Split vertically instead of horizontally?
if !exists("g:explVertical")
  let g:explVertical=0
endif

" How big to make the window? Set to "" to avoid resizing
if !exists("g:explWinSize")
  let g:explWinSize=15
endif

" When opening a new file/directory, split below current window (or
" above)?  1 = below, 0 = to above
if !exists("g:explSplitBelow")
  let g:explSplitBelow = &splitbelow
endif

" Split to right of current window (or to left)?
" 1 = to right, 0 = to left
if !exists("g:explSplitRight")
  let g:explSplitRight = &splitright
endif

" Start the first explorer window...
" Defaults to be the same as explSplitBelow
if !exists("g:explStartBelow")
  let g:explStartBelow = g:explSplitBelow
endif

" Start the first explorer window...
" Defaults to be the same as explSplitRight
if !exists("g:explStartRight")
  let g:explStartRight = g:explSplitRight
endif

" Show detailed help?
if !exists("g:explDetailedHelp")
  let g:explDetailedHelp=0
endif

" Show file size and dates?
if !exists("g:explDetailedList")
  let g:explDetailedList=0
endif

" Format for the date
if !exists("g:explDateFormat")
  let g:explDateFormat="%d %b %Y %H:%M"
endif

" Files to hide
if !exists("g:explHideFiles")
  let g:explHideFiles=''
endif

" Field to sort by
if !exists("g:explSortBy")
  let g:explSortBy='name'
endif

" Segregate directories? 1, 0, or -1
if !exists("g:explDirsFirst")
  let g:explDirsFirst=1
endif

" Segregate items in suffixes option? 1, 0, or -1
if !exists("g:explSuffixesLast")
  let g:explSuffixesLast=1
endif

" Include separator lines between directories, files, and suffixes?
if !exists("g:explUseSeparators")
  let g:explUseSeparators=0
endif

" whether or not to take over the functioning of the default file-explorer
" plugin
if !exists("g:defaultExplorer")
	let g:defaultExplorer = 1
end

if !exists('g:favDirs')
	if exists('$HOME')
		let s:favDirs = expand('$HOME').'/'
	end
else
	if exists('$HOME')
		let s:favDirs = g:favDirs."\/\n".expand('$HOME')
	end
end
let s:favDirs = substitute(s:favDirs, '\', '/', 'g')
let s:favDirs = substitute(s:favDirs, '\/\/', '\/', 'g')

" -- stuff used by winmanager
let g:FileExplorer_title = "[File List]"
function! FileExplorer_Start()
	let b:displayMode = "winmanager"
	if exists('s:lastDirectoryDisplayed')
		call s:EditDir(s:lastDirectoryDisplayed)
	else
		call s:EditDir(expand("%:p:h"))
	end
	if exists('s:lastCursorRow')
		exe s:lastCursorRow
		exe 'normal! '.s:lastCursorColumn.'|'
	end
endfunction

function! FileExplorer_IsValid()
	return 1
endfunction

function! FileExplorer_WrapUp()
	let s:lastCursorRow = line('.')
	let s:lastCursorColumn = virtcol('.')
	let s:lastDirectoryDisplayed = b:completePath
endfunction
" --- end winmanager specific stuff (for now)

"---
" script variables - these are the same across all
" explorer windows

" characters that must be escaped for a regular expression
let s:escregexp = '/*^$.~\'

" characters that must be escaped for filenames
if has("dos16") || has("dos32") || has("win16") || has("win32") || has("os2")
  let s:escfilename = ' %#'
else
  let s:escfilename = ' \%#'
endif


" A line to use for separating sections
let s:separator='"---------------------------------------------------'

"---
" Create commands
" commenting stuff for beta version release
" if !exists(':Explore')
"   command -n=? -complete=dir Explore :call s:StartExplorer(0, '<a>')
" endif
" if !exists(':Sexplore')
"   command -n=? -complete=dir Sexplore :call s:StartExplorer(1, '<a>')
" endif
" 
"---
" Start the explorer using the preferences from the global variables
"
function! s:StartExplorer(split, start_dir)
	let startcmd = "edit"
	if a:start_dir != ""
		let fname=a:start_dir
	else
		let fname = expand("%:p:h")
	endif
	if fname == ""
		let fname = getcwd()
	endif

	" Create a variable to use if splitting vertically
	let splitMode = ""
	if g:explVertical == 1
		let splitMode = "vertical"
	endif

	" Save the user's settings for splitbelow and splitright
	let savesplitbelow = &splitbelow
	let savesplitright = &splitright

	if a:split || &modified
		let startcmd = splitMode . " " . g:explWinSize . "new " . fname
		let &splitbelow = g:explStartBelow
		let &splitright = g:explStartRight
	else
		let startcmd = "edit " . fname
	endif
	silent execute startcmd
	let &splitbelow = savesplitbelow
	let &splitright = savesplitright
endfunction


"---
" This is the main entry for 'editing' a directory
"
function! s:EditDir(...)
	" depending on the number of arguments, this function has either been called
	" by winmanager or by doing "e dirname" or :Explore
	if a:0 == 0
		" Get out of here right away if this isn't a directory!
		let name = expand("%")
		if name == ""
			let name = expand("%:p")
		endif
	elseif a:0 >= 1
		let name = a:1
		set modifiable
		1,$d_
	end	
	if a:0 >= 2 
		let forceReDisplay = a:2
	else
		let forceReDisplay = 0
	end

	if !isdirectory(name)
		return
	endif

	" Turn off the swapfile, set the buffer type so that it won't get
	" written, and so that it will get deleted when it gets hidden.
	setlocal modifiable
	setlocal noswapfile
	setlocal buftype=nowrite
	setlocal bufhidden=delete
	" Don't wrap around long lines
	setlocal nowrap


	" Get the complete path to the directory to look at with a slash at
	" the end
	let b:completePath = s:Path(name)
	let s:lastDirectoryDisplayed = b:completePath

	" Save the directory we are currently in and chdir to the directory
	" we are editing so that we can get a real path to the directory,
	" eliminating things like ".."
	let origdir= s:Path(getcwd())
	exe "chdir" escape(b:completePath,s:escfilename)
	let b:completePath = s:Path(getcwd())
	exe "chdir" escape(origdir,s:escfilename)

	" Add a slash at the end
	if b:completePath !~ '/$'
		let b:completePath = b:completePath . '/'
	endif

	" escape special characters for exec commands
	let b:completePathEsc=escape(b:completePath,s:escfilename)
	let b:parentDirEsc=substitute(b:completePathEsc, '/[^/]*/$', '/', 'g')

	" Set filter for hiding files
	let b:filterFormula=substitute(g:explHideFiles, '\([^\\]\),', '\1\\|', 'g')
	if b:filterFormula != ''
		let b:filtering="\nNot showing: " . b:filterFormula
	else
		let b:filtering=""
	endif


	" added to allow directory caching
	" s:numFileBuffers is an array containing the names of the directories
	" visited.
	if !exists("s:numFileBuffers")
		let s:numFileBuffers = 0
	end

	let i = 1
	while i <= s:numFileBuffers
		exec 'let diri = s:dir_'.i
		if diri == b:completePath
			" if we are on a previously displayed directory which is being redrawn
			" forcibly, then skip the stage of pasting from memory ... 
			if !forceReDisplay
				let oldRep=&report
				let save_sc = &sc
				set report=10000 nosc
				1,$d _
				exec 'put=s:FileList_'.i
				0d
				0
				let b:maxFileLen = 0
				/^"=/+1,$g/^/call s:MarkDirs()
				call s:CleanUpHistory()
				call s:PrintFavDirs()
				0
				/^"=/+1
				call s:CleanUpHistory()
				let &report=oldRep
				let &sc = save_sc
			end
			" ... merely remember the variable number and break.
			let s:currentFileNumberDisplayed = i
			break
		endif
		let i = i+1	
	endwhile

	" No need for any insertmode abbreviations, since we don't allow
	" insertions anyway!
	iabc <buffer>

	" Long or short listing?  Use the global variable the first time
	" explorer is called, after that use the script variable as set by
	" the interactive user.
	if exists("s:longlist")
		let w:longlist = s:longlist
	else
		let w:longlist = g:explDetailedList
	endif

	" Show keyboard shortcuts?
	if exists("s:longhelp")
		let w:longhelp = s:longhelp
	else
		let w:longhelp = g:explDetailedHelp
	endif

	" Set the sort based on the global variables the first time.  If you
	" later change the sort order, it will be retained in the s:sortby
	" variable for the next time you open explorer
	let w:sortdirection=1
	let w:sortdirlabel = ""
	let w:sorttype = ""
	if exists("s:sortby")
		let sortby=s:sortby
	else
		let sortby=g:explSortBy
	endif
	if sortby =~ "reverse"
		let w:sortdirection=-1
		let w:sortdirlabel = "reverse "
	endif
	if sortby =~ "date"
		let w:sorttype = "date"
	elseif sortby =~ "size"
		let w:sorttype = "size"
	else
		let w:sorttype = "name"
	endif
	call s:SetSuffixesLast()

	" Set up syntax highlighting
	" Something wrong with the evaluation of the conditional though...
	if has("syntax") && exists("g:syntax_on") && !has("syntax_items")
		syn match browseSynopsis    "^\"[ -].*"
		syn match favoriteDirectory "^+ .*$"
		syn match browseDirectory   "[^\"+].*/ "
		syn match browseDirectory   "[^\"+].*/$"
		syn match browseCurDir      "^\"= .*$"
		syn match browseSortBy      "^\" Sorted by .*$"  contains=browseSuffixInfo
		syn match browseSuffixInfo  "(.*)$"  contained
		syn match browseFilter      "^\" Not Showing:.*$"
		syn match browseFiletime    "�\d\+$"
		exec('syn match browseSuffixes    "' . b:suffixesHighlight . '"')

		"hi def link browseSynopsis    PreProc
		hi def link browseSynopsis    Special
		hi def link browseDirectory   Directory
		hi def link browseCurDir      Statement
		hi def link favoriteDirectory Type
		hi def link browseSortBy      String
		hi def link browseSuffixInfo  Type
		hi def link browseFilter      String
		hi def link browseFiletime    Ignore
		hi def link browseSuffixes    Type
	endif
	" Set up mappings for this buffer
	let cpo_save = &cpo
	set cpo&vim

	if exists("b:displayMode") && b:displayMode == "winmanager"
		" when called in winmanager mode, the argument movefirst assumes the role
		" of whether or not to split a window.
		nnoremap <buffer> <cr> :call <SID>EditEntry(0,"winmanager")<cr>
		nnoremap <buffer> <tab> :call <SID>EditEntry(1,"winmanager")<cr>
		nnoremap <buffer> -    :call <SID>EditDir(b:parentDirEsc)<cr>
		nnoremap <buffer> <2-leftmouse> :call <SID>EditEntry(0,"winmanager")<cr>
		nnoremap <buffer> C    :call <SID>EditDir(getcwd(),1)<cr>:call <SID>RestoreFileDisplay()<cr>
		nnoremap <buffer> <F5> :call <SID>EditDir(b:completePath,1)<cr>:call <SID>RestoreFileDisplay()<cr>
		nnoremap <buffer> <C-^> <Nop>
		nnoremap <buffer> f :call <SID>AddToFavDir()<cr>
	else
		nnoremap <buffer> <cr> :call <SID>EditEntry("","edit")<cr>
		nnoremap <buffer> -    :exec ("silent e "  . b:parentDirEsc)<cr>
		nnoremap <buffer> o    :call <SID>OpenEntry()<cr>
		nnoremap <buffer> O    :call <SID>OpenEntryPrevWindow()<cr>
		nnoremap <buffer> <2-leftmouse> :call <SID>DoubleClick()<cr>
	endif
	nnoremap <buffer> p   :call <SID>EditEntry("","pedit")<cr>
	nnoremap <buffer> a   :call <SID>ShowAllFiles()<cr>:call <SID>RestoreFileDisplay()<cr>
	nnoremap <buffer> R   :call <SID>RenameFile()<cr>
	nnoremap <buffer> D   :. call <SID>DeleteFile()<cr>:call <SID>RestoreFileDisplay()<cr>
	vnoremap <buffer> D   :call <SID>DeleteFile()<cr>:call <SID>RestoreFileDisplay()<cr>
	nnoremap <buffer> i   :call <SID>ToggleLongList()<cr>:call <SID>RestoreFileDisplay()<cr>
	nnoremap <buffer> s   :call <SID>SortSelect()<cr>:call <SID>RestoreFileDisplay()<cr>
	nnoremap <buffer> r   :call <SID>SortReverse()<cr>:call <SID>RestoreFileDisplay()<cr>
	nnoremap <buffer> ?   :call <SID>ToggleHelp()<cr>
	nnoremap <buffer> a   :call <SID>ShowAllFiles()<cr>:call <SID>RestoreFileDisplay()<cr>
	nnoremap <buffer> R   :call <SID>RenameFile()<cr>
	nnoremap <buffer> c   :exec "cd ".b:completePathEsc<cr>:pwd<cr>
	let &cpo = cpo_save

	" If directory is already loaded, don't open it again!
	if line('$') > 1
		setlocal nomodifiable
		return
	endif

	" Show the files
	call s:ShowDirectory()
	call s:PrintFavDirs()

	" prevent the buffer from being modified
	setlocal nomodifiable

	" remember the contents of this directory if its been displayed for the
	" first time for fast redraw later. if we have reached here bcause of a
	" forcible redraw, do not create a new s:dir_i variable.
	if !forceReDisplay
		let s:numFileBuffers = s:numFileBuffers + 1
		let s:currentFileNumberDisplayed = s:numFileBuffers
		exe 'let s:dir_'.s:currentFileNumberDisplayed.' = b:completePath'
	end
	0
	/^"=/+1
	call s:CleanUpHistory()
	call s:RestoreFileDisplay()
endfunction

"---
" If this is the only window, open file in a new window
" Otherwise, open file in the most recently visited window
"
function! s:OpenEntryPrevWindow()
	" Figure out if there are any other windows
	let n = winnr()
	wincmd p
	" No other window?  Then open a new one
	if n == winnr()
		call s:OpenEntry()
		" Other windows exist
	else
		" Check if the previous buffer is modified - ask if they want to
		" save!
		let bufname = bufname(winbufnr(winnr()))
		if &modified
			let action=confirm("Save Changes in " . bufname . "?","&Yes\n&No\n&Cancel")
			" Yes - try to save - if there is an error, cancel
			if action == 1
				let v:errmsg = ""
				silent w
				if v:errmsg != ""
					echoerr "Unable to write buffer!"
					wincmd p
					return
				endif
				" No, abandon changes
			elseif action == 2
				set nomodified
				echomsg "Warning, abandoning changes in " . bufname
				" Cancel (or any other result), don't do the open
			else
				wincmd p
				return
			endif
		endif
		wincmd p
		call s:EditEntry("wincmd p","edit")
	endif
endfunction

"
" save the contents of the currently displayed file listing into the current
" s:dir_i variable
"
function! s:RestoreFileDisplay()
	let oldRep=&report
	let save_sc = &sc
	set report=10000 nosc
	let presLine = line('.')

	let saverega = @a
	normal! ggVG"ay
	exec 'let s:FileList_'.s:currentFileNumberDisplayed.' = @a'
	let @a = saverega

	let &report=oldRep
	let &sc = save_sc
	exe presLine
endfunction

"---
" Open a file or directory in a new window.
" Use g:explSplitBelow and g:explSplitRight to decide where to put the
" split window, and resize the original explorer window if it is
" larger than g:explWinSize
"
function! s:OpenEntry()
  " Are we on a line with a file name?
  let l = getline(".")
  if l =~ '^"'
    return
  endif

  " Copy window settings to script settings
  let s:sortby=w:sortdirlabel . w:sorttype
  let s:longhelp = w:longhelp
  let s:longlist = w:longlist

  " Get the window number of the explorer window
  let n = winnr()

  " Save the user's settings for splitbelow and splitright
  let savesplitbelow=&splitbelow
  let savesplitright=&splitright

  " Figure out how to do the split based on the user's preferences.
  " We want to split to the (left,right,top,bottom) of the explorer
  " window, but we want to extract the screen real-estate from the
  " window next to the explorer if possible.
  "
  " 'there' will be set to a command to move from the split window
  " back to the explorer window
  "
  " 'back' will be set to a command to move from the explorer window
  " back to the newly split window
  "
  " 'right' and 'below' will be set to the settings needed for
  " splitbelow and splitright IF the explorer is the only window.
  "
  if g:explVertical
    if g:explSplitRight
      let there="wincmd h"
      let back ="wincmd l"
      let right=1
      let below=0
    else
      let there="wincmd l"
      let back ="wincmd h"
      let right=0
      let below=0
    endif
  else
    if g:explSplitBelow
      let there="wincmd k"
      let back ="wincmd j"
      let right=0
      let below=1
    else
      let there="wincmd j"
      let back ="wincmd k"
      let right=0
      let below=0
    endif
  endif

  " Get the file name
  let fn=s:GetFullFileName()

  " Attempt to go to adjacent window
  exec(back)
  " If no adjacent window, set splitright and splitbelow appropriately
  if n == winnr()
    let &splitright=right
    let &splitbelow=below
  else
    " found adjacent window - invert split direction
    let &splitright=!right
    let &splitbelow=!below
  endif

  " Create a variable to use if splitting vertically
  let splitMode = ""
  if g:explVertical == 1
    let splitMode = "vertical"
  endif

  " Is it a directory?  If so, get a real path to it instead of
  " relative path
  if isdirectory(fn)
    let origdir= s:Path(getcwd())
    exe "chdir" escape(fn,s:escfilename)
    let fn = s:Path(getcwd())
    exe "chdir" escape(origdir,s:escfilename)
  endif

  " Open the new window
  exec("silent " . splitMode." sp " . escape(fn,s:escfilename))

  " resize the explorer window if it is larger than the requested size
  exec(there)
  if g:explWinSize =~ '[0-9]\+' && winheight("") > g:explWinSize
    exec("silent ".splitMode." resize ".g:explWinSize)
  endif
  exec(back)

  " Restore splitmode settings
  let &splitbelow=savesplitbelow
  let &splitright=savesplitright

endfunction

"---
" Double click with the mouse
"
function s:DoubleClick()
	if expand("<cfile>") =~ '[\\/]$'
		call s:EditEntry("","edit")		" directory: open in this window
	else
		call s:OpenEntryPrevWindow()	" file: open in another window
	endif
endfun

"---
" Open file or directory in the same window as the explorer is
" currently in
"
function! s:EditEntry(movefirst,editcmd)
  " Are we on a line with a file name?
  let l = getline(".")
  if l =~ '^"'
    return
  endif

  " Copy window settings to script settings
  let s:sortby=w:sortdirlabel . w:sorttype
  let s:longhelp = w:longhelp
  let s:longlist = w:longlist

  " Get the file name
  let fn=s:GetFullFileName()
  if isdirectory(fn)
    let origdir= s:Path(getcwd())
    exe "chdir" escape(fn,s:escfilename)
    let fn = s:Path(getcwd())
    exe "chdir" escape(origdir,s:escfilename)
  endif

	" if its the original explorer using this function, then proceed as before.
	if !(exists("b:displayMode") && b:displayMode == "winmanager")
		" Move to desired window if needed
		exec(a:movefirst)
		" Edit the file/dir
		exec(a:editcmd . " " . escape(fn,s:escfilename))
	" otherwise if its winmanager which called it, then do things the winmanager
	" way, i.e, open directories in the same buffer and open files in the last
	" visited file editing area (splitting if necessary)
	else
		if isdirectory(fn)
			" callinng EditDir ensures that things are displayed in the same buffer.
			call s:EditDir(fn)
		else
			" this function is provided by winmanager. it takes focus to the last
			" visited buffer in the file editing area and then opens the new file in
			" its place, while taking into consideration whether that buffer was
			" modified, or whether the user wants to force a split each time, etc.
			call WinManagerFileEdit(fn, a:movefirst)
		end
	end
endfunction

"---
" Create a regular expression out of the suffixes option for sorting
" and set a string to indicate whether we are sorting with the
" suffixes at the end (or the beginning)
"
function! s:SetSuffixesLast()
	let b:suffixesRegexp = '\(' . substitute(escape(&suffixes,s:escregexp),',','\\|','g') . '\)$'
	let b:suffixesHighlight = '^[^"].*\(' . substitute(escape(&suffixes,s:escregexp),',','\\|','g') . '\)\( \|$\)'
	if has("fname_case")
		let b:suffixesRegexp = '\C' . b:suffixesRegexp
		let b:suffixesHighlight = '\C' . b:suffixesHighlight
	else
		let b:suffixesRegexp = '\c' . b:suffixesRegexp
		let b:suffixesHighlight = '\c' . b:suffixesHighlight
	endif
	if g:explSuffixesLast > 0 && &suffixes != ""
		let b:suffixeslast=" (" . &suffixes . " at end of list)"
	elseif g:explSuffixesLast < 0 && &suffixes != ""
		let b:suffixeslast=" (" . &suffixes . " at start of list)"
	else
		let b:suffixeslast=" ('suffixes' mixed with files)"
	endif
endfunction

"---
" Show the header and contents of the directory
"
function! s:ShowDirectory()
	" Prevent a report of our actions from showing up
	let oldRep=&report
	let save_sc = &sc
	set report=10000 nosc

	"Delete all lines
	1,$d _

	" Add the header
	call s:AddHeader()
	$d _

	" Display the files

	" Get a list of all the files
	let files = s:Path(glob(b:completePath."*"))
	if files != "" && files !~ '\n$'
		let files = files . "\n"
	endif

	" Add the dot files now, making sure "." is not included!
	let files = files . substitute(s:Path(glob(b:completePath.".*")), "[^\n]*/./\\=\n", '' , '')
	if files != "" && files !~ '\n$'
		let files = files . "\n"
	endif

	" Are there any files left after filtering?
	if files != ""
		normal! mt
		put =files
		let b:maxFileLen = 0
		0
		/^"=/+1,$g/^/call s:MarkDirs()
		call s:CleanUpHistory()
		normal! `t
		call s:AddFileInfo()
	endif

	normal! zz

	" Move to first directory in the listing
	0
	/^"=/+1
	call s:CleanUpHistory()

	" Do the sort
	call s:SortListing("Loaded contents of ".b:completePath.". ")

	" Move to first directory in the listing
	0
	/^"=/+1
	call s:CleanUpHistory()

	let &report=oldRep
	let &sc = save_sc

endfunction

function! s:AddToFavDir()

	if s:favDirs !~ "\\(^\\|\n\\)".b:completePath."\\(\n\\|$\\)"
		let s:favDirs = s:favDirs."\n".b:completePath
	else
		return
	endif

	let pos = (line('.')+1).' | normal! '.virtcol('.').'|'
	call s:PrintFavDirs()
	exe pos
endfunction

"---
" Mark which items are directories - called once for each file name
" must be used only when size/date is not displayed
"
function! s:MarkDirs()
	let oldRep=&report
	set report=1000
	"Remove slashes if added
	s;/$;;e
	"Removes all the leading slashes and adds slashes at the end of directories
	s;^.*\\\([^\\]*\)$;\1;e
	s;^.*/\([^/]*\)$;\1;e
	"normal! ^
	let currLine=getline(".")
	if isdirectory(b:completePath . currLine)
		s;$;/;
		let fileLen=strlen(currLine)+1
	else
		let fileLen=strlen(currLine)
		if (b:filterFormula!="") && (currLine =~ b:filterFormula)
			" Don't show the file if it is to be filtered.
			d _
		endif
	endif
	if fileLen > b:maxFileLen
		let b:maxFileLen=fileLen
	endif
	let &report=oldRep
endfunction

"---
" Make sure a path has proper form
"
function! s:Path(p)
	if has("dos16") || has("dos32") || has("win16") || has("win32") || has("os2")
		return substitute(a:p,'\\','/','g')
	else
		return a:p
	endif
endfunction

"---
" Extract the file name from a line in several different forms
"
function! s:GetFullFileNameEsc()
    return s:EscapeFilename(s:GetFullFileName())
endfunction

function! s:GetFileNameEsc()
    return s:EscapeFilename(s:GetFileName())
endfunction

function! s:EscapeFilename(name)
    return escape(a:name,s:escfilename)
endfunction


function! s:GetFullFileName()
	if getline('.') =~ '+ '
		if match(getline('.'), '(.*)') > 0
			return matchstr(getline('.'), '(\zs.*\ze)')
		else
			return strpart(getline('.'), 2, 1000)
		endif
	endif
	return s:ExtractFullFileName(getline("."))
endfunction

function! s:GetFileName()
	return s:ExtractFileName(getline("."))
endfunction

function! s:ExtractFullFileName(line)
	let fn=s:ExtractFileName(a:line)
	if fn == '/'
		return b:completePath
	else
		return b:completePath . s:ExtractFileName(a:line)
	endif
endfunction

function! s:ExtractFileName(line)
	return substitute(strpart(a:line,0,b:maxFileLen),'\s\+$','','')
endfunction

"---
" Get the size of the file
function! s:ExtractFileSize(line)
	if (w:longlist==0)
		return getfsize(s:ExtractFileName(a:line))
	else
		return strpart(a:line,b:maxFileLen+2,b:maxFileSizeLen);
	endif
endfunction

"---
" Get the date of the file as a number
function! s:ExtractFileDate(line)
	if w:longlist==0
		return getftime(s:ExtractFileName(a:line))
	else
		return strpart(matchstr(strpart(a:line,b:maxFileLen+b:maxFileSizeLen+4),"�.*"),1) + 0
	endif
endfunction


"---
" Add the header with help information
"
function! s:AddHeader()
	let save_f=@f
	1
	if w:longhelp==1
		let @f="\" <enter> : open file or directory\n"
			\."\" o : open new window for file/directory\n"
			\."\" O : open file in previously visited window\n"
			\."\" p : preview the file\n"
			\."\" i : toggle size/date listing\n"
			\."\" s : select sort field    r : reverse sort\n"
			\."\" - : go up one level      c : cd to this dir\n"
			\."\" R : rename file          D : delete file\n"
			\."\" f : add current directory to favourites\n"
			\."\" :help file-explorer for detailed help\n"
	else
		let @f="\" Press ? for keyboard shortcuts\n"
	endif
	let @f=@f."\" Sorted by ".w:sortdirlabel.w:sorttype.b:suffixeslast.b:filtering."\n"
	let @f=@f."\"= ".b:completePath."\n"
	put! f
	let @f=save_f
endfunction

function! s:PrintFavDirs()
	if !exists('s:favDirs')
		return
	end
	setlocal modifiable
	0
	if search('^"=')
		exe  'silent! 1,'.line('.').' g/^+ .*$/d _'
	else
		call s:CleanUpHistory()
		setlocal nomodifiable nomodified
		return
	endif
	call s:CleanUpHistory()
	let favDirs = s:favDirs
	let favDirs = substitute(favDirs, "\\(^\\|\n\\)", '\1+ ', 'g')
	let favDirs = substitute(favDirs, '$', "\n", '')
	0
	call search('^"=')
	silent! put!=favDirs
	silent! g/^+ /s/\v^\+ (.*)\/([^\/]+\/=)$/+ \2 (\1\/\2)
	call s:CleanUpHistory()
	call s:CleanUpHistory()
	setlocal nomodifiable nomodified
endfunction

"---
" Show the size and date for each file
"
function! s:AddFileInfo()
	let save_sc = &sc
	set nosc

	" Mark our starting point
	normal! mt

	call s:RemoveSeparators()

	" Remove all info
	0
	/^"=/+1,$g/^/call setline(line("."),s:GetFileName())
	call s:CleanUpHistory()

	" Add info if requested
	if w:longlist==1
		" Add file size and calculate maximum length of file size field
		let b:maxFileSizeLen = 0
		0
		/^"=/+1,$g/^/let fn=s:GetFullFileName() |
			\let fileSize=getfsize(fn) |
			\let fileSizeLen=strlen(fileSize) |
			\if fileSizeLen > b:maxFileSizeLen |
			\   let b:maxFileSizeLen = fileSizeLen |
			\endif |
			\exec "normal! ".(b:maxFileLen-strlen(getline("."))+2)."A \<esc>" |
			\exec 's/$/'.fileSize.'/'
		call s:CleanUpHistory()

		" Right justify the file sizes and
		" add file modification date
		0
		/^"=/+1,$g/^/let fn=s:GetFullFileName() |
			\exec "normal! A \<esc>$b".(b:maxFileLen+b:maxFileSizeLen-strlen(getline("."))+3)."i \<esc>\"_x" |
			\exec 's/$/ '.escape(s:FileModDate(fn), '/').'/'
		call s:CleanUpHistory()
		setlocal nomodified
	endif

	call s:AddSeparators()

	" return to start
	normal! `t

	let &sc = save_sc
endfunction


"----
" Get the modification time for a file
"
function! s:FileModDate(name)
	let filetime=getftime(a:name)
	if filetime > 0
		return strftime(g:explDateFormat,filetime) . " �" . filetime
	else
		return ""
	endif
endfunction

"---
" Delete a file or files
"
function! s:DeleteFile() range
	let oldRep = &report
	let &report = 1000

	let filesDeleted = 0
	let stopDel = 0
	let delAll = 0
	let currLine = a:firstline
	let lastLine = a:lastline
	setlocal modifiable

	while ((currLine <= lastLine) && (stopDel==0))
		exec(currLine)
		let fileName=s:GetFullFileName()
		if isdirectory(fileName)
			echo fileName." : Directory deletion not supported yet"
			let currLine = currLine + 1
		else
			if delAll == 0
				let sure=input("Delete ".fileName." (y/n/a/q)? ")
				if sure=="a"
					let delAll = 1
				endif
			endif
			if (sure=="y") || (sure=="a")
				let success=delete(fileName)
				if success!=0
					exec (" ")
					echo "\nCannot delete ".fileName
					let currLine = currLine + 1
				else
					d _
					let filesDeleted = filesDeleted + 1
					let lastLine = lastLine - 1
				endif
			elseif sure=="q"
				let stopDel = 1
			elseif sure=="n"
				let currLine = currLine + 1
			endif
		endif
	endwhile
	echo "\n".filesDeleted." files deleted"
	let &report = oldRep
	setlocal nomodified
	setlocal nomodifiable
endfunction

"---
" Rename a file
"
function! s:RenameFile()
	let fileName=s:GetFullFileName()
	setlocal modifiable
	if isdirectory(fileName)
		echo "Directory renaming not supported yet"
	elseif filereadable(fileName)
		let altName=input("Rename ".fileName." to : ")
		echo " "
		if altName==""
			setlocal nomodifiable
			return
		endif
		let success=rename(fileName, b:completePath.altName)
		if success!=0
			echo "Cannot rename ".fileName. " to ".altName
		else
			echo "Renamed ".fileName." to ".altName
			let oldRep=&report
			set report=1000
			" e!
			" instead of generating a bufEnter event if we use e!, use EditDir. It
			" doesnt matter that EditDir() is called with more than 0 arguments
			" whether or not winmanager is active because at this location, we have
			" a buffer open anyway.
			call s:EditDir(b:completePath, 1)
			let &report=oldRep
		endif
	endif
	setlocal nomodified
	setlocal nomodifiable
	call s:RestoreFileDisplay()
endfunction

"---
" Toggle between short and long help
"
function! s:ToggleHelp()
	if exists("w:longhelp") && w:longhelp==0
		let w:longhelp=1
		let s:longhelp=1
	else
		let w:longhelp=0
		let s:longhelp=0
	endif
	" Allow modification
	setlocal modifiable
	call s:UpdateHeader()
	" Disallow modification
	setlocal nomodifiable
endfunction

"---
" Update the header
"
function! s:UpdateHeader()
	let oldRep=&report
	set report=10000
	" Save position
	normal! mt
	" Remove old header
	0
	1,/^"=/ d _
	call s:CleanUpHistory()
	" Add new header
	call s:AddHeader()
	" Go back where we came from if possible
	0
	if line("'t") != 0
		normal! `t
	endif

	let &report=oldRep
	setlocal nomodified
endfunction

"---
" Toggle long vs. short listing
"
function! s:ToggleLongList()
	setlocal modifiable
	if exists("w:longlist") && w:longlist==1
		let w:longlist=0
		let s:longlist=0
	else
		let w:longlist=1
		let s:longlist=1
	endif
	call s:AddFileInfo()
	setlocal nomodifiable
endfunction

"---
" Show all files - remove filtering
"
function! s:ShowAllFiles()
	setlocal modifiable
	let b:filterFormula=""
	let b:filtering=""
	call s:ShowDirectory()
	setlocal nomodifiable
endfunction

"---
" Figure out what section we are in
"
function! s:GetSection()
	let fn=s:GetFileName()
	let section="file"
	if fn =~ '/$'
		let section="directory"
	elseif fn =~ b:suffixesRegexp
		let section="suffixes"
	endif
	return section
endfunction

"---
" Remove section separators
"
function! s:RemoveSeparators()
  if !g:explUseSeparators
    return
  endif
  0
  silent! exec '/^"=/+1,$g/^' . s:separator . "/d _"
  call s:CleanUpHistory()
endfunction

"---
" Add section separators
"   between directories and files if they are separated
"   between files and 'suffixes' files if they are separated
function! s:AddSeparators()
  if !g:explUseSeparators
    return
  endif
  0
  /^"=/+1
  call s:CleanUpHistory()
  let lastsec=s:GetSection()
  +1
  .,$g/^/let sec=s:GetSection() |
               \if g:explDirsFirst != 0 && sec != lastsec &&
               \   (lastsec == "directory" || sec == "directory") |
               \  exec "normal! I" . s:separator . "\n\<esc>" |
               \elseif g:explSuffixesLast != 0 && sec != lastsec &&
               \   (lastsec == "suffixes" || sec == "suffixes") |
               \  exec "normal! I" . s:separator . "\n\<esc>" |
               \endif |
               \let lastsec=sec
endfunction

"---
" General string comparison function
"
function! s:StrCmp(line1, line2, direction)
	if a:line1 < a:line2
		return -a:direction
	elseif a:line1 > a:line2
		return a:direction
	else
		return 0
	endif
endfunction

"---
" Function for use with Sort(), to compare the file names
" Default sort is to put in alphabetical order, but with all directory
" names before all file names
"
function! s:FileNameCmp(line1, line2, direction)
	let f1=s:ExtractFileName(a:line1)
	let f2=s:ExtractFileName(a:line2)

	" Put directory names before file names
	if (g:explDirsFirst != 0) && (f1 =~ '\/$') && (f2 !~ '\/$')
		return -g:explDirsFirst
	elseif (g:explDirsFirst != 0) && (f1 !~ '\/$') && (f2 =~ '\/$')
		return g:explDirsFirst
	elseif (g:explSuffixesLast != 0) && (f1 =~ b:suffixesRegexp) && (f2 !~ b:suffixesRegexp)
		return g:explSuffixesLast
	elseif (g:explSuffixesLast != 0) && (f1 !~ b:suffixesRegexp) && (f2 =~ b:suffixesRegexp)
		return -g:explSuffixesLast
	else
		return s:StrCmp(f1,f2,a:direction)
	endif

endfunction

"---
" Function for use with Sort(), to compare the file modification dates
" Default sort is to put NEWEST files first.  Reverse will put oldest
" files first
"
function! s:FileDateCmp(line1, line2, direction)
	let f1=s:ExtractFileName(a:line1)
	let f2=s:ExtractFileName(a:line2)
	let t1=s:ExtractFileDate(a:line1)
	let t2=s:ExtractFileDate(a:line2)

	" Put directory names before file names
	if (g:explDirsFirst != 0) && (f1 =~ '\/$') && (f2 !~ '\/$')
		return -g:explDirsFirst
	elseif (g:explDirsFirst != 0) && (f1 !~ '\/$') && (f2 =~ '\/$')
		return g:explDirsFirst
	elseif (g:explSuffixesLast != 0) && (f1 =~ b:suffixesRegexp) && (f2 !~ b:suffixesRegexp)
		return g:explSuffixesLast
	elseif (g:explSuffixesLast != 0) && (f1 !~ b:suffixesRegexp) && (f2 =~ b:suffixesRegexp)
		return -g:explSuffixesLast
	elseif t1 > t2
		return -a:direction
	elseif t1 < t2
		return a:direction
	else
		return s:StrCmp(f1,f2,1)
	endif
endfunction

"---
" Function for use with Sort(), to compare the file sizes
" Default sort is to put largest files first.  Reverse will put
" smallest files first
"
function! s:FileSizeCmp(line1, line2, direction)
	let f1=s:ExtractFileName(a:line1)
	let f2=s:ExtractFileName(a:line2)
	let s1=s:ExtractFileSize(a:line1)
	let s2=s:ExtractFileSize(a:line2)

	if (g:explDirsFirst != 0) && (f1 =~ '\/$') && (f2 !~ '\/$')
		return -g:explDirsFirst
	elseif (g:explDirsFirst != 0) && (f1 !~ '\/$') && (f2 =~ '\/$')
		return g:explDirsFirst
	elseif (g:explSuffixesLast != 0) && (f1 =~ b:suffixesRegexp) && (f2 !~ b:suffixesRegexp)
		return g:explSuffixesLast
	elseif (g:explSuffixesLast != 0) && (f1 !~ b:suffixesRegexp) && (f2 =~ b:suffixesRegexp)
		return -g:explSuffixesLast
	elseif s1 > s2
		return -a:direction
	elseif s1 < s2
		return a:direction
	else
		return s:StrCmp(f1,f2,1)
	endif
endfunction

"---
" Sort lines.  SortR() is called recursively.
"
function! s:SortR(start, end, cmp, direction)

  " Bottom of the recursion if start reaches end
  if a:start >= a:end
    return
  endif
  "
  let partition = a:start - 1
  let middle = partition
  let partStr = getline((a:start + a:end) / 2)
  let i = a:start
  while (i <= a:end)
    let str = getline(i)
    exec "let result = " . a:cmp . "(str, partStr, " . a:direction . ")"
    if result <= 0
      " Need to put it before the partition.  Swap lines i and partition.
      let partition = partition + 1
      if result == 0
        let middle = partition
      endif
      if i != partition
        let str2 = getline(partition)
        call setline(i, str2)
        call setline(partition, str)
      endif
    endif
    let i = i + 1
  endwhile

  " Now we have a pointer to the "middle" element, as far as partitioning
  " goes, which could be anywhere before the partition.  Make sure it is at
  " the end of the partition.
  if middle != partition
	  let str = getline(middle)
	  let str2 = getline(partition)
	  call setline(middle, str2)
	  call setline(partition, str)
  endif
  call s:SortR(a:start, partition - 1, a:cmp,a:direction)
  call s:SortR(partition + 1, a:end, a:cmp,a:direction)
endfunction

"---
" To Sort a range of lines, pass the range to Sort() along with the name of a
" function that will compare two lines.
"
function! s:Sort(cmp,direction) range
	call s:SortR(a:firstline, a:lastline, a:cmp, a:direction)
endfunction

"---
" Reverse the current sort order
"
function! s:SortReverse()
	if exists("w:sortdirection") && w:sortdirection == -1
		let w:sortdirection = 1
		let w:sortdirlabel  = ""
	else
		let w:sortdirection = -1
		let w:sortdirlabel  = "reverse "
	endif
	let s:sortby=w:sortdirlabel . w:sorttype
	call s:SortListing("")
endfunction

"---
" Toggle through the different sort orders
"
function! s:SortSelect()
	" Select the next sort option
	if !exists("w:sorttype")
		let w:sorttype="name"
	elseif w:sorttype == "name"
		let w:sorttype="size"
	elseif w:sorttype == "size"
		let w:sorttype="date"
	else
		let w:sorttype="name"
	endif
	let s:sortby=w:sortdirlabel . w:sorttype
	call s:SortListing("")
endfunction

"---
" Sort the file listing
"
function! s:SortListing(msg)
    " Save the line we start on so we can go back there when done
    " sorting
    let startline = getline(".")
    let col=col(".")
    let lin=line(".")

    " Allow modification
    setlocal modifiable

    " Send a message about what we're doing
    " Don't really need this - it can cause hit return prompts
"   echo a:msg . "Sorting by" . w:sortdirlabel . w:sorttype

    " Create a regular expression out of the suffixes option in case
    " we need it.
    call s:SetSuffixesLast()

    " Remove section separators
    call s:RemoveSeparators()

    " Do the sort
    0
    if w:sorttype == "size"
      /^"=/+1,$call s:Sort("s:FileSizeCmp",w:sortdirection)
    elseif w:sorttype == "date"
      /^"=/+1,$call s:Sort("s:FileDateCmp",w:sortdirection)
    else
      /^"=/+1,$call s:Sort("s:FileNameCmp",w:sortdirection)
    endif
  	call s:CleanUpHistory()

    " Replace the header with updated information
    call s:UpdateHeader()

    " Restore section separators
    call s:AddSeparators()

    " Return to the position we started on
    0
    if search('\m^'.escape(startline,s:escregexp),'W') <= 0
      execute lin
    endif
    execute "normal!" col . "|"

    " Disallow modification
    setlocal nomodified
    setlocal nomodifiable

endfunction

if !g:defaultExplorer
	let loaded_explorer = 1
	"---
	" Create commands
	if !exists(':Explore')
		command -n=? -complete=dir Explore :call s:StartExplorer(0, '<a>')
	endif
	if !exists(':Sexplore')
		command -n=? -complete=dir Sexplore :call s:StartExplorer(1, '<a>')
	endif
	" NOTE: This is a special command NOT to be used by users. Its here for
	" communication between winmanager and explorer.vim. This command only works
	" if you are currently 'editing' a directory, in which case, you dont need
	" this anyway. USE AT YOUR OWN RISK.
	if !exists(':ExploreInCurrentWindow')
		command -n=? -complete=dir ExploreInCurrentWindow :call <SID>EditDir()
	endif
end

" CleanUpHistory
function! <SID>CleanUpHistory()
  call histdel("/", -1)
  let @/ = histget("/", -1)
endfunction

" restore 'cpo'
let &cpo = s:cpo_save
unlet s:cpo_save


" vim: ts=4:noet:sw=4
                                                                                                                                                   .vim/plugin/ctrlp.vim                                                                               000644  000765  000024  00000004661 12626714374 016013  0                                                                                                    ustar 00yaoxin125                       staff                           000000  000000                                                                                                                                                                         " =============================================================================
" File:          plugin/ctrlp.vim
" Description:   Fuzzy file, buffer, mru, tag, etc finder.
" Author:        Kien Nguyen <github.com/kien>
" =============================================================================
" GetLatestVimScripts: 3736 1 :AutoInstall: ctrlp.zip

if ( exists('g:loaded_ctrlp') && g:loaded_ctrlp ) || v:version < 700 || &cp
	fini
en
let g:loaded_ctrlp = 1

let [g:ctrlp_lines, g:ctrlp_allfiles, g:ctrlp_alltags, g:ctrlp_alldirs,
	\ g:ctrlp_allmixes, g:ctrlp_buftags, g:ctrlp_ext_vars, g:ctrlp_builtins]
	\ = [[], [], [], [], {}, {}, [], 2]

if !exists('g:ctrlp_map') | let g:ctrlp_map = '<c-p>' | en
if !exists('g:ctrlp_cmd') | let g:ctrlp_cmd = 'CtrlP' | en

com! -n=? -com=dir CtrlP         cal ctrlp#init(0, { 'dir': <q-args> })
com! -n=? -com=dir CtrlPMRUFiles cal ctrlp#init(2, { 'dir': <q-args> })

com! -bar CtrlPBuffer   cal ctrlp#init(1)
com! -n=? CtrlPLastMode cal ctrlp#init(-1, { 'args': <q-args> })

com! -bar CtrlPClearCache     cal ctrlp#clr()
com! -bar CtrlPClearAllCaches cal ctrlp#clra()

com! -bar ClearCtrlPCache     cal ctrlp#clr()
com! -bar ClearAllCtrlPCaches cal ctrlp#clra()

com! -bar CtrlPCurWD   cal ctrlp#init(0, { 'mode': '' })
com! -bar CtrlPCurFile cal ctrlp#init(0, { 'mode': 'c' })
com! -bar CtrlPRoot    cal ctrlp#init(0, { 'mode': 'r' })

if g:ctrlp_map != '' && !hasmapto(':<c-u>'.g:ctrlp_cmd.'<cr>', 'n')
	exe 'nn <silent>' g:ctrlp_map ':<c-u>'.g:ctrlp_cmd.'<cr>'
en

cal ctrlp#mrufiles#init()

com! -bar CtrlPTag      cal ctrlp#init(ctrlp#tag#id())
com! -bar CtrlPQuickfix cal ctrlp#init(ctrlp#quickfix#id())

com! -n=? -com=dir CtrlPDir
	\ cal ctrlp#init(ctrlp#dir#id(), { 'dir': <q-args> })

com! -n=? -com=buffer CtrlPBufTag
	\ cal ctrlp#init(ctrlp#buffertag#cmd(0, <q-args>))

com! -bar CtrlPBufTagAll cal ctrlp#init(ctrlp#buffertag#cmd(1))
com! -bar CtrlPRTS       cal ctrlp#init(ctrlp#rtscript#id())
com! -bar CtrlPUndo      cal ctrlp#init(ctrlp#undo#id())

com! -n=? -com=buffer CtrlPLine
	\ cal ctrlp#init(ctrlp#line#cmd(1, <q-args>))

com! -n=? -com=buffer CtrlPChange
	\ cal ctrlp#init(ctrlp#changes#cmd(0, <q-args>))

com! -bar CtrlPChangeAll   cal ctrlp#init(ctrlp#changes#cmd(1))
com! -bar CtrlPMixed       cal ctrlp#init(ctrlp#mixed#id())
com! -bar CtrlPBookmarkDir cal ctrlp#init(ctrlp#bookmarkdir#id())

com! -n=? -com=dir CtrlPBookmarkDirAdd
	\ cal ctrlp#call('ctrlp#bookmarkdir#add', <q-args>)

" vim:ts=2:sw=2:sts=2
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               