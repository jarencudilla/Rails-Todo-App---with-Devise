class Task < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, uniqueness: { scope: :category }
  validates :details, presence: true
end
