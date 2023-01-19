class AddDetailsToHomemembers < ActiveRecord::Migration[7.0]
  def change
    add_column :homemembers, :name, :string
    add_column :homemembers, :user_id, :integer
  end
end
