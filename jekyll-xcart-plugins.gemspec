# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'jekyll-xcart-plugins'
  spec.version       = '0.0.2'
  spec.date          = '2017-05-31'
  spec.summary       = 'Bunch of X-Cart Knowledge Base plugins'
  spec.description   = 'References to other local pages, navigation, breadcrumbs, ElasticSearch etc.'
  spec.author        = 'Eugene Dementjev'
  spec.email         = 'daemos@x-cart.com'
  spec.homepage      = 'https://github.com/xcart/jekyll-xcart-plugins'
  spec.license       = 'CC0'
  spec.files         = `git ls-files -z lib/`.split("\u0000")
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "jekyll", ">= 3.0"

  spec.add_dependency 'xml-simple'

  spec.add_development_dependency 'rspec'
end