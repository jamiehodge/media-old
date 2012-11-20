require_relative "../service/ffmpeg"
require_relative "../service/arguments"
require_relative "queueable"

module Media
  module Job
    class Encode
      include Queueable

      def initialize(args)
        @input   = args["input"]
        @output  = args["output"]
        @options = Service::Arguments.new(args["options"])
        @client  = args["client"] || FFMPEG
      end

      def perform
        @client.encode(@input, @output, @options.symbolize)
      end
    end
  end
end
