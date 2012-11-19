require_relative "persistent"

module Media
  module Model
    class Author < Persistent
      set_dataset(:authors)
      
      unrestrict_primary_key
        
      many_to_many :items
    end
  end
end

