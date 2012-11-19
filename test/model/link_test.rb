require_relative "../db_helper"
require_relative "../../lib/media/model/link"

module Media
  module Model
    class LinkTest < DBTestCase

      def setup
        @params = { url: "http://example.org" }
        @object = Link.new(@params)
      end

      %w(url collections items).each do |key|
        define_method "test_responds_to_#{key}" do
          assert_respond_to @object, key
        end
      end

      %w().each do |key|
        define_method "test_validates_presence_#{key}" do
          @object.send "#{key}=", nil
          refute @object.valid?
        end
      end

      def test_validates_max_length_url
        @object.url = "a"*256
        refute @object.valid?
      end

      def test_validates_format_url
        @object.url = "test space"
        refute @object.valid?
      end
    end
  end
end
