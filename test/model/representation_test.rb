require_relative "../db_helper"
require_relative "../../lib/media/model/representation"

module Media
  module Model
    class RepresentationTest < DBTestCase

      def setup
        @params = { asset_id: 1, encoder_id: 2 }
        @object = Representation.new(@params)
      end

      %w(asset encoder).each do |key|
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
    end
  end
end
