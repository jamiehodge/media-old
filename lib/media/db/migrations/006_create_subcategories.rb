Sequel.migration do
  change do
    create_table :subcategories do
      Fixnum      :id
      foreign_key :category_id, :categories, index: true, on_delete: :cascade

      String      :name
      primary_key [:category_id, :id]

      validate do
        presence   [:id, :category_id, :name]
        max_length 255, :name
      end
    end
  end
end
