\ProvidesClass{twentysecondcv}[2015/02/28 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}

%----------------------------------------------------------------------------------------
%	 REQUIRED PACKAGES
%-----------------------------------------------------------------------	-----------------

\RequirePackage[quiet]{fontspec}
\RequirePackage[sfdefault]{ClearSans}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage[absolute,overlay]{textpos}
\RequirePackage{ragged2e}
\RequirePackage{etoolbox}
\RequirePackage{ifmtarg}
\RequirePackage{ifthen}
\RequirePackage{pgffor}
\RequirePackage{marvosym}
\RequirePackage{parskip}
\usetikzlibrary{arrows}

\usepackage{enumitem}
\setlist[itemize]{leftmargin=*}

\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    pdftitle={},
    pdfauthor={},
    pdfsubject={},
    pdfkeywords={},
    colorlinks=false,           % no lik border color
    allbordercolors=white       % white border color for all
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\ifxetex
  \usepackage{letltxmacro}
  \setlength{\XeTeXLinkMargin}{1pt}
  \LetLtxMacro\SavedIncludeGraphics\includegraphics
  \def\includegraphics#1#{% #1 catches optional stuff (star/opt. arg.)
    \IncludeGraphicsAux{#1}%
  }%
  \newcommand*{\IncludeGraphicsAux}[2]{%
    \XeTeXLinkBox{%
      \SavedIncludeGraphics#1{#2}%
    }%
  }%
\fi

%----------------------------------------------------------------------------------------
%	 COLOURS
%----------------------------------------------------------------------------------------
%TD Colours

%pale
\definecolor{tdorange}{HTML}{e8b400}
\definecolor{tdgreen}{HTML}{8CC63F}
\definecolor{tdblue}{HTML}{619abc}
\definecolor{tdgray}{HTML}{808083}
%bold
\definecolor{tddarkgreen}{HTML}{163d22}
\definecolor{tdboldgreen}{HTML}{00b624}

% template colours
\definecolor{white}{RGB}{255,255,255}
\definecolor{gray}{HTML}{4D4D4D}
%\definecolor{sidecolor}{HTML}{E7E7E7}
\definecolor{sidecolor}{HTML}{FFFFFF}

\definecolor{mainblue}{HTML}{0E5484}
\definecolor{maingray}{HTML}{B9B9B9}

%\definecolor{pblue}{HTML}{0395DE}

%use grayscale colouring
\definecolor{pblue}{HTML}{808083}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{nugreen}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{nured}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{nublue}{HTML}{6CE0F1}
%\definecolor{pblue}{HTML}{0395DE}
\definecolor{materialpurple}{HTML}{9C27B0}
\definecolor{materialindigo}{HTML}{3F51B5}
\definecolor{materialblue}{HTML}{2196F3}
\definecolor{materialcyan}{HTML}{00BCD4}
\definecolor{materialteal}{HTML}{009688}
\definecolor{materialgreen}{HTML}{4CAF50}
\definecolor{materiallime}{HTML}{CDDC39}
\definecolor{materialamber}{HTML}{FFC107}
\definecolor{materialbrown}{HTML}{795548}
\definecolor{materialred}{HTML}{FF4436}
\definecolor{materialorange}{HTML}{FF5722}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{lightgray}

%----------------------------------------------------------------------------------------
%	 MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------

% \renewcommand{\bfseries}{\color{black}} % Make \textbf produce coloured text instead

\pagestyle{empty} % Disable headers and footers

\setlength{\parindent}{0pt} % Disable paragraph indentation

% --------------------------------------------------------------------------------------
% 	FONTS
%-------------------------------------------------------------------------------------
\newfontfamily\headingfont[Path = fonts/]{segoeuib.ttf}

%----------------------------------------------------------------------------------------
%	 SIDEBAR DEFINITIONS
%----------------------------------------------------------------------------------------

\setlength{\TPHorizModule}{1cm} % Left margin
\setlength{\TPVertModule}{1cm} % Top margin

\newlength\imagewidth
\newlength\imagescale
\pgfmathsetlength{\imagewidth}{5cm}
\pgfmathsetlength{\imagescale}{\imagewidth/600}

