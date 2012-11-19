require "pathname"

require_relative "storage/group"
require_relative "storage/item"

module Media
  module Service
    class Storage

      attr_reader :path

      def initialize(args)
        @path        = Pathname(args[:path])
        @group_class = args.fetch(:group_class, Group)
        @item_class  = args.fetch(:item_class, Item)
      end

      def <<(asset)
        find(asset).write(file: asset.file)
      end

      def find(asset)
        @item_class.new(group: group(asset.group), name: asset.name)
      end

      private

      def group(id)
        @group_class.new(parent: self, id: id)
      end
    end
  end
end
