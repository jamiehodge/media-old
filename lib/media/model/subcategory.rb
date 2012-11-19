require_relative "persistent"

module Media
  module Model
    class Subcategory < Persistent
      set_dataset(:subcategories)
      
      unrestrict_primary_key
        
      many_to_one :category
        
      one_to_many :items, key: [:id, :category_id]
        
      plugin :static_cache
    end
  end
end
