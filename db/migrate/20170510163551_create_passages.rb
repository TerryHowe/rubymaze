class CreatePassages < ActiveRecord::Migration[5.1]
  def change
    create_table :passages do |t|
      t.references :source, references: :rooms
      t.references :destination, references: :rooms
      t.integer :direction

      t.timestamps
    end
	 add_index :passages, [:source, :direction], unique: true
  end
end
