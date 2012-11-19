require_relative "../helper"
require_relative "../../lib/media/job/ping"

module Media
  module Job
    class PingTest < MiniTest::Unit::TestCase

      def setup
        ENV["MEDIA_PODCAST_SERVER"] = "http://example.org"

        @client = MiniTest::Mock.new
        @object = Ping.new("url" => "http://", "client" => @client)
      end

      def test_pings_url
        @client.expect(:get, true, [url: "http://example.org?feedURL=http://" ])
        @object.perform
        @client.verify
      end
    end
  end
end
