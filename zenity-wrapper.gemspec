# -*- encoding: utf-8 -*-

require 'rake'

Gem::Specification.new do |s|
  s.name = 'zenity-wrapper'
  s.version = File.read('VERSION').strip
  s.authors = ['Xavier Nayrac']
  s.email = 'xavier.nayrac@gmail.com'
  s.summary = ''
  s.homepage = ''
  s.description = %q{}
	
	readmes = FileList.new('*') do |list|
		list.exclude(/(^|[^.a-z])[a-z]+/)
		list.exclude('TODO')
	end.to_a
  s.files = FileList['lib/**/*.rb', '[A-Z]*'].to_a + readmes
	s.license = ''
	s.required_ruby_version = '>= 1.9.3'
	s.executables = ['']
end
