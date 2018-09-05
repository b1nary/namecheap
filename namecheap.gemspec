# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "namecheaper/version"

Gem::Specification.new do |s|
  s.name        = "namecheaper"
  s.version     = Namecheap::VERSION
  s.authors     = ["b1nary"]
  s.email       = ["r@cia.li"]
  s.homepage    = "https://github.com/b1nary/namecheap"
  s.description = %q{Ruby wrapper for the Namecheap API}
  s.summary     = s.description
  s.homepage    = 'https://github.com/b1nary/namecheap'
  s.licenses    = ['GNU']

  s.rubyforge_project = "namecheap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency 'rspec-its'
  s.add_runtime_dependency "httparty"
  s.add_runtime_dependency "activesupport", '>= 3.0.0'
end
