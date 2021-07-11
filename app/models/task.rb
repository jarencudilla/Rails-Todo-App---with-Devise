class Task < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, uniqueness: { scope: :category }, length: { maximum: 20 }
  validates :details, presence: true
end