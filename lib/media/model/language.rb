require_relative "persistent"

module Media
  module Model
    class Language < Persistent
      set_dataset(:languages)
             
      unrestrict_primary_key
        
      one_to_many :items
        
      plugin :static_cache
    end
  end
end

