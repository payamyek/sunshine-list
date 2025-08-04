Employee.destroy_all
Employer.destroy_all
JobTitle.destroy_all
Sector.destroy_all

Sector.create!([ {
  name: "Computer Science"
} ])

p "Created #{Sector.count} sector(s)"

JobTitle.create!([ {
  name: "Software Engineer"
} ])

p "Created #{JobTitle.count} job title(s)"

Employer.create!([ {
  name: "Candu"
} ])

p "Created #{Employer.count} employer(s)"

Employee.create!([ {
  first_name: "Bob",
  last_name: "Dylan",
  salary: 102234.24,
  benefits: 200,
  employer_id: 1,
  sector_id: 1,
  job_title_id: 1
} ])

p "Created #{Employer.count} employee(s)"
