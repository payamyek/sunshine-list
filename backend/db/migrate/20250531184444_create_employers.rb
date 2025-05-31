class CreateEmployers < ActiveRecord::Migration[8.0]
  def change
    create_table :employers, :id => false do |t|
      t.primary_key :id
      t.string :name

      t.timestamps
    end
  end
end
