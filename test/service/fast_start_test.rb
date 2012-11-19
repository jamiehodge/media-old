require_relative "../helper"
require_relative "../../lib/media/service/fast_start"

module Media
  module Service
    class FastStartTest < MiniTest::Unit::TestCase

      def setup
        @gateway = MiniTest::Mock.new
        @object = FastStart
      end

      def test_responds_to_encode
        assert_respond_to(@object, :encode)
      end

      def test_executes_cmd
        @gateway.expect(
          :call, true, ["qt-faststart input output"])
        @object.encode("input", "output", @gateway)
        @gateway.verify
      end
    end
  end
end
