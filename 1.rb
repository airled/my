Sequel.migration do
up do
  create_table :urls do
    primary_key :id
      String :url
    end
  end
  down do
    drop_table(:urls)
  end
end