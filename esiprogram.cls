% Designed by: Abdelkrime Aries
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{esiprogram}[2024/12/09 v1.0 ESI Syllabus Class]

%===============================================================
% Options
%===============================================================


\LoadClass[11pt, a4paper]{book}


%===============================================================
% Packages
%===============================================================

\usepackage{pdfpages} % For including PDFs
\usepackage{fancyhdr} % For headers and footers
\usepackage{pdflscape}
\usepackage{graphicx}
\usepackage{tabularray}
\usepackage[table]{xcolor}
\usepackage{hyperref}
\usepackage{titlesec}
\usepackage{tocloft}
\usepackage{tikz}
\usepackage{hyperref}
\usepackage{amssymb}
\usepackage{enumitem}
\usepackage{esisyllabusinf}

\usepackage{arabtex}

\usepackage[french]{babel}
%\UseTblrLibrary{booktabs, tikz}
\frenchsetup{AutoSpacePunctuation=false}

\usepackage[export]{adjustbox} %for images in table, also for frame

\definecolor{skyblue}{RGB}{150, 200, 255}
\definecolor{darkblue}{RGB}{20,40,120} %25,47,98}


\usepackage[left=1.5cm,right=1.5cm,top=1.5cm,bottom=1cm,includefoot,asymmetric]{geometry}

\usepackage{titletoc}
\usepackage{utf8}
\setcode{utf8}

%===============================================================
%               LOGICAL VARIABLES 
%===============================================================

\newif\ifarabictitle
\arabictitlefalse

\newif\ifcs
\csfalse

%===============================================================
%                INTERNAL VARIABLES
%===============================================================

\def\@title@size{\Large}
\def\@offer@syear{}
\def\@offer@eyear{}
\def\@cycle@short{CP}
\def\@cycle@long{Premier Cycle}
\def\@cycle@dep{Premier Cycle}
\def\@cycle@along{\<الطور الأول>}
\def\@cycle@adep{\<قسم تحضيري>}
%\def\@cycle@adep{\<أقسام تحضيرية>}

\def\@specialty@short{}
\def\@specialty@long{}
\def\@specialty@along{}


\newcounter{toccounter}
\setcounter{toccounter}{0}


%===============================================================
%          SETTERS (SETTING INTERNAL VARIABLES)
%===============================================================

