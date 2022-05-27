require 'bundler/gem_tasks'

namespace :container do
  desc 'build container'
  task :build do
    sh "podman build -t #{ENV['USER']}/zae ."
  end

  desc 'inspect container'
  task :inspect do
    sh "podman run --rm -it #{ENV['USER']}/zae"
  end
end
