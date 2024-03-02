class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :user
      t.integer :stars
      t.text :review_text

      t.timestamps
    end
  end
end
