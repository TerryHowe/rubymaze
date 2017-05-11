class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :x
      t.integer :y

      t.timestamps
    end
	 add_index :rooms, [:x, :y], unique: true
    Room.create(:x=>0,:y=>0);
    Room.create(:x=>1,:y=>0);
    Room.create(:x=>0,:y=>1);
  end
end
