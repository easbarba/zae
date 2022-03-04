require 'bundler/gem_tasks'

namespace :container do
  desc 'build container'
  task :build do
    sh 'docker build -t pak .'
  end

  desc 'run container'
  task :run do
    sh 'docker run --rm pak'
  end
end
