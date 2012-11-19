module Media
  module Service
    class Storage
      module Lockable

        def lock(mode="a", &block)
          open(mode) do |f|
            begin
              f.flock File::LOCK_EX
              yield f
            ensure
              f.flock File::LOCK_UN
            end
          end
        end
      end
    end
  end
end
