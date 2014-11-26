FactoryGirl.define do
  factory :project, class: 'Project' do
    name { Faker::Name.title }
  end
end
