require_relative "persistent"

module Media
  module Model
    class Rating < Persistent
      set_dataset(:ratings)
      
      unrestrict_primary_key
        
      one_to_many :items
        
      plugin :static_cache
    end
  end
end
