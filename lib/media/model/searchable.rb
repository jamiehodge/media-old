require_relative "query"

module Media
  module Model
    module Searchable
  
      def searchable(default_fields)
        def_dataset_method(:search) do |query,fields=default_fields|
          return self if query.blank?
          full_text_search(fields, Query.new(query).prefixes)
        end
      end
    end
  end
end

