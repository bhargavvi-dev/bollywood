class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :real_name
      t.string :nick_name
      t.text :address
      t.date :dob
      t.string :hometown
      t.string :religion
      t.string :nationality

      t.timestamps null: false
    end
  end
end
