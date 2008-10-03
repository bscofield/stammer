# Look in the tasks/setup.rb file for the various options that can be
# configured in this Rakefile. The .rake files in the tasks directory
# are where the options are used.

load 'tasks/setup.rb'

ensure_in_path 'lib'
require 'stammer'

task :default => 'test:run'

PROJ.name = 'stammer'
PROJ.authors = 'Ben Scofield of Viget Labs'
PROJ.email = 'ben.scofield@viget.com'
PROJ.url = 'http://www.github.com/bscofield/stammer'
PROJ.rubyforge.name = 'stammer'

PROJ.spec.opts << '--color'

# EOF
