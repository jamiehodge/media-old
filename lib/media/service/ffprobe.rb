require "shellwords"
require "json"

require_relative "system"

module Media
  module Service
    module FFProbe
      extend self

      def analyse(input, system=System, args={})
        args = defaults.merge(args)
        args[:i] = input

        result = system.call(cmd(args))
        JSON.parse(result.out) if result.success?
      end

      private

      def cmd(args)
        result = []
        result << "ffprobe"
        result += arguments(args)
        result.shelljoin
      end

      def arguments(args)
        args.each_with_object([]) do |(k,v),obj|
          next unless v
          if v == true
            obj << "-#{k}" if v == true
          else
            obj << "-#{k}" << v
          end
        end
      end

      def defaults
        {
          v: "quiet",
          print_format: "json",
          show_format: true,
          show_streams: true
        }
      end
    end
  end
end
