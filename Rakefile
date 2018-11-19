# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
require 'rake/testtask'
require 'rdoc/task'

Rails.application.load_tasks

Rake::TestTask.new do |t|
  t.libs << 'test'
end

desc 'Run tests'
task default: :test

RDoc::Task.new :rdoc do |rdoc|
  rdoc.main = 'README.md'
  rdoc.rdoc_files.include('README.md',
                          './app/models/*.rb',
                          './app/controllers/*.rb',
                          './app/helpers/*.rb',
                          './test/**/*.rb')
  rdoc.title = 'Typochan Documentation'
  rdoc.rdoc_dir = 'docs/'
  rdoc.options << '--all'
end
