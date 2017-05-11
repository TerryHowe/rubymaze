class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :x
      t.integer :y

      t.timestamps
    end
	 add_index :rooms, [:x, :y], unique: true
  end
end
