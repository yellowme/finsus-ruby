Gem::Specification.new do |s|
  s.name        = 'finsus-ruby'
  s.version     = '0.2.0'
  s.date        = '2019-09-11'
  s.summary     = "Ruby Bindings for Finsus API"
  s.description = "Ruby Bindings for Finsus API"
  s.authors     = ["Yellowme"]
  s.email       = 'hola@yellowme.mx'
  s.homepage    = 'https://rubygems.org/gems/finsus-ruby'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ['lib','lib/finsus']

  s.add_dependency 'httparty'
  s.add_dependency 'dry-validation'

  s.add_runtime_dependency 'json', '>= 1.8'
end
