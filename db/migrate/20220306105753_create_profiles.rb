class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string     :nickname,      null: false
      t.integer    :sex_id
      t.integer    :genre_id
      t.integer    :prefecture_id
      t.date       :birthday
      t.text       :biography
      t.references :user,          null: false, foreign_key: true
      t.timestamps
    end
  end
end
