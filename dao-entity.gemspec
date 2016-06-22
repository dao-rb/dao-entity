lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dao/entity/version'

Gem::Specification.new do |spec|
  spec.name          = 'dao-entity'
  spec.version       = Dao::Entity::VERSION
  spec.authors       = ['llxff', 'ssnikolay']
  spec.email         = ['ll.wg.bin@gmail.com']

  spec.summary       = 'Base entity'
  spec.description   = 'Base entity'
  spec.homepage      = 'https://github.com/dao-rb/dao-entity'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.2.2'

  spec.add_dependency 'virtus', '~> 1.0'
  spec.add_dependency 'activemodel', '>= 4.2'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
end
