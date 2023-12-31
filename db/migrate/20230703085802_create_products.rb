class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false, default: ""
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.decimal :amount, default: 0

      t.timestamps
    end
  end
end
