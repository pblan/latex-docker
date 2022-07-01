% Additional warnings for deprecated things
\RequirePackage[l2tabu, orthodox]{nag}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{spicker}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optional 'english' language option
\newcommand{\InitSpickerLanguage}{\PassOptionsToPackage{english,ngerman}{babel}}
\DeclareOption{english}{\renewcommand{\InitSpickerLanguage}{\PassOptionsToPackage{english}{babel}}}
\ProcessOptions
\InitSpickerLanguage

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compact scrartcl format
\LoadClass[a4paper,parskip=half-,DIV=15,fontsize=11pt]{scrartcl}
% Enable own macros
\RequirePackage{mymacros}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enable post-90s text processing
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typesetting
\usepackage{babel}
\usepackage{microtype}
\usepackage{parskip}
\usepackage{csquotes}
\usepackage{booktabs}
\usepackage{listings}
\usepackage{soul}

\usepackage{lmodern} % upgrade default font
\usepackage[sc]{mathpazo} % pretty font for text

\linespread{1.05} % more spacing
\setkomafont{disposition}{\fontseries{sbc}\sffamily}

\usepackage[shortlabels]{enumitem}
\setlist{nosep}

\usepackage[scaled=0.85]{beramono}
%\usepackage[scaled=0.85]{inconsolata}

\usepackage{lstautogobble}

