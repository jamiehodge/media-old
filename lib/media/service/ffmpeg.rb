require "shellwords"

require_relative "system"

module Media
  module Service
    module FFMPEG
      extend self

      def encode(input, output, gateway=System, args={})
        args = defaults.merge(args)

        cmd = []
        cmd << "ffmpeg"
        cmd << "-i" << input
        cmd += arguments(args)
        cmd << output

        gateway.call(cmd.shelljoin)
      end

      private

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
        { v: "quiet", y: true }
      end
    end
  end
end
