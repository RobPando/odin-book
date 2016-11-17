class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :gender
      t.string :status
      t.string :quote
      t.date :birthdate
      t.string :work
      t.string :education
      t.text :description
      t.string :live
      t.string :hometown
      t.string :nickname

      t.timestamps
    end
  end
end
