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
\usepackage{diagbox}

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