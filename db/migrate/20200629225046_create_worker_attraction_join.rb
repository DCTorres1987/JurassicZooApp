class CreateWorkerAttractionJoin < ActiveRecord::Migration[6.0]
  def change
    create_table :worker_attraction_joins do |t|
      t.integer :worker_id
      t.integer :attraction_id
    end
    add_index :worker_attraction_joins, [:worker_id, :attraction_id], unique: true
  end
end
