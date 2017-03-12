class CreateRounds < ActiveRecord::Migration[5.0]
  def change
    create_table :rounds do |t|
      t.string :name
      t.integer :number_of_rounds, default: 1
      t.timestamps
    end
  end
end
