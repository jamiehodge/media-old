require "socket"
require "open-uri"

module Media
  module Service
    module HTTP
      extend self

      def get(args)
        response = fetch(args[:url])
        response.read if response
      end

      def valid?(args)
        !!fetch(args[:url])
      end

      private

      def fetch(url)
        open(url)
      rescue SocketError, OpenURI::HTTPError
        nil
      end

      def parse(url)
        URI(url)
      end
    end
  end
end
