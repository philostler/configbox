# encoding: utf-8
require File.expand_path('../lib/configbox/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'configbox'
  s.version     = Configbox::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Phil Ostler'
  s.email       = 'github@philostler.com'
  s.homepage    = 'https://github.com/philostler/configbox'
  s.summary     = 'Ruby configuration encapsulated'
  s.description = 'Ruby configuration encapsulated, expressed through adapters'
  s.license     = 'MIT'

  s.add_development_dependency 'coveralls', '~> 0.7', '>= 0.7.0'
  s.add_development_dependency 'fuubar', '~> 2.0', '>= 2.0.0'

  s.files = Dir['.gitignore'] +
            Dir['Gemfile'] +
            Dir['README.md'] +
            Dir['configbox.gemspec'] +
            Dir['**/*.rb']
  s.require_paths = ['lib']
end
