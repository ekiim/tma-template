\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TMA}[2024/05/08 TMA Template]
\LoadClass[letter,11pt,oneside]{article}

%
% If you need to work with a particular extra package
% I would recomend for the user to add it here.
% That way we reduce the noise in the main.tex file.
%
\RequirePackage[english]{babel}
\RequirePackage{courier}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{booktabs}
\RequirePackage{siunitx}
\RequirePackage{blindtext}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{pageslts}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage[perpage]{footmisc}

%
% With this we configure the bibliography
% to work nicely with the foot notes.
%
\RequirePackage[
    bibencoding=utf8,
    maxcitenames=1,
    backend=biber,
    bibstyle=authoryear,
    style=footnote-dw,
    autocite=plain
]{biblatex}

%
% This is to remove the indent on the begining of paragraphs
% because usually when you write an equation, and then a 
% sentence, it will put the indent even when it's a single line
% and this scenario is common when dealing with equation
% manipulation.
%
\setlength{\parindent}{0pt}

%
% This is to configure the page margins
%
\geometry{
 left=1.5cm,
 right=1.5cm,
 top=1.5cm,
 bottom=1.5cm,
 headheight=20mm,
 footskip=20mm,
 includehead,
 includefoot
}


%
% This is to configure footer and header for the document.
%
\pagestyle{fancy}

\lhead{
    \myName \\
    Student ID: \myStudentID \\
    \texttt{\myEmail}
}
\rhead{
    \myCourse\\
    TMA-\myTMANumber\ Submission \\
    Page\ \thepage\ of \lastpageref{LastPages}
}

\lfoot{\nouppercase{\leftmark}}
\cfoot{}
\rfoot{\mySchool}

\pagenumbering{arabic}
\everymath{\displaystyle}

\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{1pt}
\renewcommand{\headruleskip}{0cm}



%
% Footnote configuration
%

\renewcommand{\cite}{\footcite}
\renewcommand{\thefootnote}{\arabic{footnote}}
\renewcommand{\footnoterule}{}
\renewcommand{\footnotelayout}{\tiny}
\renewcommand{\footnoterule}{\vfill\kern -3pt \hrule width 0.4\columnwidth \kern 2.6pt}


%
% Custom command to create question sections
% 
% This command will help you create a question header that looks
% like a "section" and it will put it in the index.
%

\newcommand{\question}[1]{
    \def \QuestionName {#1}
    \addcontentsline{toc}{section}{\QuestionName}
    \section*{\QuestionName}
    \markboth{\QuestionName}{}
}

%
% These are custom command to write derivatives more confortably
%
% \Dd{f}{t} will be total derivative of f with respect to t.
% \Dp{f}{t} will be partial derivative of f with respect to t.
%

\newcommand{\DEL}[3]{ \frac{d}{d #1} \frac{\partial #3}{\partial \dot{#2}} - \frac{\partial #3}{\partial {#2}} = 0 }
\newcommand{\Dd}[2]{\frac{d #1}{d #2}}
\newcommand{\Ddd}[2]{\frac{d^2 #1}{d {#2}^2}}
\newcommand{\Dp}[2]{\frac{\partial #1}{\partial #2}}
\newcommand{\Dpd}[2]{\frac{\partial^2 #1}{\partial {#2}^2}}
\newcommand{\Dpp}[3]{\frac{\partial^2 #1}{\partial #2 \partial #3}}

%
% These are some missing trigonometric functions
%
\newcommand{\sech}[0]{\operatorname{sech}}
\newcommand{\csch}[0]{\operatorname{csch}}
\newcommand{\acosh}[0]{\operatorname{arccosh}}
\newcommand{\asinh}[0]{\operatorname{arcsinh}}
\newcommand{\atanh}[0]{\operatorname{arctanh}}

%
% These is to create the "solution" environment
% to delimit a solution, and to put a black square at the end
% as QED.
% You can write \begin{solution}[(a)] to specify that it's
% the solution to a given problem.
%
\renewcommand{\qedsymbol}{$\blacksquare$}
\newenvironment{solution}[1][\proofname]{
    \proof[\bfseries Solution] {#1} \\
}{
  \endproof
  \newpage
}
