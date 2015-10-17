class RenameHiraganaToKatakana < ActiveRecord::Migration
  def change
    rename_column :transliterations, :hiragana, :katakana
  end
end
