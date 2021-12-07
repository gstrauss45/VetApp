FactoryBot.define do
    factory :pet do
      name { Faker::Movies::StarWars.character }
      done false
      todo_id nil
    end
  end
