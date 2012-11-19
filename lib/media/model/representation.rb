require_relative "persistent"

module Media
  module Model
    class Representation < Persistent
      set_dataset(:representations)
      
      unrestrict_primary_key
        
      many_to_one :asset
      many_to_one :encoder
    end
  end
end

