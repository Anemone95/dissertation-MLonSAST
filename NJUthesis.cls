%%
%% This is file `NJUthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% NJUthesis.dtx  (with options: `cls')
%%
%% This is a generated file.
%% 
%% Updated by Hongyu Kuang <khy@nju.edu.cn> in 2019/3.
%%
%% Copyright (C) 2010 by Wenbo Yang <http://solrex.org> and
%% any individual authors listed elsewhere in this file.
%%
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%%
%% Homepage: http://share.solrex.org/njuthesis/ or
%%           http://njuthesis.googlecode.com/
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{NJUthesis}
  [2010/05/14 v0.2d NJUthesis%
   document class]
\newif\ifNJUT@backinfo \NJUT@backinfotrue
\DeclareOption{nobackinfo}{\NJUT@backinfofalse}

\newif\ifNJUT@review \NJUT@reviewfalse
\DeclareOption{review}{\NJUT@reviewtrue}

\newif\ifNJUT@phd \NJUT@phdfalse
\newif\ifNJUT@master \NJUT@masterfalse
\DeclareOption{phd}{\NJUT@phdtrue}
\DeclareOption{master}{\NJUT@mastertrue}
\newif\ifNJUT@dvips \NJUT@dvipsfalse
\DeclareOption{dvips}{\NJUT@dvipstrue}
\DeclareOption{dvipdfm}{\NJUT@dvipsfalse}
\DeclareOption{pdftex}{\NJUT@dvipsfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax
\LoadClass[cs4size,a4paper,fancyhdr,fntef]{ctexbook}[2005/11/25]
%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
%% graphics packages
\RequirePackage{graphicx}
%% We put NJU logo in the subdir figures/, so we must declear it here.
\graphicspath{{FIGs/}}
%% check pdfTeX mode
\RequirePackage{ifpdf}
%% packages and settings depend on PDF mode
\ifpdf   % We're running pdfTeX in PDF mode
  \RequirePackage[pdftex]{hyperref}
  \DeclareGraphicsExtensions{.pdf}
\else    % We're not running pdfTeX, or running pdfTeX in DVI mode
  \ifNJUT@dvips
    \RequirePackage[dvips]{hyperref}
    \RequirePackage{psfrag}
    \AtBeginDvi{\special{pdf:tounicode GBK-EUC-UCS2}} % GBK -> Unicode
  \else
    % \RequirePackage[dvipdfmx]{hyperref} % This is the original.
    \if\RequirePackage[dvipdfm]{hyperref} % eumes added
    \else
      \RequirePackage[xetex]{hyperref}
  \fi
  \DeclareGraphicsExtensions{.pdf,.eps,.ps}
\fi
%% sort and compress citations
\RequirePackage[sort&compress,numbers]{natbib}
%% Define link colors
\RequirePackage{color}
\definecolor{darkblue}{rgb}{0,0,0.55}
\hypersetup{CJKbookmarks,%
       bookmarksnumbered,%
              colorlinks,%
               linkcolor=black,%
               citecolor=darkblue,%
              plainpages=false,%
            pdfstartview=FitH}
\AtEndOfPackage{\makeatletter\input{NJUthesis.cfg}\makeatother}
%% Define page layout.
\RequirePackage{geometry}
\geometry{top=3.5cm,bottom=3.5cm,left=3.2cm,right=3.2cm}
\geometry{headheight=2.6cm,headsep=3mm,footskip=13mm}
\parskip 0.5ex plus 0.25ex minus 0.25ex
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
  \thispagestyle{empty}%
  \hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}
