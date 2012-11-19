require_relative "../db_helper"
require_relative "../../lib/media/model/license"

module Media
  module Model
    class LicenseTest < DBTestCase

      def setup
        @params = { id: "xy", name: "test" }
        @object = License.new(@params)
      end

      %w(id name).each do |key|
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

      %w(id name).each do |key|
        define_method "test_validates_max_length_#{key}" do
          @object.send "#{key}=", "a"*256
          refute @object.valid?
        end
      end
    end
  end
end
