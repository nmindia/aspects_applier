# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aspects_applier/version'

Gem::Specification.new do |spec|
  spec.name        = "aspects_applier"
  spec.version     = "0.0.1"
  spec.summary     = "Applies aspects dynamically to classes"
  spec.date        = "2014-04-01"
  spec.description = "Applies aspects dynamically to classes"
  spec.authors     = ["Mayank"]
  spec.email       = ["mayank@systango.com"]
  spec.homepage    = "http://systango.com/"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rspec", "~> 2.14.1"
  spec.add_development_dependency "rspec-rails", "~> 2.14.0"
end