\renewcommand{\floatpagefraction}{0.80}
%% Bib styles and DIYed \cite commands.
%%\bibliographystyle{NJUthesis}
\bibliographystyle{elsart-num}
%% Author-year mode label with numerical mode indexes.
%% Jack (2000)
\newcommand\citenju[1]{\protect\citeauthor{#1} (\protect\citeyear{#1})}
%% [Jack, 2000]
\newcommand\citenjup[1]{[\protect\citeauthor{#1}, \protect\citeyear{#1}]}
%% Jack, 2000
\newcommand\citenjupr[1]{\protect\citeauthor{#1}, \protect\citeyear{#1}}
%% Jack (2000)
\newcommand\Citenju[1]{\protect\Citeauthor{#1} (\protect\citeyear{#1})}
\newcommand\NJUTspace{\protect\CTEX@spaceChar\protect\CTEX@spaceChar}
\def\NJUT@getfileinfo#1 #2 #3\relax#4\relax{%
  \def\NJUTfiledate{#1}%
  \def\NJUTfileversion{#2}%
  \def\NJUTfileinfo{#3}}%
\expandafter\ifx\csname ver@NJUthesis.cls\endcsname\relax
  \edef\reserved@a{\csname ver@ctextemp_NJUthesis.cls\endcsname}
\else
  \edef\reserved@a{\csname ver@NJUthesis.cls\endcsname}
\fi
\expandafter\NJUT@getfileinfo\reserved@a\relax? ? \relax\relax
\def\NJUT@underline[#1]#2{%
  \underline{\hbox to #1{\hfill#2\hfill}}}
\def\NJUTunderline{\@ifnextchar[\NJUT@underline\underline}
%%
%% command to file string values only in the National library cover page
%%
\newcommand\classification[1]{\def\NJUT@value@classification{#1}}
\newcommand\confidential[1]{\def\NJUT@value@confidential{#1}}
\newcommand\UDC[1]{\def\NJUT@value@UDC{#1}}
\newcommand\titlelinea[1]{\def\NJUT@nlc@value@titlelinea{#1}}
\newcommand\titlelineb[1]{\def\NJUT@nlc@value@titlelineb{#1}}
\newcommand\titlelinec[1]{\def\NJUT@nlc@value@titlelinec{#1}}
\newcommand\advisorinfo[1]{\def\NJUT@nlc@value@advisorinfo{#1}}
\newcommand\chairman[1]{\def\NJUT@nlc@value@chairman{#1}}
\newcommand\reviewera[1]{\def\NJUT@nlc@value@reviewera{#1}}
\newcommand\reviewerb[1]{\def\NJUT@nlc@value@reviewerb{#1}}
\newcommand\reviewerc[1]{\def\NJUT@nlc@value@reviewerc{#1}}
\newcommand\reviewerd[1]{\def\NJUT@nlc@value@reviewerd{#1}}
\newcommand\nlcfootdate[1]{\def\NJUT@nlc@value@footdate{#1}}
%%
%% command to fill string values in the title page
%%
\newcommand\school[1]{\def\NJUT@value@school{#1}}
\newcommand\degree[1]{\def\NJUT@value@degree{#1}}
\renewcommand\title[2][\NJUT@value@title]{%
  \def\NJUT@value@title{#2}
  \def\NJUT@value@titlemark{\MakeUppercase{#1}}}
\renewcommand\author[1]{\def\NJUT@value@author{#1}}
\newcommand\studentnum[1]{\def\NJUT@value@studentnum{#1}}
\newcommand\grade[1]{\def\NJUT@value@grade{#1}}
\newcommand\advisor[1]{\def\NJUT@value@advisor{#1}}
\newcommand\major[1]{\def\NJUT@value@major{#1}}
\newcommand\researchfield[1]{\def\NJUT@value@researchfield{#1}}
\newcommand\footdate[1]{\def\NJUT@value@footdate{#1}}
\newcommand\submitdate[1]{\def\NJUT@value@submitdate{#1}}
\newcommand\defenddate[1]{\def\NJUT@value@defenddate{#1}}

\ifNJUT@review
  \renewcommand\author[1]{}
  \renewcommand\advisor[1]{}
\fi
%%
%% command to fill string values in the english title page
%%
\newcommand\englishtitle[1]{\def\NJUT@value@englishtitle{#1}}
\newcommand\englishauthor[1]{\def\NJUT@value@englishauthor{#1}}
\newcommand\englishadvisor[1]{\def\NJUT@value@englishadvisor{#1}}
\newcommand\englishadvisorM[1]{\def\NJUT@value@englishadvisorM{#1}}
\newcommand\englishadvisorname[1]{\def\NJUT@value@englishadvisorname{#1}}
\newcommand\englishadvisornameM[1]{\def\NJUT@value@englishadvisornameM{#1}}
\newcommand\englishinstitute[1]{\def\NJUT@value@englishinstitute{#1}}
\newcommand\englishdate[1]{\def\NJUT@value@englishdate{#1}}
\newcommand\englishaddress[1]{\def\NJUT@value@englishaddress{#1}}
\newcommand\englishdegree[1]{\def\NJUT@value@englishdegree{#1}}
\newcommand\englishmajor[1]{\def\NJUT@value@englishmajor{#1}}

\ifNJUT@review
  \renewcommand\englishauthor[1]{}
  \renewcommand\englishadvisor[1]{}
  \renewcommand\englishadvisorname[1]{}
\fi

%%
%% Make Chinese title page with/without National library cover page
%%
\renewcommand\maketitle{%
  \ifNJUT@phd
    \cleardoublepage
    \thispagestyle{empty}
    \pdfbookmark[0]{NLC Cover}{nlccover}
    {\songti\zihao{-4}
      \NJUT@nlc@label@classification~
      \NJUTunderline[150pt]{\NJUT@nlc@value@classification}
      \hfill
      \NJUT@nlc@label@confidential~
      \NJUTunderline[150pt]{\NJUT@nlc@value@confidential}
      \vskip 10pt
      \NJUT@nlc@label@UDC~
      \NJUTunderline[160pt]{\NJUT@nlc@value@UDC}
    }
    \vskip \stretch{2}
    \begin{center}
      \def\ULthickness{1pt}
      {\kaishu\zihao{-0} \NJUT@nlc@label@title}
      {\kaishu\zihao{1}
        \vskip \stretch{1}
        \NJUTunderline[9em]{~\NJUT@nlc@value@titlelinea~}\\
        \NJUTunderline[9em]{~\NJUT@nlc@value@titlelineb~}\\
        \NJUTunderline[9em]{~\NJUT@nlc@value@titlelinec~}\\
      }
      \vskip \stretch{1}
      {\kaishu\zihao{4} \NJUT@nlc@label@quotetitle}
      \vskip \stretch{1}
      {\kaishu\zihao{1} \NJUTunderline{~\NJUT@value@author~}}
      \vskip \stretch{1}
      {\kaishu\zihao{4} \NJUT@nlc@label@author}
    \end{center}
    {\kaishu\zihao{4}
      \vskip \stretch{1}
      \noindent \NJUT@nlc@label@advisor \NJUTunderline[94pt]{\NJUT@value@advisor}

      \noindent \NJUTunderline[\textwidth]{\NJUT@nlc@value@advisorinfo}

      \noindent \NJUT@nlc@label@degree \NJUTunderline[8em]{\NJUT@value@degree}
      \NJUT@nlc@label@major \NJUTunderline[164pt]{\NJUT@value@major}

      \noindent \NJUT@nlc@label@submitdate \NJUTunderline[8em]{\NJUT@value@submitdate}
      \NJUT@nlc@label@defenddate \NJUTunderline[134pt]{\NJUT@value@defenddate}

      \noindent \NJUT@nlc@label@school \NJUTunderline[290pt]{}

      \noindent \hfill \NJUT@nlc@label@chairman \NJUTunderline[9em]{\NJUT@nlc@value@chairman}

      \noindent \hfill \NJUT@nlc@label@reviwer \NJUTunderline[9em]{\NJUT@nlc@value@reviewera}

      \noindent \hfill \NJUTunderline[9em]{\NJUT@nlc@value@reviewerb}

      \noindent \hfill \NJUTunderline[9em]{\NJUT@nlc@value@reviewerc}

      \noindent \hfill \NJUTunderline[9em]{\NJUT@nlc@value@reviewerd}
    }
    \vskip \stretch{2}
    \begin{center}
      {\kaishu\zihao{3}  \NJUT@nlc@value@footdate}
    \end{center}
  \fi
  \if@twoside\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \pdfbookmark[0]{NJU Cover}{cover}
  \begin{center}
    \vskip 10mm
    \ifNJUT@review
      \includegraphics[width=1.96cm]{reviewPlaceholder} \\
    \else
      \includegraphics[width=1.96cm]{njulogo} \\
    \fi
    
    \vskip 10mm
    
     \ifNJUT@review
      \includegraphics[width=1.96cm]{reviewPlaceholder} \\
    \else
      \includegraphics[height=2cm]{njuname} \\
    \fi
    
    \vskip 10mm        
    
      {\bf\songti\zihao{1}  \NJUT@label@thesis}\\
    \vskip 10mm
      {\kaishu\zihao{1} \NJUT@label@apply}\\
    \vskip \stretch{1}
    \kaishu\zihao{3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    \begin{tabular}{lc}
      \bf{\NJUT@label@title} & \kaishu\NJUTunderline[310pt]{\scalebox{0.85}[1.0]{\NJUT@value@title}}\\
      \bf{\NJUT@label@author} & \kaishu\NJUTunderline[310pt]{\NJUT@value@author}\\
      \bf{\NJUT@label@major} & \kaishu\NJUTunderline[310pt]{\NJUT@value@major}\\
      \bf{\NJUT@label@researchfield} & \kaishu\NJUTunderline[310pt]{\NJUT@value@researchfield}\\
      \bf{\NJUT@label@advisor} & \kaishu\NJUTunderline[310pt]{\NJUT@value@advisor}\\
    \end{tabular}\\
  \vskip \stretch{1}
  {\bf\kaishu\zihao{4} \NJUT@value@submitdate}
  \end{center}
  \clearpage
  \ifNJUT@backinfo
    \thispagestyle{empty}
    \vspace*{\stretch{1}}
    {\kaishu\zihao{-3}
    \noindent\begin{tabular}{rl}
      \NJUT@back@label@studentnum &： \bf{\NJUT@value@studentnum}\\
      \NJUT@back@label@defenddate &： \bf{\NJUT@value@defenddate}\\
      \NJUT@back@label@advisor &： \bf{\NJUT@back@label@sign}\\
    \end{tabular}
    }
  \fi
}
%%
%% Chinese title page
%%
\newcommand\makechinesetitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{20pt}
    \includegraphics[width=1.96cm]{njulogo}\\
    \vskip 10mm
      {\bf\kaishu\zihao{3} \NJUT@label@chinesetitle}\\
    \vskip 10mm
      {\bf\kaishu\zihao{2} \NJUT@value@title}\\
    \vskip 5mm
    %\includegraphics[width=1.96cm]{njulogo}\\
    \vskip \stretch{1.5}
    \songti\zihao{3}
    \def\tabcolsep{1pt}
    \def\arraystretch{1.5}
    \begin{tabular}{rl}
      \NJUT@label@chineseapplier &: \bf{\NJUT@value@author}\\
      \NJUT@label@chinesestudentno &: \bf{\NJUT@value@studentnum}\\
      \NJUT@label@chinesemajor  &: \bf{\NJUT@value@major}\\
      \NJUT@label@chineseresearchfield &: \bf{\NJUT@value@researchfield}\\
      \NJUT@label@chineseadvisor &: \bf{\NJUT@value@advisor}\\
    \end{tabular}\\
  \vskip \stretch{1}
  {\bf\kaishu\zihao{3} \NJUT@value@institution}
  \vskip 2mm
  {\bf\kaishu\zihao{3} \NJUT@value@footdate}
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}
%%
%% english title page
%%
\newcommand\makeenglishtitle{%
  \cleardoublepage
  \thispagestyle{empty}
  \begin{center}
    \vspace*{20pt}
    
    \ifNJUT@review
      \includegraphics[width=1.96cm]{reviewPlaceholder} \\
    \else
      \includegraphics[width=1.96cm]{njulogo} \\
    \fi
    
      \bf\zihao{2} \NJUT@value@englishtitle
    \vskip \stretch{2}
      \normalfont\zihao{4} By
    \vskip 1pt
      \bf\zihao{4} \NJUT@value@englishauthor
      \vskip \stretch{1}
      \normalfont\zihao{4} \NJUT@label@englishadvisor
    \vskip 1pt
      \normalfont\zihao{4}\NJUT@value@englishadvisorM
      \bf\zihao{4}\NJUT@value@englishadvisornameM
    \vskip 1pt
      \normalfont\zihao{4} \NJUT@value@englishadvisor
      \bf\zihao{4} \NJUT@value@englishadvisorname
    \vskip \stretch{2}
    
    \ifNJUT@review
	    \normalfont\zihao{4} \NJUT@label@englishstatementReview
	  \else  
	    \normalfont\zihao{4} \NJUT@label@englishstatement
	  \fi
	  
	%\vskip \stretch{1}
	  \bf\zihao{4} \NJUT@value@englishdegree

    \vskip \stretch{2}
      \ifNJUT@review
	      %%DO NOTHING
	    \else  
	      \normalfont\zihao{4} \NJUT@value@englishinstitute
	    \fi
      
    \vskip \stretch{0}
      \normalfont\zihao{4} \NJUT@value@englishdate
  \end{center}
  \clearpage
  \if@twoside
    \thispagestyle{empty}
    \cleardoublepage
  \fi
}
\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyhead[C]{\if@mainmatter\small \leftmark\fi}
  \fancyfoot[C]{\small ~\thepage~}
  \renewcommand{\headrulewidth}{\if@mainmatter 0.7pt\else 0pt \fi}
}
\pagestyle{plain}
\newenvironment{abstract}{
  \pdfbookmark[0]{\NJUT@abs@label@abstract}{abstract}
  \begin{center}
  
    \ifNJUT@review
	    {\bf\kaishu\zihao{-2} \uuline{\NJUT@abs@label@barReview}}
	  \else  
	    {\bf\kaishu\zihao{-2} \uuline{\NJUT@abs@label@bar}}
	  \fi
        
  \end{center}

  {\kaishu\zihao{4}%
    \noindent \NJUT@abs@label@title \NJUTunderline[316pt]{\NJUT@value@title}

    \noindent \NJUTunderline[178pt]{\NJUT@value@major} \NJUT@abs@label@major%
    \NJUTunderline[44pt]{\NJUT@value@grade} \NJUT@abs@label@author%
    \NJUTunderline[60pt]{\NJUT@value@author}

    \noindent \NJUT@abs@label@advisor \NJUTunderline[254pt]{\NJUT@value@advisor}
  }
  \begin{center}
    {\heiti\zihao{-3} \NJUT@abs@label@abstract}
  \end{center}
}{}
\newcommand\keywords[1]{\vspace{2ex}\noindent{\heiti \NJUT@abs@label@keywords} #1}
\newenvironment{englishabstract}{
  \if@twoside\cleardoublepage\else\clearpage\fi
  \pdfbookmark[0]{\NJUT@abs@label@englishabstract}{englishabstract}
  \begin{center}
    
    \ifNJUT@review
	    {\bf\kaishu\zihao{-2} \uuline{\NJUT@abs@label@englishbarReview}}
	  \else  
	    {\bf\kaishu\zihao{-2} \uuline{\NJUT@abs@label@englishbar}}
	  \fi
    
  \end{center}

  {\zihao{4}%
    \begin{description}[font=\normalfont, leftmargin=4em]
      \item[THESIS:] \NJUT@value@englishtitle
      \item[SPECIALIZATION:] \NJUT@value@englishmajor
      \item[POSTGRADUATE:] \NJUT@value@englishauthor
      \item[MENTOR:]\NJUT@value@englishadvisorM\NJUT@value@englishadvisornameM,  \NJUT@value@englishadvisor \NJUT@value@englishadvisorname
    \end{description}
  }
  \begin{center}
   {\bf\zihao{-3} \NJUT@abs@label@englishabstract}
  \end{center}
}{}
\newcommand\englishkeywords[1]{%
  \vspace{2ex}\noindent{\bf \NJUT@abs@label@englishkeywords} #1}
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \Nchapter{\contentsname}%
    \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}%
    \@starttoc{toc}%
    \if@restonecol\twocolumn\fi
}
\addtocontents{toc}{\let\string\CTEX@spaceChar\relax}
\newcommand\Nchapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi}

\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}\hfill
     \nobreak
     \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
     \par}%
  \fi}
\renewcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1
       \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
       \hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak
      \leaders\hbox{$\m@th\mkern 1.5mu\cdot\mkern 1.5mu$}
      \hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewenvironment{thebibliography}[1]
     {\Nchapter{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newenvironment{publications}[1]
     {\Nchapter{\NJUT@label@publications}%
      \@mkboth{\MakeUppercase\NJUT@label@publications}
              {\MakeUppercase\NJUT@label@publications}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `publications' environment}}%
      \endlist}
\newenvironment{Publications}[1]{
  \noindent {\heiti\zihao{3} \NJUT@label@publications}%
  \list{\@biblabel{\@arabic\c@enumiv}}%
  {\settowidth\labelwidth{\@biblabel{#1}}%
  \leftmargin\labelwidth
  \advance\leftmargin\labelsep
  \@openbib@code
  \usecounter{enumiv}%
  \let\p@enumiv\@empty
  \renewcommand\theenumiv{\@arabic\c@enumiv}}%
  \sloppy
  \clubpenalty4000
  \@clubpenalty \clubpenalty
  \widowpenalty4000%
  \sfcode`\.\@m
}{
  \def\@noitemerr
    {\@latex@warning{Empty `publications' environment}}%
  \endlist
}
\newenvironment{resume}
{\Nchapter{\NJUT@label@resume}}
{}
\newenvironment{resumesection}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 2\ccwd}
   \item\relax}
  {\endlist}
\newenvironment{resumelist}[1]
  {{\noindent\normalfont\bfseries #1}
   \list{}{\labelwidth\z@
           \leftmargin 4\ccwd
           \itemindent -2\ccwd
           \listparindent\itemindent}
   \item\relax}
  {\endlist}
\renewenvironment{thanks}
  {\Nchapter{\NJUT@label@thanks}}
  {}
\setcounter{secnumdepth}{4}
\newtheoremstyle{break}% name
  {}%      Space above, empty = `usual value'
  {}%      Space below
  {\itshape}% Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}% Thm head font
  {.}%        Punctuation after thm head
  {\newline}% Space after thm head: \newline = linebreak
  {}%         Thm head spec
\endinput
%%
%% End of file `NJUthesis.cls'.
