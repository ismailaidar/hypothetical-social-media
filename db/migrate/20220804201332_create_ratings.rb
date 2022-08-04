class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :rater, null: false, foreign_key: true
      t.integer :stars, default: 0

      t.timestamps
    end
  end
end
