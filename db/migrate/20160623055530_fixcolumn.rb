class Fixcolumn < ActiveRecord::Migration
  def change
  	rename_column :content_metadata_news, :auhtor, :author
  end
end
