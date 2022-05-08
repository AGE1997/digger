class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.float :value
      t.text :text,          null: false
      t.references :user,    null: false, foreign_key: true
      t.references :profile, null: false, foreign_key: true
      t.references :video,   null: false, foreign_key: true
      t.timestamps
    end
  end
end