require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "jruby-profiler-callgrind-printer"
  gem.homepage = "http://github.com/justfalter/jruby-profiler-callgrind-printer"
  gem.license = "MIT"
  gem.summary = %Q{Provides callgrind output for the JRuby profiler}
  gem.description = %Q{Provides callgrind output for the JRuby profiler}
  gem.email = "falter@gmail.com"
  gem.authors = ["Mike Ryan"]
  gem.platform = "java"
  gem.files  = Dir.glob("lib/**/*.rb") + 
              Dir.glob("examples/{*.rb,*.callgrind.out}") + 
              %w(LICENSE.txt Gemfile README.md Rakefile VERSION)

  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  #  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

#require 'rspec/core'
#require 'rspec/core/rake_task'
#RSpec::Core::RakeTask.new(:spec) do |spec|
#  spec.pattern = FileList['spec/**/*_spec.rb']
#end

