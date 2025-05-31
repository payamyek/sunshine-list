class ChangeFieldNameFromIntegerToDecimal < ActiveRecord::Migration[8.0]
  def change
    change_column :employees, :salary, :decimal,  precision: 15, scale: 2
    change_column :employees, :benefits, :decimal,  precision: 15, scale: 2
  end
end
