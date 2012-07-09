# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nesta-plugin-dateslugs/version"

Gem::Specification.new do |s|
  s.name        = "nesta-plugin-dateslugs"
  s.version     = Nesta::Plugin::Dateslugs::VERSION
  s.authors     = ["Adam Michel"]
  s.email       = ["awmichel90@gmail.com"]
  s.homepage    = "http://amichel.me"
  s.summary     = %q{Date slugs in blog posts for Nesta CMS.}
  s.description = %q{Adds the post date to blog post permalinks in Nesta CMS.}

  s.rubyforge_project = "nesta-plugin-dateslugs"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency("nesta", ">= 0.9.13")
  s.add_development_dependency("rake")
end
