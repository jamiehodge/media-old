require_relative "../db_helper"
require_relative "../../lib/media/model/collection"

module Media
  module Model
    class CollectionTest < DBTestCase

      def setup
        @params = { title: 100, description: "Test" }
        @object = Collection.new(@params)
      end

      %w(title description items groups links).each do |key|
        define_method "test_responds_to_#{key}" do
          assert_respond_to @object, key
        end
      end

      %w(title description).each do |key|
        define_method "test_validates_presence_#{key}" do
          @object.send "#{key}=", nil
          refute @object.valid?
        end
      end

      def test_validates_max_length_title
        @object.title = "a"*256
        refute @object.valid?
      end
    end
  end
end
