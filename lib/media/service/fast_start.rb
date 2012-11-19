require "shellwords"

require_relative "system"

module Media
  module Service
    module FastStart
      extend self

      def encode(input, output, gateway=System)

        cmd = [] << "qt-faststart" << input << output

        gateway.call(cmd.shelljoin)
      end
    end
  end
end

