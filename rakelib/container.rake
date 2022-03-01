# frozen_string_literal: true

require 'bundler/gem_tasks'

namespace :container do
  desc 'build container'
  task :build do
    sh 'podman build -t pak .'
  end

  desc 'run container'
  task :run do
    sh 'podman run -ti -rm pak'
  end
end
