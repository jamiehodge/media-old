require_relative "../helper"
require_relative "../../lib/media/job/encode"

module Media
  module Job
    class EncodeTest < MiniTest::Unit::TestCase

      def setup
        @client = MiniTest::Mock.new
        @object = Encode.new("input" => "input", "output" => "output", "options" => { "foo" => "bar" }, "client" => @client)
      end

      def test_encodes
        @client.expect(:encode, true, ["input", "output", foo: "bar"])
        @object.perform
        @client.verify
      end
    end
  end
end
