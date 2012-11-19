require_relative "persistent"

module Media
  module Model
    class Link < Persistent
      set_dataset(:links)
      
      unrestrict_primary_key
        
      many_to_many :collections
      many_to_many :items
    end
  end
end
