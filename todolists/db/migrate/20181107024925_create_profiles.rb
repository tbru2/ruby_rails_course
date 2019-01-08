class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :gender
      t.date :birth_year
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
