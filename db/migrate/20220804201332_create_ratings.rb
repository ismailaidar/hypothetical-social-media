class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :user
      t.references :rater
      t.integer :stars, default: 0

      t.timestamps
    end
  end
end
