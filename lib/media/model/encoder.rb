require_relative "persistent"

module Media
  module Model
    class Encoder < Persistent
      set_dataset(:encoders)
      
      unrestrict_primary_key
        
      one_to_many :representations
    end
  end
end
