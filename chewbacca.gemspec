# -*- encoding: utf-8 -*-
require File.expand_path('../lib/chewbacca/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Marcello Milhomem Albuquerque"]
  gem.email         = ["marcello.m.albuquerque@gmail.com"]
  gem.description   = "Chewbacca is an REST API integration testing tool for rack based REST APIs"
  gem.summary       = "Chewbacca's goal is to make API integration tests more concise by allowing to spec APIs through a dead simple API"
  gem.homepage      = "https://github.com/marcelloma/chewbacca"
  gem.files         = `git ls-files`.split($\)
  gem.name          = "chewbacca"
  gem.require_paths = ["lib"]
  gem.version       = Chewbacca::VERSION
end
