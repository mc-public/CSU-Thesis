# CSU-Thesis LaTeX Template

This is a LaTeX template for Master's Degree Theses, based on the official Word template provided by the [School of Mathematics and Statistics, Central South University (CSU)](https://math.csu.edu.cn/info/1730/11893.htm). 

This template fully implements **all** the formatting requirements and features specified in the original official Word document.

## Toolchain Requirements

To successfully compile this template, you must use the `xelatex` and `biber` toolchain.

## System Requirements

| OS | TeX Distribution |
| :--- | :--- |
| **Windows** | TeX Live 2020 or later |
| **macOS** | MacTeX 2020 or later (based on TeX Live) |
| **Linux** | TeX Live 2020 or later |

## Getting Started

### 1. Install TeX Distribution
Ensure that you have a working installation of TeX Live (or MacTeX for macOS) on your system.

### 2. Download the Source Code
Open your terminal and run the following command to clone the repository:

```bash
git clone https://github.com/mc-public/CSU-Thesis.git csu-thesis
cd csu-thesis
```
*Alternatively, you can directly download the ZIP file from the GitHub repository and extract it.*

### 3. Open and Compile
Open the `example.tex` file using your preferred LaTeX editor. Recommended editors include:
- **TeXstudio** (Windows / macOS / Linux)
- **TeXmaker** (Windows / macOS / Linux)
- **TeXifier** (macOS only)
- **VS Code** (with the *LaTeX Workshop* extension)

### 4. Compilation Sequence
Make sure to configure your editor to use **XeLaTeX** as the default compiler and **Biber** as the bibliography tool. To correctly generate the table of contents, cross-references, and bibliography, please compile using the following sequence:

1. `XeLaTeX`
2. `Biber`
3. `XeLaTeX`
4. `XeLaTeX`

> Note: Most modern LaTeX editors or build tools like `latexmk` will automate this sequence for you.