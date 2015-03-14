<%def name="table(t)">
\begin{tabular}{*{${len(t[0])}}{l}}
<%
   headers = [r'\textbf{%s}' % h for h in t[0]]
   header = ' & '.join(headers) + r'\\ \hline'
%> 
${header}
\hline
  % for row in t[1:]:
${' & '.join([str(c) for c in row]) + r'\\'}
  % endfor
\end{tabular}
</%def>
\documentclass[letter, article]{article}
\usepackage{graphicx}
\usepackage[left=2cm,top=1.5cm,right=2cm,bottom=1.5cm]{geometry}

\begin{document}

\section{Mako Is Cool}

${table([['Title A', 'Title B', 'Title C'],
         ['Row X',   1,         2],
         ['Row Y',   3,         4]])}

\section{Plots}

\input{plots}

\end{document}
