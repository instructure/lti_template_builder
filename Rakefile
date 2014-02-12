require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new('spec')

task :default => :spec
task :test => :spec

desc "Run the console"
task :console do
  require 'pry'
  require 'lti_template_builder'
  ARGV.clear
  Pry.start
end
