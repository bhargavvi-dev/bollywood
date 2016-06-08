class CreateDataItems < ActiveRecord::Migration
  def change
    create_table :data_items do |t|
      t.references :artist, index: true, foreign_key: true
      t.string :type
      t.string :title
      t.boolean :is_active, :default =>false

      t.timestamps null: false
    end
  end
end
