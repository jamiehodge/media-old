require "forwardable"

module Media
  module Service
    class Storage
      class Group
        extend Forwardable
        def_delegators :path, :mkpath

        def initialize(args)
          @parent = args[:parent]
          @id     = args[:id]
        end

        def path
          @parent.path + ("%05d" % (@id / 1000)).to_s + @id.to_s
        end
      end
    end
  end
end
