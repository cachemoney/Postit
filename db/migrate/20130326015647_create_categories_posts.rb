class CreateCategoriesPosts < ActiveRecord::Migration
  def up
  	create_table :categories_posts do |t|
  		t.integer :post_id, :category_id
  		t.timestamps
  	end
  end

  def down
  	drop_table :categories_posts
  end
end
