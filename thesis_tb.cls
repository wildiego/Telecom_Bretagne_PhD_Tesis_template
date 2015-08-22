% Template v1.0
% By William Diego <william.diego@outlook.com>
% Version 1.0 released 06/08/2015

%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis_tb}[2015/06/08 v1.0 TB thesis class]

%-------------------------- initial code -----------------------

%Style BOOK:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips, a4paper]{book}
\else   \LoadClass[pdftex, a4paper]{book}
\fi

%Packages à charger
\usepackage{amssymb}
\usepackage{graphics}
\usepackage{fancyhdr} % en-tete et pieds de page
\usepackage{eucal}
\usepackage[usenames, dvipsnames]{xcolor}
%\usepackage[numbers,sort&compress]{natbib}
\usepackage{hypernat}
\usepackage{ifpdf}
\usepackage{ifthen}
%\RequirePackage{fncychap} %en tete chapitrage
\RequirePackage{calc}

\RequirePackage{float}
\RequirePackage{latexsym}
\RequirePackage{makeidx}
\RequirePackage{calc}
\RequirePackage{ifthen}
\RequirePackage{float}
\RequirePackage[frenchb,english]{babel}
\RequirePackage{eso-pic}
\RequirePackage[absolute]{textpos}
%\RequirePackage[frenchb]{babel}
\RequirePackage[avantgarde]{quotchap}
\RequirePackage[calcwidth]{titlesec}
\RequirePackage{multicol}
\RequirePackage{xcolor}
\RequirePackage{pdfrender}
\usepackage{gensymb}

% Nomenclature
\usepackage[french]{nomencl}
%\makenomenclature

\newif \ifpdf
    \ifx \pdfoutput \undefined
        % for running latex
        \pdffalse
    \else
        % for running pdflatex
        \pdfoutput = 1    
                          
        \pdftrue
\fi
\ifpdf
 \usepackage[pdftex]{graphicx}
%\definecolor{bibcolor}{rgb}{0.02,0.75,0.06}
\usepackage[pdftex, pdfauthor={William Diego}, plainpages = false,
								 pdfpagelabels= true, 
                 pdfpagelayout = SinglePage,
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref = true, % pour effacer les rappels de pages dans la biblio (utile dans la version papier).  
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = blue,
                 anchorcolor = blue,
                 hyperindex = true,
                 hyperfootnotes=false,
                 hyperfigures
                 ]{hyperref} 

    \DeclareGraphicsExtensions{.png, .jpg, .pdf}
     \pdfcompresslevel=9
  \else
    \usepackage[ps4pdf,plainpages = false, pdfpagelabels, bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 pagebackref,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = magenta,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}


    \DeclareGraphicsExtensions{.eps, .ps}
    \usepackage{epsfig}
    \usepackage{graphicx}
  \fi
  
  
  
%%%=============================================================
% Clear Doble New : pour que les pages insérées soient vides
%%%=============================================================
\def\cleardoublepage{\clearpage
 \if@twoside
  \ifodd\c@page\else
   \null\thispagestyle{plain}%chapterverso}
   \newpage
   \if@twocolumn\null\newpage\fi
   \fi
  \fi
 }%
\def\ps@chapterverso{\ps@empty}%


%%%=============================================================
%Paramètres A4 
%%%=============================================================
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm} 
   \setlength{\paperwidth}{210mm} 
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}

\setlength{\evensidemargin}{0mm} % Paginas pares
\setlength{\oddsidemargin}{10mm}   % Impares

\setlength{\topmargin}{-5mm}
\setlength{\headheight}{0cm} % 1 cm par défaut
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{22cm}
\setlength{\textwidth}{15cm} % 16 cm par déf.
\setlength{\marginparsep}{0cm} % 1mm par def.
\setlength{\marginparwidth}{0cm}
\setlength{\headheight}{2\baselineskip} 
\setlength{\footskip}{2.36cm}


%%%=============================================================
%En tete et pied de page
%%%=============================================================
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\chaptername~\thechapter.~~\textit{#1} }}{}}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername~\thechapter.~~\textit{#1} }{}}

\fancyhf{}
\fancyhead[RO]{\itshape \rightmark}
\fancyhead[LE]{\itshape \leftmark}
\fancyfoot[RO]{\thepage}
\fancyfoot[LE]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

%%%=============================================================
% DECLARATIONS
%%%=============================================================
\def\degreedate#1{\gdef\@degreedate{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\collegeordept#1{\gdef\@collegeordept{#1}}
\def\university#1{\gdef\@university{#1}}
\def\crest#1{\gdef\@crest{#1}}


\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}
%%%=============================================================
% Dedicace
%%%=============================================================
\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}

%%%=============================================================
% Remerciements
%%%=============================================================
\newenvironment{acknowledgements}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{flushleft}
\vspace*{1.5cm}
{\Huge \bfseries Acknowledgements}
\end{flushleft}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}
%%%=============================================================
%Résumé
%%%=============================================================
\newenvironment{resume} {\begin{alwayssingle} \pagestyle{empty}
  \begin{flushleft}
  \vspace*{1.5cm}
  {\Large \bfseries  Resume}
  \end{flushleft}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}


