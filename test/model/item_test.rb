require_relative "../db_helper"
require_relative "../../lib/media/model/item"

module Media
  module Model
    class ItemTest < DBTestCase

      def setup
        @params = { title: 100, description: "Test" }
        @object = Item.new(@params)
      end

      %w(title description collection authors links category subcategory
         language rating asset).each do |key|
        define_method "test_responds_to_#{key}" do
          assert_respond_to @object, key
        end
      end

      %w(title description collection_id category_id
        language_id rating_id).each do |key|
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
