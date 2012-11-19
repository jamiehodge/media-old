require_relative "persistent"

module Media
  module Model
    class Authorship < Persistent
      set_dataset(:authors_items)
    end
  end
end
