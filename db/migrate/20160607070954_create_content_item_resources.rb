class CreateContentItemResources < ActiveRecord::Migration
  def change
    create_table :content_item_resources do |t|
      t.references :content_item, index: true, foreign_key: true
      t.references :content_resource, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
