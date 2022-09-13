class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :body
      t.string :link 
      t.integer :user_id
    end
  end
end
