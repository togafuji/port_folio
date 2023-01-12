class AddNameToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :name, :string
  end
end
