# PT Report Class

**Version:** 0.1  
**Date:** 2025/10/18  
**Author:** Pedro Toledo Correa  
**License:** LaTeX Project Public License 1.3c or later  
**Repository:** [GitHub - ptoledo-teaching/pt-commons](https://github.com/ptoledo-teaching/pt-commons)

A professional LaTeX report document class built on top of `pt-commons`, designed for technical reports, project documentation, and academic assignments. Features single-column layout with section page breaks and enhanced formatting capabilities.

## Overview

`pt-report` extends the standard LaTeX `article` class with:
- Professional single-column layout with 1-inch margins
- Automatic title page generation
- Custom header/footer with version control
- Section page breaks (each section starts on a new page)
- Enhanced section formatting
- Highlight boxes for important content
- Optional watermark support
- All features from `pt-commons` package

## Installation

Install both `pt-report.cls` and `pt-commons.sty` in your LaTeX project or texmf tree:

```bash
# Local installation
mkdir -p ~/texmf/tex/latex/pt-report
mkdir -p ~/texmf/tex/latex/pt-commons
cp pt-report.cls ~/texmf/tex/latex/pt-report/
cp pt-commons.sty ~/texmf/tex/latex/pt-commons/
texhash ~/texmf
```

## Basic Usage

```latex
\documentclass{pt-report}

\title{Your Report Title}
\addauthor{John}{Doe}{john.doe@example.com}{University Department}

\begin{document}
% Title is automatically generated

\section{Introduction}
Your content here...

\section{Methodology}
Each section starts on a new page...

\end{document}
```

## Class Options

### Language Options (from pt-commons)

```latex
\documentclass[english]{pt-report}    % English
\documentclass[spanish]{pt-report}    % Spanish (default)
\documentclass[portuguese]{pt-report} % Portuguese
\documentclass[french]{pt-report}     % French
```

### Code Environment Options

```latex
\documentclass[nominted]{pt-report}  % Disable minted, use verbatim
```

### Standard Article Options

All standard `article` class options are supported (except column-related):

```latex
\documentclass[10pt]{pt-report}   % 10pt font
\documentclass[11pt]{pt-report}   % 11pt font
\documentclass[12pt]{pt-report}   % 12pt font (default)
```

## Document Metadata

### Title and Authors

```latex
\title{Main Title}
\titlesub{Optional Subtitle}
\titlesubsub{Optional Sub-subtitle}

% Add multiple authors
\addauthor{FirstName}{LastName}{email@example.com}{Affiliation}
\addauthor{Jane}{Smith}{jane@university.edu}{Department of CS, University}

% Optional: Add logo
\logo{path/to/logo.png}
```

The title page is automatically generated at the beginning of the document with:
- Logo (if specified)
- Title hierarchy
- Author boxes with emails
- Footnotes for affiliations

### Version Control

```latex
\version{1.0}              % Set document version
\build{auto}               % Auto-increment build number
\watermark{DRAFT}          % Add watermark
```

The footer displays:
- Page number
- Version (if set): `v1.0`
- Build number and date: `B5 - 2025/10/18`

### Academic Information

```latex
\classcode{CS-101}
\classname{Introduction to Computer Science}
\classsemester{Fall 2025}
```

## Page Layout

The class uses standard report layout with comfortable margins:

- **Page margins:** 1.0in on all sides
- **Paragraph indentation:** 0.5in
- **Single-column layout**
- **Section breaks:** Each section starts on a new page

### Geometry

```latex
% Automatically configured:
% - Letter paper size (default)
% - 1.0in margins (left, right, top, bottom)
% - Footer included in layout
```

## Section Formatting

The class provides standard section formatting with automatic page breaks:

```latex
\section{Section Title}           % Starts on new page
\subsection{Subsection Title}     
\subsubsection{Subsubsection}     
\paragraph{Paragraph Title}       
```

**Important:** Each `\section` automatically starts on a new page, making reports easy to navigate and organize.

## Enhanced Features (from pt-commons)

### Highlight Boxes

```latex
\begin{highlightbox}
Important content that needs emphasis.
\end{highlightbox}
```

### Code Listings

```latex
% Inline code
Use \inlinecode{variable_name} for inline code.

% Code blocks with minted
\begin{code}{python}{Code Title}
def hello_world():
    print("Hello, World!")
\end{code}

% Code blocks with verbatim (nominted option)
\begin{code}{python}{Code Title}
def hello_world():
    print("Hello, World!")
\end{code}
```

### Tables

```latex
% Simple table with tabularray
\begin{center}
\begin{tblr}{colspec={|l|c|r|}}
    \hline
    \tableheader
    Left & Center & Right \\
    \hline
    \hline
    Data & More & Values \\
    \hline
\end{tblr}
\end{center}
```

### Figures

```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{image.png}
    \caption{Figure caption}
    \label{fig:example}
\end{figure}
```

### Mathematics

```latex
% Inline math
The equation $E = mc^2$ is famous.

% Display math
\begin{equation}
    \int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
\end{equation}
```

## Lists of Contents

```latex
\tableofcontents          % Table of contents
\ptlistoffigures         % List of figures (if any)
\ptlistoftables          % List of tables (if any)
\ptlistofcodes           % List of code listings (if any)
```

The `pt*` versions only appear if the respective content exists in the document.

## Watermark

Add a watermark to all pages (useful for drafts):

```latex
\watermark{DRAFT}         % Add "DRAFT" watermark
\watermark{CONFIDENTIAL}  % Add "CONFIDENTIAL" watermark
```

The watermark appears diagonally across each page in a light red color.

## Complete Example

```latex
\documentclass[spanish]{pt-report}

% Document metadata
\title{Informe Técnico del Proyecto}
\titlesub{Sistema de Gestión de Datos}
\titlesubsub{Versión Final}

% Version control
\version{1.0}
\build{auto}

% Authors
\addauthor{Juan}{Pérez}{juan.perez@universidad.cl}{Departamento de Informática}
\addauthor{María}{González}{maria.gonzalez@universidad.cl}{Centro de Investigación}

% Academic info
\classcode{IWI-131}
\classname{Programación}
\classsemester{Primer Semestre 2025}

\begin{document}

\tableofcontents
\ptlistoffigures
\ptlistoftables

\section{Introducción}

Este informe presenta el desarrollo completo del proyecto...

\subsection{Objetivos}

Los objetivos principales son:
\begin{itemize}
    \item Desarrollar un sistema robusto
    \item Implementar las mejores prácticas
    \item Documentar todo el proceso
\end{itemize}

\section{Marco Teórico}

El marco teórico establece las bases conceptuales...

\begin{highlightbox}
Concepto importante: La arquitectura del sistema sigue...
\end{highlightbox}

\section{Metodología}

La metodología empleada consta de las siguientes etapas...

\section{Resultados}

Los resultados obtenidos demuestran...

\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{results.png}
    \caption{Resultados experimentales}
    \label{fig:results}
\end{figure}

\section{Conclusiones}

En conclusión, el proyecto ha cumplido con los objetivos...

\end{document}
```

## Tips and Best Practices

1. **Organization:** Use the automatic section page breaks to organize your report into clear, digestible chunks.

2. **Version Control:** Always set a version number and use `build{auto}` to track document builds.

3. **Watermarks:** Use watermarks for drafts and remove them for final versions.

4. **Tables:** Keep tables concise and use `\footnotesize` if needed (automatically applied in tblr environment).

5. **Code Listings:** Prefer `minted` for syntax highlighting unless compilation time is an issue.

6. **Figures:** Always use descriptive captions and labels for cross-referencing.

7. **Lists of Contents:** Only include lists that are relevant to your report content.

## Compatibility

- **TeX Distribution:** TeX Live 2020 or later recommended
- **Compiler:** pdfLaTeX, XeLaTeX, or LuaLaTeX
- **Dependencies:** Automatically loaded by `pt-commons`
- **Python:** Required for minted (optional, use `nominted` option to disable)

## Related Classes

- **pt-commons:** Base package with shared functionality
- **pt-article:** For academic papers and articles (two-column layout)
- **pt-letter:** For formal letters
- **pt-slides:** For presentations (beamer-based)
- **pt-book:** For books and theses (in development)

## Troubleshooting

### Sections not breaking to new pages

Make sure you're using `\section` and not `\section*`. The page break is only applied to numbered sections.

### Watermark not appearing

Ensure you have the `draftwatermark` package installed and properly configured in `pt-commons`.

### Build counter not incrementing

The build counter is stored in `\jobname.bld` file. If it's not incrementing, check file permissions.

## License

This work may be distributed and/or modified under the conditions of the LaTeX Project Public License, version 1.3c or later.

## Contributing

Contributions, bug reports, and suggestions are welcome at the GitHub repository.

## Author

**Pedro Toledo Correa**  
Email: Available through GitHub repository  
GitHub: ptoledo-teaching

---

*Last updated: 2025-10-18*
