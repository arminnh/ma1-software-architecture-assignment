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
\RequirePackage{xparse}
\RequirePackage{l3sort}
\RequirePackage{enumitem}
\RequirePackage{minitoc}
\RequirePackage{fontawesome}

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


\newcommand\warning[2][]{\todo[inline, caption={2do},color=red!30, #1]{\makebox[\textwidth][c]{%
			\begin{minipage}{0.975\textwidth}\textbf{\faExclamationTriangle{} Attention:} #2\end{minipage}}}}
\newcommand\note[2][]{\todo[inline, caption={2do},color=orange!20, #1]{\makebox[\textwidth][c]{%
			\begin{minipage}{0.975\textwidth}\textbf{\faInfoCircle{} Note:} #2\end{minipage}}}}
\newcommand\hint[2][]{\todo[inline, caption={2do},color=green!20, #1]{\makebox[\textwidth][c]{%
			\begin{minipage}{0.975\textwidth}\textbf{\faCheck{} Hint:} #2\end{minipage}}}}
\newcommand{\todoinline}[2][]{\todo[inline, caption={2do},color=blue!20, #1]{\makebox[\textwidth][c]{%
			\begin{minipage}{0.975\textwidth}\textbf{\faClipboard{} TODO:} #2\end{minipage}}}}

\newcommand{\captioninstruction}{\hint{Add any essential information, necessary for interpreting the figure, in the caption. Be sure to add a separate short title for inclusion in the list of figures: \texttt{\textbackslash caption[shorttitle]\{longtitle\}}.\\
		If your explanation becomes too long for the caption, you can create a separate subsection. Don't forget to refer to the figure and vice versa.}%
}


\newcommand{\showdecisionsnotes}{
	\smallskip
	\note{This section discusses \emph{all} your architectural decisions \emph{in-depth}. First, \emph{all} decisions related to the non-functionals are discussed in detail. Next, \emph{all} other decisions are listed and discussed.}
	\smallskip
	\hint{Don't just say \emph{what} you have done. Explain \emph{why} you have done it.}
	\smallskip
}
\newcommand{\showcsnotes}{
	\smallskip
	\hint{No need to just repeat what we can see on the diagram.

		Don't do this: \emph{As you can see on fig. x: comp A consists of B and C, and C connects to D}.

		But, please do explain if there is anything non-trivial (e.g., a custom mapping from actors to external components on the context diagram).}
	\smallskip
	\captioninstruction{}
	\smallskip
	\hint{If you have any doubts about the size of your figures, it is better to make your figure too large than too small. Alternatively, you can test the readability by printing it.}
	\smallskip
	\warning{With regard to the context diagram, recall the lectures on what it means and should contain. Be sure not to miss any elements here. This is a frequent source of errors.}
	\smallskip
	\warning{Make sure your main component-and-connector and context diagrams are consistent.}
	\smallskip
}
\newcommand{\showdecompnotes}{
	\smallskip
	\hint{No need to just repeat what we can see on the diagram.

		Don't do this: \emph{As you can see on fig. x: comp A consists of B and C, and C connects to D}.

		But, please do explain if there is anything non-trivial (e.g., a custom mapping from actors to external components on the context diagram).}
	\smallskip
	\captioninstruction
	\smallskip
	\warning{\emph{Consistency between views!} Be sure to check for consistency between the client-server view and your decompositions.}
	\smallskip
	\warning{\emph{Consistency of a single decomposition!} Make sure that every interface provided or required by the decomposed component, is provided or required by a subcomponent in the decomposition.}
	\smallskip
}
\newcommand{\showdeploynotes}{
	\smallskip
	\hint{No need to just repeat what we can see on the diagram.

		Don't do this: \emph{As you can see on fig. x: components A and B are deployed on node C}.

		But, please do explain if there is anything non-trivial (e.g., a custom mapping from actors to external components on the context diagram).}
	\smallskip
	\captioninstruction
	\smallskip
	\warning{Connect nodes on the deployment diagram, \emph{not} components.}
	\smallskip
	\warning{\emph{Consistency between views!} Be sure to check for consistency between the client-server/decomposition view and your deployment view.}
	\smallskip
}
\newcommand{\showscenariosnotes}{
	\smallskip
	\hint{No need to just repeat what we can see on the diagram.

		Don't do this: \emph{As you can see on fig. x: component A calls operation b, next component C calls operation d}.

		But, please do explain if there is anything non-trivial (e.g., a custom mapping from actors to external components on the context diagram).}
	\smallskip
	\captioninstruction
	\smallskip


	\warning{Do include a list of which sequence diagrams together illustrate a which scenario from the assignment.}

	\smallskip

	\hint{Don't only model the `happy path' in your sequence diagrams. Take into account the quality attributes. For example, what happens when a certain component fails (Av) or overloads (P)? Use the sequence diagrams to illustrate how you have achieved the qualities in your architecture.}
	\smallskip
}
\newcommand{\showcatalognotes}{
	\smallskip
	\hint{Make sure the elements are sorted alphabetically. You can use the \texttt{\textbackslash componentItem\{name\} \{contents\}} command for this in your report.
	Note that you cannot use newlines in the componentItem content, but you can use \textbackslash\textbackslash.
	}
	\smallskip
	\hint{Common interfaces such as, for example, ping can be described separately so you don't have to repeat them for each component that provides it.}
	\smallskip
	\hint{Similarly, you can describe the exceptions separately as well, so you don't have to repeat what they mean for each operation that can throw them.}
	\smallskip
	\warning{Don't forget to include the exceptions in the method signature in the element catalog!}
	\smallskip
	\warning{Interfaces are uniquely identified by their name, regardless of the context (e.g., the component that provides it). In other words, two interfaces with the same name are considered identical.}
	\smallskip
	\warning{Don't forget to document the external interfaces!}
	\smallskip
}


\ExplSyntaxOn
\NewDocumentCommand{\componentItem}{mm}
{
	\seq_put_right:Nn \l_sareport_comps_seq {#1}
	\cs_new:cpn { sareport_comp_#1: } {
		\subsection{#1}#2
	}
}
\NewDocumentCommand{\printComponents}{ }
{
	\seq_sort:Nn \l_sareport_comps_seq
	{
		\string_compare:nnnTF {##1} {>} {##2} {\sort_reversed:} {\sort_ordered:}
	}
	\seq_map_inline:Nn \l_sareport_comps_seq { \use:c { sareport_comp_##1: } }
}
\seq_new:N \l_sareport_comps_seq
\prg_new_conditional:Npnn \string_compare:nnn #1 #2 #3 {TF}
{
	\if_int_compare:w \pdftex_strcmp:D {#1}{#3} #2 \c_zero
	\prg_return_true:
	\else:
	\prg_return_false:
	\fi
}
\ExplSyntaxOff

% Modified chapter format (titlesec)
\titleformat{\chapter}[block]
{\normalfont\huge\bfseries}{\thechapter.}{1em}{\Huge}
\titlespacing*{\chapter}{0pt}{-19pt}{18pt}

% geometry
\geometry{tmargin=3cm, bmargin=2.2cm, lmargin=2.2cm, rmargin=2cm}

%\newcommand{}{}


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
		\vbox to 7cm{\vfill
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
