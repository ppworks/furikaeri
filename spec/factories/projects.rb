FactoryGirl.define do
  factory :project, class: 'Project' do
    name { Faker::Name.title }
  end

  factory :project_demo, class: 'Project' do
    name { 'ふりかえりのためのKPTツール' }
  end
end
