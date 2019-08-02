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
	\ <CR>\usepackage{url}
	\ <CR>\usepackage{graphicx}
	\ <CR>\title{<++>}
	\ <CR>\author{<++>}
	\ <CR>\date{<++>}
	\ <CR><CR><CR>
	\ <CR>\begin{document}
	\ <CR>\maketitle
	\ <CR>\tableofcontent
	\ <CR><CR><CR>\end{document}<Esc>ggf{a

autocmd FileType tex inoremap ,BTH
	\ \documentclass[a4paper, oneside]{article} %article/others
	\ <CR>\usepackage[utf8]{inputenc}
	\ <CR>\usepackage{listings}
	\ <CR>\usepackage{url}
	\ <CR>\usepackage{graphicx}
	\ <CR><CR><CR>
	\ <CR>\begin{document}
	\ <CR>\begin{titlepage}
	\ <CR>\centering
	\ <CR>{\huge\bfseries <++>\par}
	\ <CR>\vspace{1cm}
	\ <CR>{\scshape\Large BTH, (\today) \par}
	\ <CR>{\scshape\Large Author: Axel Gehlin Björnberg, Gusten.1@hotmail.com \par}
	\ <CR>{\scshape\Large Course: <++>\par}
	\ <CR>\vspace{1cm}
	\ <CR>\includegraphics[width=0.3\textwidth]{bthlogo_svart_new.png}\par\vspace{1cm}
	\ <CR>\vspace*{\fill}
	\ <CR>Blekinge Institute of Technology\\
	\ <CR>SE - 371 79 Karlskrona\\
	\ <CR>Sweden
	\ <CR>\end{titlepage}
	\ <CR>\tableofcontent
	\ <CR><CR><CR>\end{document}<Esc>gg

autocmd FileType tex inoremap ,titlepage
	\ \begin{document}
	\ <CR>\begin{titlepage}
	\ <CR>\centering
	\ <CR>{\huge\bfseries <++>\par}
	\ <CR>\vspace{1cm}
	\ <CR>{\scshape\Large BTH, (\today) \par}
	\ <CR>{\scshape\Large Author: Axel Gehlin Björnberg, Gusten.1@hotmail.com \par}
	\ <CR>{\scshape\Large Course: <++>\par}
	\ <CR>\vspace{1cm}
	\ <CR>\includegraphics[width=0.3\textwidth]{bthlogo_svart_new.png}\par\vspace{1cm}
	\ <CR>\vspace*{\fill}
	\ <CR>Blekinge Institute of Technology\\
	\ <CR>SE - 371 79 Karlskrona\\
	\ <CR>Sweden
	\ <CR>\end{titlepage}


autocmd FileType tex inoremap ,bf
	\ \textbf{}<Esc>i

autocmd FileType tex inoremap ,item
	\ \begin{itemize}
	\ <CR>\item
	\ <CR>\end{itemize}
	\ <Esc>kI<Tab><Esc>A

autocmd FileType tex inoremap ,it
	\ <CR>\item

autocmd FileType tex inoremap ,sec
	\ \section{}<Esc>i

autocmd FileType tex inoremap ,sub
	\ \subsection{}<Esc>i

autocmd FileType tex inoremap ,code
	\ \begin{lstlisting}
	\ <CR>\end{lstlisting}<Esc>O

autocmd FileType tex inoremap ,pic
	\ \begin{figure}[!h]
	\ <CR>\centering
	\ <CR>\includegraphics[width=0.6\textwidth]{<++>.png}
	\ <CR>\caption{<++>}
	\ <CR>\label{<++>}
	\ <CR>\end{figure}<Esc>{<Space><Space>

autocmd FileType tex inoremap ,table
	\ \begin{tabular}[!h]
	\ <CR>\textbf{} & \textbf{<++>} \\
	\ <CR>\hline \\
	\ <CR> & \\
	\ <CR>\hline
	\ <CR>\end{tabular}<Esc>4ki

autocmd FileType tex inoremap ,math
	\ \begin{equation}
	\ <CR>\end{equation}<Esc>O

autocmd FileType tex inoremap n<Tab>
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

autocmd FileType tex inoremap ,c
	\ \cite{}<Esc>i
