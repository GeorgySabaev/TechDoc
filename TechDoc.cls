% creator: ilyakooo0
% extra credit: dashared
% version: 1.0.4

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{TechDoc}

\LoadClass[a4paper, 12pt]{article}

\RequirePackage{geometry}
\RequirePackage{listings}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{titlesec}
\RequirePackage{graphicx}
\RequirePackage[T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[unicode]{hyperref}
\RequirePackage{array}
\RequirePackage{color}
\RequirePackage{textcomp}
\RequirePackage{lastpage}
\RequirePackage{longtable}
\RequirePackage{multirow}
\RequirePackage{indentfirst}
\RequirePackage{enumitem}
\RequirePackage{tocloft}
\RequirePackage{caption}
\RequirePackage{etoolbox}
\RequirePackage{iflang}

\setcounter{secnumdepth}{4}

\titleformat{\paragraph}
{\normalfont\normalsize\bfseries}{\theparagraph}{0mm}{.~}
\titlespacing*{\paragraph}
{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}

%% Languages

\AddEnumerateCounter{\asbuk}{\@asbuk}{\cyrm}
\renewcommand{\theenumi}{(\asbuk{enumi})}
\renewcommand{\labelenumi}{\asbuk{enumi})}


\setenumerate[1]{label={\arabic*)}}
\setenumerate[2]{label={--}}
\setenumerate[3]{label={\asbuk*)}}

\DeclareUnicodeCharacter{306}{{\color{red} \textbf{По всей видимости либо ты откуда-то не очень хорошо скопировал, либо у тебя с вводом что-то не то, потому что буква Й у тебя состоит из двух скаляров юникода. Удали этот Й и напечатай его заново. (Выйди и зайди нормально)} }}

\RequirePackage[russian,english]{babel}

\titlelabel{\thetitle.~}

\lstset{
    basicstyle=\small\ttfamily,
    tabsize=4,
    breaklines=true,
    columns=flexible
}

\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black,
    unicode=true
}

\geometry{left=20mm, right=10mm, top=25mm, bottom=25mm, headheight=25mm}

\DeclareCaptionLabelSeparator{emdash}{ --- }
\captionsetup{
	justification=centering,
	singlelinecheck=false,
	labelsep=emdash
}


 %% Header

\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{
\begin{tabular}{c}
    \thepage \\ \@documentCode
\end{tabular}
}
\renewcommand\headrulewidth{0pt}

\newcommand{\@foot}{
	\vspace{-7mm}
	\footnotesize{
	\begin{tabular}{|p{0.30\linewidth}|p{0.14\linewidth}|p{0.15\linewidth}|p{0.14\linewidth}|p{0.14\linewidth}|}
			\hline
			& & & & \\ \hline
			\IfLanguageName{english}{Change}{Изм.} & \IfLanguageName{english}{Page}{Лист} & \IfLanguageName{english}{Document num.}{\textnumero~докум.} & \IfLanguageName{english}{Signature}{Подп.} & \IfLanguageName{english}{Date}{Дата}\\
			\hline
			\footnotesize{\@documentCode}& & & &\\
			\hline
			\IfLanguageName{english}{inv. num. of orig.}{Инв. \textnumero~подл.} & \IfLanguageName{english}{Sig. and date}{Подп. и дата} & \IfLanguageName{english}{inv. num.}{Взам. инв. \textnumero} & \IfLanguageName{english}{inv. num. of copy}{Инв. \textnumero~дубл.}& \IfLanguageName{english}{Sig. and date}{Подп. и дата} \\
			\hline
		\end{tabular}
	}
}

\cfoot{
\@foot
}

\setcounter{page}{2}

%% TOC

\tocloftpagestyle{fancy}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}

\setcounter{tocdepth}{2}

%% Title page

