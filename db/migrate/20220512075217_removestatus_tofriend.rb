class RemovestatusTofriend < ActiveRecord::Migration[7.0]
  def change
    remove_column :friends, :status, :boolean
  end
end
