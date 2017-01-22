class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.integer :round
      t.timestamps
    end
  end
end
