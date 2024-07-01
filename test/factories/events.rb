FactoryBot.define do
  factory :event do
    owner
    sequence(:name) { |i| "name_#{i}" }
    sequence(:place) { |i| "place_#{i}" }
    sequence(:content) { |i| "content_#{i}" }
    started_at { rand(1..30).days.from_now }
    ened_at { started_at + rand(1..30).hours }
  end
end
