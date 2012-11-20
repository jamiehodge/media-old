require_relative "../helper"
require_relative "../../lib/media/controller/base"

module Media
  module Controller
    
    StubbedUser = Struct.new(:id) do
      def authorized?(action)
        true
      end
      def authorized_fields(action)
        [:foo]
      end
    end
    
    class BaseTest < MiniTest::Unit::TestCase
      
      def model
        @model ||= MiniTest::Mock.new
      end
      
      def view
        @view ||= MiniTest::Mock.new
      end
      
      def setup
        @user   = StubbedUser.new(1)
        @object = Base.new(model: model, user: @user, view: view) 
      end
      
      %w(create read update delete list).each do |key|
        define_method "test_responds_to_#{key}" do
          assert_respond_to @object, key
        end
      end
      
      def test_create
        model.expect(:create, model, [foo: "bar"])
        view.expect(:new, view, [model])
        @object.create(foo: "bar", baz: "qux")
        model.verify
        view.verify
      end
      
      def test_read
        model.expect(:[], model, [1])
        view.expect(:new, view, [model])
        @object.read(id: 1)
        model.verify
        view.verify
      end
      
      def test_update
        model.expect(:[], model, [1])
        model.expect(:update, model, [foo: "bar"])
        view.expect(:new, view, [model])
        @object.update(id: 1, foo: "bar", baz: "qux")
        model.verify
        view.verify
      end
      
      def test_delete
        model.expect(:[], model, [1])
        model.expect(:destroy, model)
        view.expect(:new, view, [model])
        @object.delete(id: 1)
        model.verify
        view.verify
      end
      
      def test_list
        view.expect(:list, view, [model])
        @object.list
        view.verify
      end
    end
  end
end
