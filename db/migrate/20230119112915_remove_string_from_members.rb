class RemoveStringFromMembers < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :name, :string
  end
end
