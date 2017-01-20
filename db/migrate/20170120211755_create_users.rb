class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :team_name
      t.string :team_abbr
      t.integer :start_order, default: 0
      t.boolean :admin, default: false
      t.integer :semifinals_order, default: 0
      t.integer :finals_order, default: 0
      t.timestamps
    end
  end
end
