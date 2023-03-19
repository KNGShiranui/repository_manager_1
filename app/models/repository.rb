class Repository < ApplicationRecord
  belongs_to :user
  has_many :branches
  has_many :issues
  has_many :repository_holder_teams, dependent: :destroy
  has_many :teams, through: :repository_holder_teams

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :access_level, presence: true, inclusion: { in: %w[public private] }
end