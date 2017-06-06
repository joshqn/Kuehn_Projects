class Project < ApplicationRecord
  validates :title, :description, :projType, presence: true
  validates :projType, length: { maximum: 1 }
end
