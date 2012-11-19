require_relative "../helper"
require_relative "../../lib/media/service/storage.rb"

require "tmpdir"
require "stringio"

module Media
  module Service
    StubbedAsset = Struct.new(:group, :name, :file)

    class StorageTest < MiniTest::Unit::TestCase

      def run(*args, &block)
        Dir.mktmpdir { |dir| @dir = dir; super }
      end

      def setup
        @asset  = StubbedAsset.new(123, "foo.txt", StringIO.new("foo"))
        @object = Storage.new(path: @dir)
      end

      # TODO Test methods in isolation

      def test_shuttle
        @object << @asset
        item = @object.find(@asset)
        assert_equal("foo", item.read)
      end

      def test_overwrite
        2.times { @object << @asset }
        item = @object.find(@asset)
        assert_equal("foo", item.read)
      end

      def test_find
        @object << @asset
        item = @object.find(@asset)
        assert_equal("foo", item.read)
      end
    end
  end
end
