class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :password_digest
      t.integer :zoo_id

      t.timestamps
    end
  end
end
