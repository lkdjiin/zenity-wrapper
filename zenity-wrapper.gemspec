# -*- encoding: utf-8 -*-

require 'rake'

Gem::Specification.new do |s|
  s.name = 'zenity-wrapper'
  s.version = File.read('VERSION').strip
  s.authors = ['Xavier Nayrac']
  s.email = 'xavier.nayrac@gmail.com'
  s.summary = 'Zenity-wrapper is a ruby wrapper over the zenity utilily'
  s.homepage = ''
  s.description = %q{What did you expect with that name? Zenity-wrapper is a ruby wrapper over
the zenity utilily.

I wrote it because I need it for a personal project. It is far from complete,
it could only open **list** and **message** dialog boxes.
Anyway I release it because it could be helpfull to somebody.}
	
	readmes = FileList.new('*') do |list|
		list.exclude(/(^|[^.a-z])[a-z]+/)
		list.exclude('TODO')
	end.to_a
  s.files = FileList['lib/**/*.rb', '[A-Z]*'].to_a + readmes
	s.license = ''
	s.required_ruby_version = '>= 1.9.3'
end
