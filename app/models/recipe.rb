class Recipe < ApplicationRecord
  has_many :tags, through: :categorizations
end
