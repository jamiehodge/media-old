require "pony"

require_relative "queueable"

module Media
  module Job
    class Mail
      include Queueable

      def initialize(args)
        @to      = args["to"]
        @from    = args["from"]
        @subject = args["subject"]
        @body    = args["body"]
        @client  = args["client"] || Pony
      end

      def perform
        @client.mail(to: @to, from: @from, subject: @subject, body: @body,
          via: :smtp, via_options: { address: address, domain: domain })
      end

      private

      def address
        ENV["MAIL_ADDRESS"]
      end

      def domain
        ENV["MAIL_DOMAIN"]
      end
    end
  end
end
