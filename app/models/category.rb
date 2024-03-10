class Category < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 50 }
    has_many :users
end
