require_relative "../db_helper"
require_relative "../../lib/media/model/encoder"

module Media
  module Model
    class EncoderTest < DBTestCase

      def setup
        @params = { name: "example.foo", options: { foo: "bar" }}
        @object = Encoder.new(@params)
      end

      %w(name options representations).each do |key|
        define_method "test_responds_to_#{key}" do
          assert_respond_to @object, key
        end
      end

      %w(options).each do |key|
        define_method "test_validates_presence_#{key}" do
          @object.send "#{key}=", nil
          refute @object.valid?
        end
      end

      def test_validates_format_name
        @object.name = "bad file name \'\""
        refute @object.valid?
      end
    end
  end
end
