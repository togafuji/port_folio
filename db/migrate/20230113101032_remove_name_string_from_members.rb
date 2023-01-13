class RemoveNameStringFromMembers < ActiveRecord::Migration[7.0]
  def change
    remove_column :members, :name_string, :string
  end
end
