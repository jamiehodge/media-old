Sequel.migration do
  change do
    create_table :groups do
      citext :id, primary_key: true

      validate do
        presence :id
        max_length 255, :id
        format   %r{^[^\s\\'"]+$}, :id
      end
    end
  end
end
