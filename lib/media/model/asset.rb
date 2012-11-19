require_relative "persistent"

module Media
  module Model
    class Asset < Persistent
      set_dataset(:assets)
      
      one_to_many :representations
        
      many_to_one :item
    end
  end
end
