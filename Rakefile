# -*- encoding: utf-8 -*-

# todo: replace GEM by th gem name

require 'rake'
require 'rspec/core/rake_task'

desc 'Test Zenity'
task :default => :spec

desc 'Test Zenity with rspec'
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = ['--color']
end

desc 'Check for code smells'
task :reek do
  puts 'Checking for code smells...'
  files = Dir.glob 'lib/**/*.rb'
  # files.delete FILE_TO_EXCLUDE
  args = files.join(' ')
  sh "reek --quiet #{args} | ./reek.sed"
end

desc 'Build Zenity & install it'
task :install do
  sh "rm zenity-wrapper-*gem"
  sh "gem build zenity-wrapper.gemspec"
	f = FileList['zenity*gem'].to_a
	sh "gem install #{f.first}"
end

