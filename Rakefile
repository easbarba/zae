require 'bundler/gem_tasks'

task default: %i[spec]

# minitest
require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
end

# rspec
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
