class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.integer :userheight
      t.integer :userage
      t.string :usergender
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
