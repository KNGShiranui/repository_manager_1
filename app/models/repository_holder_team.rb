class RepositoryHolderTeam < ApplicationRecord
  belongs_to :repository
  belongs_to :team
end
