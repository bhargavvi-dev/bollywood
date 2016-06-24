class CreateContentMetadataNews < ActiveRecord::Migration
  def change
    create_table :content_metadata_news do |t|
      t.references :data_item, index: true, foreign_key: true
      t.string :auhtor
      t.string :publisher
      t.date :issue_date

      t.timestamps null: false
    end
  end
end
