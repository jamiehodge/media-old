require_relative "../db_helper"
require_relative "../../lib/media/model/group"

module Media
  module Model
    class GroupTest < DBTestCase

      def setup
        @params =
          { id: "test_group" }
        @object = Group.new(@params)
      end

      %w(id collections).each do |key|
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

      def test_validates_max_length_id
        @object.id = "a"*256
        refute @object.valid?
      end

      def test_validates_format_id
        @object.id = "bad group id \'\""
        refute @object.valid?
      end
    end
  end
end
