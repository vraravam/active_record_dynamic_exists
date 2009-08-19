require File.dirname(__FILE__) + '/../../../config/environment'
require 'rake'
require 'spec/rake/spectask'
require 'rake/rdoctask'

desc 'Default: run specs.'
task :default => :spec

desc 'Run ActiveRecordDynamicExists spec'
Spec::Rake::SpecTask.new do |t|
end

desc 'Generate documentation for the active_record_dynamic_exists plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'RackspaceActiveRecordExtensions'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
