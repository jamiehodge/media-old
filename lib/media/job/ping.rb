require_relative "../service/http"
require_relative "queueable"

module Media
  module Job
    class Ping
      include Queueable

      def initialize(args)
        args = defaults.merge(args)
        
        @url    = args["url"]
        @client = args["client"]
      end

      def perform
        @client.get(url: url)
      end

      private

      def url
        "#{ENV['MEDIA_PODCAST_SERVER']}?feedURL=#{@url}"
      end
      
      def defaults
        { "client" => Service::HTTP }
      end
    end
  end
end

