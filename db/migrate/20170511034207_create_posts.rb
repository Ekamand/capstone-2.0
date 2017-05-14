class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :user_id
      t.string :title
      t.string :post_text
      t.string :ingredients
      t.string :directions

      t.timestamps
    end
  end
end
