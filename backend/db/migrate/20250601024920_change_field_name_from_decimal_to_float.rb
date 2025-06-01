class ChangeFieldNameFromDecimalToFloat < ActiveRecord::Migration[8.0]
  def change
    change_column :employees, :salary, :float
    change_column :employees, :benefits, :float
  end
end
