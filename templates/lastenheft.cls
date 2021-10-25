% Additional warnings for deprecated things
\RequirePackage[l2tabu, orthodox]{nag}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lastenheft}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Optional 'english' language option
\newcommand{\InitlastenheftLanguage}{\PassOptionsToPackage{english,ngerman}{babel}}
\DeclareOption{english}{\renewcommand{\InitlastenheftLanguage}{\PassOptionsToPackage{english}{babel}}}
\ProcessOptions
\InitlastenheftLanguage

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% report format with a4paper,oneside,titlepage
%\LoadClass[a4paper,oneside,titlepage]{report}
% article format with a4paper
\LoadClass[a4paper]{article}

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
\usepackage{xltabular}
\usepackage[titletoc]{appendix}
\usepackage{multirow, makecell}
%\usepackage{tabularx}
%\usepackage{longtable}
\usepackage{pdfpages}

\usepackage{glossaries}
\newcommand{\gqq}[1]{\glqq{}#1\grqq{}}
\newcommand{\gq}[1]{\glq{}#1\grq{}}

% Show most recent revision number and date in date field
\makeatletter
\date{\small \IfLanguageName{ngerman}{Letzte Änderung:}{Last Change:} \filename@parse{\jobname}\IfFileExists{\filename@base.last-change}{\input{\filename@base.last-change}}{\today}}
\makeatother

% \subject{\normalfont{}\texttt{\href{https://matse.paddel.xyz/lastenheft}{https://matse.paddel.xyz/lastenheft}}}

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

\usepackage{nicefrac}

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

\newcommand*\conj[1]{\,\overline{\!{#1}}}

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
  %citecolor = fhmint,
  %linkcolor = matse,
  %urlcolor = matse
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Context
\usepackage[]{imakeidx}
\usepackage{iflang}

% author / Autor
\newcommand{\authorname}{}
\newcommand{\setauthor}[1]{
  \renewcommand{\authorname}{#1}
  }

\usepackage{etoolbox}

\usepackage{fancyhdr}
\usepackage{lastpage}

\pagestyle{fancy}
\fancyhf{} % sets both header and footer to nothing
\renewcommand{\headrulewidth}{0pt}
\fancyfoot{}

\lfoot{}
\cfoot[\IfLanguageName{ngerman}{Seite \thepage\ von \pageref{LastPage}}{Page \thepage\ of \pageref{LastPage}}]{\IfLanguageName{ngerman}{Seite \thepage\ von \pageref{LastPage}}{Page \thepage\ of \pageref{LastPage}}}
\rfoot{}

%\runningheadrule

\author{\authorname}

\AtEndDocument{
  \makeatletter
  \makeatother
}