Sequel.migration do
  up do
    create_table :items do
      primary_key :id

      foreign_key :collection_id, :collections, index: true, on_delete: :cascade
      foreign_key :language_id, :languages, type: :citext, index: true
      foreign_key :rating_id, :ratings, type: :citext, index: true
      foreign_key :category_id, :categories, index: true
      Fixnum      :subcategory_id
      foreign_key [:category_id, :subcategory_id], :subcategories, index: true

      String      :title
      String      :description

      DateTime    :created_at, default: Sequel::CURRENT_TIMESTAMP
      DateTime    :updated_at, default: Sequel::CURRENT_TIMESTAMP

      full_text_index [:title, :description]

      validate do
        presence [:title, :description,
          :collection_id, :language_id, :rating_id]
        max_length 255, :title
      end
    end

    create_trigger :items, :timestamp, :moddatetime,
      args: :updated_at, each_row: true, events: :update
  end

  down do
    drop_trigger :items, :timestamp
    drop_table :items
  end
end
