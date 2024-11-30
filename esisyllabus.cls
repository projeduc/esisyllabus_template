\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{esisyllabus}[2024/11/29 v1.0 ESI Syllabus Class]

%===============================================================
% Options
%===============================================================

\def\@tmode{Face-to-face}
\newif\ifshort % short vrsion
\shortfalse % by default it is long
\newif\ifinfo % information
\infofalse % by default no information

\DeclareOption{hy}{\def\@tmode{Hybrid}} 
\DeclareOption{ol}{\def\@tmode{Online}}
\DeclareOption{short}{\shorttrue}
\DeclareOption{info}{\infotrue}

\ProcessOptions\relax

\LoadClass[11pt, a4paper]{article}


%===============================================================
% Packages
%===============================================================

\usepackage[utf8]{inputenc}
\usepackage{graphicx}
\usepackage{amssymb}
\usepackage[centertags]{amsmath}
\usepackage{multirow}
\usepackage{hyperref}
\usepackage{natbib}
\usepackage[explicit]{titlesec}
\usepackage{tcolorbox}
\usepackage{times}
\usepackage{titlecaps}
\usepackage{tabularx}
\usepackage{longtable}
\usepackage[table]{xcolor}
\usepackage{etoolbox} %list variables, if else
\usepackage{tabularray}


\definecolor{skyblue}{RGB}{150, 200, 255}
\definecolor{darkblue}{RGB}{20,40,120} %25,47,98}


\usepackage[left=1.5cm,right=1.5cm,top=1.5cm,bottom=1.5cm,includefoot,includehead,headheight=14pt,asymmetric]{geometry}

%===============================================================
% Options
%===============================================================
%\newif\ifenglish % a boolean variable to check if english is used
%\englishfalse % y default it is not english


%\DeclareOption*{ol}{\def\@tmode{OL}}
%\ProcessOptions\relax