\def\offeryear#1#2{
	\def\@offer@syear{#1}
	\def\@offer@eyear{#2}
}

\def\secondcycle{
	\cstrue
	\def\@cycle@short{CS}
	\def\@cycle@long{Second cycle}
	\def\@cycle@dep{Cycle Supérieur/Second cycle}
	\def\@cycle@along{\<الطور الثاني>}
	\def\@cycle@adep{\<قسم أعلى>}
%	\def\@cycle@adep{\<أقسام عليا>}
}

\def\arabictitle{\arabictitletrue\def\@title@size{\LARGE}}

\def\offerspecialty#1#2#3{
	\def\@specialty@short{#1}
	\def\@specialty@long{#2}
	\def\@specialty@along{#3}
}


%===============================================================
%                  TITLE PAGE
%===============================================================

\def\maketitle{
	\clearpage
	\thispagestyle{empty}
	
	\noindent
	\begin{tblr}{
			colspec = {p{\textwidth}},
			rows = {skyblue, valign=m, halign=c, font=\large\bfseries},
			colsep=5pt,
			rowsep=2pt,
			stretch = 0,
		}
		\\
		
		\<الجمهورية الجزائرية الديمقراطية الشعبية>\\
		République Algérienne Démocratique et Populaire\\
		\<وزارة التعليم العالي والبحث العلمي>\\
		Ministère de l'Enseignement Supérieur et de la Recherche Scientifique\\
		\\
	\end{tblr}
	
	\vspace{3cm}
	\noindent
	\begin{center}
		\bfseries\color{darkblue}
		\ifarabictitle\Huge
		\<عرض تكوين مسار مهندس دولة>
		\else\huge
		OFFRE DE FORMATION PARCOURS INGENIEUR D'ETAT
		\fi
	\end{center}
	
	\vspace{1cm}
	\noindent
	\begin{center}
		\LARGE\bfseries
		\ifarabictitle\@cycle@along\else\MakeUppercase{\@cycle@long}\fi
		
		\vspace{1cm}
		
		\ifarabictitle\@offer@eyear-\@offer@syear\else\@offer@syear-\@offer@eyear\fi
	\end{center}
		
	\noindent
	\begin{tblr}{
			colspec = {
				p{6cm}l
				p{4.5cm}l
				p{6cm}
			},
			rows = {valign=m, halign=c, font=\bfseries},
			cell{1}{odd}={darkblue, fg=white, font=\@title@size\bfseries},
			cell{3-5}{odd}={skyblue},
			colsep=5pt,
			rowsep=5pt,
			stretch = 0,
		}
		
		\ifarabictitle \<القسم>\else Établissement\fi && 
		\ifarabictitle \<الكلية - المعهد>\else Faculté/Institut\fi && 
		\ifarabictitle \<المؤسسة>\else Département\fi \\
		&&&&\\
		ESI, Alger &&&& \@cycle@short\\
		\ifarabictitle\@cycle@adep\else Ecole nationale Supérieure d'Informatique\fi &&&&
		\ifarabictitle \<المدرسة الوطنية العليا للإعلام الآلي>\else\@cycle@dep\fi\\
		\ifarabictitle\else\includegraphics[width=2cm]{logo/ESI_logo.png}\fi &&&&
		\ifarabictitle\includegraphics[width=2cm]{logo/ESI_logo.png}\fi\\
	\end{tblr}
	
	\vfill
		
	\noindent
	\begin{tblr}{
			colspec = {
				p{6cm}l
				p{4.5cm}l
				p{6cm}
			},
			rows = {valign=m, halign=c, font=\bfseries},
			cell{1}{odd}={darkblue, fg=white, font=\@title@size\bfseries},
			cell{3}{odd}={skyblue},
			colsep=5pt,
			rowsep=5pt,
			stretch = 0,
		}
		
		\ifarabictitle \<التخصص>\else Domaine\fi && 
		\ifarabictitle \<الشعبة>\else Filière\fi && 
		\ifarabictitle \<الميدان>\else Spécialité\fi\\
		&&&&\\
		\ifarabictitle\ifcs\@specialty@short (\@specialty@along)\else /\fi\else Mathématiques/Informatique\fi && 
		\ifarabictitle \<إعلام آلي>\else Informatique\fi &&
		\ifarabictitle \<رياضيات - إعلام آلي>\else\ifcs\@specialty@short (\@specialty@long)\else /\fi\fi\\
	\end{tblr}
	
	\clearpage
}


%===============================================================
%              PAGE STYLE
%===============================================================

\def\cfootstyle{
	\scriptsize\small
	\begin{tblr}{
			colspec = {
				p{1.2cm}l
				p{2.7cm}l
				p{2cm}l
				p{6.2cm}l
				p{2.5cm}l
				p{1.5cm}
			},
			rows = {valign=m, halign=c},
			cell{1}{odd}={darkblue, fg=white, font=\bfseries},
			colsep=2pt,
			rowsep=2pt,
			stretch = 0,
			vlines = {1pt,solid},
			hlines = {1pt,solid},
			hline{1-3} = {even}{text=\clap{}},
			cell{1}{1}={white},
			hline{1,3} = {1}{text=\clap{}},
			vline{1,2} = {1,2}{text=\clap{}},
		}
		
		\SetCell[r=2]{c}\includegraphics[height=1cm]{logo/ESI_logo.png} &&
		Établissement && Année && Offre de Formation && \ifcs Option\else Cycle\fi && Page\\
		&& ESI Alger && \@offer@syear-\@offer@eyear && Ingénieur d'Etat en Informatique && \ifcs\@specialty@short\else\@cycle@long\fi && \thepage\\
	\end{tblr}
}

\pagestyle{fancy}
\fancyhf{} % Clear default settings
\renewcommand{\headrulewidth}{0pt}
\fancyfoot[C]{\cfootstyle}

\fancypagestyle{plain}{
	\fancyhf{}
	\fancyfoot[C]{\cfootstyle}
}

%===============================================================
%                 CONTENT TABLE
%===============================================================

\titlecontents{subsection}[5em]{\addvspace{1.5ex}}%
{\thecontentslabel\quad}% Label format
{}% Indentation for subsection title
{\dotfill \contentspage}% Page number format

\def\printcontenttable{
	\clearpage
	\setcounter{tocdepth}{1}
	\tableofcontents
	\setcounter{tocdepth}{3}
	\clearpage
}

%===============================================================
% Setters (setting internal variables)
%===============================================================

\def\semesterpage#1{
	\begin{landscape}
		\includepdf[pages=1, angle=90, pagecommand={\thispagestyle{fancy}}]{#1}
	\end{landscape}
}


\def\startsyllabi{
	\startcontents[sections]
	\printcontents[sections]{}{2}{}
	\clearpage
}

\def\addsyllabus#1{
	\input{#1.inf}
	\refstepcounter{toccounter}
	\def\@cref{\@unittype TU \@unitid: \@title}
	\addcontentsline{toc}{subsection}{\@cref}
	\includepdf[pages=-, pagecommand={\thispagestyle{fancy}}]{#1.pdf}
}

\def\endsyllabi{}


\def\printlocalization{
	\begin{tblr}{
			colspec = {p{6cm}lp{10cm}},
			rows = {valign=m, halign=l},
			cell{odd}{1}={darkblue, fg=white, font=\bfseries},
			colsep=5pt,
			rowsep=5pt,
			stretch = 0,
			hline{1-20} = {1,3}{1pt,solid},
			vline{1-4} = {odd}{1pt,solid},
		}
		
		Établissement && ESI (Ecole nationale Supérieure d'Informatique)\\
		&&\\
		Adresse && Oued Smar, 16309, Alger \\
		&&\\
		Tel && (213) +23 93 91 32 \\
		&&\\
		Site Web && \url{www.esi.dz} \\
		&&\\
		Département && \@cycle@dep \\
		&&\\
		Responsable de la formation && \\
	\end{tblr}\\
}
%===============================================================
% Setters (setting internal variables)
%===============================================================


\renewcommand{\chapter}{%
	\clearpage
	\thispagestyle{empty}
	\global\@topnum\z@
	\@afterindentfalse
	\secdef\@chapter\@schapter
}


\renewcommand{\thechapter}{\Roman{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}

\renewcommand{\@makechapterhead}[1]{%
%\vspace*{50pt}% Vertical space before the chapter
\vspace*{\fill}
\parindent \z@
\begin{tblr}{
		colspec = {p{2.5cm}},
%		roswpec = {p{3cm}},
		rows = {valign=m, halign=c, ht=2.5cm},
		cell{1}{1}={darkblue, fg=white, font=\fontsize{30}{30}\selectfont\bfseries},
		colsep=3pt,
		rowsep=3pt,
		stretch = 0,
%		vlines = {1pt,solid},
%		hlines = {1pt,solid},
	}
	\thechapter%\Roman{chapter}
\end{tblr}

\vspace{1cm}

\parindent \z@
\begin{minipage}{0.8\textwidth}% Adjust width here (60% of text width)
	\fontsize{30}{30}\bfseries\selectfont\color{darkblue}#1
\end{minipage}
%{\fontsize{30}{30}\bfseries\selectfont\color{darkblue}#1}
\vspace*{\fill}
\clearpage
}


% Customize itemize symbols
\setlist[itemize,1]{label=\textbullet} % Level 1
