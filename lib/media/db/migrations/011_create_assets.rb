Sequel.migration do
  change do
    create_table :assets do
      primary_key :id
      foreign_key :item_id, :items, index: true, on_delete: :cascade

      String      :name
      String      :type
      Fixnum      :size

      validate do
        presence   [:item_id, :name, :type, :size]
        max_length 255, [:name, :type]
        format     %r{^[^\s\\'"]+$}, :name
        format     %r{^[-\w.+]+/[-\w.+]*$}, :type
      end
    end
  end
end
