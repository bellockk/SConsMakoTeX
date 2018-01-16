<%!
    import os
    import numpy as np
    import matplotlib
    matplotlib.use('Agg')  # Turn off plotting window
    import matplotlib.pyplot as plt
    from mpl_toolkits.basemap import Basemap

    plot_path = 'media'
    if not os.path.isdir(plot_path):
        os.makedirs(plot_path)

    def plot(filename):
        fig=plt.figure(frameon = False)
        ax=fig.add_axes([0.1,0.1,0.8,0.8])
        m = Basemap(llcrnrlon=-100.,llcrnrlat=20.,urcrnrlon=20.,urcrnrlat=60.,\
                    rsphere=(6378137.00,6356752.3142),\
                    resolution='l',projection='merc',\
                    lat_0=40.,lon_0=-20.,lat_ts=20.)
        nylat = 40.78; nylon = -73.98
        lonlat = 51.53; lonlon = 0.08
        m.bluemarble()
        m.drawgreatcircle(nylon,nylat,lonlon,lonlat,linewidth=2,color='r')
        m.drawparallels(np.arange(10,90,20),labels=[1,1,0,1])
        m.drawmeridians(np.arange(-180,180,30),labels=[1,1,0,1])
        plt.savefig(os.path.join(plot_path, filename))
        return os.path.join('..', plot_path, filename)
%>
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
\usepackage{lipsum}
\usepackage[left=2cm,top=1.5cm,right=2cm,bottom=1.5cm]{geometry}

\begin{document}

\begin{center}\textbf{\LARGE Scenario 1}\end{center}
\section{Configuration Parameters}

${table([['', 'Variable A', 'Variable B', 'Variable C', 'Variable D', 'Variable E'],
         ['Row X',   1,         2, 2, 3, 5],
         ['Row Y',   3,         4, 4, 5, 2]])}

\section{Overview}
\vspace*{-1em}
\begin{center}\includegraphics[width=\textwidth]{${plot('plot.pdf')}}\end{center}
\vspace*{-5em}
\section{Summary}
\lipsum


\end{document}
