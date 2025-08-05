Employee.destroy_all
Employer.destroy_all
JobTitle.destroy_all
Sector.destroy_all

5.times do |index|
  Sector.create!([ {
    name: Faker::Company.unique.industry
  } ])
end

p "Created #{Sector.count} sector(s)"

5.times do |index|
  JobTitle.create!([ {
    name: Faker::Company.unique.profession
  } ])
end

p "Created #{JobTitle.count} job title(s)"

5.times do |index|
  Employer.create!([ {
    name: Faker::Company.unique.name
  } ])
end

p "Created #{Employer.count} employer(s)"

25.times do |index|
  Employee.create!([ {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    salary: Faker::Number.within(range: 100000.0..999999.0).round(2),
    benefits: Faker::Number.within(range: 0.0..300.0).round(2),
    employer_id: Faker::Number.within(range: 1..5),
    sector_id: Faker::Number.within(range: 1..5),
    job_title_id: Faker::Number.within(range: 1..5)
  } ])
end

p "Created #{Employee.count} employee(s)"
