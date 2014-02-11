# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lti_template_builder/version'

Gem::Specification.new do |spec|
  spec.name          = "lti_template_builder"
  spec.version       = LtiTemplateBuilder::VERSION
  spec.authors       = ["Eric Berry"]
  spec.email         = ["cavneb@gmail.com"]
  spec.summary       = %q{Rails mountable engine templates for LTI development}
  spec.description   = %q{Rails mountable engine templates for LTI development}
  spec.homepage      = "https://github.com/instructure/lti_template_builder"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 3.2.0"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sinatra"
end
