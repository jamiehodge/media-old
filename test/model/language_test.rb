require_relative "../db_helper"
require_relative "../../lib/media/model/language"

module Media
  module Model
    class LanguageTest < DBTestCase

      def setup
        @params = { id: "xy", name: "test" }
        @object = Language.new(@params)
      end

      %w(id name items).each do |key|
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

      def test_exact_length_id
        @object.id = "a"
        refute @object.valid?
        @object.id = "aaa"
        refute @object.valid?
      end

      def test_validates_max_length_name
        @object.name = "a"*256
        refute @object.valid?
      end
    end
  end
end
