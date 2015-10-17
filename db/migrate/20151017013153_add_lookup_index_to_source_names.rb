class AddLookupIndexToSourceNames < ActiveRecord::Migration
  def change
    add_index :source_names, [:country, :name]
  end
end
