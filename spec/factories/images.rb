FactoryBot.define do
  factory :image do
    image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    item
  end
end