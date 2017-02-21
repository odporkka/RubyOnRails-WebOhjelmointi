FactoryGirl.define do
  factory :user do
    username "Pekka"
    password "Foobar1"
    password_confirmation "Foobar1"
  end

  factory :rating do
    beer
    score 5
  end

  factory :rating2, class: Rating do
    beer
    score 9
  end

  factory :brewery do
    name "anonymous"
    active true
    year 1900
  end

  factory :beer do
    name "anonymous"
    brewery
    style
  end

  factory :style do
    name "Lager"
    description "Maukasta lageria"
  end
end