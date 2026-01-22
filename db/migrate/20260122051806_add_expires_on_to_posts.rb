class AddExpiresOnToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :expires_on, :date
  end
end
