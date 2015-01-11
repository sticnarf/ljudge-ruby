# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ljudge/version'

Gem::Specification.new do |spec|
  spec.name          = "ljudge-ruby"
  spec.version       = Ljudge::VERSION
  spec.authors       = ["Yilin Chen"]
  spec.email         = ["wormful@gmail.com"]
  spec.summary       = %q{Ruby binding for quark-zju/ljudge}
  spec.description   = %q{Ruby binding for ljudge, a backend tool for an online judge system}
  spec.homepage      = "https://github.com/wormful/ljudge-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
