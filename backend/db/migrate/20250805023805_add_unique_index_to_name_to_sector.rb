class AddUniqueIndexToNameToSector < ActiveRecord::Migration[8.0]
  def change
    add_index :sectors, :name, unique: true
  end
end
