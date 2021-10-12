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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enable utf8
\usepackage[utf8]{inputenc}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Typesetting
\usepackage{babel}
\usepackage{microtype}
\usepackage{parskip}
\usepackage{microtype}
\usepackage{csquotes}
\usepackage{booktabs}
\usepackage{listings}

\usepackage{lmodern} % upgrade default font
\usepackage[sc]{mathpazo} % pretty font for text

\linespread{1.05} % more spacing
%\setkomafont{disposition}{\fontseries{sbc}\sffamily}

\usepackage[shortlabels]{enumitem}
\setlist{nosep}

\makeatletter
% Re-enable paragraph spacing in minipages;
% we choose something smaller than what is used outside of minipages.
\newcommand{\@minipagerestore}{\setlength{\parskip}{0.8\medskipamount}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utilities
\usepackage{blindtext}
\usepackage{footnote}

\makesavenoteenv{solution}

\newcommand{\gqq}[1]{\glqq{}#1\grqq{}}
\newcommand{\gq}[1]{\glq{}#1\grq{}}

\usepackage[svgnames]{xcolor}
% https://s3.amazonaws.com/edwardtufte.com/colorblind_palette.png
\definecolor{orange}{RGB}{230,159,0}
\definecolor{skyblue}{RGB}{86,180,233}
\definecolor{bluishgreen}{RGB}{0,158,115}
\definecolor{vermillion}{RGB}{213,94,0}
\definecolor{reddishpurple}{RGB}{204,121,167}
\definecolor{matse}{RGB}{11,102,168}
\definecolor{fhmint}{RGB}{0,177,172}
\definecolor{fhblue}{RGB}{0,141,208}
\definecolor{fhred}{RGB}{168,46,104}
\definecolor{fhpurple}{RGB}{147,81,159}

\usepackage{polynom}


% Show most recent revision number and date in date field
\makeatletter
\date{\small \IfLanguageName{ngerman}{Letzte Änderung:}{Last Change:} \filename@parse{\jobname}\IfFileExists{\filename@base.last-change}{\input{\filename@base.last-change}}{\today}}
\makeatother

% \subject{\normalfont{}\texttt{\href{https://matse.paddel.xyz/Abgabe}{https://matse.paddel.xyz/Abgabe}}}

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

\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\scalarprod{\langle}{\rangle}
\DeclarePairedDelimiter\interval{[}{]}

\newcommand{\Eig}{\operatorname{Eig}}
\DeclareMathOperator{\Exists}{\exists}
\DeclareMathOperator{\Forall}{\forall}
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator*{\argmax}{argmax}

\newcommand{\Nplus}{\mathbb{N}^+}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Rnonneg}{\mathbb{R}^+_0}
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\bigo}{\mathcal{O}}

\DeclareMathOperator{\img}{img} 
\DeclareMathOperator{\defect}{defect}
\DeclareMathOperator{\rank}{rank}
\DeclareMathOperator{\trace}{trace} 
\DeclareMathOperator{\Sol}{Sol}
\DeclareMathOperator{\row}{row}
\DeclareMathOperator{\col}{col}
\DeclareMathOperator{\curl}{curl}

\newcommand*\conj[1]{\bar{#1}}

% Roman Numbers
% \Rnum{3} -> III
\newcommand{\Rnum}[1]{\uppercase\expandafter{\romannumeral #1\relax}} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diagrams
\usepackage{tikz}
\usepackage{pgfplots}
\usepgfplotslibrary{fillbetween}
\pgfplotsset{compat=1.8}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Links and Metadata
\usepackage[
  colorlinks,
  citecolor = fhmint,
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
% Environments

\usepackage{array}   % for \newcolumntype macro

\newcolumntype{L}{>{$}l<{$}} % math-mode version of "l" column type
\newcolumntype{R}{>{$}r<{$}} % math-mode version of "r" column type
\newcolumntype{C}{>{$}c<{$}} % math-mode version of "c" column type
\newcolumntype{P}{>{$}p<{$}} % math-mode version of "l" column type

\newenvironment{sysmatrix}[1]
{\left(\begin{array}{@{}#1@{}}}
    {\end{array}\right)}
    

\newcommand{\vektor}[1]{\begin{pmatrix*}[c] #1 \end{pmatrix*}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Context
\usepackage[]{imakeidx}
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