FactoryBot.define do
  # factory :room do
  #   title { "Room1" }
  # end
  factory :room do
    sequence(:title) {|n| "Room #{n}"}
  end
end