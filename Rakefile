require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

VERSION = "0.0.1"

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the anaf_habtm plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the anaf_habtm plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'AnafHabtm'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
PKG_FILES = FileList[
  'acts_as_linkable.gemspec', 
  'Gemfile',
  'install.rb', 
  'Rakefile', 'README', 'uninstall.rb',
  'lib/**/*',
  'rails/**/*',
  'test/**/*'
]

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "acts_as_linkable"
    s.version = VERSION
    s.author = "Tyler Gannon"
    s.email = "t--g__a--nnon@gmail.com"
    s.homepage = "http://github.com/tylergannon/acts_as_linkable"
    s.platform = Gem::Platform::RUBY
    s.description = "Helper methods for defining link characteristics on objects."
    s.summary = "Acts As Linkable helper methods."
    s.files = PKG_FILES.to_a
    s.require_path = "lib"
    s.has_rdoc = false
    s.extra_rdoc_files = ["README"]

  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end