\newcommand{\profilesection}[2]{\vspace{8pt}{\color{black!80} \huge #1 \rule[0.15\baselineskip]{#2}{1pt}}}

% Define custom commands for CV info
\newcommand{\cvdate}[1]{\renewcommand{\cvdate}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvmail}[1]{\renewcommand{\cvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\cvnumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvsite}[1]{\renewcommand{\cvsite}{#1}}
\newcommand{\aboutme}[1]{\renewcommand{\aboutme}{#1}}
\newcommand{\profilepic}[1]{\renewcommand{\profilepic}{#1}}
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% Command for printing the contact information icons
\newcommand*\icon[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt, fill=mainblue,mainblue,text=white] (char) {#1};}}

% Command for printing skill progress bars
\newcommand\interests[1]{ 
	\renewcommand{\interests}{
		\begin{tikzpicture}
			\foreach [count=\j] \x/\y in {#1}{
				\def\i{0.8*\j}
				\def\width{0.5}
				\fill[fill = sidecolor, opacity= 0.4 ] (0,\i) rectangle (6,\i+\width);
				%\draw[fill=maingray,maingray] (0,\i) rectangle (6,\i+\width);
				%\draw[fill=white,mainblue](0,\i) rectangle (\y,\i+0.4);
				\fill[fill=lightgray](0,\i) rectangle (\y,\i+\width);
				\node [below right] at (0,\i+\width) {\color{white}\x};
			}
		\end{tikzpicture}
	}
}

%Stuff for Languages Pie/Donut chart
% Adjusts the size of the wheel:
\def\innerradius{1.0cm}
\def\outerradius{2.2cm}


% The main macro
\newcommand{\wheelchart}[1]{
	\renewcommand{\wheelchart}{
    % Calculate total
    \pgfmathsetmacro{\totalnum}{0}
    \foreach \value/\colour/\name in {#1} {
        \pgfmathparse{\value+\totalnum}
        \global\let\totalnum=\pgfmathresult
    }
    \begin{tikzpicture}

      % Calculate the thickness and the middle line of the wheel
      \pgfmathsetmacro{\wheelwidth}{\outerradius-\innerradius}
      \pgfmathsetmacro{\midradius}{(\outerradius+\innerradius)/2}

      % Rotate so we start from the top
      \begin{scope}[rotate=120]

      % Loop through each value set. \cumnum keeps track of where we are in the wheel
      \pgfmathsetmacro{\cumnum}{0}
      \pgfmathsetmacro{\indx}{0}
      \foreach \value/\colour/\name in {#1} {
            \pgfmathsetmacro{\newcumnum}{\cumnum + \value/\totalnum*360}

            % Calculate the percent value
            \pgfmathsetmacro{\percentage}{\value/\totalnum*100}
            % Calculate the mid angle of the colour segments to place the labels
            \pgfmathsetmacro{\midangle}{-(\cumnum+\newcumnum)/2}

            % This is necessary for the labels to align nicely
            \pgfmathparse{
               (-\midangle<180?"west":"east")
            } \edef\textanchor{\pgfmathresult}
            \pgfmathsetmacro\labelshiftdir{1-2*(-\midangle>180)}

            % Draw the color segments. Somehow, the \midrow units got lost, so we add 'pt' at the end. Not nice...
            %\fill[\colour] (-\cumnum:\outerradius) arc (-\cumnum:-(\newcumnum):\outerradius) --
            \fill[\colour] (-\cumnum:\outerradius) arc (-\cumnum:-(\newcumnum):\outerradius) --
            (-\newcumnum:\innerradius) arc (-\newcumnum:-(\cumnum):\innerradius) -- cycle;

            % Draw the data labels
            \draw  [*-,thin] node [append after command={(\midangle:\midradius pt) -- (\midangle:\outerradius + 1ex) -- (\tikzlastnode)}] at (\midangle:\outerradius + 1ex) [xshift=\labelshiftdir*0.2cm,inner sep=0pt, outer sep=0pt, ,anchor=\textanchor]{\name};


            % Set the old cumulated angle to the new value
            \global\let\cumnum=\newcumnum
        }

      \end{scope}
%      \draw[gray] (0,0) circle (\outerradius) circle (\innerradius);
    \end{tikzpicture}
}
}
%----------------------------------------------------------------------------------------
%  SIDEBAR LAYOUT
%----------------------------------------------------------------------------------------

\newcommand{\makeprofile}{
  \begin{tikzpicture}[remember picture,overlay]
      \node [rectangle, fill=sidecolor!50, anchor=north, minimum width=9cm, minimum height=\paperheight+1cm] (box) at (-5cm,0.5cm){};
  \end{tikzpicture}

  %------------------------------------------------

  \begin{textblock}{6}(0.5, 0.2)

    %------------------------------------------------
    
        \vspace{4mm}
    {\Huge\color{black}\cvname}

    %------------------------------------------------
    
    {\Large\color{black!80}\cvjobtitle}

    %------------------------------------------------
    
        \vspace{3.5mm}
    \renewcommand{\arraystretch}{1.6}
    \begin{tabular}{p{1cm} @{\hskip 0.5cm}p{5cm}}
        
          \ifthenelse{\equal{\cvlinkedin}{}}{}{
            {$
              \begin{array}{l}
              {\href{\cvlinkedin}{\includegraphics[scale=0.04]{img/LinkedIn_Logo.png}}}
              \end{array}
              $} & \href{\cvlinkedin}{\hspace{16mm}/in/lucasdurand} \\
            }
      \ifthenelse{\equal{\cvnumberphone}{}}{}{
            {$
              \begin{array}{l}
              \includegraphics[scale=0.1]{img/tel.png}
              \end{array}
              $} 
            & \cvnumberphone\\}
      \ifthenelse{\equal{\href{\cvsite}{\cvsite}}{}}{}{
            {$
              \begin{array}{l}
              {\href{\cvsite}{\includegraphics[scale=0.05]{img/globe-512.png}}}
              \end{array}
              $} 
            & \cvsite\\}
 %     \ifthenelse{\equal{\href{\cvsite}{\cvsite}}{}}{}{
  %          {$
   %           \begin{array}{l}
    %          {\href{\cvsite}{\includegraphics[scale=0.05]{img/globe-512.png}}}
     %         \end{array}
      %        $} 
       %     & \cvsite\\}
      \ifthenelse{\equal{\cvmail}{}}{}{
            {$
              \begin{array}{l}
              {\href{mailto:\cvmail}{\includegraphics[scale=0.05]{img/email.png}}}
              \end{array}
              $} 
            & \href{mailto:\cvmail}{\cvmail}}
    \end{tabular}

    %------------------------------------------------
%        \vspace{1.5mm}
        \profilesection{Roles}{4.5cm}

		\venn

		\profilesection{Skills}{4.5cm}

        \wordcloud

        \profilesection{Interests}{3.2cm} 

        \interests

        \profilesection{Languages}{2.7cm} 

	\wheelchart

  \end{textblock}
}


%----------------------------------------------------------------------------------------
%	 COLOURED SECTION TITLE BOX
%----------------------------------------------------------------------------------------

% Command to create the rounded boxes around the first three letters of section titles
\newcommand*\round[2]{%
	\tikz[baseline=(char.base)]\node[anchor=north west, draw,rectangle, rounded corners, inner sep=1.6pt, minimum size=5.5mm, text height=3.6mm, fill=#2,#2,text=white](char){#1};%
}

\def\@sectioncolor#1#2#3{%
	{%
		\color{headercolor} #1#2#3%
	}%
}


\renewcommand{\section}[1]{
  \par\vspace{\parskip}
	{%
		\LARGE\headingfont\color{headercolor}%
		\@sectioncolor #1%
	}
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
	\par\vspace{.5\parskip}{%
		\Large\headingfont\color{headercolor} #1%
	}
	\par\vspace{.25\parskip}%
}

\pagestyle{empty}

%----------------------------------------------------------------------------------------
%	 LONG LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the long list
\newenvironment{twenty}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitem}[6]{%
	\parbox[t]{0.17\textwidth}{#1}
  \parbox[t]{0.83\textwidth}{%
		\textbf{#2}% 
		\hfill%
		{\footnotesize#3}\\%
        \ifblank{#4}{}{#4 \\}}\\

  \parbox[t]{0.17\textwidth}{
  \renewcommand{\labelitemi}{}
  \ifblank{#5}{\hfill}{
  \vspace{-4mm}
  \begin{itemize}\setlength{\itemindent}{-2mm}#5\end{itemize}
  \vspace{\parsep}}}

  \parbox[t]{0.83\textwidth}{
            \vspace{-4mm}
		#6\vspace{\parsep}%
	}\\
}

%----------------------------------------------------------------------------------------
%	 SMALL LIST ENVIRONMENT
%----------------------------------------------------------------------------------------

\setlength{\tabcolsep}{0pt}

% New environment for the small list
\newenvironment{twentyshort}{%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
	\end{tabular*}
}

\newcommand{\twentyitemshort}[2]{%
	#1&\parbox[t]{0.83\textwidth}{%
		#2%
	}\\
}

%----------------------------------------------------------------------------------------
%	 MARGINS AND LINKS
%----------------------------------------------------------------------------------------

\RequirePackage[left=7.6cm,top=0.1cm,right=1cm,bottom=0.2cm,nohead,nofoot]{geometry}


\usepackage{smartdiagram}
\smartdiagramset{
    bubble center node font = \footnotesize,
    bubble node font = \footnotesize,
    % specifies the minimum size of the bubble center node
    bubble center node size = 0.5cm,
    %  specifies the minimum size of the bubbles
    bubble node size = 0.5cm,
    % specifies which is the distance among the bubble center node and the other bubbles
    distance center/other bubbles = 0.3cm,
    % sets the distance from the text to the border of the bubble center node
    distance text center bubble = 0.5cm,
    % set center bubble color
%    bubble center node color = pblue,
bubble center node color = tdgray,
    % define the list of colors usable in the diagram
    %set color list = {lightgray, materialcyan, orange, materialgreen, materialorange, materialteal, materialamber, materialindigo, materiallime, blue},
    set color list = {tdorange, tdgreen, tdblue,  tddarkgreen, materialamber, tdboldgreen, materialcyan, materialgreen, materialorange},
    % sets the opacity at which the bubbles are shown
    bubble fill opacity = 0.6,
    % sets the opacity at which the bubble text is shown
    bubble text opacity = 1,
}

