class CreateMersenneNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :mersenne_numbers do |t|
      t.integer :max_number
      t.string :numbers

      t.timestamps
    end
  end
end
