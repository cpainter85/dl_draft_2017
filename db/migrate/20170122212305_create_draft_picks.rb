class CreateDraftPicks < ActiveRecord::Migration[5.0]
  def change
    create_table :draft_picks do |t|
      t.string :name
      t.integer :user_id
      t.integer :category_id
      t.integer :round_drafted
      t.timestamps
    end
  end
end
