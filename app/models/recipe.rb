class Recipe < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :tags, through: :categorizations
  has_many :ingredients, dependent: :destroy
  belongs_to :user
  accepts_nested_attributes_for :ingredients, allow_destroy: true
end
