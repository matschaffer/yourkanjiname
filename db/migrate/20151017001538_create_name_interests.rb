class CreateNameInterests < ActiveRecord::Migration
  def change
    create_table :name_interests do |t|
      t.string :email_address
      t.string :entered_name

      t.timestamps null: false
    end
  end
end
