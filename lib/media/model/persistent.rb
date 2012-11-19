require_relative "db"

module Media
  module Model
    class Persistent < Sequel::Model
      self.raise_on_typecast_failure = false
      self.raise_on_save_failure = false
      
      plugin(:string_stripper)
      plugin(:prepared_statements)
      plugin(:prepared_statements_associations)
      plugin(:constraint_validations)
    end
  end
end


