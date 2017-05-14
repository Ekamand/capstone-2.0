class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :post_id
      t.string :comment_text

      t.timestamps
    end
  end
end
