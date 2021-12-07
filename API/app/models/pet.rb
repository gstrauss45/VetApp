class Pet < ApplicationRecord
    belongs_to :users, optional: true
  end
