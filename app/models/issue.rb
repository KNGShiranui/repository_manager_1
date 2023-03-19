class Issue < ApplicationRecord
  belongs_to :repository
  has_many :assignees, dependent: :destroy
  has_many :users, through: :assignees
end
