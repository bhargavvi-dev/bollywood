class CreateArtistUsers < ActiveRecord::Migration
  def change
    create_table :artist_users do |t|
      t.references :artist, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.boolean :is_admin, :default => false

      t.timestamps null: false
    end
  end
end
