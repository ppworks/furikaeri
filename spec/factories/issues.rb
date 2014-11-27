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

  factory :issue_demo, class: 'Issue' do
    trait :keep do
      title '今後も継続したいこと'
      status { :keep }
    end

    trait :problem do
      title '改善したいこと'
      status { :problem }
    end

    trait :try do
      title '改善を含め挑戦したいこと'
      status { :try }
    end
  end
end
