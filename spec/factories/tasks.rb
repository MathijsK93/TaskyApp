FactoryGirl.define do 
  factory :task do
    name  { Faker::Name.name}
    completed true
  end
end