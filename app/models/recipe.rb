class Recipe < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :tags, through: :categorizations

end
