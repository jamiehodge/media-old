Sequel.migration do
  change do
    create_table :encoders do
      citext      :name, primary_key: true
      hstore      :options

      validate do
        presence [:name, :options]
        format   %r{^[^\s\\'"]+$}, :name
      end
    end
  end
end
