module JRuby
  module Profiler
    class CallgrindPrinter < org.jruby.runtime.profile.ProfilePrinter
      # @param [IO] out
      def printHeader(out)
        out.puts("events: process_time")
        out.puts()
      end

      # @param [IO] out
      def printFooter(out)
      end

      # @param [IO] out Where we want to write our output
      # @param [Boolean] is_first (false) Does nothing, at the moment
      def printProfile(out, is_first=false)
        ti = getTopInvocation()
        methods = self.class.methodData(ti);

        methods.entrySet.each do |entry|
          serial = entry.key
          method_data = entry.value
          file, line, method_name = get_info(serial)
          out.puts("fl=#{file}")
          out.puts("fn=#{method_name}")
          out.puts("#{line} #{method_data.selfTime}")

          method_data.children.to_a().each do |child_id|
            next if self.isThisProfilerInvocation(child_id)
            f, l, n = get_info(child_id)
            invs = method_data.rootInvocationsOfChild(child_id)
            num_calls = method_data.invocationsOfChild(child_id).totalCalls
            out.puts("cfl=#{f}")
            out.puts("cfn=#{n}")
            out.puts("calls=#{num_calls} #{l}")
            out.puts("#{l} #{invs.totalTime()}")
          end

          out.puts()
        end
      end

      # @param [Integer]
      # @return filename, line number, method_name 
      def get_info(serial)
        name = self.methodName(serial)
        file = '(jruby_runtime)'
        line = 0

        if pm = self.getProfileData().getProfiledMethods().get(serial)
          if m = pm.getMethod
            if m.respond_to?(:getFile)
              file = m.getFile
            end

            if m.respond_to?(:getLine)
              line = m.getLine
            end
          end
        end

        return [file, line, name]
      end

    end
  end
end

