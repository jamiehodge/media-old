require "open3"

module Media
  module Service
    module System
      extend self

      Capture = Struct.new(:out, :error, :success?)

      def call(cmd)
        out, error, status = Open3.capture3(cmd)
        Capture.new(out, error, status.success?)
      end
    end
  end
end
