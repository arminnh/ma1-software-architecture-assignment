\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sareport}[2017/02/01 Software Architecture Report]


\PassOptionsToClass{a4paper}{article}
\PassOptionsToClass{10pt}{article}
\LoadClassWithOptions{report}

\PassOptionsToPackage{english}{babel}
\RequirePackage{titlesec}
\RequirePackage{babel}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{todonotes}
\RequirePackage{ifthen}
\RequirePackageWithOptions{xcolor}

\newboolean{anonymize}
\DeclareOption{peerreview}{
	\setboolean{anonymize}{true}
}

\ProcessOptions\relax

\pagenumbering{arabic}

\newcommand{\authorone}[1]{\def\@authorone{#1}}
\newcommand{\authortwo}[1]{\def\@authortwo{#1}}
\newcommand{\authorthree}[1]{\def\@authorthree{#1}}
\newcommand{\academicyear}[1]{\def\@academicyear{#1}}
\newcommand{\casename}[1]{\def\@casename{#1}}
\newcommand{\phasename}[1]{\def\@phasename{#1}}
\newcommand{\phasenumber}[1]{\def\@phasenumber{#1}}
\newcommand{\groupname}[1]{\def\@groupname{#1}}

\authorone{{\color{red}Student A (r123456)}}
\authortwo{{\color{red}Student B (r890123)}}
\authorthree{{\color{red}Student C (r456789)}}
\academicyear{{\color{red}year1-year2}}
\casename{{\color{red}SA Case Name}}
\phasename{{\color{red}Phase Name}}
\phasenumber{{\color{red}\#}}
\groupname{{\color{red}LastnameA-LastnameB-LastnameC}}

%\newcommand{\setfirstauthor}[1]{
%	\renewcommand{\authorone}{#1}
%}
%\newcommand{\setsecondauthor}[1]{
%	\renewcommand{\authortwo}{#1}
%}
%\newcommand{\setthirdauthor}[1]{
%	\renewcommand{\authorthree}{#1}
%}
%\newcommand{\setyear}[1]{
%	\renewcommand{\academicyear}{#1}
%}
%\newcommand{\setcasename}[1]{
%	\renewcommand{\casename}{#1}
%}
%\newcommand{\setphase}[2]{
%	\renewcommand{\phasename}{#2}
%	\renewcommand{\phasenumber}{#1}
%}

% Modified chapter format (titlesec)
\titleformat{\chapter}[block]
{\normalfont\huge\bfseries}{\thechapter.}{1em}{\Huge}
\titlespacing*{\chapter}{0pt}{-19pt}{18pt}

% geometry
\geometry{tmargin=3cm, bmargin=2.2cm, lmargin=2.2cm, rmargin=2cm}

%\newcommand{}{}

\newcommand{\todoinline}[2][]{\todo[inline, caption={2do}, #1]{\noindent\makebox[\textwidth][c]{%
			\begin{minipage}{0.975\textwidth}#2\end{minipage}}}}

\renewcommand{\maketitle}{%
	\pagenumbering{Alph}
\begin{titlepage}
	\newpage
	\thispagestyle{empty}
	\frenchspacing
	\hspace{-0.2cm}
	\IfFileExists{sedes.pdf}{%
		\includegraphics[height=3.4cm]{sedes}
	}{%
	\ClassWarning{sareport}{The file sedes.pdf is missing.}
	}
	\hspace{0.2cm}
	\rule{0.5pt}{3.4cm}
	\hspace{0.2cm}
	\begin{minipage}[b]{8cm}
		\Large{Katholieke\newline Universiteit\newline Leuven}\smallskip\newline
		\large{}\smallskip\newline
		\textbf{Department of\newline Computer Science}\smallskip
	\end{minipage}
	\hspace{\stretch{1}}
	\vspace*{3.2cm}\vfill
	\begin{center}
		\begin{minipage}[t]{\textwidth}
			\begin{center}
				\LARGE{\rm{\textbf{\uppercase{\@casename:}}\\\@phasename}}\\
				\Large{\rm{Software Architecture (H09B5a and H07Z9a) --
						Part \@phasenumber}}\\
				\vspace{0.5cm}
				\ifthenelse{\boolean{anonymize}}{%
					\large{\textsc{Anonymized}}%
				}{%
					\large{\textsc{\@groupname}}%
				}
			\end{center}
		\end{minipage}
	\end{center}
	\vfill
	\hfill\makebox[8.5cm][l]{%
		\vbox to 7cm{\vfill\noindent
			\ifthenelse{\boolean{anonymize}}{%
				{\rm \textbf{Anonymized}}\\
				{\rm Academic year 2015--2016}
			}{%
				{\rm \textbf{\@authorone}}\\
				{\rm \textbf{\@authortwo}}\\
				{\rm \textbf{\@authorthree}}\\[2mm]
				{\rm Academic year \@academicyear}
			}
		}
	}
\end{titlepage}
\pagenumbering{arabic}
}

\AtBeginDocument{
	\ifthenelse{\boolean{anonymize}}{%
		\@ifpackageloaded{hyperref}{%
		\hypersetup{pdfauthor={Anonymized},hidelinks}
		}{}
	}{%
\@ifpackageloaded{hyperref}{%
	\hypersetup{pdfauthor={ },hidelinks}
}{}
	}
}