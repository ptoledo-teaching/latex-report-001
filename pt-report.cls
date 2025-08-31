\ProvidesClass{pt-report}[2021/07/01 v1.0 PT Report Class]
\NeedsTeXFormat{LaTeX2e}

% Fixed options
\PassOptionsToClass{12pt}{article}
\PassOptionsToClass{letterpaper}{article}
\PassOptionsToClass{twoside}{article}
% Loading class
\LoadClass{article}

% Packages

% Page geometry
\geometry{
  letterpaper,
  top=1.0in,
  bottom=1.0in,
  left=1.25in,
  right=1.25in,
  headheight=15pt,
}
\setlength\parskip{1em}
\setlength\parindent{15pt}

% Header and footer
\pagestyle{fancy}
\cfoot{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0.5pt}
\makeatletter
  \fancyhead[LE]{\printif{classcode}{\@classcode\ - }{}\@classsemester}
  \fancyhead[RE]{\@doctitle}
  \fancyhead[LO]{\@astudentlastname\printif{bstudentlastname}{, \@bstudentlastname}{}\printif{cstudentlastname}{, \@cstudentlastname}{}}
  \fancyhead[RO]{\printif{version}{\@version\ - }{}\the\year/\two@digits{\month}/\two@digits{\day}}
\makeatother

% Custom titlepage
\makeatletter
\def\@maketitle{
  % Configurations
  \renewcommand\listtablename{Índice de tablas}
  \renewcommand\lstlistlistingname{Índice de fragmentos de codigo}
  % Cover
  \thispagestyle{empty}
  \noindent\includegraphics[width=.475 \textwidth]{../latex-report-001/logo-\@institution}
  \vfill
  \vfill
  \begin{center}
    \printif{docsubtitle}{\fontsize{25}{25}\selectfont \@docsubtitle\\[3em]}{}
    {\fontsize{35}{35}\selectfont \@doctitle}\\[2.0em]
    {\fontsize{15}{15}\selectfont \printif{classcode}{\@classcode\ - }{}\@classsemester\printif{classparallel}{ - \@classparallel}{}}\\[10pt]
    {\fontsize{20}{20}\selectfont \@classname}\\[5pt]
    {\fontsize{15}{15}\selectfont \today\printif{version}{ - \@version}{}}
  \end{center}
  \vfill
  \vfill
  \vfill
  \begin{flushright}
    \begin{tabular}{r|l}
      \printif{astudentname}{\@astudentname\ \@astudentlastname & \@astudentrol \\ \@astudentemail & \\}{}
      \printif{bstudentname}{\@bstudentname\ \@bstudentlastname & \@bstudentrol \\ \@bstudentemail & \\}{}
      \printif{cstudentname}{\@cstudentname\ \@cstudentlastname & \@cstudentrol \\ \@cstudentemail & \\}{}
    \end{tabular}
  \end{flushright}
  \newpage
  % Index
  % Table of contents
  \tableofcontents
  % Tables
  \ifnum \totvalue{table}>0
    \listoftables
  \fi
  % Figures
  \ifnum \totvalue{figure}>0
    \listoffigures
  \fi
  % Code
  \ifnum \totvalue{lstlisting}>0
    \lstlistoflistings
  \fi
  \newpage
}
\makeatother

% Hooks
\AtBeginDocument{
  \maketitle
}
