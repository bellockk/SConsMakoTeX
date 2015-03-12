# SConsMakoTeX
Python + LaTeX = Goodness

You must have SCons, Mako, pdflatex, and python installed for this proof of concept to work.

Purpose:
Combine python and LaTeX in an intuitive way, while not having to re-run the python bits unless they are modified.

Why Scons/Mako/LaTeX?

LaTeX:  Nothing makes a document as beautiful as LaTeX, and its source files are easily merged in version control systems.
Mako: Plugs Python into the LaTeX source code.
SCons:  The glue that pulls the python and LaTeX together in a way that if utilizized properly does not re-run any python code unless it has changed.

Use Cases:

Integrating python code into LaTeX code, without making document build times unwieldy.



Notes:
The current implementation is a proof of concept that integrates SCons, Mako, and LaTeX.  It does not yet demonstrate how to take advantage of SCons to compartmentalize the python bits and have them only be built if those bits have changed.
