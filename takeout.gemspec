# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'takeout/version'

Gem::Specification.new do |spec|
  spec.name          = "takeout"
  spec.version       = Takeout::VERSION
  spec.authors       = ["hubert"]
  spec.email         = ["hubert77@gmail.com"]
  spec.description   = %q{castlight puzzle}
  spec.summary       = %q{castlight puzzle}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
