\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2015/02/08 Class for scientist's resumes in indisty]
\LoadClass{article}

%-------------------------------------------------------------------------------
%                Packages
%-------------------------------------------------------------------------------
\RequirePackage[left=1.00 in, right=1.50 in,top=0.70 in,bottom=1.00in]{geometry}
\RequirePackage{fontspec}
\RequirePackage{titlesec}
\RequirePackage{url}
\RequirePackage{etoolbox}

%\RequirePackage{fancyhdr}
%\pagestyle{fancy}
%\RequirePackage[kerning=true]{microtype}



\AtEndPreamble{
  \pagenumbering{arabic}% has to be issued before loading hyperref, as to set \thepage and hence to avoid hyperref issuing a warning and setting pdfpagelabels=false
  \RequirePackage[unicode]{hyperref}% unicode is required for unicode pdf metadata
  \hypersetup{
    breaklinks,
    %baseurl       = http://,
    %pdfborder     = 0 0 0,
    %pdfpagemode   = \pdfpagemode,
    pdfstartpage  = 1,
    pdfcreator    = {Howard Kim},
    pdfproducer   = {\LaTeX{}},% will/should be set automatically to the correct TeX engine used
    pdfauthor     = {\@firstname{}~\@lastname{}},
    pdftitle      = {\@firstname{}~\@lastname{} -- \@title{}},
    pdfsubject    = {R\'{e}sum\'{e} of \@firstname{}~\@lastname{}},
    pdfkeywords   = {\@firstname{}~\@lastname{}, curriculum vit\ae{}, r\'{e}sum\'{e}}}
    }

%-------------------------------------------------------------------------------
%                Define values of text
%-------------------------------------------------------------------------------
% elements
%---------
% defines one's name


\newcommand{\setname}[2]{%
  \gdef\@firstname{#1}% First name
  \gdef\@lastname{#2}% Last name
}

\newcommand{\pname}{%
  \ifdef{\@firstname}{\ifdefempty{\@firstname}{}{\@firstname\ }}{}%
  \ifdef{\@lastname}{\ifdefempty{\@lastname}{\unskip}{\@lastname}{}}{}}

\renewcommand{\Huge}{\@setfontsize\Huge{36}{40}}
\renewcommand{\huge}{\@setfontsize\huge{30}{42}}
\renewcommand{\Large}{\@setfontsize\Large{16}{18}}
\renewcommand{\large}{\@setfontsize\large{14}{18}}
\renewcommand{\normalsize}{\@setfontsize\normalsize{12}{12}}
\renewcommand{\small}{\@setfontsize\small{13}{18}}
\renewcommand{\footnotesize}{\@setfontsize\footnotesize{8}{10}}
\renewcommand{\scriptsize}{\@setfontsize\scriptsize{12}{14}}
\renewcommand{\tiny}{\@setfontsize\tiny{8}{10}}

\newcommand{\titlenamecolor}{}
\newcommand{\titlecolor}{}

\newfontfamily{\namefont}{Big Caslon}%Next Ultra Light}%IM FELL English SC}
\newfontfamily{\titlefont}{Gill Sans Light}
\newfontfamily{\SectionFont}{Gill Sans Light}%Helvetica Neue ULTRALIGHT}
\newfontfamily{\numberstyle}{Georgia}
\newfontfamily{\worklistfont}{Big Caslon}
\newfontfamily{\SchoolFont}{Big Caslon}
\newfontfamily{\WorkFont}{Big Caslon}
\newfontfamily{\MainFont}{Big Caslon}

\newcommand{\SectionStyle}{\small\addfontfeature{LetterSpace=10.0}}
\newcommand{\TitlenameStyle}{\Huge}
\newcommand{\TitleStyle}{\normalsize}

\newcommand{\SchoolNameStyle}{\large}
\newcommand{\SchoolDeatleStyle}{\normalsize}

\newcommand{\WorkNameStyle}{\large}
\newcommand{\WorkDeatleStyle}{\normalsize}



\newcommand{\address}[3]{\def\@addressstreet{#1} \def\@addresscity{#2} \def\@addresscountry{#3}}
\newcommand{\paddress}{\@addressstreet, \@addresscity, \@addresscountry}


\newcommand*{\email}[1]{\def\@email{#1}}
\NewDocumentCommand{\pemail}{}{\href{mailto:howardfk@gmail.com}{\@email}}


\newcommand*{\homepage}[2]{\def\@homepage{#1} \def\@homepagedis{#2}}
\NewDocumentCommand{\phomepage}{}{\href{\@homepage}{\@homepagedis}
}

\newcommand*{\mobile}[1]{\def\@mobile{#1}}
\NewDocumentCommand{\pmobile}{}{\@mobile}

%	Symbles
\newcommand*{\listitemsymbol}      {\labelitemi~}
\newcommand*{\addresssymbol}       {}
\newcommand*{\mobilephonesymbol}   {}
\newcommand*{\fixedphonesymbol}    {}
\newcommand*{\faxphonesymbol}      {}
\newcommand*{\emailsymbol}         {}
\newcommand*{\homepagesymbol}      {}
\newcommand*{\linkedinsocialsymbol}{}
\newcommand*{\twittersocialsymbol} {}
\newcommand*{\githubsocialsymbol}  {}

%-------------------------------------------------------------------------------
%                Displaying title and name
%-------------------------------------------------------------------------------

\renewcommand{\@title}{\TitleStyle \\* \paddress \\* \pmobile \hspace{1em}  \pemail  \\* \phomepage \\ }


%-------------------------------------------------------------------------------
%                overall design commands definitions
%-------------------------------------------------------------------------------
\newcommand{\makecvtitle}{
	\centering
	\TitlenameStyle
	\namefont
	\@firstname \hspace{0.2em} \@lastname
	\vspace{0.25 em}
	\titlefont	
	\@title 
\raggedright}

%\newcommand{\SectionColor{}
%\newcommand{\subSectionSize}{\large}
%\newfontfamily{\subSectionFont}{Georgia}
%\newcommand{\subSectionColor{}
%-------------------------------------------------------------------------------
%                Title Styling
%-------------------------------------------------------------------------------
\pagestyle{empty}


\titleformat{\section}{\vspace*{-0.5em}
	\SectionFont\SectionStyle\raggedright}
	{}{0em}%Prefix for section
	{\titlerule \\*} %code befor heading
	[\vspace*{-1em}] %code/text after heading
	
\titlespacing*{\section}{0pt}{0.2em}{1.5em}

\newenvironment{school}[7]{
	\SchoolFont \SchoolNameStyle #1 \hfill{} \normalsize \numberstyle #2 \\* \SchoolDeatleStyle #3 \\* #4 #5 #6 #7}{\vspace*{1.0 em}}

\newenvironment{work}[3]{
	\WorkFont \WorkNameStyle #1 \hfill{} \normalsize\numberstyle #2 \\* \worklistfont\WorkDeatleStyle 
	\begin{list}{-}{#3 \vspace*{0.40em}}%\settowidth{\rightmargin}{#2}}
	}
	{\end{list}\vspace*{1.0 em}}
