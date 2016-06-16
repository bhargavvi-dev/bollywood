class CreateContentResources < ActiveRecord::Migration
  def change
    create_table :content_resources do |t|

      t.timestamps null: false
    end
  end
end
