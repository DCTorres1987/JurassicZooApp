class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :time
      t.decimal :price       
      t.integer :attraction_id
      t.integer :user_id

      t.timestamps
    end
  end
end
