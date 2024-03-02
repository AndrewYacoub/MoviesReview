FactoryBot.define do
    factory :movie do
      title { "Example Movie" }
      description { "An example movie for testing" }
      year { 2020 }
      director { "Jane Doe" }
    end
  end