\newenvironment{abstracts} {\begin{alwayssingle} \pagestyle{empty}
  \begin{flushleft}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{flushleft}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}


\newenvironment{abstractslong} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm} \begin{quote}}
{\end{quote}\end{alwayssingle}}


%%%=============================================================
%%%=============================================================
\newcommand{\alignquatriemedecouv}{
\newpage\thispagestyle{empty}~
\ifodd\value{page}
\newpage\thispagestyle{empty}
\else
\newpage\thispagestyle{empty}~\newpage\thispagestyle{empty}
\fi
}

\AtBeginDocument{%
%\floatstyle{plain}
%\newfloat{algorithm}{t}{algs}[chapter]
%\floatname{algorithm}{\textsc{Alg}}
%\floatplacement{algorithm}{tbp}
%\makeindex
\def\uppercase{}
}
\AtEndDocument{%
}

%%%=============================================================
%%%=============================================================
% Thesis Cover
%%%=============================================================
%%%=============================================================


%%%%%% Space between caracters
\RequirePackage[tracking=true]{microtype}
\SetTracking[no ligatures = f]{encoding = *,shape = sc}{120}
\newcommand*{\textsomels}[1]{\textls[-60]{#1}}
\newcommand*{\textplus}[1]{\textls[+180]{#1}}
%%%%%%

\newcommand{\THESE}{TH{\`E}SE / TELECOM Bretagne}
\newcommand{\UNIV}{Universit{\'e} de Bretagne Sud}
\newcommand{\UNIVaddress}{Universit{\'e} de Bretagne Sud}
\newcommand{\UFR}{En accréditation conjointe avec l'Ecole Doctorale Matisse}
\newcommand{\SCEAU}{Sous le sceau de l'Universit{\'e} Europ{\'e}enne de Bretagne}
\newcommand{\GRADE}{Docteur de Telecom Bretagne}
\newcommand{\MENTION}{Informatique}
\newcommand{\ED}{MATISSE}
\newcommand{\AUTEURprenom}{William David}
\newcommand{\AUTEURnom}{Diego Maza}
\newcommand{\LAB}{Th{\'e}se CIFRE Orange Labs \\ D{\'e}partement : R{\'e}seaux, Sé{\'e}curit{\'e} et Multim{\'e}dia (RSM) \\Laboratoire : IRISA}
\newcommand{\TITRE}{Contr\^ole de trafic et gestion de la QoS "IP centric" dans les r\'eseaux mobiles LTE}
\newcommand{\TITREfr}{Contr\^ole de trafic et gestion de la QoS  "IP centric" \\ dans les r\'eseaux mobiles LTE}
\newcommand{\TITREen}{Contr\^ole de trafic et gestion de la QoS "IP centric" \\ dans les r\'eseaux mobiles LTE}
\newcommand{\DATE}{28 F{\'e}vrier 1957}
\newcommand{\DATEen}{28 F{\'e}vrier 1957}
\newcommand{\PRESIDENTgenre}{M}
\newcommand{\PRESIDENTgenreen}{M}
\newcommand{\PRESIDENTtitre}{pr{\'e}sident}
\newcommand{\PRESIDENTprenom}{xyz}
\newcommand{\PRESIDENTnom}{mnop}
\newcommand{\PRESIDENTcity}{City, Country}
\newcommand{\PRESIDENTqualite}{R{\'e}dacteur, abc}
\newcommand{\PRESIDENTqualiteen}{R{\'e}dacteur, abc}
\newcommand{\RAPPORTEURgenrei}{M}
\newcommand{\RAPPORTEURgenreeni}{M}
\newcommand{\RAPPORTEURtitre}{rapporteur}
\newcommand{\RAPPORTEURprenomi}{xyz}
\newcommand{\RAPPORTEURnomi}{mnop}
\newcommand{\RAPPORTEURcity}{City, Country}
\newcommand{\RAPPORTEURqualitei}{Repporteur, abc}
\newcommand{\RAPPORTEURqualiteeni}{Repporteur, abc}
\newcommand{\EXAMINATEURgenrei}{M}
\newcommand{\EXAMINATEURgenreeni}{M}
\newcommand{\EXAMINATEURtitre}{examinateur}
\newcommand{\EXAMINATEURprenomi}{xyz}
\newcommand{\EXAMINATEURnomi}{mnop}
\newcommand{\EXAMINATEURcity}{City, Country}
\newcommand{\EXAMINATEURqualitei}{Examinateur, abc}
\newcommand{\EXAMINATEURqualiteeni}{Examinateur, abc}
\newcommand{\DIRECTEURgenrei}{M}
\newcommand{\DIRECTEURgenreeni}{M}
\newcommand{\DIRECTEURtitre}{Directeur de th{\`e}se}
\newcommand{\DIRECTEURtitrei}{Directeur de th{\`e}se}
\newcommand{\DIRECTEURprenomi}{xyz}
\newcommand{\DIRECTEURnomi}{mnop}
\newcommand{\DIRECTEURqualitei}{Directure, abc}
\newcommand{\DIRECTEURqualiteeni}{Directure, abc}
\newcommand{\ENCADRANTgenrei}{M}
\newcommand{\ENCADRANTgenreeni}{M}
\newcommand{\ENCADRANTtitre}{Encadrant de thèse}
\newcommand{\ENCADRANTprenomi}{xyz}
\newcommand{\ENCADRANTnomi}{mnop}
\newcommand{\ENCADRANTcity}{City, Country}
\newcommand{\ENCADRANTqualitei}{Encadrant, abc}
\newcommand{\ENCADRANTqualiteeni}{Encadrant, abc}
\newcommand{\RESUMEfrancais}{Le meilleur  th{\`e}se de tout l'universe}
\newcommand{\RESUMEanglais}{The best PhD thesis of all the universe}
\newcommand{\RESUMEtitre}{this is an abstract}
\newcommand{\NORDRE}{2016telbxxxx}



\newcommand{\COVERBACKGROUND}[2]{
	\begin{textblock*}{\paperwidth}(0mm,0mm)
		\noindent\includegraphics[width=\paperwidth,height={#2}\paperwidth]{#1}
	\end{textblock*}

	\begin{textblock*}{.5\paperwidth-2mm}(0mm,{#2}\paperwidth-32mm)		
		\noindent\mbox{
			\begin{minipage}{.5\paperwidth-2mm}
        			\vspace{3pt}
				\noindent \flushright \small \textcolor{white}{\fontfamily{qhv}\selectfont \textsomels{\textbf{\THESE}}}
				\vspace{-7pt}
				\noindent \flushright \scriptsize \textcolor{white}{\fontfamily{qhv}\selectfont \textsomels{\emph{\SCEAU}}}
				\vspace{-3pt}
				\noindent \flushright \scriptsize \textcolor{white}{\fontfamily{qhv}\selectfont \textsomels{Pour obtenir le grade de \GRADE}}
				\vspace{-8pt}
				\noindent \flushright \scriptsize \textcolor{white}{\fontfamily{qhv}\selectfont \textsomels{\UFR}}	
				\vspace{-8pt}
				\noindent \flushright \scriptsize \textcolor{white}{\fontfamily{qhv}\selectfont \textsomels{\emph{Mention : \MENTION}}}				
				
%				\hspace{1pt}}				
			\end{minipage}
		}
	\end{textblock*}

	\begin{textblock*}{.5\paperwidth-2mm}(.5\paperwidth+2mm,{#2}\paperwidth-32mm)
		\noindent\mbox{
			\begin{minipage}{.5\paperwidth-2mm}
				\vspace{3.6mm}
				\noindent \flushleft \scriptsize \textcolor{white}{\fontfamily{qhv}\selectfont \textsomels{pr{\'e}sent{\'e}e par} }
				\vspace{-12pt}
				\noindent \flushleft \Large \textcolor{white}{\fontfamily{qhv}\selectfont \textsomels{\AUTEURprenom\ \AUTEURnom} }
				\vspace{-7pt}
				\noindent \flushleft \footnotesize \textcolor{white}{\fontfamily{qhv}\selectfont \textsomels{\LAB} }
			\end{minipage}
		}
	\end{textblock*}

	\begin{textblock*}{.5\paperwidth-2mm}(0mm,{#2}\paperwidth+1mm)
		\noindent\mbox{
			\begin{minipage}{.5\paperwidth-7pt}
				\noindent \flushright \huge \textcolor{black}{\fontfamily{qhv}\selectfont  \textbf{\TITRE} }
			\end{minipage}
		}
	\end{textblock*}

	\begin{textblock*}{.5\paperwidth-2mm}(.5\paperwidth+2mm,{#2}\paperwidth)
		\noindent\mbox{
			\begin{minipage}{.5\paperwidth-2mm}
				\vspace{1mm}
				\noindent \flushleft \tiny \textcolor{black}{\fontfamily{qhv}\selectfont \textbf{Th{\`e}se soutenue le \DATE,}}
				\vspace{-9pt}
				\noindent \flushleft \tiny \textcolor{black}{\fontfamily{qhv}\selectfont Devant le jury compos{\'e} de :}

				\vspace{-5pt}

				\noindent \flushleft \tiny \textcolor{black}{\fontfamily{qhv}\selectfont \textbf{\PRESIDENTgenre.\ \PRESIDENTprenom\ \PRESIDENTnom}}
				\vspace{-9pt}
				\noindent \flushleft \tiny \textcolor{black}{\fontfamily{qhv}\selectfont \PRESIDENTqualite\ / \PRESIDENTtitre}

				\setcounter{III}{0}
				\whiledo{{\value{III}<\value{cptRapporteur}}}{
					\stepcounter{III}
					\vspace{-5pt}
					\noindent \flushleft \hspace{-4pt} \tiny \textcolor{black}{\fontfamily{phv}\selectfont \textbf{
						{\csname RAPPORTEURgenre\roman{III}\endcsname}.\ {\csname RAPPORTEURprenom\roman{III}\endcsname}\ {\csname RAPPORTEURnom\roman{III}\endcsname}}
					}
					\vspace{-9pt}
					\noindent \flushleft \tiny \textcolor{black}{\fontfamily{qhv}\selectfont
						{\csname RAPPORTEURqualite\roman{III}\endcsname}\ / \RAPPORTEURtitre
					}
				}

				\setcounter{III}{0}
				\whiledo{{\value{III}<\value{cptExaminateur}}}{
					\stepcounter{III}
					\vspace{-5pt}
					\noindent \flushleft \hspace{-4pt} \tiny \textcolor{black}{\fontfamily{qhv}\selectfont \textbf{
						{\csname EXAMINATEURgenre\roman{III}\endcsname}.\ {\csname EXAMINATEURprenom\roman{III}\endcsname}\ {\csname EXAMINATEURnom\roman{III}\endcsname}}
					}
					\vspace{-9pt}
					\noindent \flushleft \tiny \textcolor{black}{\fontfamily{qhv}\selectfont
						{\csname EXAMINATEURqualite\roman{III}\endcsname}\ / \EXAMINATEURtitre
					}
				}

				\setcounter{III}{0}
				\whiledo{{\value{III}<\value{cptDirecteur}}}{
					\stepcounter{III}
					\vspace{-5pt}
					\noindent \flushleft \hspace{-4pt} \tiny \textcolor{black}{\fontfamily{qhv}\selectfont \textbf{
						{\csname DIRECTEURgenre\roman{III}\endcsname}.\ {\csname DIRECTEURprenom\roman{III}\endcsname}\ {\csname DIRECTEURnom\roman{III}\endcsname}}
					}
					\vspace{-9pt}
					\noindent \flushleft \tiny \textcolor{black}{\fontfamily{qhv}\selectfont
						{\csname DIRECTEURqualite\roman{III}\endcsname}\ / {\csname DIRECTEURtitre\roman{III}\endcsname}
					}
				}
			\end{minipage}
		}
	\end{textblock*}

}





\newcommand{\makeFrontCove}{
	\thispagestyle{empty}
	\COVERBACKGROUND{FrontCover_TB.eps}{1.02489019}
}



\addtocounter{secnumdepth}{1}
\AtBeginDocument{
	\makeindex
	\def\uppercase{}
	\newcounter{cptRapporteur}
	\setcounter{cptRapporteur}{0}
	\newcounter{cptExaminateur}
	\setcounter{cptExaminateur}{0}
	\newcounter{cptDirecteur}
	\setcounter{cptDirecteur}{0}
	\newcounter{cptEncadrant}
	\setcounter{cptEncadrant}{0}
	\newcounter{III}
}
\AtEndDocument{
}


\newcommand{\whitepage}{\newpage\thispagestyle{empty}\addtocounter{page}{-1}~\vspace*{3cm}~\vfill~\newpage}





\newcommand{\Titre}[1]{\renewcommand{\TITRE}{{\LARGE\textbf{#1}}}}
\newcommand{\Titrefr}[1]{\renewcommand{\TITREfr}{#1}}
\newcommand{\Titreen}[1]{\renewcommand{\TITREen}{#1}}
\newcommand{\DateSoutenance}[1]{\renewcommand{\DATE}{#1}}
\newcommand{\DateDefence}[1]{\renewcommand{\DATEen}{#1}}
\newcommand{\Auteur}[2]{
	\renewcommand{\AUTEURprenom}{#1}
	\renewcommand{\AUTEURnom}{#2}
}
\newcommand{\Composante}[4]{
	\renewcommand{\UNIV}{#1}
	\renewcommand{\UNIVaddress}{#2}
	\renewcommand{\UFR}{#3}
	\renewcommand{\LAB}{#4}
}
\newcommand{\President}[6]{
	\renewcommand{\PRESIDENTgenre}{#1}
	\ifthenelse{\equal{#1}{Me}}{\renewcommand{\PRESIDENTtitre}{Pr{\'e}sidente}}{}
	\renewcommand{\PRESIDENTgenreen}{#2}
	\renewcommand{\PRESIDENTprenom}{#3}
	\renewcommand{\PRESIDENTnom}{#4}
	\renewcommand{\PRESIDENTqualite}{#5}
	\renewcommand{\PRESIDENTqualiteen}{#6}
}
\newcommand{\Rapporteur}[7]{
	\stepcounter{cptRapporteur}
	\nouveauRapporteur{\roman{cptRapporteur}}{#1}{#2}{#3}{#4}{#5}{#6}{#7}
}
\newcommand{\nouveauRapporteur}[8]{
	\expandafter\def\csname RAPPORTEURgenre#1\endcsname{#2}
	\expandafter\def\csname RAPPORTEURgenreen#1\endcsname{#3}
	\expandafter\def\csname RAPPORTEURprenom#1\endcsname{#4}
	\expandafter\def\csname RAPPORTEURnom#1\endcsname{#5}
	\expandafter\def\csname RAPPORTEURqualite#1\endcsname{#6}
	\expandafter\def\csname RAPPORTEURqualiteen#1\endcsname{#7}
	\expandafter\def\csname RAPPORTEURcity#1\endcsname{#8}
}
\newcommand{\Examinateur}[7]{
	\stepcounter{cptExaminateur}
	\nouveauExaminateur{\roman{cptExaminateur}}{#1}{#2}{#3}{#4}{#5}{#6}{#7}
}
\newcommand{\nouveauExaminateur}[8]{
	\expandafter\def\csname EXAMINATEURgenre#1\endcsname{#2}
	\expandafter\def\csname EXAMINATEURgenreen#1\endcsname{#3}
	\expandafter\def\csname EXAMINATEURprenom#1\endcsname{#4}
	\expandafter\def\csname EXAMINATEURnom#1\endcsname{#5}
	\expandafter\def\csname EXAMINATEURqualite#1\endcsname{#6}
		\expandafter\def\csname EXAMINATEURqualiteen#1\endcsname{#7}
	\expandafter\def\csname EXAMINATEURcity#1\endcsname{#8}
}
\newcommand{\Directeur}[7]{
	\stepcounter{cptDirecteur}
	\nouveauDirecteur{\roman{cptDirecteur}}{#1}{#2}{#3}{#4}{#5}{#6}{#7}
}
\newcommand{\nouveauDirecteur}[8]{
	\expandafter\def\csname DIRECTEURgenre#1\endcsname{#2}
	\expandafter\def\csname DIRECTEURgenreen#1\endcsname{#3}
	\expandafter\def\csname DIRECTEURprenom#1\endcsname{#4}
	\expandafter\def\csname DIRECTEURnom#1\endcsname{#5}
	\expandafter\def\csname DIRECTEURqualite#1\endcsname{#6}
	\expandafter\def\csname DIRECTEURqualiteen#1\endcsname{#7}
	\expandafter\def\csname DIRECTEURtitre#1\endcsname{#8}
}

\newcommand{\Encadrant}[7]{
	\stepcounter{cptEncadrant}
	\nouveauEncadrat{\roman{cptEncadrant}}{#1}{#2}{#3}{#4}{#5}{#6}{#7}
}
\newcommand{\nouveauEncadrat}[8]{
	\expandafter\def\csname ENCADRANTgenre#1\endcsname{#2}
	\expandafter\def\csname ENCADRANTgenreen#1\endcsname{#3}
	\expandafter\def\csname ENCADRANTprenom#1\endcsname{#4}
	\expandafter\def\csname ENCADRANTnom#1\endcsname{#5}
	\expandafter\def\csname ENCADRANTqualite#1\endcsname{#6}
	\expandafter\def\csname ENCADRANTqualiteen#1\endcsname{#7}
	\expandafter\def\csname ENCADRANTcity#1\endcsname{#8}
}


\newcommand{\Resumes}[3]{
        \renewcommand{\RESUMEtitre}{#1}
	\renewcommand{\RESUMEfrancais}{#2}
	\renewcommand{\RESUMEanglais}{#3}
}




\newcommand{\resumes}{

        \begin{textblock*}{.5\paperwidth-2cm}(1.5cm,2cm)
		\noindent\mbox{
			\begin{minipage}{.5\paperwidth-2cm}
				\begin{center}
			                \small \fontfamily{qhv}\selectfont \textbf{R{\'e}sum{\'e}}
		                \end{center}
		                \scriptsize \fontfamily{qhv}\selectfont \RESUMEfrancais
			\end{minipage}
		}
	\end{textblock*}
	
	\begin{textblock*}{.5\paperwidth-2cm}(.5\paperwidth+2.5mm,2cm)
		\noindent\mbox{
			\begin{minipage}{.5\paperwidth-2cm}
	                        \begin{center}
			                \small \fontfamily{qhv}\selectfont \textbf{Abstract}
		                \end{center}
		                \scriptsize \fontfamily{qhv}\selectfont \RESUMEanglais
			\end{minipage}
		}
	\end{textblock*}
	
	\begin{textblock*}{\paperwidth-2cm}(1.5cm,25.7cm)
        	\noindent\mbox{
			\begin{minipage}{\paperwidth-2cm}
        	        	\noindent\includegraphics[width=2.5cm]{logo-TB.eps}
	        	\end{minipage}
                }	        	
	\end{textblock*}
	
	\begin{textblock*}{\paperwidth-2cm}(4.5cm,26.2cm)
		\noindent\mbox{
			\begin{minipage}{\paperwidth-2cm}	                        
        	                        \noindent \flushleft \small \fontfamily{qhv}\selectfont n$^{\circ}$ d'ordre : \NORDRE
        	                        \vspace{-8pt}
			                \noindent \flushleft \small \fontfamily{qhv}\selectfont \textbf{\UNIV}
			                \vspace{-8pt}
			                \noindent \flushleft \scriptsize \fontfamily{qhv}\selectfont \UNIVaddress
			\end{minipage}
		}
	\end{textblock*}
	
}




\newcommand{\remerciements}[1]{
	\thispagestyle{empty}
	\section*{Remerciements}

	Je remercie \PRESIDENTgenre.\ \PRESIDENTprenom\ \PRESIDENTnom, \PRESIDENTqualite, qui me fait l'honneur de pr{\'e}sider ce jury.\\[\baselineskip]
	
	Je remercie
	\setcounter{III}{1}
	\whiledo{\value{III}<\value{cptRapporteur}}{
		{\csname RAPPORTEURgenre\roman{III}\endcsname}.\ {\csname RAPPORTEURprenom\roman{III}\endcsname}\ {\csname RAPPORTEURnom\roman{III}\endcsname}, {\csname RAPPORTEURqualite\roman{III}\endcsname}
		\stepcounter{III}
		\ifthenelse{\value{III}=\value{cptRapporteur}}{et }{, }
	}{\csname RAPPORTEURgenre\roman{III}\endcsname}.\ {\csname RAPPORTEURprenom\roman{III}\endcsname}\ {\csname RAPPORTEURnom\roman{III}\endcsname}, {\csname RAPPORTEURqualite\roman{III}\endcsname}, d'avoir bien voulu accepter la charge de rapporteur.\\[\baselineskip]
	
	Je remercie
	\setcounter{III}{1}
	\whiledo{\value{III}<\value{cptExaminateur}}{
		{\csname EXAMINATEURgenre\roman{III}\endcsname}.\ {\csname EXAMINATEURprenom\roman{III}\endcsname}\ {\csname EXAMINATEURnom\roman{III}\endcsname}, {\csname EXAMINATEURqualite\roman{III}\endcsname}
		\stepcounter{III}
		\ifthenelse{\value{III}=\value{cptExaminateur}}{et }{, }
	}{\csname EXAMINATEURgenre\roman{III}\endcsname}.\ {\csname EXAMINATEURprenom\roman{III}\endcsname}\ {\csname EXAMINATEURnom\roman{III}\endcsname}, {\csname EXAMINATEURqualite\roman{III}\endcsname}, d'avoir bien voulu accepter la charge d'examinateur.\\[\baselineskip]
	
	Je remercie
	\setcounter{III}{1}
	\whiledo{\value{III}<\value{cptDirecteur}}{
		{\csname DIRECTEURgenre\roman{III}\endcsname}.\ {\csname DIRECTEURprenom\roman{III}\endcsname}\ {\csname DIRECTEURnom\roman{III}\endcsname}, {\csname DIRECTEURqualite\roman{III}\endcsname}
		\stepcounter{III}
		\ifthenelse{\value{III}=\value{cptDirecteur}}{et }{,}
	}{\csname DIRECTEURgenre\roman{III}\endcsname}.\ {\csname DIRECTEURprenom\roman{III}\endcsname}\ {\csname DIRECTEURnom\roman{III}\endcsname}, {\csname DIRECTEURqualite\roman{III}\endcsname}, qui ont dirig{\'e} ma th{\`e}se.\\[\baselineskip]
}




%\newcommand{\alignquatriemedecouv}{
%	\newpage\thispagestyle{empty}~
%	\ifodd\value{page}
%		\newpage\thispagestyle{empty}
%	\else
%		\newpage\thispagestyle{empty}~\newpage\thispagestyle{empty}
%	\fi
%}


\newcommand{\anquatriemedecouve}{

	\begin{textblock*}{\paperwidth-2cm}(4.5cm,26.3cm)
		\noindent\mbox{
			\begin{minipage}{\paperwidth-2cm}	                        
        	                        \noindent \flushleft \small \fontfamily{qhv}\selectfont n$^{\circ}$ d'ordre : \NORDRE
        	                        \vspace{-8pt}
			                \noindent \flushleft \small \fontfamily{qhv}\selectfont \textbf{\UNIV}
			                \vspace{-8pt}
			                \noindent \flushleft \scriptsize \fontfamily{qhv}\selectfont \UNIVaddress
			\end{minipage}
		}
	\end{textblock*}
	
}

\newcommand{\cover}{

\begin{textblock*}{0cm}(1.8cm,1.5cm)
		\noindent\mbox{
			\begin{minipage}{\paperwidth-1.8cm}
			\noindent \flushleft \footnotesize \fontfamily{qhv}\selectfont N$^{\circ}$ d'ordre : \NORDRE
			\end{minipage}
		}
	\end{textblock*}
	
	\begin{textblock*}{0cm}(0cm,3.0cm)
		\noindent\mbox{
			\begin{minipage}{\paperwidth}
			\noindent \center \normalsize \fontfamily{qhv}\selectfont 
			\textpdfrender{TextRenderingMode=FillStroke, FillColor=black, LineWidth=.09ex, }{\textplus{\textbf{\SCEAU}}}
			
			
			\vspace{+10pt}
			\noindent \center \Large \fontfamily{qhv}\selectfont \textbf{T{\'e}l{\'e}com Bretagne}
			\vspace{+5pt}
			\noindent \center \normalsize \fontfamily{qhv}\selectfont \textbf{\UFR}
			\vspace{+25pt}
			\noindent \center \normalsize \fontfamily{qhv}\selectfont {Ecole Doctorale -- MATISSE}
			
			\vspace{+25pt}
		    \noindent \center \rule{\paperwidth-3.6cm}{1.0pt} 
		    
		    \vspace{-10pt}
		    \noindent \center \Large \fontfamily{qag}\selectfont \textup{\TITREfr}
		     \vspace{-20pt}
		    \noindent \center \rule{\paperwidth-3.6cm}{1.5pt} 
		    
		    \vspace{+25pt}
			\noindent \center \Large \fontfamily{phv}\selectfont \textbf{Th{\`e}se de Doctorat}
			
			\vspace{+5pt}
			\noindent \center \normalsize \fontfamily{phv}\selectfont {Mention :  Informatique}
			
			\vspace{+25pt}
			\noindent \center \normalsize\fontfamily{phv}\selectfont Pr{\'e}sent{\'e}e par \textbf{William David Diego Maza}
			
			\vspace{+5pt}
			\noindent \center \normalsize \fontfamily{phv}\selectfont {D{\'e}partement : R{\'e}seaux, S{\'e}curit{\'e} et Multim{\'e}dia (RSM)}
			\vspace{+5pt}
			\noindent \center \normalsize \fontfamily{phv}\selectfont {Laboratoire : Orange Labs}
			\vspace{+25pt}
			\noindent \center \normalsize \fontfamily{phv}\selectfont {Directeur de th{\`e}se : \DIRECTEURprenomi~\DIRECTEURnomi}	
			\vspace{+15pt}
			\noindent \center \normalsize \fontfamily{phv}\selectfont {Soutenue le \DATE}	
			\end{minipage}
		}
	\end{textblock*}
	
	
	\begin{textblock*}{0cm}(1.8cm,23cm)
		\noindent\mbox{
			\begin{minipage}{\paperwidth-1.8cm}
			\noindent \flushleft \normalsize  \fontfamily{phv}\selectfont \textbf{Jury :}
			
			
			\noindent \flushleft \normalsize \fontfamily{phv}\selectfont \PRESIDENTgenre.\ \PRESIDENTprenom\ \PRESIDENTnom, \PRESIDENTqualite ~~(Pr{\'e}sident)
			
				\setcounter{III}{0}
				\whiledo{{\value{III}<\value{cptRapporteur}}}{
					\stepcounter{III}
					\vspace{-10pt}
					\noindent \flushleft \normalsize{\fontfamily{phv}\selectfont {
						{\csname RAPPORTEURgenre\roman{III}\endcsname}.\ {\csname RAPPORTEURprenom\roman{III}\endcsname}\ {\csname RAPPORTEURnom\roman{III}\endcsname},\ {\csname RAPPORTEURqualite\roman{III}\endcsname}\ ~(Rapporteur)}}}
						
				\setcounter{III}{0}
				\whiledo{{\value{III}<\value{cptExaminateur}}}{
					\stepcounter{III}
					\vspace{-10pt}
					\noindent \flushleft \normalsize{\fontfamily{phv}\selectfont {
					{\csname EXAMINATEURgenre\roman{III}\endcsname}.\ {\csname EXAMINATEURprenom\roman{III}\endcsname}\ {\csname EXAMINATEURnom\roman{III}\endcsname},\ {\csname EXAMINATEURqualite\roman{III}\endcsname}\ ~(Examinateur)}}}

				\setcounter{III}{0}
				\whiledo{{\value{III}<\value{cptDirecteur}}}{
					\stepcounter{III}
					\vspace{-10pt}
					\noindent \flushleft \normalsize{\fontfamily{phv}\selectfont {
					{\csname DIRECTEURgenre\roman{III}\endcsname}.\ {\csname DIRECTEURprenom\roman{III}\endcsname}\ {\csname DIRECTEURnom\roman{III}\endcsname},\ {\csname DIRECTEURqualite\roman{III}\endcsname}\ ~(Directeur de th{\`e}se)}}}

				\setcounter{III}{0}
				\whiledo{{\value{III}<\value{cptEncadrant}}}{
					\stepcounter{III}
					\vspace{-10pt}
					\noindent \flushleft \normalsize{\fontfamily{phv}\selectfont {
					{\csname ENCADRANTgenre\roman{III}\endcsname}.\ {\csname ENCADRANTprenom\roman{III}\endcsname}\ {\csname ENCADRANTnom\roman{III}\endcsname},\ {\csname ENCADRANTqualite\roman{III}\endcsname}\ ~(Encadrant)}}}
		
			\end{minipage}
		}
	\end{textblock*}
}




\newcommand{\coveren}{

\begin{textblock*}{0cm}(1.8cm,1.5cm)
		\noindent\mbox{
			\begin{minipage}{\paperwidth-1.8cm}
			\noindent \flushleft \footnotesize \fontfamily{qhv}\selectfont N$^{\circ}$ of order : \NORDRE
			\end{minipage}
		}
	\end{textblock*}
	
\begin{textblock*}{0cm}(0cm,3.0cm)
		\noindent\mbox{
			\begin{minipage}{\paperwidth}
						\noindent \center \normalsize \fontfamily{qhv}\selectfont 
			\textpdfrender{TextRenderingMode=FillStroke, FillColor=black, LineWidth=.09ex, }{\textplus{\textbf{Under the seal of European University of Brittany}}}
			\vspace{+10pt}
			\noindent \center \LARGE \fontfamily{qhv}\selectfont \textbf{T{\'e}l{\'e}com Bretagne}
			\vspace{+5pt}
			\noindent \center \normalsize\fontfamily{qhv}\selectfont \textbf{In joint accreditation with University of Rennes 1}
			\vspace{+25pt}
			\noindent \center \normalsize \fontfamily{qhv}\selectfont {Doctoral School --MATISSE}
			
			\vspace{+25pt}
		    \noindent \center \rule{\paperwidth-3.6cm}{1.0pt} 
		    
		    \vspace{-10pt}
		    \noindent \center \Large \fontfamily{qag}\selectfont \textup{\TITREen}
		     \vspace{-20pt}
		    \noindent \center \rule{\paperwidth-3.6cm}{1.5pt} 
		    
		    \vspace{+25pt}
			\noindent \center \Large \fontfamily{phv}\selectfont \textbf{PhD Thesis}
			
			\vspace{+5pt}
			\noindent \center \normalsize \fontfamily{phv}\selectfont {In Computer Sciences}
			
			\vspace{+25pt}
			\noindent \center \normalsize \fontfamily{phv}\selectfont Presented by \textbf{William David Diego Maza}
			
			\vspace{+5pt}
			\noindent \center \normalsize \fontfamily{phv}\selectfont {Departement : Networks, Security and Multimedia (RSM)}
			\vspace{+5pt}
			\noindent \center \normalsize \fontfamily{phv}\selectfont {Laboratory : Orange Labs}
			\vspace{+25pt}
			\noindent \center \normalsize \fontfamily{phv}\selectfont {Thesis advisor : \DIRECTEURprenomi~\DIRECTEURnomi}	
			\vspace{+15pt}
			\noindent \center \normalsize \fontfamily{phv}\selectfont {Defended on \DATEen}	
			\end{minipage}
		}
	\end{textblock*}
	
\begin{textblock*}{0cm}(1.8cm,23cm)
		\noindent\mbox{
			\begin{minipage}{\paperwidth-1.8cm}
			\noindent \flushleft \normalsize \fontfamily{phv}\selectfont \textbf{Thesis committe :}
			
			
			\noindent \flushleft \normalsize \fontfamily{phv}\selectfont \PRESIDENTgenreen.\ \PRESIDENTprenom\ \PRESIDENTnom, \PRESIDENTqualiteen ~~(President)
			
				\setcounter{III}{0}
				\whiledo{{\value{III}<\value{cptRapporteur}}}{
					\stepcounter{III}
					\vspace{-10pt}
					\noindent \flushleft \normalsize{\fontfamily{phv}\selectfont {
						{\csname RAPPORTEURgenreen\roman{III}\endcsname}.\ {\csname RAPPORTEURprenom\roman{III}\endcsname}\ {\csname RAPPORTEURnom\roman{III}\endcsname},\ {\csname RAPPORTEURqualiteen\roman{III}\endcsname}\ ~(Reviewer)}}}
						
				\setcounter{III}{0}
				\whiledo{{\value{III}<\value{cptExaminateur}}}{
					\stepcounter{III}
					\vspace{-10pt}
					\noindent \flushleft \normalsize{\fontfamily{phv}\selectfont {
					{\csname EXAMINATEURgenreen\roman{III}\endcsname}.\ {\csname EXAMINATEURprenom\roman{III}\endcsname}\ {\csname EXAMINATEURnom\roman{III}\endcsname},\ {\csname EXAMINATEURqualiteen\roman{III}\endcsname}\ ~(Examiner)}}}

				\setcounter{III}{0}
				\whiledo{{\value{III}<\value{cptDirecteur}}}{
					\stepcounter{III}
					\vspace{-10pt}
					\noindent \flushleft \normalsize{\fontfamily{phv}\selectfont {
					{\csname DIRECTEURgenreen\roman{III}\endcsname}.\ {\csname DIRECTEURprenom\roman{III}\endcsname}\ {\csname DIRECTEURnom\roman{III}\endcsname},\ {\csname DIRECTEURqualiteen\roman{III}\endcsname}\ ~(Thesis advisor)}}}

				\setcounter{III}{0}
				\whiledo{{\value{III}<\value{cptEncadrant}}}{
					\stepcounter{III}
					\vspace{-10pt}
					\noindent \flushleft \normalsize{\fontfamily{phv}\selectfont {
					{\csname ENCADRANTgenreen\roman{III}\endcsname}.\ {\csname ENCADRANTprenom\roman{III}\endcsname}\ {\csname ENCADRANTnom\roman{III}\endcsname},\ {\csname ENCADRANTqualiteen\roman{III}\endcsname}\ ~(Supervisor)}}}
			\end{minipage}
		}
	\end{textblock*}

\begin{textblock*}{0cm}(0cm,0cm)\end{textblock*}
}
