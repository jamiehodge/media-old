require_relative "../service/arguments"

module Media
  module Controller
    class Base
      
      def initialize(args)
        args = defaults.merge(args)
        
        @model = args[:model]
        @user  = args[:user]
        @view  = args[:view]
        @arguments = args[:arguments]
      end
      
      def create(args)
        authorize!(:create)
        
        instance = model.create(filter(args))
        
        view.new(instance)
      end
      
      def read(args)
        authorize!(:read)
        
        id = args.delete(:id)
        instance = model[id]
        
        view.new(instance)
      end
      
      def update(args)
        authorize!(:update)
        
        id = args.delete(:id)
        instance = model[id]
        
        instance.update(filter(args))
        
        view.new(instance)
      end
      
      def delete(args)
        authorize!(:delete)
        
        id = args.delete(:id)
        instance = model[id]
        
        instance.destroy
        
        view.new(instance)
      end
      
      def list
        authorize!(:list)
        
        view.list(model)
      end
      
      private
      
      attr_reader :model, :user, :view, :arguments
      
      def authorize!(action)
        raise AuthenticationError unless user.authorized?(action)
      end
      
      def filter(fields)
        arguments.new(fields).filter(authorized_fields)
      end
      
      def authorized_fields
        user.authorized_fields(resource.to_sym)
      end
      
      def resource
        self.class.name.split("::").first
      end
      
      def defaults
        { arguments: Service::Arguments }
      end
    end
  end
end
