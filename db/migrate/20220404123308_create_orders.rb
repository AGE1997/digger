class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer    :prefecture_id, null: false
      t.references :user,          null: false, foreign_key: true
      t.references :profile,       null: false, foreign_key: true
      t.references :video,         null: false, foreign_key: true
      t.timestamps
    end
  end
end
