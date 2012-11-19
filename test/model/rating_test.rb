require_relative "../db_helper"
require_relative "../../lib/media/model/rating"

module Media
  module Model
    class RatingTest < DBTestCase

      def setup
        @params = { name: "test" }
        @object = Rating.new(@params)
      end

      %w(name items).each do |key|
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

      def test_validates_max_length_name
        @object.name = "a"*256
        refute @object.valid?
      end
    end
  end
end

