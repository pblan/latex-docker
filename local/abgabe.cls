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
\usepackage{pdfpages}
\usepackage{nicefrac}

\usepackage[linguistics]{forest}

\forestset{
    above left prob/.style={
            edge label={node[midway, above left] {#1}},
            %edge label={node[midway, fill=white] {\tiny #1}}
    },
    above right prob/.style={
            edge label={node[midway, above right] {#1}},
            %edge label={node[midway, fill=white] {\tiny #1}}
    },
    below left prob/.style={
            edge label={node[midway, below left] {#1}},
            %edge label={node[midway, fill=white] {\tiny #1}}
    },
    below right prob/.style={
            edge label={node[midway, below right] {#1}},
            %edge label={node[midway, fill=white] {\tiny #1}}
    },
    left prob/.style={
            edge label={node[midway, left] {#1}},
            %edge label={node[midway, fill=white] {\tiny #1}}
    },
    right prob/.style={
            edge label={node[midway, right] {#1}},
            %edge label={node[midway, fill=white] {\tiny #1}}
    },
    marked/.style={
            edge=red, text=red
    },
    wide/.style={
      s sep+=15pt,
      l sep+=40pt,
    }
}

\makesavenoteenv{solution}

\newcommand{\gqq}[1]{\glqq{}#1\grqq{}}
\newcommand{\gq}[1]{\glq{}#1\grq{}}

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
\usepackage{venndiagram}

\DeclarePairedDelimiter\abs{\lvert}{\rvert}
\DeclarePairedDelimiter\norm{\lVert}{\rVert}
\DeclarePairedDelimiter\floor{\lfloor}{\rfloor}
\DeclarePairedDelimiter\ceil{\lceil}{\rceil}
\DeclarePairedDelimiter\scalarprod{\langle}{\rangle}
\DeclarePairedDelimiter\interval{[}{]}

\newcommand{\Eig}{\operatorname{Eig}}
\DeclareMathOperator{\Exists}{\exists}
\DeclareMathOperator{\Forall}{\forall}
\DeclareMathOperator{\Var}{Var}
\DeclareMathOperator{\Mean}{E}
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
\DeclareMathOperator{\diff}{d}

%\newcommand*\conj[1]{\mkern 1.5mu\overline{\mkern-1.5mu#1\mkern-1.5mu}\mkern 1.5mu}
%\newcommand*\conj[1]{\overline{#1}}
\newcommand*\conj[1]{\,\overline{\!{#1}}}
%\newcommand*\conj[1]{\bar{#1}}

% Roman Numbers
% \Rnum{3} -> III
\newcommand{\Rnum}[1]{\uppercase\expandafter{\romannumeral #1\relax}} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Diagrams
\usepackage{tikz}
\usepackage{tikzscale}
\usepackage{pgfplots, pgfplotstable}
\usepgfplotslibrary{fillbetween}

\makeatletter
\long\def\ifnodedefined#1#2#3{%
    \@ifundefined{pgf@sh@ns@#1}{#3}{#2}%
}

\pgfplotsset{
  compat=1.8,
  % src: https://tex.stackexchange.com/questions/578935/how-to-change-the-dot-of-discontinuous-latex-plot
  % comments based on: https://tex.stackexchange.com/questions/578935/how-to-change-the-dot-of-discontinuous-latex-plot
  discontinuous/.style={ 
  scatter,
  scatter/@pre marker code/.code={
      \ifnodedefined{marker}{
          \pgfpointdiff{\pgfpointanchor{marker}{center}}%
            {\pgfpoint{0}{0}}%
            \ifdim\pgf@y>0pt
              %\tikzset{options/.style={mark=*, fill=white}}
              \tikzset{options/.style={mark=*}}
              \draw [densely dashed] (marker-|0,0) -- (0,0);
              %\draw plot [mark=*] coordinates {(marker-|0,0)};
              \draw plot [mark=*,mark options={fill=white}] coordinates {(marker-|0,0)};
            \else
              \tikzset{options/.style={mark=none}}
            \fi
      }{
          \tikzset{options/.style={mark=none}}        
      }
      \coordinate (marker) at (0,0);
      \begin{scope}[options]
  },
  scatter/@post marker code/.code={\end{scope}}
  },
  table/create on use/cumulative distribution/.style={
    create col/expr={\pgfmathaccuma + \thisrow{f(x)}}
  },
  table/create on use/density function/.style={
    create col/expr={\thisrow{f(x)}}
  }
}

\makeatother

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