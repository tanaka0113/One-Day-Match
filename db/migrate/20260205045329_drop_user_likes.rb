class DropUserLikes < ActiveRecord::Migration[7.1]
  def change
    drop_table :user_likes
  end
end
