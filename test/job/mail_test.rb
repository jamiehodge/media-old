require_relative "../helper"
require_relative "../../lib/media/job/mail"

module Media
  module Job
    class MailTest < MiniTest::Unit::TestCase

      def setup
        ENV["MAIL_ADDRESS"] = "address"
        ENV["MAIL_DOMAIN"]  = "domain"

        @client = MiniTest::Mock.new
        @params = {
          "to"      => "to",
          "from"    => "from",
          "subject" => "subject",
          "body"    => "body"
        }
        @object = Mail.new(@params.merge("client" => @client))
      end

      def test_delivers_mail
        @client.expect(:mail, true, [to: "to", from: "from", subject: "subject", body: "body", via: :smtp, via_options: { address: "address", domain: "domain" }])
        @object.perform
        @client.verify
      end
    end
  end
end
