class CreateFeedings < ActiveRecord::Migration[6.0]
  def change
    create_table :feedings do |t|
      t.string :sustenance
      t.integer :user_id
      t.integer :dinosaur_id

      t.timestamps
    end
  end
end
