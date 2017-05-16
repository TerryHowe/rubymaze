class CreatePassages < ActiveRecord::Migration[5.1]
  def change
    create_table :passages do |t|
      t.references :source, references: :rooms
      t.references :destination, references: :rooms
      t.integer :direction

      t.timestamps
    end
	 add_index :passages, [:source_id, :direction], unique: true
    r00 = Room.create(:x=>0,:y=>0);
    r10 = Room.create(:x=>1,:y=>0);
    r01 = Room.create(:x=>0,:y=>1);
    Passage.create(:source=>r00, :destination=>r10, :direction=>0)
    Passage.create(:source=>r10, :destination=>r00, :direction=>2)
    Passage.create(:source=>r00, :destination=>r01, :direction=>1)
    Passage.create(:source=>r01, :destination=>r00, :direction=>3)
  end
end
