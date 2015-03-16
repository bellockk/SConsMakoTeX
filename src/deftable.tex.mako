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

${table([['Title A', 'Title B', 'Title C'],
         ['Row X',   1,         2],
         ['Row Y',   3,         4]])}
