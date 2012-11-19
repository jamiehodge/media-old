require "sequel"
require "pg"

module Media
  module Model
    Sequel.extension(:constraint_validations, :pg_hstore, :blank, :pagination)

    DB = Sequel.connect(ENV["DATABASE_URL"])
    DB.extension(:pg_hstore)
  end
end
