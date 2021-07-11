class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy

  validates :name, presence: true, uniqueness: {scope: :user}, length: { maximum: 20 }
  validates :details, presence: true
end
