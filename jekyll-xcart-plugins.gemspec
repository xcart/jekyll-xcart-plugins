# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'jekyll-xcart-plugins'
  s.version     = '0.0.2'
  s.date        = '2017-05-31'
  s.summary     = 'Bunch of X-Cart Knowledge Base plugins'
  s.description = 'References to other local pages, navigation, breadcrumbs, ElasticSearch etc.'
  s.author      = 'Eugene Dementjev'
  s.email       = 'daemos@x-cart.com'
  s.homepage    = 'https://github.com/xcart/jekyll-xcart-plugins'
  s.license     = 'CC0'
  s.post_install_message = 'Remember to add `jekyll-xcart-plugins` to the list of Gems in _config.yml'
  s.files       = ['lib/converter.rb',
                   'lib/global.rb',
                   'lib/link.rb',
                   'lib/localization.rb',
                   'lib/markup.rb',
                   'lib/navigation.rb']
  s.require_paths = ["lib"]

  s.extra_rdoc_files = ['README.md', 'LICENSE.md']

  s.add_runtime_dependency "jekyll", ">= 3.0"

  s.add_dependency 'xml-simple'

  s.add_development_dependency 'rspec'
end