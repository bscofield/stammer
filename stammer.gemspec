Gem::Specification.new do |s|
  s.name     = "stammer"
  s.version  = "0.0.1"
  s.date     = "2008-09-19"
  s.summary  = "Super-simple wrapper for the Yammer API"
  s.email    = "ben.scofield@viget.com"
  s.homepage = "http://github.com/bscofield/stammer"
  s.description = "Super-simple wrapper for the Yammer API"
  s.has_rdoc = true
  s.authors  = ["Ben Scofield"]
  s.files    = [
    "History.txt",
    "Manifest.txt",
    "README.txt",
    "Rakefile",
    "lib/stammer.rb",
    "lib/stammer/client.rb",
    "lib/stammer/exceptions.rb",
    "stammer.gemspec",
    "tasks/ann.rake",
    "tasks/bones.rake",
    "tasks/gem.rake",
    "tasks/git.rake",
    "tasks/manifest.rake",
    "tasks/notes.rake",
    "tasks/post_load.rake",
    "tasks/rdoc.rake",
    "tasks/rubyforge.rake",
    "tasks/setup.rb",
    "tasks/svn.rake",
    "tasks/test.rake"
    ]
  s.test_files = [
    "test/test_client.rb",
    "test/test_helper.rb"
  ]
  s.rdoc_options = ["--main", "README.txt"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.add_dependency("json", ["> 0.0.0"])
end
