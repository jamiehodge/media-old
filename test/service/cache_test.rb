require_relative "../helper"
require_relative "../../lib/media/service/cache"

module Media
  module Service
    class CacheTest < MiniTest::Unit::TestCase

      def setup
        @client = MiniTest::Mock.new
        @object = Cache.new(client: @client)
      end

      def test_responds_to_fetch
        assert_respond_to(@object, :fetch)
      end

      def test_fetch_value
        @client.expect(:fetch, true, ["media_test", 2592000])
        @object.fetch(key: "test") { true }
        @client.verify
      end
    end
  end
end