\renewcommand{\@title}{\color{red}{TODO}}
\renewcommand{\title}[1]{
    \renewcommand{\@title}{#1}
}

\newcommand{\@institute}{
    \IfLanguageName{english}
    {national research university\\<<higher school of economics>>}
    {правительство российской федерации\\
		национальный исследовательский университет \\
		«высшая школа экономики»}}
\newcommand{\institute}[1]{
    \renewcommand{\@institute}{#1}
}

\newcommand{\@faculty}{
    \IfLanguageName{english}
    {Faculty of Computer Science}
    {Факультет компьютерных наук\\
		Департамент программной инженерии}}
\newcommand{\faculty}[1]{
    \renewcommand{\@faculty}{#1}
}

\newcommand{\@academicTeacherTitle}{{\color{red}{TODO}}}
\newcommand{\@academicTeacherName}{{\color{red}{TODO}}}
\newcommand{\academicTeacher}[2]{
    \renewcommand{\@academicTeacherTitle}{#1}
    \renewcommand{\@academicTeacherName}{#2}
}

\newcommand{\@academicSupervisorName}{\IfLanguageName{english}{N. A. Pavlochev}{Н. А. Павлочев}}
\newcommand{\@academicSupervisorTitle}{
    \IfLanguageName{english}
        {Academic supervisor of the <<software engineering>> programme}
        {Академический руководитель образовательной программы «Программная инженерия»}}
\newcommand{\academicSupervisor}[2]{
    \renewcommand{\@academicSupervisorTitle}{#1}
    \renewcommand{\@academicSupervisorName}{#2}
}

\newcommand{\@documentTitle}{{\color{red}{TODO}}}
\newcommand{\documentTitle}[1]{
    \renewcommand{\@documentTitle}{#1}
}

\newcommand{\@documentCode}{{\color{red}{TODO}}}
\newcommand{\documentCode}[1]{
    \renewcommand{\@documentCode}{#1}
}

\renewcommand{\@author}{{\color{red}{TODO}}}
\newcommand{\@authorTitle}{{\color{red}{TODO}}}
\renewcommand{\author}[2]{
    \renewcommand{\@authorTitle}{#1}
    \renewcommand{\@author}{#2}
}

\newcommand{\@year}{2024}
\renewcommand{\year}[1]{
    \renewcommand{\@year}{#1}
}

\newcommand{\@city}{\IfLanguageName{english}{Moscow}{Москва}}
\newcommand{\city}[1]{
    \renewcommand{\@city}{#1}
}

\newcommand{\@titleTable}{
\reversemarginpar\marginpar{\rotatebox{90}{\begin{tabular}{|p{25mm}|p{35mm}|p{25mm}|p{25mm}|p{35mm}|}
	\hline
	\rule{0mm}{5mm}\IfLanguageName{english}{inv. num. of orig.}{Инв. \textnumero~подл} & \IfLanguageName{english}{Sig. and date}{Подп. и дата} & \IfLanguageName{english}{inv. num}{Взам. инв. \textnumero}& \IfLanguageName{english}{inv. num. of copy}{Инв. \textnumero~дубл.}&\IfLanguageName{english}{Sig. and date}{Подп. и дата}\\
	\hline
	\rule{0mm}{7mm}&   &   &   &  \\
	\hline
\end{tabular}}}
}

\titleformat{\subsection}{\normalfont\large\bfseries\raggedright}{\thesubsection.~}{0mm}{}
\titleformat{\subsubsection}{\normalfont\normalsize\bfseries\raggedright}{\thesubsubsection.~}{0mm}{}
\titleformat{\paragraph}{\normalfont\normalsize\bfseries\raggedright}{\theparagraph.~}{0mm}{}

\newcommand{\@startAdditions}{
    \setcounter{section}{0}
    \renewcommand{\sectionbreak}{}
    \titleformat{\section}[block]{\Large\bfseries\filcenter}{}{0mm}{}
    \renewcommand{\@startAdditions}{}
}

\newcounter{@tempSection}

\newcommand{\addition}[1]{%
    \clearpage
    \newpage
    \@startAdditions
    \stepcounter{section}
    \begin{flushright}
        \Large \textbf{\textsc{\IfLanguageName{english}{appendix}{приложение} \asbuk{section}}}
    \end{flushright}
    \setcounter{@tempSection}{\arabic{section}}
    \setcounter{secnumdepth}{0}
    \section[Приложение \Asbuk{@tempSection}]{#1}
    \setcounter{secnumdepth}{4}
}

\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}

\newcommand{\@LU}{
    \begin{center}
        \textsc{\textbf{\@institute}}
		\par\vspace{5mm}
		\upshape\mdseries
		\@faculty

		\par\vspace{10mm}

		\begin{tabular}[h!]{P{0.45\textwidth}  P{0.45\textwidth}}

			\textit{\IfLanguageName{english}{COORDINATED}{СОГЛАСОВАНО}} & \textsl{\IfLanguageName{english}{APPROVED}{УТВЕРЖДАЮ}}\\
			& \\
			\@academicTeacherTitle & \@academicSupervisorTitle \\
			& \\
			\underline{\hspace{4cm}} \@academicTeacherName & \underline{\hspace{4cm}} \@academicSupervisorName \\
			<<\underline{\hspace{1cm}}>> \underline{\hspace{3cm}} \@year{} \IfLanguageName{english}{}{г.} & <<\underline{\hspace{1cm}}>> \underline{\hspace{3cm}} \@year{} \IfLanguageName{english}{}{г.}\\
		\end{tabular}


	\vspace{15mm}
	{\LARGE{\textsc{\textbf{\MakeLowercase{\@title}}}}}

	\vspace{6mm}

	\textbf{\@documentTitle}

	\vspace{6mm}

    \textbf{\textsc{\IfLanguageName{english}{Approval Sheet}{Лист Утверждения}}}

	\vspace{6mm}

    \textbf{\@documentCode{}-ЛУ}

	\end{center}


	\vfill
	\hfill
	\begin{tabular}{c}
	\\
	\IfLanguageName{english}{Author}{Исполнитель}: \@authorTitle
	\\
	\underline{\hspace{4cm}} \@author
	\\
	<<\underline{\hspace{1cm}}>> \underline{\hspace{4cm}} \@year\IfLanguageName{english}{}{~г.}
	\end{tabular}

    \@titleTable

    \vspace{30mm}

    \begin{center}
        \@city~\@year
    \end{center}

    \vspace{-20mm}
}

\newcommand{\noLU}{
    \renewcommand{\@LU}{}
}

\renewcommand{\maketitle}{
    \pagestyle{empty}
    \clearpage

    \begin{titlepage}

    \@LU

    \newpage

    \textbf{\textsc{\IfLanguageName{english}{Approved}{Утверждён}}}

    \textbf{\@documentCode{}-ЛУ}

    \vspace{40mm}

    \begin{center}
    	{\LARGE{\textsc{\textbf{\MakeLowercase{\@title}}}}}

    		\vspace{6mm}

    	\textbf{\@documentTitle}

    	\vspace{6mm}

        \textbf{\@documentCode}

    	\vspace{6mm}

        \textbf{\IfLanguageName{english}{\pageref{LastPage} pages}{Листов \pageref{LastPage}}}

    \end{center}

    \vfill

    \@titleTable

    \vspace{80mm}

    \begin{center}
        \@city~\@year
    \end{center}

    \vspace{-20mm}

    \end{titlepage}

    \pagestyle{fancy}

    \setcounter{page}{2}
}


\newcommand{\registrationList}{%
    \clearpage
    \newpage

    \@startAdditions

    % \setcounter{secnumdepth}{0}
    \section*{\IfLanguageName{english}{Change registration sheet}{Лист регистрации изменений}}
    % \setcounter{secnumdepth}{4}

    \cfoot{}

    \begin{tabular}{|p{0.05\linewidth}|p{0.04\linewidth}|p{0.06\linewidth}|p{0.06\linewidth}|p{0.06\linewidth}|p{0.1\linewidth}|p{0.1\linewidth}|p{0.12\linewidth}|p{0.05\linewidth}|p{0.05\linewidth}|}

    	\hline
    	\multirow{2}{*}{\IfLanguageName{english}{\shortstack[l]{Cha-\\nge}}{Изм.}} & \multicolumn{4}{c|}{\IfLanguageName{english}{Page number}{Номера листов}} & \IfLanguageName{english}{Total number of pages}{Всего листов в документе} & \IfLanguageName{english}{Document number}{\textnumero{} доку-мента} & \IfLanguageName{english}{Number of accompanying documents and date}{Входящий \textnumero{} сопрово-дит.~докум. и дата} & \IfLanguageName{english}{Sig-na-ture}{Под-пись} & \IfLanguageName{english}{Date}{Дата} \\ [5ex] \cline{2-5}
    	& \IfLanguageName{english}{Mo-di-fied}{из-ме-нен-ных} & \IfLanguageName{english}{Re-pla-ced}{заме-нен-ных} & \IfLanguageName{english}{Ad-ded}{но-вых} & \IfLanguageName{english}{An-nul-led}{анну-лиро-ван-ных} &  &  &  &  & \\[10ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    	& & & & & & & & & \\[5ex]
    	\hline
    \end{tabular}

    \newpage
    \cfoot{
    \@foot
    }
}


%% Code

\newcommand{\programmingLanguage}[1]{
    \lstset{language=#1}
}

%% [#1]: ref id
%% #2: file
%% #3: caption
\newcommand{\floatCode}[3][]{
\begin{figure}[hbp]
    \lstinputlisting [frame=single] {#2}
    \ifblank{#3}{}{\caption{#3}}
    \ifblank{#1}{}{\label{#1}}
\end{figure}
}

\newcommand{\code}[1]{%
	\lstinputlisting[frame=single,basicstyle=\footnotesize\ttfamily]{#1}
}

\renewcommand{\code}[2]{%
	\lstinputlisting [frame=single, basicstyle=\footnotesize\ttfamily, caption={#2}, captionpos=b] {#1}
}

\newcommand{\lcode}[1]{
    \begin{lstlisting}%
#1
    \end{lstlisting}%
}

% [#1]: caption
% #2: file
% #3: label
\newcommand{\image}[3][]{
\begin{figure}[hbp]
    \includegraphics{#2}
    \ifblank{#1}{}{\caption{#1}}
    \ifblank{#3}{}{\label{#3}}
\end{figure}
}

\newcommand{\img}[1]{%
    \begin{figure}[b]%
        \centering%
        \includegraphics[width=0.6\textwidth,height=0.6\textheight,keepaspectratio]{#1}%
        \caption{}%
        \label{#1}%
    \end{figure}%
    \ref{#1}%
}
\newcommand{\imgs}[2]{%
    \begin{figure}[bp]%
        \centering%
        \includegraphics[width=0.45\textwidth,height=0.45\textwidth,keepaspectratio]{#1}%
        \hspace{0.05\textwidth}%
        \includegraphics[width=0.45\textwidth,height=0.45\textwidth,keepaspectratio]{#2}%
        \caption{}%
        \label{#1=#2}%
    \end{figure}%
    \ref{#1=#2}%
}

\titleformat{\section}[block]{\Large\bfseries\filcenter}{\thesection.}{0mm}{~}

\newcommand{\sectionsAreChapters}{
    \titleformat{\section}[block]{\Large\bfseries\filcenter}{\IfLanguageName{english}{Chapter}{Глава} \thesection.}{0mm}{~}
}

\newcommand{\sectionbreak}{\clearpage}
