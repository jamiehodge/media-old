module Media
  module Service
    class Arguments
  
      attr_reader :args
  
      def initialize(args)
        @args = args
      end
  
      def filter(allowed)
        @args.select { |k,v| allowed.include?(k) }
      end
  
      def symbolize
        @args = args.each_with_object({}) { |(k,v),obj| obj[k.to_sym] = v }
      end
  
      def stringify
        @args = args.each_with_object({}) { |(k,v),obj| obj[k.to_s] = v }
      end
    end
  end
end
