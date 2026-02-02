class FixPostsColumns < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :title, :string
    remove_column :posts, :body, :text

    add_column :posts, :content, :text
    add_column :posts, :user_id, :integer
  end
end
