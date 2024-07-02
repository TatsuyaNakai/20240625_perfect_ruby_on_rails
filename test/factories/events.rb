FactoryBot.define do
  factory :event do
    sequence(:name) { |i| "name_#{i}" }
    sequence(:place) { |i| "place_#{i}" }
    sequence(:content) { |i| "content_#{i}" }
    started_at { rand(1..30).days.from_now }
    ended_at { started_at + rand(1..30).hours }

    association :owner, factory: :user
  end
end
