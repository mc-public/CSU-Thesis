% csuthesis.cls
% 2026/04/09 v2.0 CSU Thesis Template
% Require: texlive 2020+
% Author: Chao Meng 

%%%% Engine Check
\RequirePackage{iftex}
\ifxetex
\else
    \ClassError{csuthesis}{
        \MessageBreak
        ********************************************************\MessageBreak
        **                                                      \MessageBreak
        **   Error: USE 'xelatex' to compile!       \MessageBreak
        **   Error: Please use it to compile this thesis!         \MessageBreak
        **                                                      \MessageBreak
        ********************************************************
    }{Please use xelatex to compile this thesis.}
    \stop
\fi

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csuthesis}[2026/03/07 v1.1 CSU Thesis Template]
%%%% Options

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=csu,
    prefix=csu@,
    setkeys=\kvsetkeys
}
\DeclareStringOption[biber]{bibbackend}
\DeclareBoolOption[true]{notexpresso}
\ProcessKeyvalOptions*
\ifcsu@notexpresso
\LoadClass[a4paper, openany, fontset=none, UTF8]{ctexbook}
\else
\LoadClass[a4paper, openany, UTF8]{ctexbook}
\fi


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
\RequirePackage{caption}
\RequirePackage{subcaption} 
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{etoolbox}
\RequirePackage{enumitem}
\RequirePackage[boxed, ruled]{algorithm}
\RequirePackage{mdframed}
\RequirePackage{algpseudocode}
\usepackage[
    backend=\csu@bibbackend,
    style=gb7714-2015,      % 使用 GB/T 7714-2015 样式
    gbnamefmt=lowercase,    % 作者姓氏仅首字母大写，不全大写（符合您的图片样例）
    url=false,              % 抑制 URL 字段
    doi=false,              % 抑制 DOI 字段
    isbn=false,             % 抑制 ISBN 字段
    eprint=false,           % 抑制 arXiv 等 eprint 字段
    related=false,           % 抑制 related 字段
]{biblatex}
\renewbibmacro*{in:}{%
  \printtext{\addperiod\space}% 将 // 替换为句号和空格
}

\let\inlinecite\parencite

%%%% Config Alg
\floatname{algorithm}{算法}
\renewcommand{\algorithmicrequire}{\textbf{输入：}}
\renewcommand{\algorithmicensure}{\textbf{输出：}}
\renewcommand{\algorithmicend}{\textbf{结束}}
\renewcommand{\algorithmicif}{\textbf{如果}}
\renewcommand{\algorithmicthen}{\textbf{则}}
\renewcommand{\algorithmicelse}{\textbf{否则}}
\renewcommand{\algorithmicfor}{\textbf{对于}}
\renewcommand{\algorithmicforall}{\textbf{对于所有}}
\renewcommand{\algorithmicdo}{\textbf{执行}}
\renewcommand{\algorithmicwhile}{\textbf{当}}
\renewcommand{\algorithmicloop}{\textbf{循环}}
\renewcommand{\algorithmicrepeat}{\textbf{重复}}
\renewcommand{\algorithmicuntil}{\textbf{直到}}


