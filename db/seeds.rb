require 'faker'

# Populate 'onetables' with 10 records
10.times do
  onetable = Onetable.create!(
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    prefix: Faker::Name.prefix,
    suffix: Faker::Name.suffix
  )

  # Populate 'twotables' with 10 records for each onetable
  Twotable.create!(
    street_address: Faker::Address.street_address,
    building_number: Faker::Address.building_number,
    city: Faker::Address.city,
    country: Faker::Address.country,
    zip: Faker::Address.zip_code,
    onetable: onetable
  )

  # Populate 'threetables' with 10 records for each onetable
  Threetable.create!(
    primary_school: Faker::Educator.primary_school,
    secondary_school: Faker::Educator.secondary_school,
    university: Faker::Educator.university,
    degree: Faker::Educator.degree,
    onetable: onetable
  )
end
