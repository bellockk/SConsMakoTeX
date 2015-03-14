import os
import SCons

# Define the Mako Builder
def _string(target, source, env):
    return 'Mako(%s, %s)' % (target[0], source[0])

def _action(target, source, env):
    from mako.template import Template
    template_object = Template(filename=source[0].abspath)
    rendered = template_object.render(**env['MAKO_DICTIONARY'])
    file_object = open(target[0].abspath, 'w')
    file_object.write(rendered)
    file_object.close()

def generate(env):
    scons_action=SCons.Action.Action(_action, _string)
    env['BUILDERS']['Mako'] =  Builder(action=scons_action,
                                       target_factory=env.fs.File)
    env.AppendUnique(MAKO_DICTIONARY={})

def exists(env):
    try:
        from mako.template import Template
    except ImportError:
        raise SCons.Errors.StopError(SCons.Warnings.Warning, "Could not find mako, please ensure you have it installed on your system.")
    else:
        return True


# Import the default build environment
Import('env')

# Create a local build environment
local_env = env.Clone()

# Add the mako builder to the local environment
generate(local_env)

# Create a Variant Directory
variant_dir = 'build'
VariantDir(variant_dir,['src'],duplicate=0)

# Render the mako templates
local_env.Mako(os.path.join(variant_dir, 'plots.tex'),
               os.path.join(variant_dir, 'plots.tex.mako'))
template = local_env.Mako(os.path.join(variant_dir, 'document.tex'),
                          os.path.join(variant_dir, 'document.tex.mako'))

# Build the LaTeX
doc = local_env.PDF(template)

# Install
inst = env.Install('dist',doc)
env.NoClean(inst)
