require_relative "../db_helper"
require_relative "../../lib/media/model/asset"

module Media
  module Model
    class AssetTest < DBTestCase

      def setup
        @params = { name: "foo.txt", type: "text/plain", size: 1000, item_id: 1}
        @object = Asset.new(@params)
      end

      %w(name type size representations item).each do |key|
        define_method "test_responds_to_#{key}" do
          assert_respond_to @object, key
        end
      end

      %w(name type size item_id).each do |key|
        define_method "test_validates_presence_#{key}" do
          @object.send "#{key}=", nil
          refute @object.valid?
        end
      end

      def test_validates_max_length_name
        @object.name = "a"*256
        refute @object.valid?
      end

      def test_validates_max_length_type
        @object.type = "video/" + "a"*250
        refute @object.valid?
      end

      def test_validates_format_name
        @object.name = "bad file name \'\""
        refute @object.valid?
      end

      def test_validates_format_type
        @object.type = "invalid-format"
        refute @object.valid?
      end
    end
  end
end
