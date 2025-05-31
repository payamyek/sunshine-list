class CreateSectors < ActiveRecord::Migration[8.0]
  def change
    create_table :sectors, :id => false do |t|
      t.primary_key :id
      t.string :name

      t.timestamps
    end
  end
end