%===============================================================
% Control commands
%===============================================================
\newcommand{\makename}[2]{\titlecap{#1}\ \titlecap{#2}} %\MakeUppercase


%\makeatletter
\newcommand{\addnums}[3]{\expandafter\strip@pt\dimexpr#3pt+#2pt+#1pt\relax}
%\makeatother
	
%===============================================================
% Thesis labels
%===============================================================
\newcommand{\bgparbox}[1]{\colorbox{darkblue}{\setlength{\fboxsep}{6pt}%
		
		\begin{tabularx}{\dimexpr\linewidth-\fboxsep}{l>{\raggedright\arraybackslash}X}#1\end{tabularx}}}
		
\titleformat{\section}[block]
{}{}{0em}
{\bgparbox{\color{white}\bfseries\Large\thesection.\hskip8pt #1}}

%\AtBeginDocument{%
%	\immediate\openout\chapters@file=\jobname_chapters.tmp
%}
%
%\AtEndDocument{%
%	\immediate\closeout\chapters@file
%}

% The cover page will be in french whatever the used language
%\ifenglish
%
%\fi

%===============================================================
% Thesis information
%===============================================================

%\newif\ifelab % a boolean variable to check if there is a lab info
%\elabfalse

% commands to store cover pages informations
\def\@title{}
\def\@semester{x}
\def\@ects{n}
\def\@coeff{m}
\def\@unit{}
\def\@lect@volume{0}
\def\@tuto@volume{0}
\def\@prac@volume{0}
\def\@totl@volume{0}

\def\@ca@prc{0\%}
\def\@ca@cmt{}
\def\@pr@prc{0\%}
\def\@pr@cmt{}
\def\@me@prc{0\%}
\def\@me@cmt{}
\def\@fe@prc{0\%}
\def\@fe@cmt{}

\def\@redactorlist{}
\def\@reviewerlist{}
\def\@prerequisitelist{}
\def\@objectivelist{}
\def\@chapterslist{}
\def\@methodlist{}
\def\@practicallist{}


%\def\@date{}


%\def\@esilogo{logo/ESI_logo.png}

% commands to set up cover pages informations
\def\title#1{\def\@title{#1}}
\def\semester#1{\def\@semester{#1}}
\def\ects#1{\def\@ects{#1}}
\def\coeff#1{\def\@coeff{#1}}
\def\unit#1{\def\@unit{#1}}

\newcommand{\volume}[3]{
	\def\@lect@volume{#1}
	\def\@tuto@volume{#2}
	\def\@prac@volume{#3}
	\def\@totl@volume{\addnums{#1}{#2}{#3}}
}

\newcommand{\ca}[2][]{\def\@ca@prc{#2\%}\def\@ca@cmt{#1}}
\newcommand{\pr}[2][]{\def\@pr@prc{#2\%}\def\@pr@cmt{#1}}
\newcommand{\fe}[2][]{\def\@fe@prc{#2\%}\def\@fe@cmt{#1}}
\newcommand{\me}[2][]{\def\@me@prc{#2\%}\def\@me@cmt{#1}}


%\def\date#1{\def\@date{#1}}


\newcounter{cchapter}
\newcounter{cpractical}


%\newcommand{\makechapter}[4]{
%	\expandafter\arabic{cchapter} & #2 & 
%	\begin{minipage}{9.15cm}
%		\vspace{6pt}#4\vspace{6pt}
%	\end{minipage} 
%	& #3 \\*
%}

\newcommand{\makechapter}[4]{
%	\vspace{6pt}
	\begin{tabular}{|p{0.5cm}|p{5.5cm}|p{9.25cm}|p{1cm}|}
		\hline
		\rowcolor{skyblue}\textbf{N} & \textbf{Chapter title} & \textbf{Outline} & \textbf{\%} \\
		\hline
		#1 & #2 & 
		\begin{minipage}{9.15cm}
			\vspace{6pt}#4\vspace{6pt}
		\end{minipage} 
		& #3\% \\
		\hline
	\end{tabular}
	\vskip6pt
}

\newcommand{\makepractical}[3]{
	\begin{tabular}{|p{0.5cm}|p{5.5cm}|p{10.73cm}|}
		\hline
		\rowcolor{skyblue}\textbf{N} & \textbf{Title} & \textbf{Description} \\
		\hline
		#1 & #2 & 
		\begin{minipage}{10.63cm}
			\vspace{6pt}#3\vspace{6pt}
		\end{minipage}
		\\
		\hline
	\end{tabular}
	\vskip6pt
}

%\xdef\makechapter#1#2#3#4{#1 & #2 & #4 & #3 \\}


\newcommand\addchapter[3]{% titl prcntag outlin
	\listadd{\@chapterslist}{\makechapter{\arabic{cchapter}}{#1}{#2}{#3}}
}

\newcommand\addpractical[2]{% titl outlin
	\listadd{\@practicallist}{\makepractical{\arabic{cpractical}}{#1}{#2}}
}

\newcommand\addredactor[3]{% firstname familyname mail
	\listadd{\@redactorlist}{\makename{#1}{#2} (\url{#3})}
}

\newcommand\addreviewer[3]{% firstname familyname mail
	\listadd{\@reviewerlist}{\makename{#1}{#2} (\url{#3})}
}

\newcommand\addprerequisite[1]{%
	\listadd{\@prerequisitelist}{#1}
}

\newcommand\addobjective[1]{%
	\listadd{\@objectivelist}{#1}
}

\newcommand\addmethod[1]{%
	\listadd{\@methodlist}{#1}
}

%\def\lablogo#1{\def\@lablogo{#1}\elabtrue}
%\def\labtitle#1{\def\@labtitle{#1}\elabtrue}


%===============================================================
% General Layout
%===============================================================

% Default page style

\renewcommand{\baselinestretch}{1.15} 

%\newcommand{\identification}{%
%	\begin{tabular}{|p{2.5cm}|p{1.5cm}|p{1.5cm}|p{1.5cm}|p{1.5cm}|p{1.5cm}|p{1.5cm}|p{2.99cm}|}
%		\hline
%		Semester & \multicolumn{7}{|c|}{Course Title} \\
%		\hline
%		\@semester & \multicolumn{7}{|c|}{\@title} \\
%		\hline
%		UE Code && ECTS && Coeff && \multicolumn{4}{|c|}{Hourly volume} && Teaching Mode \\
%		\hline
%		\multirow{2}{*}{UEF xxx} & \multirow{2}{*}{\@ects} & \multirow{2}{*}{\@coeff} & 
%		Lectures & Tutorials & Practicals & Total & \multirow{2}{*}{\@tmode} \\
%		\cline{4-7}
%		&  &  & \@lect@volume H & \@tuto@volume H & \@prac@volume H & \@totl@volume H &  \\
%		\hline
%	\end{tabular}
%}

\newcommand{\identification}{%
	\begin{tblr}{
			colspec = {p{2.5cm}l
				       p{1.6cm}l
				       p{1.6cm}l
				       p{1.6cm}
				       p{1.6cm}
				       p{1.6cm}
				       p{1.6cm}l
				       p{2.92cm}},
			rows = {valign=m, halign=c},
			cell{1,4}{1,3,5,7,12}={skyblue, fg=black, font=\bfseries},
			cell{5}{7-10}={fg=black, font=\bfseries},
			colsep=3pt,
			rowsep=3pt,
			stretch = 0,
			vlines = {1pt,solid},
			vline{1,13} = {3}{text=\clap{}},
		}
		
		\SetHline{1-1,3-12}{1pt}
		Semester && \SetCell[c=10]{c} Course Title &&&&&&&&& \\
		\SetHline{1-1,3-12}{1pt}
		\@semester && \SetCell[c=10]{c} \@title &&&&&&&&& \\
		\SetHline{1-1,3-12}{1pt}
		\SetCell[c=12]{c} &&&&&&&&&&&\\
		\SetHline{1-1,3-3,5-5,7-10,12-12}{1pt}
		UE Code && ECTS && Coeff && \SetCell[c=4]{c} Hourly volume &&& && Teaching Mode \\
		\SetHline{1-1,3-3,5-5,7-10,12-12}{1pt}
		\SetCell[r=2]{c} \@unit && \SetCell[r=2]{c} \@ects && \SetCell[r=2]{c} \@coeff && 
		Lectures & Tutorials & Practicals & Total && \SetCell[r=2]{c} \@tmode \\
		\SetHline{1-1,3-3,5-5,7-10,12-12}{1pt}
		&&  &&  && \@lect@volume H & \@tuto@volume H & \@prac@volume H & \@totl@volume H &&  \\
		\SetHline{1-1,3-3,5-5,7-10,12-12}{1pt}
		
	\end{tblr}

}

\newcommand{\objectives}{%
	\ifdefempty{\@objectivelist}{}{
		\renewcommand*{\do}[1]{\item ##1}
		\vspace{14pt}On completion of this course, students will be able to:
		\begin{itemize}
			\dolistloop{\@objectivelist}
		\end{itemize}
	}	
}

\newcommand{\prerequisites}{%
	\ifdefempty{\@prerequisitelist}{}{
		\renewcommand*{\do}[1]{\item ##1}
		\begin{itemize}
			\dolistloop{\@prerequisitelist}
		\end{itemize}
	}	
}

\newcommand{\redactors}{%
	\ifdefempty{\@redactorlist}{}{
		\renewcommand*{\do}[1]{\item ##1}
		This syllabus was proposed by:
		\begin{itemize}
			\dolistloop{\@redactorlist}
		\end{itemize}
	}	
}

\newcommand{\reviewers}{%
	\ifdefempty{\@reviewerlist}{}{
		\renewcommand*{\do}[1]{\item ##1}
		This syllabus was reviewed by:
		\begin{itemize}
			\dolistloop{\@reviewerlist}
		\end{itemize}
	}	
}


\newcommand{\methods}{%
	\ifdefempty{\@methodlist}{}{
		\renewcommand*{\do}[1]{\item ##1}
		\begin{itemize}
			\dolistloop{\@methodlist}
		\end{itemize}
	}	
}

\newcommand{\assessment}{%
	\begin{tblr}{
			colspec = {p{1cm}lp{4cm}lp{9.25cm}lp{2cm}},
%			rows = {valign=m, halign=c},
			cell{1,4}{odd} = {skyblue, fg=black, font=\bfseries, halign=c},
			colsep=3pt,
			rowsep=3pt,
			stretch = 0,
			vlines = {1pt,solid},
			hlines = {1pt,solid},
			vline{1,8} = {3}{text=\clap{}},
			hline{4-9} = {even}{text=\clap{}},
		}
		
%		\hline
		\SetCell[c=7]{c} Final grade formula &&&&&& \\
%		\hline
		\SetCell[c=7]{c} \@ca@prc\ CA + \@pr@prc\ PR + \@me@prc\ ME + \@fe@prc\ FE &&&&&& \\
%		\hline
		\SetCell[c=7]{c} &&&&&& \\
%		\hline
		Code && Title && Comment && Percentage \\
%		\hline
		CA && Continuous Assessment && \@ca@cmt && \@ca@prc\\
%		\hline
		PR && Practicals grade && \@pr@cmt && \@pr@prc \\
%		\hline
		ME && Midterm exam && \@me@cmt && \@me@prc \\
%		\hline
		FE && Final exam && \@fe@cmt && \@fe@prc \\
%		\hline
		
	\end{tblr}
}


\setlength\parindent{0pt}

%\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}.}


%\newcommand{\chapters}{
%	\renewcommand*{\do}[1]{##1\hline}
%	\begin{tabular}{|p{0.5cm}|p{6cm}|p{9.25cm}|p{0.5cm}|}
%		\hline
%		N & Title & Outline & \% \\
%		\hline
%		\dolistloop{\@chapterslist}
%	\end{tabular}
%}

\newcommand{\chapters}{
	\ifdefempty{\@chapterslist}{}{
		\setcounter{cchapter}{0}
		\renewcommand*{\do}[1]{\stepcounter{cchapter}##1}
		\dolistloop{\@chapterslist}
	}
}

\newcommand{\practicals}{
	\ifdefempty{\@practicallist}{}{
		\setcounter{cpractical}{0}
		\renewcommand*{\do}[1]{\stepcounter{cpractical}##1}
		\dolistloop{\@practicallist}
	}
}


\usepackage{enumitem}
\setlist{nolistsep}
