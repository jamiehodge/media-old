require_relative "adapter/ldap"
require "forwardable"

class User
  extend Forwardable
  def_delegators :entry, :first_name, :last_name, :full_name, :title,
    :primary_institution, :department, :email, :group_name
    
  attr_reader :id

  def initialize(id, adapter)
    @id = id
    @adapter = adapter
  end
  
  def authenticate(password)
    !!adapter.authenticate_user(id, password)
  end
  
  private
  
  attr_reader :adapter
  
  def entry
    adapter.user(id)
  end
end
