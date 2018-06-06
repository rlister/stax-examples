lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "stax/examples/version"

Gem::Specification.new do |spec|
  spec.name          = 'stax-examples'
  spec.version       = Stax::Examples::VERSION
  spec.authors       = ['Richard Lister']
  spec.email         = ['rlister@gmail.com']

  spec.summary       = %q{Stax example generators.}
  spec.description   = %q{Stax example stacks and generators for cloudformation templates.}
  spec.homepage      = 'https://github.com/rlister/stax-examples'
  spec.license       = 'MIT'

  spec.files = Dir["{lib}/**/*", "[A-Z]*"]
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency 'stax', '>= 0.0.6'
  spec.add_development_dependency 'docile', '1.2.0'
end