% Additional warnings for deprecated things
\RequirePackage[l2tabu, orthodox]{nag}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{abgabe}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optional 'english' language option
\newcommand{\InitAbgabeLanguage}{\PassOptionsToPackage{english,ngerman}{babel}}
\DeclareOption{english}{\renewcommand{\InitAbgabeLanguage}{\PassOptionsToPackage{english}{babel}}}
\ProcessOptions
\InitAbgabeLanguage

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% exam format with answers
\LoadClass[answers]{exam}
% Enable own macros
\RequirePackage{mymacros}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enable utf8
\usepackage[utf8]{inputenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typesetting
\usepackage{babel}
\usepackage{parskip}
\usepackage{microtype}
\usepackage{csquotes}
\usepackage{booktabs}
\usepackage{listings}

\usepackage{lmodern} % upgrade default font
\usepackage[sc]{mathpazo} % pretty font for text

\usepackage[scaled=0.85]{beramono}
%\usepackage[scaled=0.85]{inconsolata}

\usepackage{lstautogobble}

\definecolor{codered}{rgb}{0.788, 0.102, 0.35}
\definecolor{codegreen}{rgb}{0.137, 0.471, 0.255}
\definecolor{codeblue}{rgb}{0, 0.333, 0.749}
\definecolor{codeorange}{rgb}{0.996, 0.541, 0.094}
\definecolor{codegray}{rgb}{0.627, 0.647, 0.663}
\definecolor{codepurple}{HTML}{C42043}
\definecolor{backcolour}{HTML}{F2F2F2}
\definecolor{bookColor}{cmyk}{0,0,0,0.90}  
\color{bookColor}

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

\lstdefinelanguage{mysql}
    {morekeywords={USE, SELECT, FROM, WHERE, AS, ORDER, ASC, DESC, IS, AND, OR, LIKE, JOIN, INNER, LEFT, RIGHT, FULL, OUTER, ON, UNION, MINUS, INTERSECT, GROUP, BY, IN, HAVING, USE, SHOW, CREATE, UPDATE, ALTER, DESCRIBE, COLUMNS, SCHEMA, SCHEMAS, DATABASE, DATABASES, TABLE, TABLES, INSERT, INTO, VALUES, DROP, PRIMARY, KEY, FOREIGN, CONSTRAINT, REFERENCES},
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
    morecomment=[l][\color{codegray}]{--},
    morecomment=[s][\color{codegray}]{{/*}{*/}},
    morestring=[b]",
    morestring=[b]',
    % keyword highlighting
    classoffset=1, % starting new class
    %otherkeywords={CONCAT,ROUND,COUNT,COALESCE,DISTINCT,MIN,MAX,SUM,AVG,ANY,ALL},
    morekeywords={CONCAT,ROUND,COUNT,COALESCE,DISTINCT,MIN,MAX,SUM,AVG,ANY,ALL,NOW},
    keywordstyle=\color{codegreen},
    classoffset=0,
    classoffset=2, % starting new class
    %otherkeywords={NULL},
    morekeywords={NULL},
    keywordstyle=\bfseries\color{codered},
    classoffset=0,
    classoffset=2, % starting new class
    morekeywords={INT, CHAR, VARCHAR, DECIMAL, FLOAT, DATETIME, DEFAULT, BOOLEAN},
    keywordstyle=\bfseries\color{codeorange},
    classoffset=0,
    % better highlighting
    moredelim=**[is][\btHL]{!}{!},
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
    numberstyle=\tiny\color{codegray},
    numbersep=10pt,
    stepnumber=1,
    framesep=5pt,
    xleftmargin=10pt,
    framexleftmargin=0pt,
    %frame=ltb,
    frame=l,
    framerule=0pt,
}
\lstset{style=MatseInputStyle}

\makeatletter

\linespread{1.05} % more spacing
%\setkomafont{disposition}{\fontseries{sbc}\sffamily}

\usepackage[shortlabels]{enumitem}
\setlist{nosep}

\makeatletter
% Re-enable paragraph spacing in minipages;
% we choose something smaller than what is used outside of minipages.
\newcommand{\@minipagerestore}{\setlength{\parskip}{0.8\medskipamount}}
\makeatother

\usepackage{textcomp}  % Required for encoding \textbigcircle
\usepackage{scalerel}  % Required for emoji \scalerel

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utilities
\usepackage{blindtext}
\usepackage{footnote}
\usepackage{pdfpages}
\usepackage{diagbox}
\usepackage{enumitem}

\usepackage{nicefrac}
\usepackage{polynom}

\makesavenoteenv{solution}

% Show most recent revision number and date in date field
\makeatletter
\date{\small \IfLanguageName{ngerman}{Letzte Änderung:}{Last Change:} \filename@parse{\jobname}\IfFileExists{\filename@base.last-change}{\input{\filename@base.last-change}}{\today}}
\makeatother

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
% Links and Metadata
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Context
%\usepackage[]{imakeidx}
\usepackage{iflang}

% author / Autor
\newcommand{\authorname}{}
\newcommand{\setauthor}[1]{
  \renewcommand{\authorname}{#1}
  }

% sheet number / Übungsblattnummer
\newcommand{\sheetnum}{}
\newcommand{\setsheetnum}[1]{
  \renewcommand{\sheetnum}{#1}
}

% module / Fach
\newcommand{\module}{}
\newcommand{\setmodule}[1]{
  \renewcommand{\module}{#1}
}

% sheettype / Fachtyp
\newcommand{\sheettype}{\IfLanguageName{ngerman}{Hausaufgabenblatt}{Exercise}}
\newcommand{\setsheettype}[1]{
  \renewcommand{\sheettype}{#1}
}

\renewcommand{\solutiontitle}{\noindent\textbf{\IfLanguageName{ngerman}{Lösung}{Solution}:}\par}
\newcommand{\lsheet}{\sheettype~\sheetnum}

\usepackage{etoolbox}

\lhead{\ifdefempty{\sheetnum}{}{\lsheet}}
\rhead{\ifdefempty{\module}{}{\module}}

\lfoot{}
\cfoot[\IfLanguageName{ngerman}{Seite \thepage\ von \numpages}{Page \thepage\ of \numpages}]{\IfLanguageName{ngerman}{Seite \thepage\ von \numpages}{Page \thepage\ of \numpages}}
\rfoot{}

\runningheadrule

\title{\module \\ {\large \ifdefempty{\sheetnum}{}{\lsheet}}}

\author{\authorname}

\AtEndDocument{
  \makeatletter
  \makeatother
}