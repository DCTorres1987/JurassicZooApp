class CreateZoos < ActiveRecord::Migration[6.0]
  def change
    create_table :zoos do |t|
      t.string :name
      t.string :location
      t.string :image

      t.timestamps
    end
  end
end
