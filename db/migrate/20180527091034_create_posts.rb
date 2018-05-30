class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :name, null: false
      t.text :content
      t.references :category

      t.timestamps
    end
  end
end
