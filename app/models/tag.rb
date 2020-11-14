class Tag < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :recipes, through: :categorizations
end
