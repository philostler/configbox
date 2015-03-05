# encoding: utf-8
require File.expand_path('../lib/confignado/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'confignado'
  s.version     = Confignado::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Phil Ostler'
  s.email       = 'github@philostler.com'
  s.homepage    = 'https://github.com/philostler/confignado'
  s.summary     = ''
  s.description = ''
  s.license     = 'MIT'

  s.add_development_dependency 'coveralls', '~> 0.7', '>= 0.7.0'
  s.add_development_dependency 'fuubar', '~> 2.0', '>= 2.0.0'

  s.files = Dir['.gitignore'] +
            Dir['Gemfile'] +
            Dir['README.md'] +
            Dir['confignado.gemspec'] +
            Dir['**/*.rb']
  s.require_paths = ['lib']
end
