require_relative "persistent"
require_relative "searchable"

module Media
  module Model
    class Item < Persistent
      set_dataset(:items)
      
      extend Searchable
  
      searchable [:title, :description]
  
      one_to_one   :asset
                
      many_to_one  :category
      many_to_one  :collection
      many_to_one  :language
      many_to_one  :rating
      many_to_one  :subcategory
        
      many_to_many :authors
      many_to_many :links
     
      def_dataset_method(:authored_by) do |author_id|
        join(:authors_items, item_id: :id, author_id: author_id)
      end
    end
  end
end
