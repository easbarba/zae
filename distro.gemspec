# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'distro'
  spec.version = '0.2.0'
  spec.authors = ['easbarba']
  spec.email = ['easbarba@pm.me']

  spec.summary = 'Porcelain front-end of Linux Distro package managers.'
  # spec.description   = "TODO: Write a longer description or delete this line."
  spec.homepage = 'https://git.sr.ht/~easbarba/distro'
  spec.required_ruby_version = '>= 2.7.5'
  spec.license = 'GPL-3.0'

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # development deps
  spec.add_development_dependency 'pry', '~> 0.14.1'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.3'
  spec.add_development_dependency 'reek', '~> 6.0', '>= 6.0.4'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.15'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.3'
  spec.add_development_dependency 'rufo', '~> 0.12.0'
  spec.add_development_dependency 'solargraph', '~> 0.40.4'

  # runtime deps
  spec.add_runtime_dependency 'dry-auto_inject', '~> 0.7.0'
  spec.add_runtime_dependency 'dry-container', '~> 0.7.2'
  spec.add_runtime_dependency('gli', '~> 2.20.0')
end