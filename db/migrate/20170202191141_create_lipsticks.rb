class CreateLipsticks < ActiveRecord::Migration[5.0]
  def change
    create_table :lipsticks do |t|
      t.string :name, null: false
      t.string :brand
      t.string :image_url
      t.string :product_link
      t.string :description
      t.timestamps
    end
  end
end
