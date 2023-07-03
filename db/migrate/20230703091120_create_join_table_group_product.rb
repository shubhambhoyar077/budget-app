class CreateJoinTableGroupProduct < ActiveRecord::Migration[7.0]
  def change
    create_join_table :groups, :products do |t|
      # t.index [:group_id, :product_id]
      # t.index [:product_id, :group_id]
    end
  end
end
