#!/usr/bin/env rake
require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs << "lib/iscore_baseball_parser"
  t.test_files = FileList["test/lib/iscore_baseball_parser/*_test.rb", "test/lib/iscore_baseball_parser/players/*_test.rb"]
  t.verbose = true
end

task :default => :test