# -*- encoding: utf-8 -*-

# todo: replace GEM by th gem name

require 'rake'
require 'rspec/core/rake_task'

desc 'Test Zenity'
task :default => :spec

desc 'Test Zenity with rspec'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--color --format documentation']
end

desc 'Build Zenity & install it'
task :install do
  sh "gem build zenity.gemspec"
	f = FileList['zenity*gem'].to_a
	sh "gem install #{f.first} --no-rdoc --no-ri"
end

