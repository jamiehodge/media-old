module Media
  module Model
    class Query
  
      def initialize(query)
        @query = query
      end
  
      def prefixes
        terms.map {|term| "#{term}:*" }
      end
  
      private
  
      attr_reader :query
  
      def terms
        query.split
      end
    end
  end
end
