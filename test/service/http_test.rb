require_relative "../helper"
require_relative "../../lib/media/service/http"

module Media
  module Service
    class HTTPTest < MiniTest::Unit::TestCase

      def setup
        @object = HTTP
        @valid_url = "http://google.com"
        @invalid_url = "http://google.invalid"
      end

      def test_responds_to_get
        assert_respond_to(@object, :get)
      end

      def test_get_valid_url
        assert_match("<title>Google</title>",
          @object.get(url: @valid_url))
      end

      def test_get_invalid_url
        refute(@object.get(url: @invalid_url))
      end

      def test_validate_url
        assert(@object.valid?(url: @valid_url))
      end

      def test_invalidates_url
        refute(@object.valid?(url: @invalid_url))
      end
    end
  end
end
