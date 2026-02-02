class CreateUserLikes < ActiveRecord::Migration[7.1]
  def change
    create_table :user_likes do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
