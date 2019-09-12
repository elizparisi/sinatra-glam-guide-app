class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :rating
      t.string :image_url
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
