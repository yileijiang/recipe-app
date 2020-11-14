class Recipe < ApplicationRecord
  has_many :categorizations
  has_many :tags, through: :categorizations

end
