require "forwardable"

require_relative "lockable"

module Media
  module Service
    class Storage
      class Item
        extend Forwardable
        def_delegators :path, :read, :size

        def initialize(args)
          @group = args[:group]
          @name  = args[:name]
        end

        def write(args)
          mkdir
          locked_write(args[:file])
          self
        end

        def delete
          path.delete
          self
        end

        def path
          @group.path + @name
        end

        private

        def mkdir
          @group.mkpath
        end

        def locked_write(file, mode="a", buffer=4096)
          p = path.dup
          p.extend(Lockable)
          p.lock(mode) do |f|
            f.write(file.read(buffer)) until file.eof?
          end
        end
      end
    end
  end
end
