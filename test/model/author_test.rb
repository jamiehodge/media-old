require_relative "../db_helper"
require_relative "../../lib/media/model/author"

module Media
  module Model
    class AuthorTest < DBTestCase

      def setup
        @params = { id: "abc123" }
        @object = Author.new(@params)
      end

      %w(id items).each do |key|
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

      def test_validates_exact_length_id
        @object.id = "a"*5
        refute @object.valid?
        @object.id = "a"*7
        refute @object.valid?
      end

      def test_validates_format_id
        @object.id = "bad group id"
        refute @object.valid?
      end
    end
  end
end
