class CreateHomemembers < ActiveRecord::Migration[7.0]
  def change
    create_table :homemembers do |t|

      t.timestamps
    end
  end
end
