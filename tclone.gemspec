# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tclone/version"

Gem::Specification.new do |s|
  s.name        = "tclone"
  s.version     = Tclone::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mohammed Siddick. E"]
  s.email       = ["siddick@gmail.com"]
  s.homepage    = "http://github.com/siddick/tclone"
  s.summary     = %q{Clone the templates of the Rails generators}
  s.description = %q{ 
    Now, You can copy the default templates of rails generators to Your Rails Project.
    Example( clone the templates of scaffold generator ): 
      `rails g tclone scaffold`
  }

  s.rubyforge_project = "tclone"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
