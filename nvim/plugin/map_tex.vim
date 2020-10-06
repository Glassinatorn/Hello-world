"	""8""
"	  8   eeee e    e
"	  8e  8    8    8
"	  88  8eee eeeeee
"	  88  88   88   8
"	  88  88ee 88   8


autocmd BufWritePost *.tex :! pdflatex %:p && rm %:r.log %:r.aux
autocmd FileType tex nnoremap <leader>r :source /usr/share/nvim/runtime/plugin/map_tex.vim

autocmd FileType tex inoremap ,article
    \ \documentclass[a4paper, oneside]{article} %article/others
    \ <CR>\usepackage[utf8]{inputenc}
    \ <CR>\usepackage{listings}
    \ <CR>\usepackage{hyperref}
    \ <CR>\usepackage{graphicx}
    \ <CR>\hypersetup{
    \ <CR>    colorlinks=true,
    \ <CR>    linkcolor=blue,
    \ <CR>    filecolor=magenta,
    \ <CR>    urlcolor=blue,
    \ <CR>}
    \ <CR>\title{<++>}
    \ <CR>\author{<++>}
    \ <CR>\date{<++>}
    \ <CR><CR><CR>
    \ <CR>\begin{document}
    \ <CR>\maketitle
    \ <CR>\tableofcontent
    \ <CR><CR><CR>\end{document}<Esc>ggf{a

autocmd FileType tex inoremap ,bf
    \ \textbf{}<Esc>i

autocmd FileType tex inoremap ,en
    \ \begin{enumerate}
    \ <CR>\item
    \ <CR>\end{enumerate}
    \ <Esc>kA

autocmd FileType tex inoremap ,it
    \ \begin{itemize}
    \ <CR>\item
    \ <CR>\end{itemize}
    \ <Esc>kA

autocmd FileType tex inoremap ,i
    \ <CR>\item
autocmd FileType tex nnoremap ,i
    \ o\item

autocmd FileType tex inoremap ,se
    \ \section{}<Esc>i

autocmd FileType tex inoremap ,su
    \ \subsection{}<Esc>i

autocmd FileType tex inoremap ,co
    \ \begin{lstlisting}
    \ <CR>\end{lstlisting}<Esc>O<Tab>

autocmd FileType tex inoremap ,p
    \ \begin{figure}[!h]
    \ <CR>\centering
    \ <CR>\includegraphics[width=0.6\textwidth]{<++>.png}
    \ <CR>\caption{<++>}
    \ <CR>\label{<++>}
    \ <CR>\end{figure}<Esc>{<Space><Space>

autocmd FileType tex inoremap ,ta
    \ \begin{tabular}{}
    \ <CR>\hline
    \ <CR>\textbf{<++>} & \textbf{<++>} \\ \hline
    \ <CR>& \\ \hline
    \ <CR>\end{tabular}<Esc>4k$hi

autocmd FileType tex inoremap ,math
    \ \begin{equation}
    \ <CR>\end{equation}<Esc>O

autocmd FileType tex inoremap ,<Tab>
    \ \noindent<Space>

autocmd FileType tex inoremap ,\\
    \ \setlength{\parskip}{9pt}

autocmd FileType tex inoremap ,bib
    \ \begin{thebibliography}{00}
    \ <CR>\bibitem{1}
    \ <CR>{""
    \ <CR>[<++>].
    \ <CR>Available at: <++>
    \ <CR>[Accessed: <++>]}
    \ <CR>\end{thebibliography}<Esc>4khi

autocmd FileType tex inoremap ,bt
    \ <CR>\bibitem{}
    \ <CR>{"<++>"
    \ <CR>[<++>].
    \ <CR>Available at: <++>
    \ <CR>[Accessed: <++>]}<Esc>4khi

autocmd FileType tex inoremap ,ci
    \ \cite{}<Esc>i

autocmd FileType tex inoremap ,"
    \ ``''<Esc>hi

autocmd FileType tex inoremap ,fra
    \ \frac{}{<++>}<Esc>ba

autocmd FileType tex inoremap ,cent
    \ \begin{center}
    \ <CR>\end{center}<Esc>O

autocmd FileType tex inoremap ,matr
    \ $\begin{matrix} %v-/bmatrix
    \ <CR>&
    \ <CR>\end{<++>matrix}$
    \ <Esc>2kF{a

autocmd FileType tex inoremap ,r
    \ \ref{}<Esc>i

autocmd FileType tex inoremap ,u
    \ \url{}<Esc>i

autocmd FileType tex inoremap ,hr
    \ \href{}{<++>}<Esc>ba

autocmd FileType tex inoremap ,gr
    \ \begin{tikzpicture}
    \ <CR>\begin{axis}[
    \ <CR>title={<++>},
    \ <CR>xlabel={<++>},
    \ <CR>ylabel={<++>},
    \ <CR>xtick=data,
    \ <CR>xmin=1,
    \ <CR>xmax=8,
    \ <CR>]
    \ <CR>   \addplot[color=blue] coordinates {
    \ <CR>   (<++>, <++>)
    \ <CR>   };
    \ <CR>\end{axis}
\end{tikzpicture}

