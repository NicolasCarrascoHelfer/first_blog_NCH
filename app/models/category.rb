class Category < ApplicationRecord
  extend FriendlyId
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  has_many :posts

  friendly_id :name, use: %i[slugged history finders]

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end
