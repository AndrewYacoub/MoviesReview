FactoryBot.define do
    factory :review do
      stars { 4 }
      review_text { "Great movie!" }
      user { "test_user" }
      movie
    end
  end