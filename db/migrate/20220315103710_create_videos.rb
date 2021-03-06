class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string     :title,         null: false
      t.string     :introduction,  null: false
      t.integer    :genre_id,      null: false
      t.integer    :prefecture_id, null: false
      t.integer    :price,         null: false
      t.references :user,          null: false, foreign_key: true
      t.references :profile,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
