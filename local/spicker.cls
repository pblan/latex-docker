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

\usepackage{lmodern} % upgrade default font
\usepackage[sc]{mathpazo} % pretty font for text

\linespread{1.05} % more spacing
\setkomafont{disposition}{\fontseries{sbc}\sffamily}

\usepackage[shortlabels]{enumitem}
\setlist{nosep}

\usepackage[scaled=0.85]{beramono}
%\usepackage[scaled=0.85]{inconsolata}

\usepackage{lstautogobble}

\definecolor{codered}{rgb}{0.788, 0.102, 0.35}
\definecolor{codegreen}{rgb}{0.137, 0.471, 0.255}
\definecolor{codeblue}{rgb}{0, 0.333, 0.749}
\definecolor{codegray}{rgb}{0.627, 0.647, 0.663}
\definecolor{codepurple}{HTML}{C42043}
\definecolor{backcolour}{HTML}{F2F2F2}
\definecolor{bookColor}{cmyk}{0,0,0,0.90}  
\color{bookColor}

\lstset{upquote=true}

\lstdefinelanguage{mysql}
    {morekeywords={USE, SELECT, FROM, WHERE, AS, ORDER, ASC, DESC, IS, AND, OR, LIKE, JOIN, INNER, LEFT, RIGHT, FULL, OUTER, ON, UNION, MINUS, INTERSECT, GROUP, BY, IN},
    % keywordstyle bold
    keywordstyle=\bfseries\color{codeblue},
    sensitive=false,
    morecomment=[l][\color{codegray}]{--},
    morecomment=[s][\color{codegray}]{{/*}{*/}},
    %morecomment=[l][\color{codegreen}]{//},
    morestring=[b]",
    morestring=[b]',
    stringstyle=\color{codered}
    }

\lstdefinestyle{SqlInputStyle}{
    backgroundcolor=\color{backcolour},   
    %commentstyle=\color{codegreen},
    %keywordstyle=\color{codeblue},
    %stringstyle=\color{codered},
    basicstyle=\footnotesize\ttfamily,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    showspaces=false,
    showstringspaces=false,
    showtabs=true, %
    autogobble=true,
    % SQL specific
    language=mysql,
    deletekeywords={IDENTITY},
    deletekeywords={[2]INT},
    morekeywords={clustered},
    % show small line numbers
    numbers=left,
    numberstyle=\tiny\color{codegray},
    numbersep=10pt,
    stepnumber=1,
    framesep=5pt,
    xleftmargin=10pt,
    framexleftmargin=0pt,
    %frame=ltb,
    frame=l,
    framerule=0pt,
    % keyword highlighting
    classoffset=1, % starting new class
    otherkeywords={CONCAT,ROUND,COUNT,COALESCE,DISTINCT,MIN,MAX,SUM,AVG,ANY,ALL},
    morekeywords={CONCAT,ROUND,COUNT,COALESCE,DISTINCT,MIN,MAX,SUM,AVG,ANY,ALL},
    keywordstyle=\color{codeblue},
    classoffset=0,
    classoffset=2, % starting new class
    otherkeywords={NULL},
    morekeywords={NULL},
    keywordstyle=\color{codegreen},
    classoffset=0,
}

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
\usepackage{pgfplots, pgfplotstable}
\usepgfplotslibrary{fillbetween}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Environments
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

\newenvironment{sql}[1]{%
\index{#1}%
\begin{tcolorbox}[colback=fhblue!5!white, colframe=fhblue!75!black, title={\sffamily SQL: #1}]
}{%
\end{tcolorbox}}

\newenvironment{example}[1]{%
\index[Beispiele]{#1}%
\begin{tcolorbox}[colback=fhred!5!white, colframe=fhred!75!black, title={\sffamily \IfLanguageName{ngerman}{Beispiel}{Example}: #1}]
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