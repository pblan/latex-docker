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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Enable post-90s text processing
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
\setkomafont{disposition}{\fontseries{sbc}\sffamily}

\usepackage[shortlabels]{enumitem}
\setlist{nosep}

\makeatletter
% Re-enable paragraph spacing in minipages;
% we choose something smaller than what is used outside of minipages.
\newcommand{\@minipagerestore}{\setlength{\parskip}{0.8\medskipamount}}
\makeatother

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utilities
\usepackage[svgnames]{xcolor}
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


\newcommand{\gqq}[1]{\glqq{}#1\grqq{}}
\newcommand{\gq}[1]{\glq{}#1\grq{}}

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
  }
}

\makeatother

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
% Just like the 'center' block, but without spacing around it.
\newenvironment{tightcenter}{%
  \setlength\topsep{0pt}
  \setlength\parskip{0pt}
  \begin{center}
}{%
  \end{center}
}

\usepackage{tcolorbox}

\usepackage{array}   % for \newcolumntype macro

\newcolumntype{L}{>{$}l<{$}} % math-mode version of "l" column type
\newcolumntype{R}{>{$}r<{$}} % math-mode version of "r" column type
\newcolumntype{C}{>{$}c<{$}} % math-mode version of "c" column type
\newcolumntype{P}{>{$}p<{$}} % math-mode version of "l" column type

\newenvironment{sysmatrix}[1]
{\left(\begin{array}{@{}#1@{}}}
    {\end{array}\right)}
    

\newcommand{\vektor}[1]{\begin{pmatrix*}[c] #1 \end{pmatrix*}}

%%%%%%%%%%%%%%%%
% Context Blocks

\usepackage[]{imakeidx}

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
\begin{tcolorbox}[colback=fhmint!5!white, colframe=fhmint!75!black, title={\sffamily Definition: #1}]
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
    
\newcommand{\exampleseparator}{\noindent\rule{\textwidth}{0.2pt}}

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

\usepackage[style=numeric, backend=bibtex]{biblatex}