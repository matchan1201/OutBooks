class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :image_id
      t.string :author
      t.integer :evaluation
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
