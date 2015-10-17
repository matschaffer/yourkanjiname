class CreateTransliterations < ActiveRecord::Migration
  def change
    create_table :transliterations do |t|
      t.belongs_to :source_name, index: true, foreign_key: true
      t.string :kanji
      t.string :hiragana
      t.string :romaji
      t.text :explanation

      t.timestamps null: false
    end
  end
end
