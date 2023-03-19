class Team < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :team_members, dependent: :destroy
  has_many :users, through: :team_members
  has_many :repository_holder_teams, dependent: :destroy
  has_many :repositories, through: :repository_holder_teams
end
