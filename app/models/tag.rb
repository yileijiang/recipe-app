class Tag < ApplicationRecord
  has_many :recipes, through: :categorizations
end
