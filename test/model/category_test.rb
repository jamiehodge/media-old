require_relative "../db_helper"
require_relative "../../lib/media/model/category"

module Media
  module Model
    class CategoryTest < DBTestCase

      def setup
        @params = { id: 100, name: "Test" }
        @object = Category.new(@params)
      end

      %w(id name subcategories items).each do |key|
        define_method "test_responds_to_#{key}" do
          assert_respond_to @object, key
        end
      end

      %w(name).each do |key|
        define_method "test_validates_presence_#{key}" do
          @object.send "#{key}=", nil
          refute @object.valid?
        end
      end

      def test_validates_max_length_name
        @object.name = "a"*256
        refute @object.valid?
      end
    end
  end
end

