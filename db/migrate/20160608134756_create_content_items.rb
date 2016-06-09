class CreateContentItems < ActiveRecord::Migration
  def change
    create_table :content_items do |t|
      t.references :data_item, index: true, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
