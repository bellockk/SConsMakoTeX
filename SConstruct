import os
import platform

# Create Build Environment
temp_env = Environment()
if platform.system().lower().startswith('win'):
    temp_env.PrependENVPath(
        "PATH", r'C:\specific\texlive\bin\win32')
elif platform.system().lower().startswith('linux'):
    temp_env.PrependENVPath(
        "PATH", '/specific/texlive/bin/x86_64-linux')
elif platform.system().lower().startswith('darwin'):
    temp_env.PrependENVPath(
        "PATH", '/specific/texlive/bin/universal-darwin')
env = Environment(tools=['default', 'pdflatex'], ENV=temp_env['ENV'])
env.Append(PDFLATEXFLAGS=['-halt-on-error', '-shell-escape'])
Export('env')
doc = SConscript(os.path.join('src', 'SConscript'),
                 variant_dir='build',
                 duplicate=1)
Install('dist', doc)
