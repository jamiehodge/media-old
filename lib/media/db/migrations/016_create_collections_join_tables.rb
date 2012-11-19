Sequel.migration do
  change do
    create_table(:collections_groups) do
      foreign_key :collection_id, :collections, null: false
      foreign_key :group_id, :groups, null: false, type: :citext

      foreign_key :status_id, :statuses, null: false, type: :citext

      primary_key [:collection_id, :group_id]
      index [:group_id, :collection_id]
    end

    create_table(:collections_links) do
      foreign_key :collection_id, :collections, null: false
      foreign_key :link_id, :links, null: false, type: :citext
      primary_key [:collection_id, :link_id]
      index [:link_id, :collection_id]
    end
  end
end
