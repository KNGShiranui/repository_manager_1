class Assignee < ApplicationRecord
  belongs_to :issue
  belongs_to :user
end
