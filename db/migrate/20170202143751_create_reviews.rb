class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :rating, null: false
      t.text    :body
      t.belongs_to :user
      t.belongs_to :mascara
      t.belongs_to :eyeshadow
      t.belongs_to :lipstick

      t.timestamps
    end
  end
end
