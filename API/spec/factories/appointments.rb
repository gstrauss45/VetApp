FactoryBot.define do
    factory :Appointment do
      date {Faker::Time.forward(days: 23, period: :morning)   }
      done false
      todo_id nil
    end
  end
