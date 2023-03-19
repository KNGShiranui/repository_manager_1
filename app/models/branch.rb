class Branch < ApplicationRecord
  belongs_to :repository
  belongs_to :parent, class_name: 'Branch', optional: true
  has_many :files
  has_many :commits
end
