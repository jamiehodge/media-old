Sequel.migration do
  change do
    create_table :authors do
      citext :id, primary_key: true

      validate do
        presence :id
        exact_length 6, :id
        format   %r{^[a-z]{3}\d{3}$}, :id
      end
    end
  end
end
