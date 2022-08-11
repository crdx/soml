require_relative 'lib/soml/version'

Gem::Specification.new do |spec|
    spec.homepage = 'https://github.com/crdx/soml'
    spec.summary = 'SOML parser'
    spec.name = 'soml'
    spec.version = SOML::VERSION
    spec.author = 'crdx'
    spec.license = 'GPLv3'
    spec.metadata['rubygems_mfa_required'] = 'true'

    spec.required_ruby_version = '>= 3.0'

    spec.files = Dir['lib/**/*']

    spec.add_development_dependency 'rake',  '~> 12.3'
    spec.add_development_dependency 'rspec', '~> 3.8'
end
