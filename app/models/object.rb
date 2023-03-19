class Object < ApplicationRecord
  belongs_to :branch
  has_many :diffs_as_old_object, class_name: 'Diff', foreign_key: 'old_object_id', dependent: :destroy
  has_many :diffs_as_new_object, class_name: 'Diff', foreign_key: 'new_object_id', dependent: :destroy

  validates :name, presence: true
end