# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'dmapper'
  s.version     = '0.1'
  s.summary     = "Generators for DataMapper"
  s.description = "Create models easily for DataMapper using the command line."
  s.authors     = ["Daniel Durante"]
  s.email       = 'officedebo@gmail.com'
  s.files       = Dir.glob("{bin,lib}/**/*") + %w(COPYING README.rdoc)
  s.executables = ["dmap"]
  s.require_paths = ["lib"]
  s.homepage    = 'https://github.com/durango/dmap'
  s.add_dependency 'data_mapper'
  s.license = 'MIT'
  s.date = Time.now.strftime("%Y-%m-%d")
  s.required_rubygems_version = ">= 1.3.6"
end
