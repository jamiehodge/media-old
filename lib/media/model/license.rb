require_relative "persistent"

module Media
  module Model
    class License < Persistent
      set_dataset(:licenses)
      
      unrestrict_primary_key
        
      plugin :static_cache
    end
  end
end
