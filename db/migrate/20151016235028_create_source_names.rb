class CreateSourceNames < ActiveRecord::Migration
  def change
    create_table :source_names do |t|
      t.string :name
      t.string :country

      t.timestamps null: false
    end
  end
end
