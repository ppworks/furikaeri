FactoryGirl.define do
  factory :project, class: 'Project' do
    name { Faker::Name.title }
    key { 'indentified_key' }
  end
end
