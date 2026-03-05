% csuthesis.cls
% 2026/03/05 v1.1 CSU Thesis Template
% Require: texlive 2020+
% Author: ChaoMeng 

%%%% Engine Check
\RequirePackage{iftex}
\ifxetex
\else
    \ClassError{csuthesis}{
        \MessageBreak
        ********************************************************\MessageBreak
        **                                                      \MessageBreak
        **   Error: USE 'xelatex' or 'luatex' to compile!       \MessageBreak
        **   Error: Please use  to compile this thesis!         \MessageBreak
        **                                                      \MessageBreak
        ********************************************************
    }{Please use lualatex or xelatex to compile this thesis.}
    \stop
\fi

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csuthesis}[2026/03/05 v1.1 CSU Thesis Template]
\LoadClass[a4paper, openany, fontset=none, UTF8]{ctexbook}
%%%% Options
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=csu,
    prefix=csu@,
    setkeys=\kvsetkeys
}
\DeclareStringOption[biber]{bibbackend}
\ProcessKeyvalOptions*
% 1. 关闭内容流压缩 (Text/Graphics streams)
\special{pdf: compresslevel 0}

% 2. 关闭对象流压缩 (Object streams, PDF 1.5+ 特性)
\special{pdf: objcompresslevel 0}
%%%% Requires
\RequirePackage{xeCJK}
\RequirePackage{geometry}
\RequirePackage{pdfpages}
\RequirePackage{totcount}
\RequirePackage{titletoc}
\RequirePackage{fancyhdr}
\RequirePackage{amsthm}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{newtxmath}  
\RequirePackage{caption}
\RequirePackage{subcaption} 
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{etoolbox}
\RequirePackage{enumitem}
\RequirePackage[
    backend=\csu@bibbackend,
    style=gb7714-2015,
    sorting=none,      
    maxnames=3,
    minnames=1
]{biblatex}


%%%% -- Config Font
\xeCJKsetup{CheckSingle,CJKmath=true}
\setmainfont{TimesNewRoman-Regular.ttf}[
    ExternalLocation=config/font/,
    BoldFont = TimesNewRoman-Bold.ttf,
    ItalicFont = TimesNewRoman-Italic.ttf,
    BoldItalicFont = TimesNewRoman-Bold-Italic.ttf
]
\setCJKmainfont{SimSun.ttf}[
    ExternalLocation=config/font/,
    BoldFont = SimHei.ttf,
    BoldFeatures = {AutoFakeBold=true},
    ItalicFont = SimKai.ttf,
    ItalicFeatures = {AutoFakeBold=true}
]
\setCJKmonofont{SimFang.ttf}[
    ExternalLocation=config/font/
]

%% Set songti
\setCJKfamilyfont{songti}{SimSun.ttf}[
    ExternalLocation=config/font/,
    % BoldFont = SimHei.ttf,
    AutoFakeBold=true
]
\newcommand{\songti}{\CJKfamily{songti}}
%% Set heiti
\setCJKfamilyfont{heiti}{SimHei.ttf}[
    ExternalLocation=config/font/,
    AutoFakeBold=true
]
\setCJKfamilyfont{reheiti}{SimHei.ttf}[
    ExternalLocation=config/font/,
    AutoFakeBold=false
]
\newcommand{\heiti}{\CJKfamily{heiti}}
\newcommand{\reheiti}{\CJKfamily{reheiti}}
%% Set kaishu
\setCJKfamilyfont{kaishu}{SimKai.ttf}[
    ExternalLocation=config/font/,
    AutoFakeBold=true,
    ItalicFont=SimKai.ttf
]
\newcommand{\kaishu}{\CJKfamily{kaishu}}

%%%% -- Setup page geometry

%% 根据 Word 模版计算出来的 Magic Number
\geometry{left=3.18cm, right=3.18cm, top=3.94cm, bottom=3.94cm, headheight=12.7pt, footskip=1.5cm}


%%%% -- Set Content Format
\setlength{\parindent}{2\ccwd}
\ctexset{
    chapter = {
        name = {第,章}, 
        number = \arabic{chapter},
        format = \zihao{3} \bfseries \heiti \centering,
        beforeskip = 10bp, 
        afterskip = 18bp,
        fixskip = true,
        pagestyle = csumain
    },
    section = {
        format = \zihao{4} \songti \raggedright,
        beforeskip = 15bp,  
        afterskip = 15bp, 
        fixskip = true
    },
    subsection = {
        format = \zihao{-4} \songti \raggedright,
        beforeskip = 15bp,
        afterskip = 15bp,
        fixskip = true
    }
}

