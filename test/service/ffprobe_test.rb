require_relative "../helper"
require_relative "../../lib/media/service/ffprobe"

module Media
  module Service
    StubbedCapture = Struct.new(:out, :error) do
      def success?; true; end
    end

    class FFProbeTest < MiniTest::Unit::TestCase

      def setup
        @gateway = MiniTest::Mock.new
        @capture = StubbedCapture.new("{}", "")
        @object = FFProbe
      end

      def test_responds_to_analyse
        assert_respond_to(@object, :analyse)
      end

      def test_executes_default_cmd
        @gateway.expect(:call, @capture,
          ["ffprobe -v quiet -print_format json -show_format -show_streams -i input"])
        @object.analyse("input", @gateway, {})
        @gateway.verify
      end

      def test_executes_custom_cmd
        @gateway.expect(:call, @capture,
          ["ffprobe -v quiet -print_format json -show_format -show_streams -foo bar -i input"])
        @object.analyse("input", @gateway, foo: "bar")
        @gateway.verify
      end
    end
  end
end
