class CreateContentMetadataEvents < ActiveRecord::Migration
  def change
    create_table :content_metadata_events do |t|
      t.references :content_item, index: true, foreign_key: true
      t.string :organisers
      t.string :location
      t.date :date

      t.timestamps null: false
    end
  end
end
