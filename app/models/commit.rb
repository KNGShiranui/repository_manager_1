class Commit < ApplicationRecord
  belongs_to :branch
  belongs_to :user

  validates :message, presence: true
end
