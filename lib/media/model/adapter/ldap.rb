require "ku/ldap"
require "forwardable"

module Media
  module Model
    module Adapter
      class LDAP
        extend Forwardable
        def_delegators :ldap, :user, :authenticate_user
      
        def initialize(args)
          @ldap = args[:ldap] || KU::LDAP
        end
      
        private
      
        attr_reader :ldap
      end
    end
  end
end