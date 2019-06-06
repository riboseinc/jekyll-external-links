# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name          = 'jekyll-external-links'
  s.version       = '0.1'
  s.authors       = ['Ribose Inc.']
  s.email         = ['open.source@ribose.com']

  s.summary       = 'Jekyll plugin that marks external links in your site'
  s.homepage      = 'https://github.com/riboseinc/jekyll-external-links/'
  s.license       = 'MIT'

  s.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|spec|features)/!) }

  s.add_runtime_dependency 'jekyll', '~> 3.8'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rubocop', '~> 0.50'

  s.require_paths = ["lib"]
end
