# SConsMakoTeX
*SCons(Python + LaTeX) = Goodness*

## Dependencies
You must have SCons, Mako, pdflatex, and python installed for this proof of concept to work.

## Purpose
Combine python and LaTeX in an intuitive way, while not having to re-run the python bits unless they are modified.  This project is meant to provide the building blocks to enhance your LaTeX workflow with the power of python, to build your documents your way.

## What this project is not.
This project is not meant to be a toolbox of python hooks into LaTeX.  There is just too many different ways to tweak the many packages of LaTeX into your documents.  The examples provided are meant to show *a* way to hook python into your LaTeX documents, not *the* way.

## Why Scons/Mako/LaTeX?

### LaTeX
Nothing builds a document as beautiful as LaTeX, and its source files are easily merged in version control systems.

### Mako
Plugs Python into the LaTeX source code.

### SCons
The glue that pulls the python and LaTeX together in a way that if utilized properly does not re-run any python code unless it has changed.

## Use Cases
Integrating python code into LaTeX code, without making document build times unwieldy.
