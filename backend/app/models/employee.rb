class Employee < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search, against: { first_name: "A", last_name: "A" }, associated_against: { employer: { name: "B" }, sector: { name: "D" }, job_title: { name: "C" } }

  belongs_to :job_title
  belongs_to :sector
  belongs_to :employer
end
