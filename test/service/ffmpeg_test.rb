require_relative "../helper"
require_relative "../../lib/media/service/ffmpeg"

module Media
  module Service
    class FFMPEGTest < MiniTest::Unit::TestCase

      def setup
        @gateway = MiniTest::Mock.new
        @object = FFMPEG
      end

      def test_responds_to_encode
        assert_respond_to(@object, :encode)
      end

      def test_executes_default_cmd
        @gateway.expect(
          :call, true, ["ffmpeg -i input -v quiet -y output"])
        @object.encode("input", "output", @gateway)
        @gateway.verify
      end

      def test_executes_custom_cmd
        @gateway.expect(
          :call, true, ["ffmpeg -i input -v quiet -y -foo bar output"])
        @object.encode("input", "output", @gateway, foo: "bar")
        @gateway.verify
      end
    end
  end
end
