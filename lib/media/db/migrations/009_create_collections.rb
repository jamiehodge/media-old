Sequel.migration do
  up do
    create_table :collections do
      primary_key :id

      String      :title
      String      :description

      DateTime    :created_at, default: Sequel::CURRENT_TIMESTAMP
      DateTime    :updated_at, default: Sequel::CURRENT_TIMESTAMP

      full_text_index [:title, :description]

      validate do
        presence   [:title, :description]
        max_length 255, :title
      end
    end

    create_trigger :collections, :timestamp, :moddatetime, args: :updated_at, each_row: true, events: :update
  end

  down do
    drop_trigger :collections, :timestamp
    drop_table :collections
  end
end