\newcommand*{\ditto}{\texttt{\char`\"}}

\definecolor{codered}{rgb}{0.788, 0.102, 0.35}
\definecolor{codegreen}{rgb}{0.137, 0.471, 0.255}
\definecolor{codeblue}{rgb}{0, 0.333, 0.749}
\definecolor{codeorange}{rgb}{0.996, 0.541, 0.094}
\definecolor{codegrey}{rgb}{0.627, 0.647, 0.663}
\definecolor{codepurple}{HTML}{C42043}
\definecolor{backcolour}{HTML}{F2F2F2}

\lstset{upquote=true}

% better highlighting
\makeatletter
\newenvironment{btHighlight}[1][]
{\begingroup\tikzset{bt@Highlight@par/.style={#1}}\begin{lrbox}{\@tempboxa}}
{\end{lrbox}\bt@HL@box[bt@Highlight@par]{\@tempboxa}\endgroup}

\newcommand\btHL[1][]{%
  \begin{btHighlight}[#1]\bgroup\aftergroup\bt@HL@endenv%
}
\def\bt@HL@endenv{%
  \end{btHighlight}%   
  \egroup
}
\newcommand{\bt@HL@box}[2][]{%
  \tikz[#1]{%
    \pgfpathrectangle{\pgfpoint{1pt}{0pt}}{\pgfpoint{\wd #2}{\ht #2}}%
    \pgfusepath{use as bounding box}%
    \node[anchor=base west, fill=orange!30,outer sep=0pt,inner xsep=1pt, inner ysep=0pt, rounded corners=3pt, minimum height=\ht\strutbox+1pt,#1]{\raisebox{1pt}{\strut}\strut\usebox{#2}};
  }%
}
\makeatother

%%% used to color digits
% \newcommand\digitstyle{\color{codeorange}}
% \makeatletter
% \newcommand{\ProcessDigit}[1]
% {%
%   \ifnum\lst@mode=\lst@Pmode\relax%
%    {\digitstyle #1}%
%   \else
%     #1%
%   \fi
% }

\lstdefinelanguage{mysql}{
  morekeywords={USE, SELECT, FROM, WHERE, AS, ORDER, ASC, DESC, IS, AND, OR, LIKE, JOIN, INNER, LEFT, RIGHT, FULL, OUTER, ON, UNION, MINUS, INTERSECT, GROUP, BY, IN, HAVING, USE, SHOW, CREATE, UPDATE, ALTER, DESCRIBE, COLUMNS, SCHEMA, SCHEMAS, DATABASE, DATABASES, TABLE, TABLES, INSERT, INTO, VALUES, DROP, PRIMARY, KEY, FOREIGN, CONSTRAINT, REFERENCES, CASE, WHEN, THEN, ELSE, END, CROSS, INTERVAL, YEAR, HOUR, ADD, MODIFY, RENAME, TO, IF, EXISTS, NOT, REPLACE, VIEW, START, TRANSACTION, COMMIT, ROLLBACK, AUTOCOMMIT, FOREIGN_KEY_CHECKS, SET, TRUNCATE, LOCK, WRITE, UNLOCK, DELIMITER, PROCEDURE, BEGIN, CALL, TRIGGER, BEFORE, FOR, EACH, ROW, AFTER, TOP},
  sensitive=false,
  basicstyle=\footnotesize\ttfamily,
  keywordstyle=\bfseries\color{codeblue},  
  stringstyle=\color{codered},
  commentstyle=\color{codegrey},
  % literate=
  % *{0}{{{\ProcessDigit{0}}}}1
  % {1}{{{\ProcessDigit{1}}}}1
  % {2}{{{\ProcessDigit{2}}}}1
  % {3}{{{\ProcessDigit{3}}}}1
  % {4}{{{\ProcessDigit{4}}}}1
  % {5}{{{\ProcessDigit{5}}}}1
  % {6}{{{\ProcessDigit{6}}}}1
  % {7}{{{\ProcessDigit{7}}}}1
  % {8}{{{\ProcessDigit{8}}}}1
  % {9}{{{\ProcessDigit{9}}}}1,
  morecomment=[l][\color{codegrey}]{--},
  morecomment=[s][\color{codegrey}]{{/*}{*/}},
  morestring=[b]",
  morestring=[b]',
  % keyword highlighting
  classoffset=1, % starting new class
  %otherkeywords={CONCAT,ROUND,COUNT,COALESCE,DISTINCT,MIN,MAX,SUM,AVG,ANY,ALL},
  morekeywords={CONCAT, ROUND, COUNT, COALESCE, DISTINCT, MIN, MAX, SUM, AVG, ANY, ALL, NOW, POW, CAST, STR_TO_DATE, DATE_FORMAT, GET_FORMAT, DATEDIFF, TIMEDIFF, DATE_ADD},
  keywordstyle=\color{codegreen},
  classoffset=0,
  classoffset=2, % starting new class
  %otherkeywords={NULL},
  morekeywords={NULL},
  keywordstyle=\bfseries\color{codered},
  classoffset=0,
  classoffset=3, % starting new class
  morekeywords={INT, CHAR, VARCHAR, DECIMAL, FLOAT, DATETIME, DEFAULT, BOOLEAN, DATE, TIME, DATETIME},
  keywordstyle=\bfseries\color{codeorange},
  classoffset=0,
  % better highlighting
  moredelim=**[is][\btHL]{!}{!},
}

% \lstdefinelanguage{XML}
% {
%   morestring=[s][\color{codered}]{"}{"},
%   morestring=[s][\color{black}]{>}{<},
%   morecomment=[s][\color{codegreen}]{<?}{?>},
%   morecomment=[s][\color{codegreen}]{<!--}{-->},
%   stringstyle=\color{black},
%   identifierstyle=\color{codeblue},
%   keywordstyle=\color{codered},
%   morekeywords={xmlns,xsi,noNamespaceSchemaLocation,type,id,x,y,source,target,version,tool,transRef,roleRef,objective,eventually}% list your attributes here
% }

% \lstdefinelanguage{matseXML}{
%   emphstyle=\color{codered}, basicstyle=\small\ttfamily, columns=fullflexible, showstringspaces=false, commentstyle=\color{codegreen}\upshape,
%   morestring=[b][\color{codered}]",
%   morecomment=[s]{<?}{?>},
%   morecomment=[s]{<!--}{-->},
%   keywordstyle=\color{codeblue},
%   stringstyle=\color{codepurple},
%   morekeywords={xmlns,version,type},
% }

\lstdefinelanguage{XML}
{
  morestring=[b]",
  morestring=[s][\color{codeblue}]{>}{<},
  morecomment=[s]{<?}{?>},
  stringstyle=\color{black},
  identifierstyle=\color{codeblue},
  keywordstyle=\color{codegreen},
  stringstyle=\color{codered},
  morekeywords={version,type,name,default,minOccurs,maxOccurs,value,base}% list your attributes here
}

% \lstdefinelanguage{JSON}{
%     commentstyle=\color{codered}, % style of comment
%     stringstyle=\color{codeblue}, % style of strings
%     % numberstyle=\scriptsize,
%     string=[s]{"}{"},
%     comment=[s]{:\ "},
%     morecomment=[s]{:"},
%     % literate=
%     %     *{0}{{{\color{codeblue}0}}}{1}
%     %      {1}{{{\color{codeblue}1}}}{1}
%     %      {2}{{{\color{codeblue}2}}}{1}
%     %      {3}{{{\color{codeblue}3}}}{1}
%     %      {4}{{{\color{codeblue}4}}}{1}
%     %      {5}{{{\color{codeblue}5}}}{1}
%     %      {6}{{{\color{codeblue}6}}}{1}
%     %      {7}{{{\color{codeblue}7}}}{1}
%     %      {8}{{{\color{codeblue}8}}}{1}
%     %      {9}{{{\color{codeblue}9}}}{1}
% }
\lstdefinelanguage{JSON}{
  string=[s]{"}{"},
  stringstyle=\color{blue},
  comment=[l]{:},
  commentstyle=\color{black},
}

\lstdefinelanguage{JavaScript}{
  morekeywords={break, case, catch, continue, debugger, default, delete,         do, else, false, finally, for, function, if, in, instanceof, new, null, return, switch, this, throw, true, try, typeof, var, void, while, with},
  morecomment=[s]{/*}{*/},
  morecomment=[l]//,
  morestring=[b]",
  morestring=[b]',
  % better highlighting
  moredelim=**[is][\btHL]{^}{^},
}

\lstdefinelanguage{CSS}{
  keywords={accelerator,azimuth,background,background-attachment,
        background-color,background-image,background-position,
        background-position-x,background-position-y,background-repeat,
        behavior,border,border-bottom,border-bottom-color,
        border-bottom-style,border-bottom-width,border-collapse,
        border-color,border-left,border-left-color,border-left-style,
        border-left-width,border-right,border-right-color,
        border-right-style,border-right-width,border-spacing,
        border-style,border-top,border-top-color,border-top-style,
        border-top-width,border-width,bottom,caption-side,clear,
        clip,color,content,counter-increment,counter-reset,cue,
        cue-after,cue-before,cursor,direction,display,elevation,
        empty-cells,filter,float,font,font-family,font-size,
        font-size-adjust,font-stretch,font-style,font-variant,
        font-weight,height,ime-mode,include-source,
        layer-background-color,layer-background-image,layout-flow,
        layout-grid,layout-grid-char,layout-grid-char-spacing,
        layout-grid-line,layout-grid-mode,layout-grid-type,left,
        letter-spacing,line-break,line-height,list-style,
        list-style-image,list-style-position,list-style-type,margin,
        margin-bottom,margin-left,margin-right,margin-top,
        marker-offset,marks,max-height,max-width,min-height,
        min-width,-moz-binding,-moz-border-radius,
        -moz-border-radius-topleft,-moz-border-radius-topright,
        -moz-border-radius-bottomright,-moz-border-radius-bottomleft,
        -moz-border-top-colors,-moz-border-right-colors,
        -moz-border-bottom-colors,-moz-border-left-colors,-moz-opacity,
        -moz-outline,-moz-outline-color,-moz-outline-style,
        -moz-outline-width,-moz-user-focus,-moz-user-input,
        -moz-user-modify,-moz-user-select,orphans,outline,
        outline-color,outline-style,outline-width,overflow,
        overflow-X,overflow-Y,padding,padding-bottom,padding-left,
        padding-right,padding-top,page,page-break-after,
        page-break-before,page-break-inside,pause,pause-after,
        pause-before,pitch,pitch-range,play-during,position,quotes,
        -replace,richness,right,ruby-align,ruby-overhang,
        ruby-position,-set-link-source,size,speak,speak-header,
        speak-numeral,speak-punctuation,speech-rate,stress,
        scrollbar-arrow-color,scrollbar-base-color,
        scrollbar-dark-shadow-color,scrollbar-face-color,
        scrollbar-highlight-color,scrollbar-shadow-color,
        scrollbar-3d-light-color,scrollbar-track-color,table-layout,
        text-align,text-align-last,text-decoration,text-indent,
        text-justify,text-overflow,text-shadow,text-transform,
        text-autospace,text-kashida-space,text-underline-position,top,
        unicode-bidi,-use-link-source,vertical-align,visibility,
        voice-family,volume,white-space,widows,width,word-break,
        word-spacing,word-wrap,writing-mode,z-index,zoom},  
  sensitive=true,
  morecomment=[l]{//},
  morecomment=[s]{/*}{*/},
  morestring=[b]',
  morestring=[b]",
  alsoletter={:},
  alsodigit={-},
  % better highlighting
  moredelim=**[is][\btHL]{^}{^},
}
% \lstdefinelanguage{HTML5}{
%         language=html,
%         sensitive=true, 
%         alsoletter={<>=-},
%         otherkeywords={
%         % HTML tags
%         <, </, >,
%         </a, <a, </a>,
%         </abbr, <abbr, </abbr>,
%         </address, <address, </address>,
%         </area, <area, </area>,
%         </area, <area, </area>,
%         </article, <article, </article>,
%         </aside, <aside, </aside>,
%         </audio, <audio, </audio>,
%         </audio, <audio, </audio>,
%         </b, <b, </b>,
%         </base, <base, </base>,
%         </bdi, <bdi, </bdi>,
%         </bdo, <bdo, </bdo>,
%         </blockquote, <blockquote, </blockquote>,
%         </body, <body, </body>,
%         </br, <br, </br>,
%         </button, <button, </button>,
%         </canvas, <canvas, </canvas>,
%         </caption, <caption, </caption>,
%         </cite, <cite, </cite>,
%         </code, <code, </code>,
%         </col, <col, </col>,
%         </colgroup, <colgroup, </colgroup>,
%         </data, <data, </data>,
%         </datalist, <datalist, </datalist>,
%         </dd, <dd, </dd>,
%         </del, <del, </del>,
%         </details, <details, </details>,
%         </dfn, <dfn, </dfn>,
%         </div, <div, </div>,
%         </dl, <dl, </dl>,
%         </dt, <dt, </dt>,
%         </em, <em, </em>,
%         </embed, <embed, </embed>,
%         </fieldset, <fieldset, </fieldset>,
%         </figcaption, <figcaption, </figcaption>,
%         </figure, <figure, </figure>,
%         </footer, <footer, </footer>,
%         </form, <form, </form>,
%         </h1, <h1, </h1>,
%         </h2, <h2, </h2>,
%         </h3, <h3, </h3>,
%         </h4, <h4, </h4>,
%         </h5, <h5, </h5>,
%         </h6, <h6, </h6>,
%         </head, <head, </head>,
%         </header, <header, </header>,
%         </hr, <hr, </hr>,
%         </html, <html, </html>,
%         </i, <i, </i>,
%         </iframe, <iframe, </iframe>,
%         </img, <img, </img>,
%         </input, <input, </input>,
%         </ins, <ins, </ins>,
%         </kbd, <kbd, </kbd>,
%         </keygen, <keygen, </keygen>,
%         </label, <label, </label>,
%         </legend, <legend, </legend>,
%         </li, <li, </li>,
%         </link, <link, </link>,
%         </main, <main, </main>,
%         </map, <map, </map>,
%         </mark, <mark, </mark>,
%         </math, <math, </math>,
%         </menu, <menu, </menu>,
%         </menuitem, <menuitem, </menuitem>,
%         </meta, <meta, </meta>,
%         </meter, <meter, </meter>,
%         </nav, <nav, </nav>,
%         </noscript, <noscript, </noscript>,
%         </object, <object, </object>,
%         </ol, <ol, </ol>,
%         </optgroup, <optgroup, </optgroup>,
%         </option, <option, </option>,
%         </output, <output, </output>,
%         </p, <p, </p>,
%         </param, <param, </param>,
%         </pre, <pre, </pre>,
%         </progress, <progress, </progress>,
%         </q, <q, </q>,
%         </rp, <rp, </rp>,
%         </rt, <rt, </rt>,
%         </ruby, <ruby, </ruby>,
%         </s, <s, </s>,
%         </samp, <samp, </samp>,
%         </script, <script, </script>,
%         </section, <section, </section>,
%         </select, <select, </select>,
%         </small, <small, </small>,
%         </source, <source, </source>,
%         </span, <span, </span>,
%         </strong, <strong, </strong>,
%         </style, <style, </style>,
%         </summary, <summary, </summary>,
%         </sup, <sup, </sup>,
%         </svg, <svg, </svg>,
%         </table, <table, </table>,
%         </tbody, <tbody, </tbody>,
%         </td, <td, </td>,
%         </template, <template, </template>,
%         </textarea, <textarea, </textarea>,
%         </tfoot, <tfoot, </tfoot>,
%         </th, <th, </th>,
%         </thead, <thead, </thead>,
%         </time, <time, </time>,
%         </title, <title, </title>,
%         </tr, <tr, </tr>,
%         </track, <track, </track>,
%         </u, <u, </u>,
%         </ul, <ul, </ul>,
%         </var, <var, </var>,
%         </video, <video, </video>,
%         </wbr, <wbr, </wbr>,
%         />, <!
%         },  
%         ndkeywords={
%         % General
%         =,
%         % HTML attributes
%         accept=, accept-charset=, accesskey=, action=, align=, alt=, async=, autocomplete=, autofocus=, autoplay=, autosave=, bgcolor=, border=, buffered=, challenge=, charset=, checked=, cite=, class=, code=, codebase=, color=, cols=, colspan=, content=, contenteditable=, contextmenu=, controls=, coords=, data=, datetime=, default=, defer=, dir=, dirname=, disabled=, download=, draggable=, dropzone=, enctype=, for=, form=, formaction=, headers=, height=, hidden=, high=, href=, hreflang=, http-equiv=, icon=, id=, ismap=, itemprop=, keytype=, kind=, label=, lang=, language=, list=, loop=, low=, manifest=, max=, maxlength=, media=, method=, min=, multiple=, name=, novalidate=, open=, optimum=, pattern=, ping=, placeholder=, poster=, preload=, pubdate=, radiogroup=, readonly=, rel=, required=, reversed=, rows=, rowspan=, sandbox=, scope=, scoped=, seamless=, selected=, shape=, size=, sizes=, span=, spellcheck=, src=, srcdoc=, srclang=, start=, step=, style=, summary=, tabindex=, target=, title=, type=, usemap=, value=, width=, wrap=,
%         % CSS properties
%         accelerator:,azimuth:,background:,background-attachment:,
%         background-color:,background-image:,background-position:,
%         background-position-x:,background-position-y:,background-repeat:,
%         behavior:,border:,border-bottom:,border-bottom-color:,
%         border-bottom-style:,border-bottom-width:,border-collapse:,
%         border-color:,border-left:,border-left-color:,border-left-style:,
%         border-left-width:,border-right:,border-right-color:,
%         border-right-style:,border-right-width:,border-spacing:,
%         border-style:,border-top:,border-top-color:,border-top-style:,
%         border-top-width:,border-width:,bottom:,caption-side:,clear:,
%         clip:,color:,content:,counter-increment:,counter-reset:,cue:,
%         cue-after:,cue-before:,cursor:,direction:,display:,elevation:,
%         empty-cells:,filter:,float:,font:,font-family:,font-size:,
%         font-size-adjust:,font-stretch:,font-style:,font-variant:,
%         font-weight:,height:,ime-mode:,include-source:,
%         layer-background-color:,layer-background-image:,layout-flow:,
%         layout-grid:,layout-grid-char:,layout-grid-char-spacing:,
%         layout-grid-line:,layout-grid-mode:,layout-grid-type:,left:,
%         letter-spacing:,line-break:,line-height:,list-style:,
%         list-style-image:,list-style-position:,list-style-type:,margin:,
%         margin-bottom:,margin-left:,margin-right:,margin-top:,
%         marker-offset:,marks:,max-height:,max-width:,min-height:,
%         min-width:,transition-duration:,transition-property:,
%         transition-timing-function:,transform:,
%         -moz-transform:,-moz-binding:,-moz-border-radius:,
%         -moz-border-radius-topleft:,-moz-border-radius-topright:,
%         -moz-border-radius-bottomright:,-moz-border-radius-bottomleft:,
%         -moz-border-top-colors:,-moz-border-right-colors:,
%         -moz-border-bottom-colors:,-moz-border-left-colors:,-moz-opacity:,
%         -moz-outline:,-moz-outline-color:,-moz-outline-style:,
%         -moz-outline-width:,-moz-user-focus:,-moz-user-input:,
%         -moz-user-modify:,-moz-user-select:,orphans:,outline:,
%         outline-color:,outline-style:,outline-width:,overflow:,
%         overflow-X:,overflow-Y:,padding:,padding-bottom:,padding-left:,
%         padding-right:,padding-top:,page:,page-break-after:,
%         page-break-before:,page-break-inside:,pause:,pause-after:,
%         pause-before:,pitch:,pitch-range:,play-during:,position:,quotes:,
%         -replace:,richness:,right:,ruby-align:,ruby-overhang:,
%         ruby-position:,-set-link-source:,size:,speak:,speak-header:,
%         speak-numeral:,speak-punctuation:,speech-rate:,stress:,
%         scrollbar-arrow-color:,scrollbar-base-color:,
%         scrollbar-dark-shadow-color:,scrollbar-face-color:,
%         scrollbar-highlight-color:,scrollbar-shadow-color:,
%         scrollbar-3d-light-color:,scrollbar-track-color:,table-layout:,
%         text-align:,text-align-last:,text-decoration:,text-indent:,
%         text-justify:,text-overflow:,text-shadow:,text-transform:,
%         text-autospace:,text-kashida-space:,text-underline-position:,top:,
%         unicode-bidi:,-use-link-source:,vertical-align:,visibility:,
%         voice-family:,volume:,white-space:,widows:,width:,word-break:,
%         word-spacing:,word-wrap:,writing-mode:,z-index:,zoom:
%         },  
%         morecomment=[s]{<!--}{-->},
%         tag=[s],
%         % better highlighting
%         moredelim=**[is][\btHL]{^}{^},
% }

\lstdefinelanguage{html5}{
  language=html,
  % better highlighting
  moredelim=**[is][\btHL]{^}{^},
}

\lstdefinestyle{MatseInputStyle}{
    backgroundcolor=\color{backcolour}, 
    basicstyle=\footnotesize\ttfamily,
    keywordstyle=\bfseries\color{codeblue},  
    stringstyle=\color{codered},
    commentstyle=\color{codegrey},
    %keywordstyle=\color{codeblue},
    %stringstyle=\color{codered},
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    showspaces=false,
    showstringspaces=false,
    showtabs=false, %
    autogobble=true,
    % SQL specific
    % language=mysql,
    % deletekeywords={IDENTITY},
    % deletekeywords={[2]INT},
    % morekeywords={clustered},
    % show small line numbers
    numbers=left,
    numberstyle=\tiny\color{codegrey},
    numbersep=10pt,
    stepnumber=1,
    framesep=5pt,
    xleftmargin=10pt,
    framexleftmargin=0pt,
    %frame=ltb,
    frame=l,
    framerule=0pt,
    % Code
    alsodigit={.:;},
    % better highlighting
    moredelim=**[is][\btHL]{^}{^},
}
\lstset{style=MatseInputStyle}

\makeatletter
% Re-enable paragraph spacing in minipages;
% we choose something smaller than what is used outside of minipages.
\newcommand{\@minipagerestore}{\setlength{\parskip}{0.8\medskipamount}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utilities
\usepackage{blindtext}
\usepackage{footnote}
\usepackage{pdfpages}

\usepackage{nicefrac}
\usepackage{polynom}

% Show most recent revision number and date in date field
\makeatletter
\date{\small \IfLanguageName{ngerman}{Letzte Änderung:}{Last Change:} \filename@parse{\jobname}\IfFileExists{\filename@base.last-change}{\input{\filename@base.last-change}}{\today}}
\makeatother

\subject{\normalfont{}\texttt{\href{https://matse.paddel.xyz/spicker}{https://matse.paddel.xyz/spicker}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Math & Symbols
\usepackage{mathtools}
\usepackage{amssymb}
\usepackage{amsmath}
\usepackage{amsthm}
\usepackage{stmaryrd}
\usepackage{braket}
\usepackage{cool}
\usepackage{siunitx}
\usepackage{venndiagram}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diagrams
\usepackage{tikz}
\usepackage{tikzscale}

\usetikzlibrary{tikzmark,bbox,calc,automata,arrows.meta,chains,decorations.pathreplacing,matrix,scopes,shapes.misc,shapes.multipart,backgrounds}

\tikzset{
    weight/.style = {
        scale=0.7,
        },
    prim node/.style = {
        fill = blue!50,
        text = white,
        },
    prim edge/.style = {
        draw=blue,
        very thick,
        },
    current/.style = {
        fill = teal!50,
        },
    marked/.style = {
        fill = teal!25,
        },
    visited/.style = {
        fill = teal!30,
        %text=white,
        opacity = 0.5,
    },
    new/.style = {
        red,
    },
    index small/.style = {
        minimum width=1.5em,
        minimum height=0.5em,
        fill = gray!25,
    },
    index/.style = {
        minimum width=2em,
        minimum height=0.5em,
        fill = gray!25,
    },
    every state/.style = {
        minimum size=2em
    }
}

\forestset{%
empty node/.style = {
    dashed,
    opacity = .2, 
    fill opacity = 0.2,
    edge = {opacity=.2},
    },
r/.style = {
    fill = red!50,
    text=white,
    draw=red,
    calign angle=30,
    calign=fixed edge angles,
    %fill opacity = 0.5,
},
b/.style = {
    fill = black!50,
    text=white,
    draw=black,
    calign angle=30,
    calign=fixed edge angles,
    %fill opacity = 0.5,
},
rbn/.style = { %red black not defined
    fill = blue!50,
    text=white,
    draw=black,
    calign angle=30,
    calign=fixed edge angles,
    %fill opacity = 0.5,
},
nil/.style = {
    fill = black!50,
    minimum size=1em,
    calign angle=30,
    calign=fixed edge angles,
    %fill opacity = 0.5,
},
mpn/.style args = {#1/#2/#3/#4}{draw,
rectangle split, rectangle split horizontal,
rectangle split parts=4,
on chain=A,
draw=black!50,
node contents={ \nodepart{one}    $#1$
                \nodepart{two}    $#2$
                \nodepart{three}  $#3$
                \nodepart{four}   $#4$}
                            },
}

\newcommand\mpnc[4]{\nodepart{one}      $#1$
                    \nodepart{two}      $#2$                    
                    \nodepart{three}    $#3$
                    \nodepart{four}     $#4$
                    }


\usepackage{pgfplots, pgfplotstable}
\usepgfplotslibrary{fillbetween}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Environments
\usepackage{algpseudocode}

% for each
\algnewcommand\algorithmicforeach{\textbf{for each}}
\algdef{S}[FOR]{ForEach}[1]{\algorithmicforeach\ #1\ \algorithmicdo}

% Just like the 'center' block, but without spacing around it.
\newenvironment{tightcenter}{%
  \setlength\topsep{0pt}
  \setlength\parskip{0pt}
  \begin{center}
}{%
  \end{center}
}

% LaTeX counter interface for \rownum
% ---
\makeatletter
\@ifundefined{c@rownum}{%
  \let\c@rownum\rownum
}{}
\@ifundefined{therownum}{%
  \def\therownum{\@arabic\rownum}%
}{}
\makeatother

%%%%%%%%%%%%%%%%
% Links and Metadata, Context Blocks
\usepackage{tcolorbox}
\usepackage{nameref}

\usepackage[]{imakeidx}
\usepackage[
  colorlinks,
  citecolor = .,
  linkcolor = matse,
  urlcolor = matse
]{hyperref}
\usepackage{bookmark}

\makeatletter
\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author}
  }
}
\makeatother

\usepackage{iflang}
\newcommand{\SpickerAlgorithm}{\IfLanguageName{ngerman}{Algorithmus}{Algorithm}}
\newcommand{\SpickerCode}{\IfLanguageName{ngerman}{Code}{Code}}

\tcbset{boxrule=0pt,toprule=1pt,parbox=false,on line}

\newenvironment{algo}[1]{%
\index{#1}%
\setlist{nosep,leftmargin=*}%
\begin{tcolorbox}[colback=fhblue!5!white, colframe=fhblue!75!black, title={\sffamily \SpickerAlgorithm: #1}]
}{%
\end{tcolorbox}}

\newenvironment{info}[1]{%
\setlist{nosep,leftmargin=*}%
\begin{tcolorbox}[colback=fhyellow!5!white, colframe=fhyellow!75!black, title={\sffamily Information: #1}]
}{%
\end{tcolorbox}}

\newenvironment{code}[1]{%
\index{#1}%
\begin{tcolorbox}[colback=fhpurple!5!white, colframe=fhpurple!75!black, title={\sffamily \SpickerCode: #1}]
}{%
\end{tcolorbox}}

\newenvironment{defi}[1]{%
\index{#1}%
\label{defi:#1}%
\begin{tcolorbox}[colback=fhmint!5!white, colframe=fhmint!75!black, title={\sffamily Definition: #1}, label=defi:#1]
%\begin{tcolorbox}[colback=fhmint!5!white, colframe=fhmint!75!black, title={\sffamily Definition: #1}]
}{%

\end{tcolorbox}}

\newenvironment{bonus}[1]{%
\index{#1}%
\begin{tcolorbox}[colback=fhred!5!white, colframe=fhred!75!black, title={\sffamily Bonus: #1}]
}{%
\end{tcolorbox}}

\newenvironment{example}[1]{%
\index[Beispiele]{#1}%
\begin{tcolorbox}[colback=fhred!5!white, colframe=fhred!75!black, title={\sffamily \IfLanguageName{ngerman}{Beispiel}{Example}: #1}]
}{%
\end{tcolorbox}}

% SQL specific
\newenvironment{sql}[1]{%
\index[SQL]{#1}%
\begin{tcolorbox}[colback=fhblue!5!white, colframe=fhblue!75!black, title={\sffamily SQL: #1}]
}{%
\end{tcolorbox}}

% SWT specific
\newenvironment{diag}[1]{%
\index{#1}%
\begin{tcolorbox}[colback=fhblue!5!white, colframe=fhblue!75!black, title={\sffamily \IfLanguageName{ngerman}{Diagramm}{Diagram}: #1}]
}{%
\end{tcolorbox}}

\newenvironment{sqlbonus}[1]{%
\index[SQL]{#1}%
\begin{tcolorbox}[colback=fhpurple!5!white, colframe=fhpurple!75!black, title={\sffamily SQL-Bonus: #1}]
}{%
\end{tcolorbox}}
    
\newcommand{\exampleseparator}{\noindent\rule{\textwidth}{0.2pt}}

\newcommand*{\fullref}[1]{\hyperref[{#1}]{\ref*{#1} \nameref*{#1}}}

%%%%%%%%%%%%%%
% Split Blocks

\newenvironment{halfboxl}{%
\noindent
\begin{minipage}[t]{0.4875\textwidth}
%\vspace{0pt}
%\vspace{\dimexpr\ht\strutbox-\topskip}
}{%
\end{minipage}\hspace{0.025\textwidth}}
\newenvironment{halfboxr}{%
\begin{minipage}[t]{0.4875\textwidth}
\vspace{0pt}
}{%
\end{minipage}\bigbreak}

\newenvironment{thirdboxl}{%
\begin{minipage}[t]{0.3166\textwidth}
}{%
\end{minipage}\hspace{0.025\textwidth}}
\newenvironment{thirdboxm}{%
\begin{minipage}[t]{0.3166\textwidth}
}{%
\end{minipage}\hspace{0.025\textwidth}}
\newenvironment{thirdboxr}{%
\begin{minipage}[t]{0.3166\textwidth}
}{%
\end{minipage}\bigbreak}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Citations 

\usepackage[
  style=numeric, 
  backend=bibtex, 
  sorting=none
]{biblatex}