%%%% Config Font
\xeCJKsetup{CheckSingle,CJKmath=true}
\ifcsu@notexpresso
    \setmainfont{TimesNewRoman-Regular.ttf}[
        ExternalLocation=config/font/,
        BoldFont = TimesNewRoman-Bold.ttf,
        ItalicFont = TimesNewRoman-Italic.ttf,
        BoldItalicFont = TimesNewRoman-Bold-Italic.ttf
    ]
    \RequirePackage{unicode-math}
    \setmathfont{XITSMath-Regular.otf}[
        ExternalLocation=config/font/
    ]
    % \setmathfont[range={"002C}]{Latin Modern Math}

\else
    \RequirePackage{unicode-math}
\fi

\AtBeginDocument{
\newcommand{\bm}[1]{\symbfit{#1}}
\renewcommand{\mathbf}[1]{\symbf{#1}}
\renewcommand{\boldsymbol}[1]{\symbf{#1}}
}

\ifcsu@notexpresso
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
\newcommand{\heiti}{\CJKfamily{heiti}}

%% Set kaishu
\setCJKfamilyfont{kaishu}{SimKai.ttf}[
    ExternalLocation=config/font/,
    AutoFakeBold=true,
    ItalicFont=SimKai.ttf
]
\newcommand{\kaishu}{\CJKfamily{kaishu}}
\else
\renewcommand{\kaishu}{}
\fi

%%%% Setup page geometry

%% 根据 Word 模版计算出来的 Magic Number
\geometry{left=3.18cm, right=3.18cm, top=3.94cm, bottom=3.94cm, headheight=12.7pt, footskip=1.5cm}


%%%% Set Content Format
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

%%%% Load auto-generated pdf
\ifcsu@notexpresso
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
\fi

%%%% Add entry counters
\newtotcounter{csu@totalfigure}
\newtotcounter{csu@totaltable}
\AtBeginEnvironment{figure}{\stepcounter{csu@totalfigure}}
\AtBeginEnvironment{figure*}{\stepcounter{csu@totalfigure}}
\AtBeginEnvironment{table}{\stepcounter{csu@totaltable}}
\AtBeginEnvironment{table*}{\stepcounter{csu@totaltable}}


%%%% Add user defines
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


%%%% Chinese Abstract Page
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
    {\fontsize{14bp}{15bp}\selectfont \songti \csu@cnclc \par}
    
    \clearpage
}

%%%% English Abstract Page
\newenvironment{enabstract}{
    \clearpage
    \pagestyle{plain}
    
    % Big Title
    \vspace*{12bp}
    {\noindent\centering \zihao{3} \heiti \bfseries \csu@entitle \par}
    \vspace{12bp}
    
    % Abstract Word
    \vspace{10bp}
    \noindent {\fontsize{14bp}{15bp} \heiti \bfseries Abstract:}
    \fontsize{14bp}{15bp}\selectfont \songti
}{
    \par \mbox{} \par
    
    % Keywords
    \vspace{23bp}
    \noindent {\fontsize{14bp}{15bp}\selectfont \heiti \bfseries Keywords:}
    {\fontsize{14bp}{15bp}\selectfont \songti \csu@enkeywords \par}
    
    % Classification
    \noindent {\fontsize{14bp}{15bp}\selectfont \heiti \bfseries Classification:}
    {\fontsize{14bp}{15bp}\selectfont \songti \csu@cnclc \par}
    
    \clearpage
}


%%%% Make Table
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
%%%% Symbols
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

%%%% Mark content start
\newif\ifcsu@content@started
\csu@content@startedfalse
\newcommand{\csucontentstart}{
    \ifcsu@content@started%
        \ClassWarning{csuthesis}{
            Duplicate \string\csucontentstart\space command! \MessageBreak
            It must be called only once before the first \string\chapter.
            Remove the extra \string\csucontentstart\space commands
        }
        \clearpage
        \vspace*{5cm}
        \begin{center}
            \zihao{3}\heiti\ifdefined\color\color{red}\fi
            你竟然真的不小心\textbf{重复添加}了\texttt{\textbackslash csucontentstart}。\\
            
            可是这会导致\textbf{后续格式错乱}。\\
        \end{center}
        \vspace{1cm}
        \noindent\zihao{4}\songti
        你必须在正文开始之前的第一个 \texttt{\textbackslash chapter} 之前紧接着的地方添加命令 \texttt{\textbackslash csucontentstart}，并且只能添加一次。
        
        \vspace{1cm}
        \noindent{\heiti 编译已经终止}，解决此错误后即可继续编译。
        \clearpage
        \stop\end{document}
    \fi%
    \csu@content@startedtrue
    \clearpage
    \pagenumbering{arabic}
    \pagestyle{csumain} 
    \makeatletter
    \g@addto@macro\normalsize{%
        \@setfontsize\normalsize{13bp}{20bp}%
        \baselineskip=20bp
        \renewcommand{\baselinestretch}{1.0}
        \abovedisplayskip=8bp 
        \abovedisplayshortskip=8bp
        \belowdisplayskip=8bp
        \belowdisplayshortskip=8bp
        \setlength{\parskip}{0pt}
        \linespread{1.0}
    }
    \newcommand{\forcenormalsize}{%
        \@setfontsize\normalsize{13bp}{20bp}%
        \baselineskip=20bp
        \renewcommand{\baselinestretch}{1.0}
        \abovedisplayskip=8bp 
        \abovedisplayshortskip=8bp
        \belowdisplayskip=8bp
        \belowdisplayshortskip=8bp
        \setlength{\parskip}{0pt}
        \linespread{1.0}
    }
    \makeatother
    \normalsize
}


\newenvironment{csuconfig}{}{}
\AddToHook{cmd/chapter/before}{%
    \ifcsu@content@started\else
        \ClassWarning{csuthesis}{
            Command \string\csucontentstart\space is missing! \MessageBreak
            You MUST call \string\csucontentstart\space \MessageBreak
            before the first \string\chapter
        }%
        \clearpage
        \vspace*{5cm}
        \begin{center}
            \zihao{3}\heiti\ifdefined\color\color{red}\fi
            你竟然真的不小心\textbf{漏掉}了\texttt{\textbackslash csucontentstart}。
            
            可是这会导致\textbf{后续格式错乱}。\\
        \end{center}
        \vspace{1cm}
        \noindent\zihao{4}\songti
        你必须在正文开始之前的第一个 \texttt{\textbackslash chapter} 之前紧接着的地方添加命令 \texttt{\textbackslash csucontentstart}。
        
        \vspace{1cm}
        \noindent{\heiti 编译已经终止}，解决此错误后即可继续编译。
        \clearpage
        \stop\end{document}
    \fi
}
%%%% Theorem API
\newcommand{\csu@name@definition}{定义}
\newcommand{\csu@name@theorem}{定理}
\newcommand{\csu@name@lemma}{引理}
\newcommand{\csu@name@corollary}{推论}
\newcommand{\csu@name@remark}{注}
\newcommand{\csu@name@assume}{假设}
\newcommand{\csu@name@proposition}{命题}
\newcommand{\csu@name@claim}{论断}
\newcommand{\csu@name@conjecture}{猜想}

\newcommand{\setproofname}[1]{\renewcommand{\proofname}{#1}}
\setproofname{证明}
\newtheoremstyle{csutheorem}%%%% By Gemini
  {16bp} % 段前额外间距
  {16bp} % 段后额外间距
  {\kaishu\forcenormalsize}            % 正文字体：中文楷体，英文/数学意大利斜体
  {0em}                           % 整体缩进量 (顶格)
  {\heiti}
  {}                           % 标题后的标点符号 (留空)
  {0.6em}                        % 标题与正文之间的水平间距
  {\thmname{#1}\textbf{\thmnumber{#2}}\thmnote{ (\songti #3)}} % 格式：名称+编号+全角括号附加说明

\theoremstyle{csutheorem}

\newcommand{\setdefinitionname}[1]{\newtheorem{#1}{\csu@name@definition}[chapter]}
\newcommand{\settheoremname}[1]{\newtheorem{#1}{\csu@name@theorem}[chapter]}
\newcommand{\setpropositionname}[1]{\newtheorem{#1}{\csu@name@proposition}[chapter]}
\newcommand{\setclaimname}[1]{\newtheorem{#1}{\csu@name@claim}[chapter]}
\newcommand{\setlemmaname}[1]{\newtheorem{#1}{\csu@name@lemma}[chapter]}
\newcommand{\setcorollaryname}[1]{\newtheorem{#1}{\csu@name@corollary}[chapter]}
\newcommand{\setremarkname}[1]{\newtheorem{#1}{\csu@name@remark}[chapter]}
\newcommand{\setassumename}[1]{\newtheorem{#1}{\csu@name@assume}[chapter]}
\newcommand{\setconjecturename}[1]{\newtheorem{#1}{\csu@name@conjecture}[chapter]}


%%%% Proof Environment
\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont 
  \topsep=10pt\relax
  \partopsep=0pt\relax
  \trivlist
  \item[\hskip\labelsep\zihao{-4}\heiti #1]\ignorespaces
}{%
  \popQED\endtrivlist\@endpefalse
}
\makeatother
\allowdisplaybreaks[4]


%%%% Number Within
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


%%%% Table Control
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

%%%% Figure Control
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
    % nosep,
    noitemsep,       
    nosep,
    % topsep=8bp,
    parsep=4bp,       
    partopsep=0bp,    
    after=\vspace{2bp},
    % before=\vspace{0bp},
    % leftmargin=1.5em     
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
\makeatletter
\newcounter{csu@appendix}
\setcounter{csu@appendix}{0}

\providecommand{\csu@totapp@count}{0}

\AtEndDocument{%
  \if@filesw
    \immediate\write\@mainaux{%
      \string\gdef\string\csu@totapp@count{\number\value{csu@appendix}}%
    }%
  \fi
}

\newenvironment{csuappendix}[1][]{
    \clearpage
    \stepcounter{csu@appendix}
    \ifnum\csu@totapp@count<2
        \ifstrempty{#1}{
            \def\csu@app@title{附录}
        }{
            \def\csu@app@title{附录\quad #1}
        }
        \def\@currentlabel{附录}
    \else
        \ifstrempty{#1}{
            \def\csu@app@title{附录 \Alph{csu@appendix}}
        }{
            \def\csu@app@title{附录 \Alph{csu@appendix}\quad #1}
        }
        \def\@currentlabel{附录 \Alph{csu@appendix}}
    \fi
    
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
\makeatother


%%%% Package safe check and remove
\makeatletter
\@namedef{ver@bm.sty}{2026/03/04 Fake bm package for csuthesis compatibility}

\AtBeginDocument{
  \@ifpackageloaded{newtxmath}{
    \ClassError{csuthesis}{
      \MessageBreak
      The 'newtxmath' package conflicts with modern math fonts (unicode-math).\MessageBreak
      Please remove \string\usepackage{newtxmath} from your preamble.%
    }{%
      Package 'newtxmath' is strictly forbidden!%
    }
  }{}
  \@ifpackageloaded{newtxtext}{
    \ClassError{csuthesis}{
      \MessageBreak
      The 'newtxtext' package conflicts with modern text fonts (fontspec).\MessageBreak
      Please remove \string\usepackage{newtxtext} from your preamble.%
    }{Package 'newtxtext' is strictly forbidden!}
  }{}
}
\makeatother



\endinput