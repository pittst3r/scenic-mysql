# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'scenic-mysql/version'

Gem::Specification.new do |spec|
  spec.name          = "scenic-mysql"
  spec.version       = ScenicMysql::VERSION
  spec.authors       = ["Robbie Pitts"]
  spec.email         = ["robbie@sweatypitts.com"]
  spec.summary       = %q{A MySQL adapter for Scenic}
  spec.homepage      = "https://github.com/sweatypitts/scenic-mysql"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'ammeter', '>= 1.1.3'
  spec.add_development_dependency 'appraisal'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '>= 3.3'
  spec.add_development_dependency 'rspec-rails'

  spec.add_dependency 'activerecord', '>= 4.0.0'
  spec.add_dependency 'mysql2'
  spec.add_dependency 'railties', '>= 4.0.0'
  spec.add_dependency 'scenic'

  spec.required_ruby_version = '~> 2.1'
end
