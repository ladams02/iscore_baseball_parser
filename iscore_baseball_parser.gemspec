# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "iscore_baseball_parser/version"

Gem::Specification.new do |s|
  s.name        = "iscore_baseball_parser"
  s.version     = IscoreBaseballParser::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Luke Adams"]
  s.email       = ["ladams02@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{A parsing tool for the iScore Baseball application (http://iscorecentral.com/baseball/).}
  s.description = %q{This tool will parse the stats.xls spreadsheet from the iScore Baseball application and return back easy to use objects packed with data.}

  s.rubyforge_project = "iscore_baseball_parser"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_development_dependency "rake"
  s.add_development_dependency "minitest"
  s.add_development_dependency "roo", "1.13.2"
end
