class AddfriendidTofriend < ActiveRecord::Migration[7.0]
  def change
    add_column :friends, :friend_id, :integer
  end
end
