class Branch < ApplicationRecord
  belongs_to :repository
  belongs_to :parent, class_name: "Branch", optional: true
  has_many :commits
  has_many :objects

  validates :name, presence: true, uniqueness: { scope: :repository_id }
end
