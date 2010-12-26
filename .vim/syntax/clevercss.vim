" Vim syntax file
" Language:	CleverCSS
" Maintainer:	Zak Johnson <zakj@nox.cx>
" Last Change:	2010-01-05

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

setlocal iskeyword+=45  " -

" http://simon.html5.org/html5-elements
syn keyword ccssElement contained
\ a address area article aside abbr audio b base bdo blockquote body br button
\ canvas caption cite code col colgroup command datalist dd del details dfn div
\ dl dt em embed fieldset figure footer form h1 h2 h3 h4 h5 h6 head header
\ hgroup hr html i iframe img input ins kbd keygen label legend li link map
\ mark menu meta meter nav noscript object ol optgroup option output p param
\ pre progress q rp rt ruby samp script section select small source span strong
\ style sub sup table tbody td textarea tfoot th thead time title tr ul var
\ video

" http://www.w3.org/TR/2009/CR-CSS2-20090908/propidx.html
syn keyword ccssProperty contained
\ azimuth background-attachment background-color background-image
\ background-position background-repeat background border-collapse border-color
\ border-spacing border-style border-top border-right border-bottom border-left
\ border-top-color border-right-color border-bottom-color border-left-color
\ border-top-style border-right-style border-bottom-style border-left-style
\ border-top-width border-right-width border-bottom-width border-left-width
\ border-width border bottom caption-side clear clip color content
\ counter-increment counter-reset cue-after cue-before cue cursor direction
\ display elevation empty-cells float font-family font-size font-style
\ font-variant font-weight font height left letter-spacing line-height
\ list-style-image list-style-position list-style-type list-style margin-right
\ margin-left margin-top margin-bottom margin max-height max-width min-height
\ min-width orphans outline-color outline-style outline-width outline overflow
\ padding-top padding-right padding-bottom padding-left padding
\ page-break-after page-break-before page-break-inside pause-after pause-before
\ pause pitch-range pitch play-during position quotes richness right
\ speak-header speak-numeral speak-punctuation speak speech-rate stress
\ table-layout text-align text-decoration text-indent text-transform top
\ unicode-bidi vertical-align visibility voice-family volume white-space widows
\ width word-spacing z-index

syn keyword ccssElement contained *
syn match ccssClassName contained "\.[A-Za-z][A-Za-z0-9_-]\+"
syn match ccssIdentifier contained "#[A-Za-z_@][A-Za-z0-9_@-]*"

syn match ccssPsuedoClass contained ":\S\+" contains=ccssPseudoClassId
syn keyword ccssPseudoClassId contained link visited active hover focus before after left right
syn match ccssPseudoClassId contained "\<first\(-\(line\|letter\|child\)\)\=\>"

syn match ccssValueInteger contained "[-+]\=\d\+"
syn match ccssValueNumber contained "[-+]\=\d\+\(\.\d*\)\="
syn match ccssValueLength contained "[-+]\=\d\+\(\.\d*\)\=\(%\|mm\|cm\|in\|pt\|pc\|em\|ex\|px\)"

syn match ccssValueColor contained "\<transparent\>"
syn match ccssValueColor contained "#[0-9A-Fa-f]\{3\}\>"
syn match ccssValueColor contained "#[0-9A-Fa-f]\{6\}\>"

syn region ccssValueURL contained start="\<url\s*(" end=")" matchgroup=ccssFunctionName oneline keepend
syn region ccssValueFunction contained start="\<\(rgb\|clip\|attr\|counter\|rect\)\s*(" end=")" matchgroup=ccssFunctionName oneline keepend

syn match ccssSelector "^\s*\zs[^:]\+" contains=ccssElement,ccssClassName,ccssIdentifier,ccssPseudo,ccssProperty nextgroup=ccssColon
syn match ccssColon ":\s*" nextgroup=ccssRightSide
syn match cCssRightSide "[^:]\+$" contains=ALLBUT,ccssElement,ccssProperty,ccssClassName,ccssIdentifier,ccssPseudo
syn region ccssComment start="//" end="$" oneline contains=@Spell

syn match ccssVariable contained "\$[A-Za-z][A-Za-z0-9_]*"

syn keyword ccssMethod contained abs
syn keyword ccssMethod contained brighten
syn keyword ccssMethod contained darken
syn keyword ccssMethod contained eval
syn keyword ccssMethod contained join
syn keyword ccssMethod contained length
syn keyword ccssMethod contained lower
syn keyword ccssMethod contained round
syn keyword ccssMethod contained split
syn keyword ccssMethod contained string
syn keyword ccssMethod contained strip
syn keyword ccssMethod contained upper


if version >= 508 || !exists("did_ccss_syn_inits")
  if version < 508
    let did_ccss_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink ccssElement Statement
  HiLink ccssClassName Label
  HiLink ccssIdentifier Label
  HiLink ccssPseudoClassId PreProc

  HiLink ccssProperty Type

  HiLink ccssComment Comment

  HiLink ccssValueInteger Number
  HiLink ccssValueNumber Number
  HiLink ccssValueLength Number
  HiLink ccssValueColor Constant
  HiLink ccssValueFunctionName Function

  HiLink ccssMethod Function
  HiLink ccssVariable Identifier

  delcommand HiLink
endif

let b:current_syntax = "clevercss"
