class AddColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :likes, :integer
  end
end
