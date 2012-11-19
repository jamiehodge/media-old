require "dalli"

module Media
  module Service
    class Cache

      def initialize(args={})
        args = defaults.merge(args)

        @client    = args[:client]
        @namespace = args[:namespace]
      end

      def fetch(args, &value)
        ttl = args[:ttl] || 2592000
        key = namespaced(args[:key])

        client.fetch(key, ttl, &value)
      end

      private

      attr_reader :client, :namespace

      def namespaced(key)
        [@namespace, key].join("_")
      end

      def defaults
        {
          client: Dalli::Client.new(ENV["MEDIA_CACHE"]),
          namespace: "media"
        }
      end
    end
  end
end

