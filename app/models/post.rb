class Post < ApplicationRecord
  extend FriendlyId
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :body, presence: true, length: { minimum: 3, maximum: 5000 }
  belongs_to :user, counter_cache: true
  belongs_to :category, counter_cache: true
  has_many :comments, dependent: :destroy

  has_rich_text :body
  has_one :content, class_name: "ActionText::RichText", as: :record, dependent: :destroy

  has_noticed_notifications model_name: "Notification"
  has_many :notifications, through: :user

  friendly_id :title, use: %i[slugged history finders]

  after_initialize :set_default_category, if: :new_record?

  def should_generate_new_friendly_id?
    title_changed? || slug.blank?
  end

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user", "content", "category"]
  end

  private

  def set_default_category
    self.category ||= Category.first
  end
end
