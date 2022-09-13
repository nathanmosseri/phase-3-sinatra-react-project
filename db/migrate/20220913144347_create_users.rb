class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :bio
      t.string :email
      t.string :links
      t.integer :phase_id
    end
  end
end
