% Designed by: Abdelkrime Aries
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{esisemester}[2024/12/07 v1.0 ESI Syllabus Class]

%===============================================================
% Options
%===============================================================


\newif\ifshort % short vrsion
\shortfalse % by default it is long
\newif\ifinfo % information
\infofalse % by default no information

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
%\usepackage{natbib}
\usepackage[explicit]{titlesec}
\usepackage{tcolorbox}
\usepackage{times}
\usepackage{titlecaps}
\usepackage{tabularx}
\usepackage{longtable}
\usepackage[table]{xcolor}
\usepackage{etoolbox} %list variables, if else
\usepackage{tabularray}
\usepackage{fancyhdr}
\usepackage[natbibapa]{apacite}

\usepackage{pgf}  % Package for floating-point arithmetic


\definecolor{skyblue}{RGB}{150, 200, 255}
\definecolor{darkblue}{RGB}{20,40,120} %25,47,98}


\ifinfo
\usepackage[left=1.5cm,right=1.5cm,top=1cm,bottom=1cm,includefoot,includehead,headheight=1.25cm,asymmetric,landscape]{geometry}
%\pagestyle{fancyinfo}
\else
\usepackage[left=1.5cm,right=1.5cm,top=1.5cm,bottom=1.5cm,includefoot,includehead,headheight=14pt,asymmetric,landscape]{geometry}
%\pagestyle{fancymain}
%\thispagestyle{fancyfirstpage}
\fi

%===============================================================
% Internal Varivables
%===============================================================

%\def\@csdvalidation{}
%\def\@csvalidation{}
%\def\@version{}
%\def\@syear{}

\def\init{
	\def\@title{}
	\def\@semester{x}
	\def\@ects{n}
	\def\@coeff{m}
	\def\@unitid{}
	\def\@unittype{F}
	\def\@tmode{Face-to-face}
	\def\@socle{CP}
	
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
}

\init

\def\@sem@lect@volume{0}
\def\@sem@tuto@volume{0}
\def\@sem@prac@volume{0}
\def\@sem@totl@volume{0}
\def\@sem@ects{0}
\def\@sem@coeff{0}

\def\@firstlst{}
\def\@lastlst{}

\newcounter{rn}
\setcounter{rn}{0}

%===============================================================
% Helper commands (formatting)
%===============================================================

