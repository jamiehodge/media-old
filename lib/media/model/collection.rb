require_relative "persistent"
require_relative "searchable"

module Media
  module Model
    class Collection < Persistent
      set_dataset(:collections)
      
      extend Searchable
  
      searchable [:title, :description]
  
      one_to_many  :items
        
      many_to_many :groups
      many_to_many :links
        
      def_dataset_method(:owned_by) do |group_id|
        join(:collections_groups, collection_id: :id, group_id: group_id)
      end
    end
  end
end
