require_relative "helper"

require "sequel"

class DBTestCase < MiniTest::Unit::TestCase
  def run(*args, &block)
    result = nil
    Sequel::Model.db.transaction(rollback: :always) { result = super }
  end
end
