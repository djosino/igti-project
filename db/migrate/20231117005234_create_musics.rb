class CreateMusics < ActiveRecord::Migration[7.1]
  def change
    create_table :musics do |t|
      t.references :album, null: false, foreign_key: true
      t.string :title
      t.string :feat, array: true
      t.date :release_date

      t.timestamps
    end
  end
end
