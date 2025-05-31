class Employee < ApplicationRecord
  belongs_to :job_title
  belongs_to :sector
  belongs_to :employer
end
