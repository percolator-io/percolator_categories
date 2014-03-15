# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'percolator_categories/version'

Gem::Specification.new do |spec|
  spec.name          = "percolator_categories"
  spec.version       = PercolatorCategories::VERSION
  spec.authors       = ["Михаил Кузьмин"]
  spec.email         = ["m.kuzmin@darkleaf.ru"]
  spec.summary       = %q{Percolator categories wrapper}
  spec.description   = %q{yaml to objects}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "> 4.0.0"
  spec.add_dependency "activemodel", "> 4.0.0"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
