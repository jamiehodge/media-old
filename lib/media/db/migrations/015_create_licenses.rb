Sequel.migration do
  change do
    create_table :licenses do
      citext :id, primary_key: true
      String :name

      validate do
        presence   [:id, :name]
        max_length 255, [:id, :name]
      end
    end
  end
end
