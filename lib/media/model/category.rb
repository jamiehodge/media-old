require_relative "persistent"

module Media
  module Model
    class Category < Persistent
      set_dataset(:categories)
      
      unrestrict_primary_key
        
      one_to_many :items
      one_to_many :subcategories
        
      plugin :static_cache
    end
  end
end
