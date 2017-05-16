class AddphotoColumnToUserTable < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :photo, :string
  	add_column :posts, :origin, :string
  end
end
