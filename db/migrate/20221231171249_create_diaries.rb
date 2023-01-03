class CreateDiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :diaries do |t|
      t.text :body
      t.string :title
      t.string :avatar
      t.string :whodiary
      t.integer :user_id
      t.datetime :when_diary
      t.timestamps
    end
  end
end
