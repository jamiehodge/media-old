require_relative "persistent"

module Media
  module Model
    class Group < Persistent
      set_dataset(:groups)
         
      unrestrict_primary_key
        
      many_to_many :collections
    end
  end
end

