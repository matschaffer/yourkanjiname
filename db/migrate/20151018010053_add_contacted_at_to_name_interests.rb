class AddContactedAtToNameInterests < ActiveRecord::Migration
  def change
    add_column :name_interests, :contacted_at, :timestamp
  end
end
