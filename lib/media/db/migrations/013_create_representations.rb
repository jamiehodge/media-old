Sequel.migration do
  change do
    create_table :representations do
      foreign_key :asset_id, :assets, index: true, on_delete: :cascade

      foreign_key :encoder_id, :encoders, type: :citext, index: true,
        on_delete: :cascade

      primary_key [:asset_id, :encoder_id]

      validate do
        presence [:asset_id, :encoder_id]
      end
    end
  end
end
