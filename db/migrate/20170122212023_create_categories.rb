class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :minimum, default: 2
      t.integer :maximum, default: 4
      t.boolean :include_semi_finals, default: false
      t.boolean :include_finals, default: false
      t.timestamps
    end
  end
end
