class AddUniqueIndexToNameToJobTitle < ActiveRecord::Migration[8.0]
  def change
     add_index :job_titles, :name, unique: true
  end
end
