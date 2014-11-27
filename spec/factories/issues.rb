FactoryGirl.define do
  factory :issue, class: 'Issue' do
    title { Faker::Name.title }

    trait :keep do
      status { :keep }
    end

    trait :problem do
      status { :problem }
    end

    trait :try do
      status { :try }
    end
  end
end
