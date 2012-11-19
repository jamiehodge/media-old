Sequel.migration do
  change do
    create_table :statuses do
      citext :name, primary_key: true

      validate do
        presence   :name
        max_length 255, :name
      end
    end
  end
end
