class Category < ApplicationRecord
  validates :name,
            presence: true,
            length: { within: 4..25 }
  validates_uniqueness_of :name

end