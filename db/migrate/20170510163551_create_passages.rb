class CreatePassages < ActiveRecord::Migration[5.1]
  def change
    create_table :passages do |t|
      t.references :source, foreign_key: true
      t.references :destination, foreign_key: true
      t.integer :direction

      t.timestamps
    end
	 add_index :passages, [:source, :direction], unique: true
  end
end
