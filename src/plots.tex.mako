<%!
    import os
    import numpy
    import matplotlib
    matplotlib.use('Agg')  # Turn off plotting window
    import matplotlib.pyplot as plt

    plot_path = 'mako'
    if not os.path.isdir(plot_path):
        os.makedirs(plot_path)

    def myhist(filename, x, bins):
        rand_numbers = numpy.random.randn(x)
        plt.clf()
        plt.hist(rand_numbers, bins)
        plt.savefig(os.path.join(plot_path, filename))
        return os.path.join('..', plot_path, filename)
%>
% for i in [2000, 20000]:
\subsection{${i} Random Numbers}
\includegraphics[width=5in]{${myhist('plot{0}.pdf'.format(i), i, 200)}}

% endfor
