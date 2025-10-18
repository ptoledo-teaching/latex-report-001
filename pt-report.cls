\ProvidesClass{pt-report}[2021/07/01 v1.0 PT Report Class]
\NeedsTeXFormat{LaTeX2e}

% Class handling %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pass user options to pt-commons
\DeclareOption*{%
    \PassOptionsToClass{\CurrentOption}{pt-commons}
}
\ProcessOptions\relax
% Fixed options
\PassOptionsToClass{letterpaper, 12pt}{article}
% Loading class
\LoadClass{article}
% Loading pt-commons
\RequirePackage{pt-commons}

% Page and text formatting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Font sizing
\RequirePackage{microtype}
\setlist{
    topsep=8pt,   % space above and below list
    itemsep=0pt, 
    parsep=0pt    % space between paragraphs within an item
}
% Section breaks
\pretocmd{\section}{\clearpage}{}{}

% Watermark %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\setupwatermark}[1]{% 
    \newlength{\@watermarkheight}
    \newlength{\@watermarklen}
    \newlength{\@watermarktargetlen}
    \newlength{\@watermarkwidth}
    \newlength{\@watermarkfinal}
    \begingroup
    % Calculate the watermark size
    \fontsize{5cm}{6cm}\selectfont
    \settowidth{\@watermarkwidth}{#1}%
    \settoheight{\@watermarkheight}{#1}%
    % Choose the smaller dimension between watermark width and height
    \ifdim\@watermarkwidth>\@watermarkheight
        \global\setlength{\@watermarklen}{\@watermarkwidth}%
    \else
        \global\setlength{\@watermarklen}{\@watermarkheight}%
    \fi
    \endgroup
    % Calculate the watermark target size
    \ifdim\paperwidth<\paperheight
        \setlength{\@watermarktargetlen}{1.2\paperwidth}%
    \else
        \setlength{\@watermarktargetlen}{1.2\paperheight}%
    \fi
    \setlength{\@watermarkfinal}{\dimexpr 4cm * \@watermarktargetlen / \@watermarklen \relax}
    % Set watermark properties
    \SetWatermarkText{#1}%
    \SetWatermarkFontSize{\@watermarkfinal}%
    \SetWatermarkAngle{45}%
    \SetWatermarkColor{ptred!21}
    \SetWatermarkHorCenter{0.5\paperwidth}
}

% Template pages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Custom titlepage
\renewcommand{\maketitle}{
    \edef\temp{\pt@logo}%
    \begin{titlepage}
        \newpage
        \vbox to 30pt{%
                \ifx\temp\@empty
                    \vfil % nothing, just stretch inside
                \else
                    \includegraphics[height=30pt]{\pt@logo}%
                \fi
            }%
        \vfill
        \begin{center}
            {\Huge\pt@title}\\%
            \ifdefined\pt@titlesub\vspace{6pt}{\LARGE\pt@titlesub}\\%
            \fi%
            \ifdefined\pt@titlesubsub%
                \vspace{10pt}%
                \ifdefined\pt@watermark%
                    \pt@watermark\ -%
                \fi%
                \pt@titlesubsub\\%
            \fi%
        \end{center}
        \vfill
        \begin{flushright}
            \titleauthorstable
        \end{flushright}
    \end{titlepage}
    \addtocounter{page}{1}
}

% Hooks %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginEnvironment{tblr}{\footnotesize}
