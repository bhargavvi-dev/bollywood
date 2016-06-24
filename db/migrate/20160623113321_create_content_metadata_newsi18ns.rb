class CreateContentMetadataNewsi18ns < ActiveRecord::Migration
  def change
    create_table :content_metadata_newsi18ns do |t|
    	t.integer :content_metadata_news_id
        t.string :title
        t.string :language_code

      t.timestamps null: false
    end
  end
end
