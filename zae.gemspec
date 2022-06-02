require_relative 'lib/info'

Gem::Specification.new do |spec|
  spec.name = 'zae'
  spec.version = Zae::VERSION
  spec.authors = ['easbarba']
  spec.summary = Zae::DESCRIPTION
  spec.homepage = Zae::REPOSITORY
  spec.required_ruby_version = '>= 2.7'
  spec.license = 'gpl-v3'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.files = Dir.glob('{lib,exe}/**/*', File::FNM_DOTMATCH).reject { |f| File.directory?(f) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
  spec.add_development_dependency 'reek', '~> 6.1.1'
  spec.add_development_dependency 'rexml', '~> 3.2', '>= 3.2.5'
  spec.add_development_dependency 'rspec', '~> 3.11'
  spec.add_development_dependency 'rufo', '~> 0.13.0'

  spec.add_runtime_dependency 'gli', '~> 2.21'
end
