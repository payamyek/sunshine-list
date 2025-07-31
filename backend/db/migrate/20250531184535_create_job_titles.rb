class CreateJobTitles < ActiveRecord::Migration[8.0]
  def change
    create_table :job_titles, id: false do |t|
      t.primary_key :id
      t.string :name

      t.timestamps
    end
  end
end
