# JRuby::Profiler::CallgrindPrinter

## Summary

This gem allows for the printing of JRuby Profiler results in 'callgrind' (sometimes called 'calltree') format. This functionality is similar to that of [ruby-prof](https://github.com/ruby-prof/ruby-prof)'s [RubyProf::CallTreePrinter](https://github.com/ruby-prof/ruby-prof/blob/master/lib/ruby-prof/printers/call_tree_printer.rb), but for the JRuby's Profiler. Specifically, JRuby::Profiler::CallgrindPrinter will produce 'callgrind' formatted output for analysis in any tool that understands Valgrind's 'callgrind' file format, such as KCacheGrind and QCacheGrind.

CallgrindPrinter has been written in pure-ruby, as opposed to Java, simply to see if it was possible (and it was). 

## Installation

Requires JRuby 1.6 or newer, though I've only tested it on JRuby 1.7.9. 
```
gem install jruby-profiler-callgrind-printer
```

## Usage

For a runnable example, see examples/example1.rb. 

Generally, you would do something like the following:
```
require 'jruby/profiler'
require 'jruby/profiler/callgrind_printer'

result = JRuby::Profiler.profile do 
  # Do some expensive stuff.
end

printer = JRuby::Profiler::CallgrindPrinter.new(result)
File.open("callgrind.out", "w") do |fio|
  printer.printHeader(fio)
  printer.printProfile(fio)
  printer.printFooter(fio)
end
```

and then run the above with 'jruby --profile.api your_code.rb'. You can then open up 'callgrind.out' with Kcachegrind or Qcachegrind. 

## Important!
The jruby profiler is disabled by default. You *must* run jruby with the '--profile.api' switch in order for any data to be gathered. Something along the lines of 'jruby --profile.api some_script.rb'

If you don't enable the profiler, everything will run fine, but it will seem as though no data is being gathered, and somewhat empty outputs will be produced. 

## Todo

* Specs :)

## References

* [Callgrind Format Specification](http://valgrind.org/docs/manual/cl-format.html)




