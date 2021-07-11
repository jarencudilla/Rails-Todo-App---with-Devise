class Task < ApplicationRecord
  validates :name, presence: true, uniqueness: {scope: :category}, length: {maximum: 20}
  validates :details, presence: true, length: {maximum: 45}

  belongs_to :category
end