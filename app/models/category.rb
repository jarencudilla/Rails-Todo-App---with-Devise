class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: {scope: :user}, length: { maximum: 20 }
  validates :details, presence: true, length: { minimum: 5, maximum: 60 }

  belongs_to :user
  has_many :tasks, dependent: :destroy
end
