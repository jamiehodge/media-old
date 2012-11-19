Sequel.migration do
  change do
    create_table :languages do
      citext :id, primary_key: true
      String :name

      validate do
        presence     [:id, :name]
        exact_length 2, :id
        max_length   255, :name
      end
    end
  end
end

