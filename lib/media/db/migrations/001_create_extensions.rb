Sequel.migration do
  up do
    create_constraint_validations_table

    run 'CREATE EXTENSION moddatetime'
    run 'CREATE EXTENSION citext'
    run 'CREATE EXTENSION hstore'
  end
  down do
    run 'DROP EXTENSION hstore'
    run 'DROP EXTENSION citext'
    run 'DROP EXTENSION moddatetime'

    drop_constraint_validations_table
  end
end
