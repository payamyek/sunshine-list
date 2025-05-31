class CreateEmployees < ActiveRecord::Migration[8.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.float :salary
      t.float :benefits
      t.integer :employer_id
      t.integer :sector_id
      t.integer :job_title_id

      t.timestamps
    end
  end
end
