class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :nickname
      t.string :full_name
      t.date :birthday
      t.string :country

      t.timestamps
    end
  end
end
