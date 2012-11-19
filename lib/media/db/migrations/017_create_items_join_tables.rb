Sequel.migration do
  change do
    create_table(:items_authors) do
      foreign_key :item_id, :items, null: false
      foreign_key :author_id, :authors, null: false, type: :citext

      foreign_key :status_id, :statuses, null: false, type: :citext
      foreign_key :license_id, :licenses, null: false, type: :citext

      primary_key [:item_id, :author_id]
      index [:author_id, :item_id]
    end

    create_table(:items_links) do
      foreign_key :item_id, :items, null: false
      foreign_key :link_id, :links, null: false, type: :citext
      primary_key [:item_id, :link_id]
      index [:link_id, :item_id]
    end
  end
end
