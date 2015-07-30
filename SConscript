import os
import SCons

# Define the Mako Builder
def _string(target, source, env):
    return 'Mako(%s, %s)' % (target[0], source[0])

def _action(target, source, env):

    from mako.template import Template
    from mako import exceptions

    try:
        template_object = Template(filename=source[0].abspath)
    except:
        print exceptions.text_error_template().render()
        raise SCons.Errors.StopError(SCons.Warnings.Warning, "Because of the above error, could not load the mako template %s. Because of the previous error." % source[0].abspath)

    try:
        rendered = template_object.render(**env['MAKO_DICTIONARY'])
    except:
        print exceptions.text_error_template().render()
        raise SCons.Errors.StopError(SCons.Warnings.Warning, "Because of the above error, could not render the template %s with the following dictionary.\n%s" % (source[0].abspath, env['MAKO_DICTIONARY']))

    try:
        file_object = open(target[0].abspath, 'w')
        file_object.write(rendered)
        file_object.close()
    except:
        raise SCons.Errors.StopError(SCons.Warnings.Warning, "Could not write the rendered template to %s." % target[0].abspath)

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
VariantDir(variant_dir,['src'],duplicate=1)

# Render the mako templates
for root, dirs, filenames in os.walk('src'):
    for filename in filenames:
        if filename.lower().endswith('.mako'):
            local_env.Mako(os.path.join(variant_dir, os.path.relpath(root, 'src'), filename[:-5]),
                           os.path.join(variant_dir, os.path.relpath(root, 'src'), filename))

# Build the LaTeX
doc = local_env.PDF(File(os.path.join(variant_dir, 'document.tex')))

# Install
inst = env.Install('dist',doc)
env.NoClean(inst)
