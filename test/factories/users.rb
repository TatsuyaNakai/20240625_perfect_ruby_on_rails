FactoryBot.define do
  factory :user, aliases: [:owner] do
    provider { 'github' }
    sequence(:uid) { |i| "uuid_#{i}" }
    sequence(:name) { |i| "name_#{i}" }
    sequence(:image_url) { |i| "http://example.com/image#{i}.jpg" }
  end
end
