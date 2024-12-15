% Designed by: Abdelkrime Aries
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{esisyllabus}[2024/11/29 v1.0 ESI Syllabus Class]

%===============================================================
% Options
%===============================================================


\newif\ifshort % short vrsion
\shortfalse % by default it is long
\newif\ifinfo % information
\infofalse % by default no information
\newif\ifsmp % simpl
\smpfalse % by default no information


\DeclareOption{short}{\shorttrue}
\DeclareOption{info}{\infotrue}
\DeclareOption{smp}{\smptrue}

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

\usepackage{esisyllabusinf}


\definecolor{skyblue}{RGB}{150, 200, 255}
\definecolor{darkblue}{RGB}{20,40,120} %25,47,98}


%===============================================================
% Internal Varivables
%===============================================================

\def\@csdvalidation{}
\def\@csvalidation{}
\def\@version{}
\def\@syear{}


\def\@redactorlist{}
\def\@reviewerlist{}
\def\@prerequisitelist{}
\def\@objectivelist{}
\def\@chapterslist{}
\def\@methodlist{}
\def\@practicallist{}
\def\@abstract{}


\newcounter{cchapter}
\newcounter{cpractical}

%===============================================================
% Helper commands (formatting)
%===============================================================

% Format an expert (First-name Family-name (email))
\newcommand{\formatexpert}[3]{\titlecap{#1}\ \titlecap{#2} (\url{#3})} %\MakeUppercase


\newcommand{\formatchapter}[4]{
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

\newcommand{\formatpractical}[3]{
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


%===============================================================
% Setters (setting internal variables)
%===============================================================

\def\setcsdvalidation#1{\def\@csdvalidation{#1}}
\def\setcsvalidation#1{\def\@csvalidation{#1}}
\def\setversion#1{\def\@version{#1}}
\def\setyear#1{\def\@syear{#1}}
\def\setabstract#1{\def\@abstract{#1}}

%===============================================================
% Adding elements
%===============================================================

\newcommand\addchapter[3]{% titl prcntag outlin
	\listadd{\@chapterslist}{\formatchapter{\arabic{cchapter}}{#1}{#2}{#3}}
}

\newcommand\addpractical[2]{% titl outlin
	\listadd{\@practicallist}{\formatpractical{\arabic{cpractical}}{#1}{#2}}
}

\newcommand\addredactor[3]{% firstname familyname mail
	\listadd{\@redactorlist}{\formatexpert{#1}{#2}{#3}}
}

\newcommand\addreviewer[3]{% firstname familyname mail
	\listadd{\@reviewerlist}{\formatexpert{#1}{#2}{#3}}
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

%===============================================================
% Headers and Footers
%===============================================================

\fancypagestyle{fancyinfo}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[C]{
		\scriptsize
		\begin{tblr}{
				colspec = {p{7.8cm}lp{7.8cm}lp{1.1cm}},
				rows = {valign=m, halign=c},
				cell{1}{odd}={darkblue, fg=white, font=\bfseries},
				colsep=3pt,
				rowsep=3pt,
				stretch = 0,
				vlines = {1pt,solid},
				hlines = {1pt,solid},
				hline{1-3} = {even}{text=\clap{}},
			}
			
			Validation CSD-ISI / CSD-CP && Validation du CS && Page\\
			\@csdvalidation && \@csvalidation && \thepage\\
		\end{tblr}
	}

	\fancyhead[C]{
		\scriptsize
		\begin{tblr}{
				colspec = {p{3cm}lp{9.5cm}lp{1.9cm}lp{1.9cm}},
				rows = {valign=m, halign=c},
				cell{1}{5,7}={darkblue, fg=white, font=\bfseries},
				colsep=3pt,
				rowsep=3pt,
				stretch = 0,
				vlines = {1pt,solid},
				hlines = {1pt,solid},
				hline{1-3} = {even}{text=\clap{}},
				hline{2} = {2}{text=\clap{}},
			}
			
			\SetCell[r=2]{c}\includegraphics[height=1cm]{logo/ESI_logo_txt.png} &&
			SYLLABUS MATIERE\_version LONGUE
			&& Version && Ann\'ee \\
			&& (Destinataire :  Usage Interne restreint  via Talents) && \@version && \@syear\\
		\end{tblr}
	}
}

\fancypagestyle{fancymain}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{1pt}
	\fancyfoot[C]{-\thepage-}
	
	\fancyhead[L]{ESI- \@title\ (version LONGUE)}
}

\fancypagestyle{fancyfirstpage}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[C]{-\thepage-}
	
%	\fancyhead[C]{SYLLABUS MATIERE\_version LONGUE}
}

\ifinfo
\usepackage[left=1.5cm,right=1.5cm,top=1cm,bottom=1cm,includefoot,includehead,headheight=1.25cm,asymmetric]{geometry}
\pagestyle{fancyinfo}
\else
\ifsmp
\usepackage[left=1.5cm,right=1.5cm,top=1.5cm,bottom=1.5cm,includefoot,includehead,headheight=14pt,asymmetric]{geometry}
\pagestyle{fancymain}
\thispagestyle{fancyfirstpage}
\else
\usepackage[left=1.5cm,right=1.5cm,top=1.5cm,bottom=1cm,includefoot,asymmetric]{geometry}
\pagestyle{empty}
\fi
\fi

%===============================================================
% Printing commands (print results)
%===============================================================

\newcommand{\printidentification}{%
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
		\@socle-S\@semester && \SetCell[c=10]{c} \bfseries\Large\color{darkblue}\@title &&&&&&&&& \\
		\SetHline{1-1,3-12}{1pt}
		\SetCell[c=12]{c} &&&&&&&&&&&\\
		\SetHline{1-1,3-3,5-5,7-10,12-12}{1pt}
		TU Code && ECTS && Coeff && \SetCell[c=4]{c} Hourly volume &&& && Teaching Mode \\
		\SetHline{1-1,3-3,5-5,7-10,12-12}{1pt}
		\SetCell[r=2]{c} \@unittype TU\ \@unitid && \SetCell[r=2]{c} \@ects && \SetCell[r=2]{c} \@coeff && 
		Lectures & Tutorials & Practicals & Total && \SetCell[r=2]{c} \@tmode \\
		\SetHline{1-1,3-3,5-5,7-10,12-12}{1pt}
		&&  &&  && \@lect@volume H & \@tuto@volume H & \@prac@volume H & \@totl@volume H &&  \\
		\SetHline{1-1,3-3,5-5,7-10,12-12}{1pt}
		
	\end{tblr}

}

\newcommand{\loopitems}[1]{
	\def\sep{}
	\renewcommand*{\do}[1]{\sep\item ##1\def\sep{;}}
	\begin{itemize}
		\dolistloop{#1}.
	\end{itemize}
}

\newcommand{\printabstract}{\@abstract}

\newcommand{\printobjectives}{%
	\ifdefempty{\@objectivelist}{}{
		\vspace{14pt}On completion of this course, students will be able to:
		\loopitems{\@objectivelist}
	}	
}

\newcommand{\printprerequisites}{%
	\ifdefempty{\@prerequisitelist}{}{
		\loopitems{\@prerequisitelist}
	}	
}

\newcommand{\printredactors}{%
	\ifdefempty{\@redactorlist}{}{
		This syllabus was proposed by:
		\loopitems{\@redactorlist}
	}	
}

\newcommand{\printreviewers}{%
	\ifdefempty{\@reviewerlist}{}{
		It was reviewed by:
		\loopitems{\@reviewerlist}
	}	
}

\newcommand{\printmethods}{%
	\ifdefempty{\@methodlist}{}{
		\loopitems{\@methodlist}
	}
}

\newcommand{\printchapters}{
	\ifdefempty{\@chapterslist}{}{
		\setcounter{cchapter}{0}
		\renewcommand*{\do}[1]{\stepcounter{cchapter}##1}
		\dolistloop{\@chapterslist}
	}
}

\newcommand{\printpracticals}{
	\ifdefempty{\@practicallist}{}{
		\setcounter{cpractical}{0}
		\renewcommand*{\do}[1]{\stepcounter{cpractical}##1}
		\dolistloop{\@practicallist}
	}
}

\newcommand{\printassessment}{%
	\begin{tblr}{
			colspec = {p{1cm}lp{4cm}lp{9.25cm}lQ[r,2cm]},
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
%		CA && Continuous Assessment && \@ca@cmt && \@ca@prc\\
%		PR && Practicals grade && \@pr@cmt && \@pr@prc \\
%		ME && Midterm exam && \@me@cmt && \@me@prc \\
%		FE && Final exam && \@fe@cmt && \@fe@prc \\
		CA && Continuous Assessment && 
		\begin{minipage}{9.15cm}\vspace{6pt}\@ca@cmt\vspace{6pt}\end{minipage} && \@ca@prc \\
%		
		PR && Practicals grade && 
		\begin{minipage}{9.15cm}\vspace{6pt}\@pr@cmt\vspace{6pt}\end{minipage} && \@pr@prc \\
%		
		ME && Midterm exam && 
		\begin{minipage}{9.15cm}\vspace{6pt}\@me@cmt\vspace{6pt}\end{minipage} && \@me@prc \\
%		
		FE && Final exam && 
		\begin{minipage}{9.15cm}\vspace{6pt}\@fe@cmt\vspace{6pt}\end{minipage} && \@fe@prc \\
	\end{tblr}
}




%===============================================================
% Formatting commands
%===============================================================

\AtBeginDocument{
	\begin{center}
		\huge\bfseries\color{darkblue} SYLLABUS
	\end{center}
}
%
%\AtEndDocument{
%	
%}

\newcommand{\bgparbox}[1]{\colorbox{darkblue}{\setlength{\fboxsep}{6pt}%
		
		\begin{tabularx}{\dimexpr\linewidth-\fboxsep}{l>{\raggedright\arraybackslash}X}#1\end{tabularx}}}

\titleformat{\section}[block]
{}{}{0em}
{\bgparbox{\color{white}\bfseries\Large\thesection.\hskip8pt #1}}

\setlength\parindent{0pt}

%\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}.}


\renewcommand{\baselinestretch}{1.15} 

\usepackage{enumitem}
\setlist{nolistsep}

%===============================================================
% Custom Tabls
%===============================================================

\def\@tbl@label@a{}
\def\@tbl@label@b{}
\def\@tbl@label@c{}

\def\@tbl@len@a{0.3\textwidth}
\def\@tbl@len@b{0.3\textwidth}
\def\@tbl@len@c{0.3\textwidth}

\newcommand{\defthreecoltbl}[6]{
	\def\@tbl@label@a{#1}
	\def\@tbl@label@b{#2}
	\def\@tbl@label@c{#3}
	
	\def\@tbl@len@a{#4}
	\def\@tbl@len@b{#5}
	\def\@tbl@len@c{#6}
}

\newcommand{\printthreecoltbl}[3]{
	\begin{tabular}{|p{\@tbl@len@a}|p{\@tbl@len@b}|p{\@tbl@len@c}|}
		\hline
		\rowcolor{skyblue}\textbf{\@tbl@label@a} & \textbf{\@tbl@label@b} & \textbf{\@tbl@label@c}\\
		\hline
		#1 & 
		\begin{minipage}{5.4cm}
			\vspace{6pt}#2\vspace{6pt}
		\end{minipage} &
		\begin{minipage}{9.15cm}
			\vspace{6pt}#3\vspace{6pt}
		\end{minipage}\\
		\hline
	\end{tabular}
	\vskip6pt
}


