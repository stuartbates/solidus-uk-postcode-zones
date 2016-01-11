# encoding: UTF-8

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "solidus_uk_postcode_zones"
  s.version     = "0.0.1"
  s.summary     = "Create zones based on whitelisting or blacklist postcode zones"
  s.required_ruby_version = ">= 2.1"

  s.author    = "Stuart Bates"
  s.email     = "hello@stuartbates.com"
  s.homepage  = "http://www.stuartbates.com"
  s.license   = %q{BSD-3}

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = "lib"
  s.requirements << "none"

  s.add_dependency "solidus", [">= 1.2.0.alpha", "< 1.3.0"]

  s.add_development_dependency "rspec-rails", "~> 3.2"
  s.add_development_dependency "simplecov"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "sass-rails"
  s.add_development_dependency "coffee-rails"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "capybara"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "ffaker"
end
