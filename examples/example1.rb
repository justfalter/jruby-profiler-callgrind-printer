# To run:
#   jruby --profile.api example1.rb
#
# This will produce 'example1.callgrind.out', which may be opened within Kcachegrind

require 'jruby/profiler'
require 'jruby/profiler/callgrind_printer'

def fibonacci( n )
  return  n  if ( 0..1 ).include? n
  ( fibonacci( n - 1 ) + fibonacci( n - 2 ) )
end

result = JRuby::Profiler.profile do 
  0.upto(20) do |i|
    fibonacci(i)
  end
end

printer = JRuby::Profiler::CallgrindPrinter.new(result)
File.open("example1.callgrind.out", "w") do |fio|
  printer.printHeader(fio)
  printer.printProfile(fio)
  printer.printFooter(fio)
end