\fancypagestyle{csumain}{
    \fancyhf{}
    
    \fancyhead[L]{\zihao{5} \songti 中南大学硕士学位论文}
    
    \fancyhead[R]{\zihao{5} \songti \leftmark}
    
    \fancyfoot[C]{\zihao{5} \thepage}
    
    \renewcommand{\headrulewidth}{0.5pt}
}

\renewcommand{\chaptermark}[1]{%
    \markboth{第\arabic{chapter}章\quad #1}{}%
}

%%%% -- Load auto-generated pdf
\IfFileExists{./config/pdf/cover.pdf}{
    \AtBeginDocument{
        \includepdf[pages={1, {}}, fitpaper=true]{./config/pdf/cover.pdf}
    }
}{
    \ClassError{csuthesis}{
        File 'cover.pdf' not found! \MessageBreak
        Please run 'python ./config/src/converter.py' in the terminal to generate 'cover.pdf' based on the information in 'config.json', or provide a custom cover PDF at './config/pdf/cover.pdf'.
    }{
        The document class csuthesis requires 'cover.pdf' for the cover page.
    }
}

\IfFileExists{./config/pdf/frontispiece.pdf}{
    \AtBeginDocument{
        \includepdf[pages={1, {}}, fitpaper=true]{./config/pdf/frontispiece.pdf}
    }
}{
    \ClassError{csuthesis}{
        File 'frontispiece.pdf' not found! \MessageBreak
        Please run 'python ./config/src/converter.py' in the terminal to generate 'frontispiece.pdf' based on the information in 'config.json', or provide a custom frontispiece PDF at './config/pdf/frontispiece.pdf'.
    }{
        The document class csuthesis requires 'frontispiece.pdf' for the frontispiece page.
    }
}

\IfFileExists{./config/pdf/statement.pdf}{
    \AtBeginDocument{
        \includepdf[pages={1, {}}, fitpaper=true]{./config/pdf/statement.pdf}
    }
}{
    \ClassError{csuthesis}{
        File 'statement.pdf' not found! \MessageBreak
        Please run 'python ./config/src/converter.py' in the terminal to generate 'statement.pdf' based on the information in 'config.json', or provide a custom statement PDF at './config/pdf/statement.pdf'.
    }{
        The document class csuthesis requires 'statement.pdf' for the statement page.
    }
}

%%%% - Add entry counters
\newtotcounter{csu@totalfigure}
\newtotcounter{csu@totaltable}
\AtBeginEnvironment{figure}{\stepcounter{csu@totalfigure}}
\AtBeginEnvironment{figure*}{\stepcounter{csu@totalfigure}}
\AtBeginEnvironment{table}{\stepcounter{csu@totaltable}}
\AtBeginEnvironment{table*}{\stepcounter{csu@totaltable}}


%%%% - Add user defines
\def\csu@cntitle{}
\def\csu@cnkeywords{}
\def\csu@entitle{}
\def\csu@enkeywords{}
\def\csu@cnclc{}
\newcommand{\cntitle}[1]{\def\csu@cntitle{#1}}
\newcommand{\cnkeywords}[1]{\def\csu@cnkeywords{#1}}
\newcommand{\entitle}[1]{\def\csu@entitle{#1}}
\newcommand{\enkeywords}[1]{\def\csu@enkeywords{#1}}
\newcommand{\cnclc}[1]{\def\csu@cnclc{#1}}


%%%% - Chinese Abstract Page
\newenvironment{cnabstract}{
    \clearpage
    \pagenumbering{Roman} 
    \pagestyle{plain}
    % 标题
    \vspace*{12bp}
    {\noindent\centering \zihao{3} \heiti \bfseries \csu@cntitle \par}
    \vspace{12bp}
    
    % 摘要
    \vspace{20bp}
    \noindent {\zihao{4} \heiti \bfseries 摘要：}
    \fontsize{14bp}{15bp}\selectfont \songti
}{
    \par \mbox{} \par

    % 图表汇总
    \vspace{10bp}
    \noindent
    {\fontsize{14bp}{15bp}\selectfont \songti
    图 \total{csu@totalfigure} 幅，表 \total{csu@totaltable} 个，参考文献 \total{csu@bibcount} 篇\par}

    
    % 关键词
    \vspace{30bp}
    \noindent {\fontsize{14bp}{15bp}\selectfont \heiti \bfseries 关键词：}
    {\fontsize{14bp}{15bp}\selectfont \songti \csu@cnkeywords \par}
    
    % 分类号
    \noindent {\fontsize{14bp}{15bp}\selectfont \heiti \bfseries 分类号：}
    {\fontsize{14bp}{20bp}\selectfont \songti \csu@cnclc \par}
    
    \clearpage
}

%%%% - English Abstract Page
\newenvironment{enabstract}{
    \clearpage
    \pagenumbering{Roman}
    \pagestyle{plain}
    
    % Big Title
    \vspace*{12bp}
    {\noindent\centering \zihao{3} \heiti \bfseries \csu@entitle \par}
    \vspace{12bp}
    
    % Abstract Word
    \vspace{10bp}
    \noindent {\fontsize{14bp}{15bp} \heiti \bfseries Abstract:}
    \fontsize{14bp}{20bp}\selectfont \songti
}{
    \par \mbox{} \par
    
    % Keywords
    \vspace{23bp}
    \noindent {\fontsize{14bp}{15bp}\selectfont \heiti \bfseries Keywords:}
    {\fontsize{14bp}{15bp}\selectfont \songti \csu@enkeywords \par}
    
    % Classification
    \noindent {\fontsize{14bp}{15bp}\selectfont \heiti \bfseries Classification:}
    {\fontsize{14bp}{20bp}\selectfont \songti \csu@cnclc \par}
    
    \clearpage
}


%%%% - Make Table
%% Chapter
\titlecontents{chapter}
  [0pt]
  {\zihao{-4} \heiti \fontsize{12bp}{20bp}\selectfont}
  {\thecontentslabel\quad}
  {}
  {\titlerule*[8pt]{.}\contentspage}
  [\addvspace{0bp}] % 段后间距: 6bp

%% Section
\titlecontents{section}
  [12bp] % 左侧缩进 1 个字符 (小四号字宽为12bp)
  {\zihao{-4} \songti \fontsize{12bp}{15bp}\selectfont}
  {\thecontentslabel\quad}
  {}
  {\titlerule*[8pt]{.}\contentspage}

%% Subsection
\titlecontents{subsection}
  [24bp]
  {\zihao{-4} \songti \fontsize{12bp}{15bp}\selectfont}
  {\thecontentslabel\quad}
  {}
  {\titlerule*[8pt]{.}\contentspage}

\newcommand{\makecsutoc}{
    \clearpage
    \pagestyle{plain}
    \vspace*{12bp}
    {\noindent\centering \zihao{3} \heiti \bfseries 目\quad 录 \par}
    \vspace{12bp}
    
    \@starttoc{toc}
    \clearpage
}
%%%% - Symbols
\newenvironment{csusymbols}{
    \clearpage
    \pagestyle{plain}
    \begin{center}
        \vspace*{12bp}
        \noindent\centering \zihao{3} \heiti \bfseries 符号说明
    \end{center}

    \par\fontsize{12bp}{20bp}\selectfont \songti
}{
    \clearpage
}

\newcommand{\csucontentstart}{
    \clearpage
    \pagenumbering{arabic}
    \pagestyle{csumain} 
    \makeatletter
    \renewcommand{\normalsize}{%
        \@setfontsize\normalsize{12bp}{15bp}%
        \abovedisplayskip=7.5bp \@plus 2bp \@minus 2bp
        \abovedisplayshortskip=7.5bp \@plus 2bp \@minus 2bp
        \belowdisplayskip=\abovedisplayskip
        \belowdisplayshortskip=\abovedisplayshortskip
    }
    \makeatother
    \normalsize
}
\newenvironment{csuconfig}{}{\csucontentstart}

%%%% -- Theorem API
\newcommand{\csu@name@definition}{定义}
\newcommand{\csu@name@theorem}{定理}
\newcommand{\csu@name@lemma}{引理}
\newcommand{\csu@name@corollary}{推论}
\newcommand{\csu@name@remark}{注}
\newcommand{\csu@name@assume}{假设}


\newcommand{\setproofname}[1]{\renewcommand{\proofname}{#1}}
\setproofname{证明}
\newtheoremstyle{csutheorem}%%%% By Gemini
  {0.0ex plus 0.2ex minus 0.0ex} % 段前额外间距
  {0.0ex plus 0.2ex minus 0.0ex} % 段后额外间距
  {\kaishu\itshape\normalsize}            % 正文字体：中文楷体，英文/数学意大利斜体
  {}                           % 整体缩进量 (顶格)
  {\normalsize\reheiti}
  {}                           % 标题后的标点符号 (留空)
  {1em}                        % 标题与正文之间的水平间距
  {\thmname{#1}\textbf{\thmnumber{#2}}\thmnote{ (#3)}} % 格式：名称+编号+全角括号附加说明

\theoremstyle{csutheorem}

\newcommand{\setdefinitionname}[1]{\newtheorem{#1}{\csu@name@definition}[chapter]}
\newcommand{\settheoremname}[1]{\newtheorem{#1}{\csu@name@theorem}[chapter]}
\newcommand{\setlemmaname}[1]{\newtheorem{#1}{\csu@name@lemma}[chapter]}
\newcommand{\setcorollaryname}[1]{\newtheorem{#1}{\csu@name@corollary}[chapter]}
\newcommand{\setremarkname}[1]{\newtheorem{#1}{\csu@name@remark}[chapter]}
\newcommand{\setassumename}[1]{\newtheorem{#1}{\csu@name@assume}[chapter]}


%%%% - Proof Environment
\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep\zihao{-4}\heiti #1：]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
\makeatother

%%%% - Number Within
\numberwithin{equation}{chapter}
\numberwithin{table}{chapter}
\numberwithin{figure}{chapter}
\renewcommand{\thetable}{\thechapter-\arabic{table}}
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\patchcmd{\subequations}
  {\def\theequation{\theparentequation\alph{equation}}}
  {\def\theequation{\theparentequation-\alph{equation}}}
  {}{}


%%%% - Table Control
\DeclareCaptionFont{csu@tablefont}{\zihao{5}\kaishu} 
\DeclareCaptionFont{csu@figfont}{\zihao{5}\kaishu} 
\captionsetup[table]{
    font = csu@tablefont, 
    labelfont = md,
    textfont = md,
    labelsep = space,
    justification = centering,
    position = top,      
    aboveskip = 12.5bp,   
    skip = 2pt            
}
\setlength{\heavyrulewidth}{0.75bp}
\setlength{\lightrulewidth}{0.37bp}
\AtBeginEnvironment{tabular}{
    \zihao{5}\songti
    \renewcommand{\arraystretch}{1.0}
}

%%%% - Figure Control
\captionsetup[figure]{
    font = csu@figfont,
    labelfont = md,
    textfont = md,
    labelsep = space,
    justification = centering,
    position = bottom
}


\captionsetup[subfigure]{
    labelformat = parens, % (a), (b), (c)
    labelfont = md,       
    textfont = md,
    labelsep = space,
    font = csu@figfont
}

%%%% Items
\setlist{
    nosep,
    noitemsep,       
    topsep=0pt,       
    parsep=0pt,       
    partopsep=0pt,    
    leftmargin=1.5em     
}

%%%% Reference
\renewcommand{\bibfont}{\zihao{-4}\songti}
\setlength{\biblabelsep}{1em}
\newtotcounter{csu@bibcount}
\setcounter{csu@bibcount}{0}
\AtDataInput{\stepcounter{csu@bibcount}}
\newcommand{\makecsureferencepage}{
    \clearpage
    \markboth{参考文献}{}
    \addcontentsline{toc}{chapter}{参考文献}
    \vspace*{12bp}
    {\noindent\centering \zihao{3} \heiti \bfseries 参考文献 \par}
    \vspace*{18bp}

    \printbibliography[heading=none]
    \clearpage
}
%%%% Main Research Result And Thanks
\newenvironment{cnresearchresult}{
    \clearpage
    \markboth{攻读学位期间主要的研究成果}{}
    \addcontentsline{toc}{chapter}{攻读学位期间主要的研究成果}
    \vspace*{12bp}
    {\noindent\centering \zihao{3} \heiti \bfseries 攻读学位期间主要的研究成果 \par}
    \vspace*{28bp}
}{
    \clearpage
}

\newenvironment{cnthanks}{
    \clearpage
    \markboth{致谢}{}
    \addcontentsline{toc}{chapter}{致谢}
    \vspace*{12bp}
    {\noindent\centering \zihao{3} \heiti \bfseries 致谢 \par}
    \vspace*{28bp}
}{
    \clearpage
}

%%%% Appendix
\newcounter{csu@appendix}
\setcounter{csu@appendix}{0}
\newenvironment{csuappendix}[1][]{
    \clearpage
    \stepcounter{csu@appendix}
    
    \ifstrempty{#1}{
        \def\csu@app@title{附录 \Alph{csu@appendix}}
    }{
        \def\csu@app@title{附录 \Alph{csu@appendix}\quad #1}
    }
    
    \markboth{\csu@app@title}{}
    \addcontentsline{toc}{chapter}{\csu@app@title}
    
    \vspace*{12bp}
    {\noindent\centering \zihao{3} \heiti \bfseries \csu@app@title \par}
    \vspace*{28bp}

    \setcounter{equation}{0}
    \setcounter{figure}{0}
    \setcounter{table}{0}
    \renewcommand{\theequation}{\Alph{csu@appendix}-\arabic{equation}}
    \renewcommand{\thefigure}{\Alph{csu@appendix}-\arabic{figure}}
    \renewcommand{\thetable}{\Alph{csu@appendix}-\arabic{table}}
}{
    \clearpage
}
\endinput