<%!
    import os
    import numpy
    import matplotlib
    matplotlib.use('Agg')  # Turn off plotting window
    import matplotlib.pyplot as plt

    variant_dir = 'build'

    def myhist(filename, x, bins):
        rand_numbers = numpy.random.randn(x)
        plt.clf()
        plt.hist(rand_numbers, bins)
        plt.savefig(os.path.join(variant_dir, filename))
        return filename
%>
\documentclass[letter, article]{article}
\usepackage{graphicx}
\usepackage[left=2cm,top=2cm,right=2cm,bottom=2cm]{geometry}

\begin{document}

\section{Mako Is Cool}

\section{Plots}

% for i in [2000, 20000]:
    \subsection{${i} Random Numbers}
    \includegraphics[width=5in]{${myhist('plot{0}.pdf'.format(i), i, 200)}}

% endfor

\end{document}
