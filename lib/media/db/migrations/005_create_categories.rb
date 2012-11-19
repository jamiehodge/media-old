Sequel.migration do
  change do
    create_table :categories do
      Fixnum :id, primary_key: true
      String :name

      validate do
        presence   [:id, :name]
        max_length 255, :name
      end
    end
  end
end