% summs the values of 3 float numbers
\newcommand{\floatssum}[3]{\expandafter\strip@pt\dimexpr#3pt+#2pt+#1pt\relax}

% summs the values of 2 float numbers
\newcommand{\floatssumb}[2]{\expandafter\strip@pt\dimexpr#2pt+#1pt\relax}


%===============================================================
% Setters (setting internal variables)
%===============================================================

\def\settitle#1{\def\@title{#1}}
\def\setsemester#1{\def\@semester{#1}}
\def\setects#1{\def\@ects{#1}}
\def\setcoeff#1{\def\@coeff{#1}}
\def\setunitid#1{\def\@unitid{#1}}

\def\setmethodological{\def\@unittype{M}}
\def\setiscovery{\def\@unittype{D}}
\def\settransversal{\def\@unittype{T}}

\def\setcs{\def\@socle{CS}}


%\def\setcsdvalidation#1{\def\@csdvalidation{#1}}
%\def\setcsvalidation#1{\def\@csvalidation{#1}}
%\def\setversion#1{\def\@version{#1}}
%\def\setyear#1{\def\@syear{#1}}
%\def\setabstract#1{\def\@abstract{#1}}


\newcommand{\setca}[2][]{\def\@ca@prc{#2\%}\def\@ca@cmt{#1}}
\newcommand{\setpr}[2][]{\def\@pr@prc{#2\%}\def\@pr@cmt{#1}}
\newcommand{\setfe}[2][]{\def\@fe@prc{#2\%}\def\@fe@cmt{#1}}
\newcommand{\setme}[2][]{\def\@me@prc{#2\%}\def\@me@cmt{#1}}

\newcommand{\setvolume}[3]{
	\def\@lect@volume{#1}
	\def\@tuto@volume{#2}
	\def\@prac@volume{#3}
	\def\@totl@volume{\floatssum{#1}{#2}{#3}}
}

\def\sethy{\def\@tmode{Hybrid}} 
\def\setol{\def\@tmode{Online}}


%===============================================================
% Printing commands (print results)
%===============================================================

\newwrite\myfile

\newcommand{\startsemester}[1]{
	
	\immediate\openout\myfile=tmp.tex
	
	\immediate\write\myfile{\string\begin{center}}
	\immediate\write\myfile{\string\huge\string\bfseries\string\color{darkblue} #1}
	\immediate\write\myfile{\string\end{center}}
	\immediate\write\myfile{\string\begin{tblr}\string{\string}}
	\immediate\write\myfile{\string\hline}
	\stepcounter{rn}
	\immediate\write\myfile{\string\SetCell[r=2]{c}Teaching Units & \string\SetCell[c=4]{c}Hourly volume&&&& \string\SetCell[r=2]{c}ECTS & \string\SetCell[r=2]{c}Coeff & \string\SetCell[r=2]{c}Teaching Mode & \string\SetCell[c=4]{c}Assessment &&&\\}
	\immediate\write\myfile{\string\SetHline{2-5,9-12}{1pt}}
	\stepcounter{rn}
	\immediate\write\myfile{Teaching Units & Total & Lect. & Tuto. & Pract. & ECTS & Coeff & Teaching Mode & CA & PR & ME & FE \\}
	\immediate\write\myfile{\string\hline}
}


\def\starttype#1{%
	\stepcounter{rn}\listeadd{\@firstlst}{\thern}\listeadd{\@lastlst}{\thern}
	\immediate\write\myfile{\string\SetCell[c=12]{c} &&&&&&&&&&& \\}
	\immediate\write\myfile{\string\SetHline{1-1}{1pt}}
	\immediate\write\myfile{\string\SetCell[]{c, darkblue, fg=white, font=\string\bfseries}}
	\stepcounter{rn}\listeadd{\@lastlst}{\thern}
	\immediate\write\myfile{#1 Units & \string\SetCell[c=11]{c} &&&&&&&&&& \\}
	\immediate\write\myfile{\string\SetHline{1-1}{1pt}}
}

\def\startfundamental{\starttype{Fundamental}}
\def\startmethodological{\starttype{Methodological}}


\def\starttransversal{\starttype{Transversal}}

\newcommand{\startunit}[2]{%
	\stepcounter{rn}\listeadd{\@lastlst}{\thern}
	\immediate\write\myfile{\string\SetCell[]{skyblue, fg=black, font=\string\bfseries}}
	\immediate\write\myfile{#1: #2 & \string\SetCell[c=11]{c} &&&&&&&&&& \\}
	\immediate\write\myfile{\string\hline}
}

\def\endsemester{
	\stepcounter{rn}\listeadd{\@firstlst}{\thern}\listeadd{\@lastlst}{\thern}
	\immediate\write\myfile{\string\SetCell[c=12]{c} &&&&&&&&&&& \\}
	\immediate\write\myfile{\string\SetHline{1-7}{1pt}}
	\immediate\write\myfile{\string\SetCell[]{c, darkblue, fg=white, font=\string\bfseries}}
	\stepcounter{rn}\listeadd{\@lastlst}{\thern}
	\immediate\write\myfile{Total semester & \@sem@totl@volume & \@sem@lect@volume & \@sem@tuto@volume & \@sem@prac@volume & \@sem@ects & \@sem@coeff & \string\SetCell[c=5]{c} &&&&\\}
	\immediate\write\myfile{\string\SetHline{1-7}{1pt}}
	
	\immediate\write\myfile{\string\end{tblr}}
	
	\immediate\closeout\myfile
	
	\immediate\openout\myfile=tmp0.tex
	\renewcommand*{\do}[1]{##1,}
%	\immediate\write\myfile{\dolistloop{\firstlst}}
	\immediate\write\myfile{\string\SetTblrInner{vline{1} = {\dolistloop{\@firstlst}3}{text=\string\clap{}}}}
	\immediate\write\myfile{\string\SetTblrInner{vline{13} = {\dolistloop{\@lastlst}3}{text=\string\clap{}}}}
	\immediate\closeout\myfile
	
	\SetTblrInner{
		colspec = {
			p{9cm}
			p{1.25cm}
			p{1.25cm}
			p{1.25cm}
			p{1.25cm}
			p{1.1cm}
			p{1.1cm}
			p{2cm}
			p{1.25cm}
			p{1.25cm}
			p{1.25cm}
			p{1.25cm}
		},
		rows = {valign=m, halign=c},
		column{1} = {halign=l},
		colsep=3pt,
		rowsep=5pt,
		stretch = 0,
		vlines = {1pt,solid},
		row{1,2} = {skyblue, fg=black, font=\bfseries},
	}
	
	\input{tmp0}
	
	\input{tmp}

}

\newcommand{\addcourseinf}[1]{%
	\input{#1}%
	\stepcounter{rn}
	\immediate\write\myfile{\@title & \@totl@volume & \@lect@volume & \@tuto@volume & \@prac@volume & \@ects & \@coeff & \@tmode & \@ca@prc & \@pr@prc & \@me@prc & \@fe@prc \\}
	\immediate\write\myfile{\string\hline}

	\pgfmathsetmacro{\@sem@totl@volume}{\@sem@totl@volume + \@totl@volume}
	\pgfmathsetmacro{\@sem@prac@volume}{\@sem@prac@volume + \@prac@volume}
	\pgfmathsetmacro{\@sem@tuto@volume}{\@sem@tuto@volume + \@tuto@volume}
	\pgfmathsetmacro{\@sem@lect@volume}{\@sem@lect@volume + \@lect@volume}
	
	\pgfmathsetmacro{\@sem@ects}{\@sem@ects + \@ects}
	\pgfmathsetmacro{\@sem@coeff}{\@sem@coeff + \@coeff}

	\init%
}




		

